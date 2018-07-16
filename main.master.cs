using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class main : System.Web.UI.MasterPage
{
   

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ddlcategory.DataSource = DAL.get_all_live_product_categories();
            ddlcategory.DataTextField = "product_category_name";
            ddlcategory.DataValueField = "product_category_Id";
            ddlcategory.DataBind();


            rptcategory.DataSource = DAL.get_all_live_product_categories();
            rptcategory.DataBind();
        }
    }
}
