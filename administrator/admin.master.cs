﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class administrator_admin : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnlogout_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        FormsAuthentication.SignOut();
        FormsAuthentication.RedirectToLoginPage();
    }
}
