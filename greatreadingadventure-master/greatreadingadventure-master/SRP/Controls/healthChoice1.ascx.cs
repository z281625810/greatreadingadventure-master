using GRA.SRP.DAL;
using GRA.Tools;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GRA.SRP.Controls {
    public partial class HealthChoice : System.Web.UI.UserControl {
        protected void Page_Load(object sender, EventArgs e) {
            if(!IsPostBack) {
                var currentPatron = (Patron)Session["Patron"];
                PopulateList(currentPatron.PID.ToString());
                
                
            }
        }


        protected void PopulateList(string patronId)
        {
            int patronIdNumeric = int.Parse(patronId);
            var patron = Patron.FetchObject(patronIdNumeric);
            var ds = Patron.GetHealthChoice(patronIdNumeric);
            
            

        }
    }
}