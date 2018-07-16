using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class administrator_product_rate : System.Web.UI.Page
{
    int product_Id = 0;
    string product_unit = "";
    double product_rate = 0;

    Guid user_Id;

    protected void bind_unit_rate()
    {
        if (product_Id > 0)
        {
            gdvunit.DataSource = DAL.get_all_units_of_a_product(product_Id);
            gdvunit.DataBind();
        }
        
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["product"] != null)
        {
            product_Id = Convert.ToInt32(Request.QueryString["product"].ToString());
        }
        else
        {
            Response.Redirect("list-of-products.aspx");
        }

        if (!IsPostBack)
        {
            bind_unit_rate();
        }
    }
    protected void btnsave_Click(object sender, EventArgs e)
    {
        try
        {
            string errmsg = "";
            if (String.IsNullOrEmpty(txtproductunit.Text.Trim()))
            {
                errmsg += "<li>Please Enter Product Unit</li>";
            }
            else
            {
               product_unit=txtproductunit.Text.Trim();
            }

            if (String.IsNullOrEmpty(txtproductrate.Text.Trim()))
            {
                errmsg += "<li>Please Enter Product Unit Rate</li>";
            }
            else
            {
                string digits = "0123456789.";
                bool Found = false;
                for(int i=0;i<txtproductrate.Text.Length;i++)
                {
                    string ch = txtproductrate.Text.Substring(i, 1);
                    if (digits.IndexOf(ch) == -1)
                    {
                        Found = true;
                        break;
                    }
                }

                if (Found == true)
                {
                    errmsg += "<li>Please Enter Valid Product Unit Rate</li>";
                }
                else
                {
                    product_rate = Convert.ToDouble(txtproductrate.Text);
                }

                
            }

            if (errmsg.Length > 0)
            {
                errormsg.Text = "<font color='red'>" + errmsg+ "</font>";
            }
            else
            {
                user_Id = (Guid)Membership.GetUser(User.Identity.Name).ProviderUserKey;

                int r=DAL.add_a_product_unit(product_Id, product_unit, product_rate, user_Id);
                if (r > 0)
                {
                    errmsg = "";
                    errormsg.Text = "<font color='red'>Record(s) Saved Successfully !</font>";
                }
            }
        }
        catch (Exception ex)
        {
            errormsg.Text = "<font color='red'>" + ex.Message + "</font>";
        }
    }
}