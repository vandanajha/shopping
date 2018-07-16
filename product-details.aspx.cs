using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Text;
using System.Web.UI.HtmlControls;

public partial class product_details : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["product"] != null)
        {
            int product=Convert.ToInt32(Request.QueryString["product"].ToString());

            if (!IsPostBack)
            {
                rptproducts.DataSource = DAL.get_a_product(product);
                rptproducts.DataBind();

               
                
            }
        }
    }

   /* protected void PayWithPayPal(string amount, string itemInfo, string name,string phone, string email, string currency)
    {
        string redirecturl = "";

        //Mention URL to redirect content to paypal site
        redirecturl += "https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&business=" + ConfigurationManager.AppSettings["paypalemail"].ToString();

        //First name i assign static based on login details assign this value
        redirecturl += "&first_name=" + name;

        //City i assign static based on login user detail you change this value
        

        //State i assign static based on login user detail you change this value
       

        //Product Name
        redirecturl += "&item_name=" + itemInfo;

        //Product Name
        redirecturl += "&amount=" + amount;

        //Phone No
        redirecturl += "&night_phone_a=" + phone;

        //Product Name
        redirecturl += "&item_name=" + itemInfo;

        //Address 
        redirecturl += "&address1=" + email;

        //Business contact id
         //redirecturl += "&business=k.tapankumar@gmail.com";

        //Shipping charges if any
        redirecturl += "&shipping=0";

        //Handling charges if any
        redirecturl += "&handling=0";

        //Tax amount if any
        redirecturl += "&tax=0";

        //Add quatity i added one only statically 
        redirecturl += "&quantity=1";

        //Currency code 
        redirecturl += "&currency=" + currency;
        redirecturl += "&shopping_url=" +
         ConfigurationManager.AppSettings["ShoppingURL"].ToString();
        //Success return page url
        redirecturl += "&return=" +
          ConfigurationManager.AppSettings["SuccessURL"].ToString();

        //Failed return page url
        redirecturl += "&cancel_return=" +
          ConfigurationManager.AppSettings["FailedURL"].ToString();

        Response.Redirect(redirecturl);
    }*/
    protected void rptproducts_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "addTocart")
        {
           // PayWithPayPal("20", "Badi Elaishi", "Prasant", "9540467539", "prasantcalls@gmail.com", "USD");

           
           

        }
    }
    protected void rptproducts_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType != ListItemType.Item && e.Item.ItemType != ListItemType.AlternatingItem)
         return;
            string product_name=((Literal)e.Item.FindControl("lblproductname")).Text;


            string str = "javascript:OpenPayPalWindow(\"https://www.paypal.com/cgi-bin/webscr" + "?cmd=_cart" + "&business=prasantcalls@live.com" + "&item_name=" + product_name + "&amount=20" + "&currency=USD" + "&add=1" + "&return=http://www.sewaherbs.in/index.aspx" + "&cancel_return=http://www.sewaherbs.in/index.aspx\")";
            string encodedUrl = Server.HtmlEncode(str);
            ((HtmlAnchor)e.Item.FindControl("addToCart")).HRef = encodedUrl;
         
        
    }
}