using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class list_of_products : System.Web.UI.Page
{
    int product_category_Id = 0;
    string product_category_name = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["Id"] != null && Request.QueryString["category"] != null)
        {
            product_category_Id = Convert.ToInt32(Request.QueryString["Id"].ToString());
            product_category_name = Request.QueryString["category"].ToString();

            if (!IsPostBack)
            {
                lblcaption.Text = product_category_name;

                lstproducts.DataSource = DAL.get_all_live_products_of_category(product_category_Id);
                lstproducts.DataBind();
            }
        }
        else
        {
            Response.Redirect("index.aspx");
        }
    }
}