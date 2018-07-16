using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Collections;

public partial class administrator_list_of_products : System.Web.UI.Page
{
    string product_name = "";
    string product_scientific_name = "";
    string product_description = "";
    byte[] product_photo;
    string product_keywords = "";
    string product_intake = "";
    int product_category_Id = 0;
    bool IsLiveProduct = false;
    bool IsInStock = false;
    Guid user_Id;


    protected void bind_products()
    {
        if (product_category_Id > 0)
        {
            gdvproduct.DataSource = DAL.get_all_products_of_category(product_category_Id);
        }
        else
        {
            gdvproduct.DataSource = DAL.get_all_products();
        }
        gdvproduct.DataBind();

       
    }


    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["category"] != null)
        {
            product_category_Id = Convert.ToInt32(Request.QueryString["category"].ToString());
        }
        if (!IsPostBack)
        {
            bind_products();
        }
    }
    protected void btnsave_Click(object sender, EventArgs e)
    {
         try
         {
             if (product_category_Id > 0)
             {
                 product_name = txtproductname.Text.Trim();
                 product_scientific_name = txtscientificname.Text.Trim();
                 product_description = txtdescription.Text.Trim();
                 if (photoUploader != null && photoUploader.HasFile)
                 {
                     int len = photoUploader.PostedFile.ContentLength;
                     product_photo = new byte[len];
                     photoUploader.PostedFile.InputStream.Read(product_photo, 0, len);
                 }


                 product_keywords = txtkeywords.Text.Trim();
                 product_intake = txtintake.Text.Trim();
                 IsLiveProduct = chkLive.Checked;
                 IsInStock = chkavailable.Checked;

                 user_Id = (Guid)Membership.GetUser(User.Identity.Name).ProviderUserKey;

                 int r = DAL.add_a_product(product_name, product_scientific_name, product_description, product_photo, product_keywords, product_intake, product_category_Id, IsLiveProduct, IsInStock, user_Id);
                 if (r > 0)
                 {
                     bind_products();
                     errormsg.Text = "<font color='red'>Record(s) Saved</font>";
                 }
             }
             else
             {
                 errormsg.Text = "<font color='red'>Please select product category</font>";
             }
         }
         catch (Exception ex)
         {
             errormsg.Text = "<font color='red'>"+ex.Message+"</font>";
         }
    }

    private void delete_a_product(ArrayList productToDelete)
    {

         for (int i = 0; i < productToDelete.Count; i++)
         {


             int product = Convert.ToInt32(productToDelete[i].ToString());
             int r = DAL.delete_a_product(product);

         }

         bind_products();
     }
     protected void btndelete_Click(object sender, EventArgs e)
     {
         ArrayList productToDelete = new ArrayList();

         foreach (GridViewRow row in gdvproduct.Rows)
         {
             if (row.RowType == DataControlRowType.DataRow)
             {
                 CheckBox chkDelete = (CheckBox)row.FindControl("chkDelete");

                 if (chkDelete != null)
                 {
                     if (chkDelete.Checked)
                     {


                         int product = Convert.ToInt32(gdvproduct.DataKeys[row.RowIndex].Values["product_Id"].ToString());
                         productToDelete.Add(product);

                     }
                 }
             }
         }

         delete_a_product(productToDelete);
         bind_products();
     }
     protected void gdvproduct_RowCommand(object sender, GridViewCommandEventArgs e)
     {
         string product = e.CommandArgument.ToString();
         if (e.CommandName == "Rate")
         {
             Response.Redirect("product-rate.aspx?product="+product);
         }

         if (e.CommandName == "Modify")
         {
             Response.Redirect("edit-a-product.aspx?product=" + product);
         }
     }
     protected void gdvproduct_PageIndexChanging(object sender, GridViewPageEventArgs e)
     {
         gdvproduct.PageIndex = e.NewPageIndex;
         bind_products();
     }

   
     protected void gdvproduct_RowDeleting(object sender, GridViewDeleteEventArgs e)
     {
         try
         {
             int product = Convert.ToInt32(gdvproduct.DataKeys[e.RowIndex].Value.ToString());
             int r = DAL.delete_a_product(product);
             if (r > 0)
             {
                 bind_products();
             }
         }
         catch (Exception ex)
         {
             errormsg.Text = "<font color='red'><ul>" + ex.Message + "</ul></font>";
         }
     }
    }
    

