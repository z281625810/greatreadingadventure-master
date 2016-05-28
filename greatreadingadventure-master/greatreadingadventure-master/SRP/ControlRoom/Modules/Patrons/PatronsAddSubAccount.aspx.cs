﻿using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SRPApp.Classes;
using GRA.SRP.ControlRooms;
using GRA.SRP.Core.Utilities;
using GRA.SRP.DAL;

namespace GRA.SRP.ControlRoom.Modules.Patrons
{
    public partial class PatronsAddSubAccount : BaseControlRoomPage
    {

        protected void Page_Load(object sender, EventArgs e)
        {

            MasterPage.RequiredPermission = 5100;
            MasterPage.IsSecure = true;

            if (!IsPostBack)
            {
                string editpage = "~/ControlRoom/Modules/Patrons/PatronDetails.aspx";

                    Session["CURR_PATRON_MODE"] = "ADDSUB";
                    Response.Redirect(editpage);

            }

        }
    }
}
