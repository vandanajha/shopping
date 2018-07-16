<%@ WebHandler Language="C#" Class="process_image" %>

using System;
using System.Web;

public class process_image : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        if (context.Request.QueryString["product"] != null)
        {

            int product = Convert.ToInt32(context.Request.QueryString["product"].ToString());
            byte[] photo = DAL.get_a_product_photo(product);
            context.Response.BinaryWrite(photo);
        }

    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}