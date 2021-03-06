﻿using GRA.SRP.DAL;
using GRA.SRP.Utilities.CoreClasses;
using GRA.Tools;
using SRPApp.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace GRA.SRP.Controls {
    public partial class ReadingLogControl : System.Web.UI.UserControl {

        protected bool ShowModal { get; set; }
        protected void Page_Load(object sender, EventArgs e) {

            

            if(!IsPostBack) {
                if(Session["Patron"] == null) {
                    Response.Redirect("~");
                }
                var patron = (Patron)Session[SessionKey.Patron];
                var program = Programs.FetchObject(patron.ProgID);

                if(program == null || !program.IsOpen) {
                    readingLogControlPanel.Visible = false;
                    return;
                }

                ViewState["ProgramGameId"] = program.PID.ToString();

                if(Request.Cookies[CookieKey.LogBookDetails] != null) {
                    enterBookDetails.Checked = true;
                }

                foreach(ActivityType activityTypeValue in Enum.GetValues(typeof(ActivityType))) {
                    int activityTypeId = (int)activityTypeValue;
                    string lookupString = string.Format("{0}.{1}.{2}",
                                                        CacheKey.PointGameConversionStub,
                                                        patron.ProgID,
                                                        activityTypeId);
                    var pgc = Cache[lookupString] as ProgramGamePointConversion;
                    if(pgc == null) {
                        this.Log().Debug("Cache miss looking up {0}", lookupString);
                        pgc = ProgramGamePointConversion.FetchObjectByActivityId(patron.ProgID,
                                                                                 activityTypeId);
                        Cache[lookupString] = pgc;
                    }

                    if(pgc != null && pgc.PointCount > 0) {
                        activityTypeSelector.Items.Add(new ListItem(activityTypeValue.ToString(),
                                                                    activityTypeId.ToString()));
                    }
                }

                if(activityTypeSelector.Items.Count == 1) {
                    var singleOption = activityTypeSelector.Items[0];

                    if(int.Parse(singleOption.Value) == (int)ActivityType.Books) {
                        countSubmittedLabel.Visible = false;
                        //readingActivityField.Text = "1";
                        //readingActivityField.Attributes.Remove("style");
                        //readingActivityField.Attributes.Add("style", "display: none;");
                        activityTypeSelector.Attributes.Remove("style");
                        activityTypeSelector.Attributes.Add("style", "display: none;");
                        activityTypeSingleLabel.Visible = false;
                        submitButton.Text = StringResources.getString("readinglog-read-a-book");
                    } else {
                        activityTypeSelector.Attributes.Remove("style");
                        activityTypeSelector.Attributes.Add("style", "display: none;");
                        //activityTypeSingleLabel.Text = "";
                        //activityTypeSingleLabel.Visible = true;
                    }
                } else {
                    activityTypeSingleLabel.Visible = false;
                }
            }

        }

        protected void SubmitActivity() {

           

            var intCount = 0;       
            
            DateTime temp = Calendar1.SelectedDate;
            if (temp == new DateTime(1, 1, 1))
            {
                temp = DateTime.Today;
            }
            

            if (temp > DateTime.Today)
            {
                Session[SessionKey.PatronMessage] = "Sorry, you can only select the day in the past, not in the future";
                Session[SessionKey.PatronMessageLevel] = PatronMessageLevels.Warning;
                Session[SessionKey.PatronMessageGlyphicon] = "exclamation-sign";
                return;
            }

            var selectedActivityType = activityTypeSelector.SelectedValue;

            // check that we aren't over the max
            int maxAmountForLogging = 0;
            switch(int.Parse(selectedActivityType)) {
                case 0:
                    maxAmountForLogging = SRPSettings.GetSettingValue("MaxBook").SafeToInt();
                    break;
                case 1:
                    maxAmountForLogging = SRPSettings.GetSettingValue("MaxPage").SafeToInt();
                    break;
                //case 2: maxAmountForLogging = SRPSettings.GetSettingValue("MaxPar").SafeToInt();
                //    break;
                case 3:
                    maxAmountForLogging = SRPSettings.GetSettingValue("MaxMin").SafeToInt();
                    break;
                default:
                    maxAmountForLogging = SRPSettings.GetSettingValue("MaxMin").SafeToInt();
                    break;
            }
            if (intCount > maxAmountForLogging) {
                Session[SessionKey.PatronMessage] = string.Format("That's an awful lot of reading! You can only submit {0} {1} at a time.",
                                                                  maxAmountForLogging,
                                                                  ((ActivityType)int.Parse(selectedActivityType)).ToString());
                Session[SessionKey.PatronMessageLevel] = PatronMessageLevels.Warning;
                Session[SessionKey.PatronMessageGlyphicon] = "exclamation-sign";
                return;
            }

            var patronId = ((Patron)Session[SessionKey.Patron]).PID;
            var programGameId = int.Parse(ViewState["ProgramGameId"].ToString());

            var pa = new AwardPoints(patronId);
            var points = 0;

            // convert pages/minutes/etc. to points
            var pc = new ProgramGamePointConversion();
            pc.FetchByActivityId(programGameId, int.Parse(activityTypeSelector.SelectedValue));

            // only one point at a time, one point for a day, because only log once each day
            points = 1;
            // ensure they aren't over teh day total
            var allPointsToday = PatronPoints.GetTotalPatronPoints(patronId, temp);
            //var allPointsToday = 1;
            //int maxPointsPerDayForLogging = SRPSettings.GetSettingValue("MaxPtsDay").SafeToInt();
            int maxPointsPerDayForLogging = 1;
            if (allPointsToday >= maxPointsPerDayForLogging) {
                Session[SessionKey.PatronMessage] = "Sorry but you have already submited your log once in that day. You can only earn one point a day. Keep reading and come back tomorrow!";
                Session[SessionKey.PatronMessageLevel] = PatronMessageLevels.Warning;
                Session[SessionKey.PatronMessageGlyphicon] = "exclamation-sign";
                return;
            }

            
            var earnedBadges = pa.AwardPointsToPatron(points: points,
                reason: PointAwardReason.Reading,
                MGID: 0,
                readingActivity: (ActivityType)pc.ActivityTypeId,
                readingAmount: intCount,
                author: authorField.Text,
                title: titleField.Text,review: "",eventCode:"",eventID:0,bookListID:0,forceDate: temp,healthChoice: healthChoice.Text);

            // clear out the form
            var bookButton = activityTypeSelector.Items.Count == 1
                             && int.Parse(activityTypeSelector.Items[0].Value) == (int)ActivityType.Books;

            if(!bookButton) {
                //readingActivityField.Text = string.Empty;
            }
            authorField.Text = string.Empty;
            titleField.Text = string.Empty;
            healthChoice.Text = string.Empty;

            // set message and earned badges
            string earnedMessage = new PointCalculation().EarnedMessage(earnedBadges, points);
            if(string.IsNullOrEmpty(earnedMessage)) {
                Session[SessionKey.PatronMessage] = "<strong>Great job!</strong> You have read for at least 15 minutes!";
            } else {
                Session[SessionKey.PatronMessage] = string.Format("<strong>Great job!</strong> You have read for at least 15 minutes! <strong>{0}</strong>",
                                                                  earnedMessage);
            }
            Session[SessionKey.PatronMessageLevel] = PatronMessageLevels.Success;
            Session[SessionKey.PatronMessageGlyphicon] = "thumbs-up";
            new SessionTools(Session).EarnedBadges(earnedBadges);
        }


        protected void submitButton_Click(object sender, EventArgs e) {


            if (enterBookDetails.Checked && enterHealthChoiceDetails.Checked)
            {
                // show pop-up
                HttpCookie logDetailsCookie = new HttpCookie(CookieKey.LogBookDetails);
                logDetailsCookie.Expires = DateTime.Now.AddDays(14);
                logDetailsCookie.Value = "y";
                Response.SetCookie(logDetailsCookie);
                readingLogPopup.Visible = true;
                healthDiv.Visible = true;
                this.ShowModal = true;
            }
            else if (enterBookDetails.Checked)
            {
                // show pop-up
                HttpCookie logDetailsCookie = new HttpCookie(CookieKey.LogBookDetails);
                logDetailsCookie.Expires = DateTime.Now.AddDays(14);
                logDetailsCookie.Value = "y";
                Response.SetCookie(logDetailsCookie);
                readingLogPopup.Visible = true;
                healthDiv.Visible = false;
                this.ShowModal = true;
            }
            else {
                // log activity
                if (Request.Cookies[CookieKey.LogBookDetails] != null)
                {
                    Response.Cookies[CookieKey.LogBookDetails].Expires = DateTime.Now.AddDays(-1);
                }
                authorField.Text = string.Empty;
                titleField.Text = string.Empty;
                SubmitActivity();
            }
        }

        protected void cancelButton_Click(object sender, EventArgs e) {
            // hide popup
            readingLogPopup.Visible = false;
            authorField.Text = string.Empty;
            titleField.Text = string.Empty;
            healthChoice.Text = string.Empty;
        }
        protected void submitDetailsButton_Click(object sender, EventArgs e) {
            // log activity
            SubmitActivity();
            
        }

        protected void MyDayRenderer(object sender, DayRenderEventArgs e)
        {
            var LoggedInPatron = (Patron)Session["Patron"];
            String str = LoggedInPatron.PID.ToString();
            int pid = int.Parse(str);
            var ds = PatronPoints.GetAll(pid);
            DataTable table = ds.Tables[0];
            List<DateTime> datetime = new List<DateTime>();
            foreach (DataRow row in table.Rows)
            {
                datetime.Add(row.Field<DateTime>(3));
            }

            foreach (DateTime d in datetime)
            {
                if (e.Day.Date == new DateTime(d.Year, d.Month, d.Day))
                {
                    e.Cell.BackColor = System.Drawing.Color.Aqua;
                } 
            }       
        }
    }
}