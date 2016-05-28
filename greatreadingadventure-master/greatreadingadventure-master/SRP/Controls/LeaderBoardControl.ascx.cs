using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GRA.SRP.DAL;

namespace GRA.SRP.Controls {
    public partial class LeaderBoardControl : System.Web.UI.UserControl {
        protected void Page_Load(object sender, EventArgs e) {
            if(!IsPostBack) {
                LoadData();
            }

        }

        protected string AvatarImage(string avatarId) {
            string avatarPath = "~/Images/Avatars/no_avatar_sm.png";
            string potentialAvatarPath = string.Format("~/Images/Badges/{0}_sm.png",
                                                      avatarId);
            if(System.IO.File.Exists(Server.MapPath(potentialAvatarPath))) {
                avatarPath = potentialAvatarPath;
            }
            return avatarPath;
        }

        public void LoadData() {
            //var ds = DAL.Programs.GetLeaderboard(((Patron)Session["Patron"]).ProgID);
            var ds = DAL.Programs.GetLeaderboard1();
            rptr.DataSource = ds;
            rptr.DataBind();
        }

        protected void rptr_ItemDataBound(object sender, RepeaterItemEventArgs e) {
          /*  if(e.Item.ItemType == ListItemType.Item
               || e.Item.ItemType == ListItemType.AlternatingItem) {
                var imageControl = (Image)e.Item.FindControl("SmallAvatar");
                string potentialAvatarPath = imageControl.ImageUrl;
                if(!System.IO.File.Exists(Server.MapPath(potentialAvatarPath))) {
                    imageControl.ImageUrl = "~/Images/Avatars/no_avatar_sm.png";
                }
            }*/
        }

        protected static String changeToGrade(int grade)
        {
            String strGrade = string.Empty;

            if (grade == -1)
            {
                strGrade = "Early Learners";
            }
            else if (grade == 0)
            {
                strGrade = "Kindergarten";
            }
            else if (grade == 1)
            {
                strGrade = "1st";
            }
            else if (grade == 2)
            {
                strGrade = "2nd";
            }
            else if (grade == 3)
            {
                strGrade = "3rd";
            }
            else if (grade == 4)
            {
                strGrade = "4th";
            }
            else if (grade == 5)
            {
                strGrade = "5th";
            }
            else if (grade == 6)
            {
                strGrade = "6th";
            }
            else if (grade == 7)
            {
                strGrade = "7th";
            }
            else if (grade == 8)
            {
                strGrade = "8th";
            }
            else if (grade == 9)
            {
                strGrade = "9th";
            }
            else if (grade == 10)
            {
                strGrade = "10th";
            }
            else if (grade == 11)
            {
                strGrade = "11th";
            }
            else if (grade == 12)
            {
                strGrade = "12th";
            }
            else
            {
                strGrade = string.Empty;
            }

            return strGrade;
        }
    }
}