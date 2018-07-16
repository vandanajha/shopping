using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class login : System.Web.UI.Page
{
    string username = "";
    string password = "";
    bool RememberMe = false;

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnlogin_Click(object sender, EventArgs e)
    {
        try
        {
            string errmsg = "";

            if (string.IsNullOrEmpty(txtusername.Text.Trim()))
            {
                errmsg += "<li>Please Enter User Name</li>";
            }
            else
            {
                username = txtusername.Text.Trim();
            }

            if (string.IsNullOrEmpty(txtpassword.Text.Trim()))
            {
                errmsg += "<li>Please Enter Password</li>";
            }
            else
            {
                password = txtpassword.Text.Trim();
            }

            RememberMe = chkremember.Checked;

            if (errmsg.Length > 0)
            {
                errormsg.Text = "<font color='red'><ul>" + errmsg + "</ul></font>";
            }
            else
            {
                if (Membership.ValidateUser(username, password) == true)
                {
                    FormsAuthentication.RedirectFromLoginPage(username, RememberMe);
                }
                else
                {
                    errormsg.Text = "<font color='red'>Please Enter Correct Credentials</font>";
                }
            }
        }
        catch (Exception ex)
        {
            errormsg.Text = "<font color='red'><ul>"+ex.Message+"</ul></font>";
        }
    }
}