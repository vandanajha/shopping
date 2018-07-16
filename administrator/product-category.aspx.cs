using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Collections;

public partial class administrator_product_category : System.Web.UI.Page
{
    string product_category_name = "";
    bool IsLiveProductCategory = false;
    Guid user_Id;

    protected void bind_product_category()
    {
        gdvcategory.DataSource = DAL.get_all_product_categories();
        gdvcategory.DataBind();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bind_product_category();
        }
    }
    protected void btnsave_Click(object sender, EventArgs e)
    {
      try
        {
            string errmsg = "";

            user_Id = (Guid)Membership.GetUser(User.Identity.Name).ProviderUserKey;
            if (string.IsNullOrEmpty(txtcategoryname.Text.Trim()))
            {
                errmsg += "<li>Please Enter Product Category Name</li>";
            }
            else
            {
                product_category_name = txtcategoryname.Text.Trim();
            }

           

            IsLiveProductCategory = chkLive.Checked;

            if (errmsg.Length > 0)
            {
                errormsg.Text = "<font color='red'><ul>" + errmsg + "</ul></font>";
            }
            else
            {
                int r = DAL.add_a_product_category(product_category_name, IsLiveProductCategory, user_Id);
                if (r > 0)
                {
                    bind_product_category();
                    errormsg.Text = "<font color='red'>Product Category Saved !</font>";
                    errmsg = "";
                }
                else
                {
                    errormsg.Text = "<font color='red'>Error Saving Product Category !</font>";
                }
            }
        }
        catch (Exception ex)
        {
            errormsg.Text = "<font color='red'><ul>" + ex.Message + "</ul></font>";
        }
    }
    protected void gdvcategory_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gdvcategory.EditIndex = e.NewEditIndex;
        bind_product_category();
    }
    protected void gdvcategory_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gdvcategory.EditIndex = -1;
        bind_product_category();
    }
    protected void gdvcategory_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gdvcategory.PageIndex = e.NewPageIndex;
        bind_product_category();
    }
    protected void gdvcategory_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "add_a_product")
        {
            string category = e.CommandArgument.ToString();
            Response.Redirect("list-of-products.aspx?category=" + category);
        }
    }

    private void delete_a_category(ArrayList categoryToDelete)
    {

       for (int i = 0; i < categoryToDelete.Count; i++)
        {
            

            int category =Convert.ToInt32(categoryToDelete[i].ToString());
            int r = DAL.delete_a_product_category(category);
        
        }
        
        bind_product_category();
    }
    protected void btndelete_Click(object sender, EventArgs e)
    {
        ArrayList categoryToDelete = new ArrayList();

        foreach (GridViewRow row in gdvcategory.Rows)
        {
            if (row.RowType == DataControlRowType.DataRow)
            {
                CheckBox chkDelete = (CheckBox)row.FindControl("chkDelete");

                if (chkDelete != null)
                {
                    if (chkDelete.Checked)
                    {
                        

                        int category =Convert.ToInt32( gdvcategory.DataKeys[row.RowIndex].Values["product_category_Id"].ToString());
                        categoryToDelete.Add(category);

                    }
                }
            }
        }

        delete_a_category(categoryToDelete);
        bind_product_category();
    }
    protected void gdvcategory_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            int category = Convert.ToInt32(gdvcategory.DataKeys[e.RowIndex].Value.ToString());
            int r = DAL.delete_a_product_category(category);
            if (r > 0)
            {
                bind_product_category();
            }
        }
        catch (Exception ex)
        {
            errormsg.Text = "<font color='red'><ul>" + ex.Message + "</ul></font>";
        }
    }
    protected void gdvcategory_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            user_Id = (Guid)Membership.GetUser(User.Identity.Name).ProviderUserKey;
            int product_category_Id = Convert.ToInt32(gdvcategory.DataKeys[e.RowIndex].Value.ToString());
            string product_category_name = ((TextBox)gdvcategory.Rows[e.RowIndex].FindControl("txtproductcategory")).Text;
            bool IsLiveProductCategory=((CheckBox)gdvcategory.Rows[e.RowIndex].FindControl("chkLive2")).Checked;
            int r = DAL.update_a_product_category(product_category_Id,product_category_name,IsLiveProductCategory,user_Id);
            if (r > 0)
            {

                gdvcategory.EditIndex = -1;
                bind_product_category();
            }
        }
        catch (Exception ex)
        {
            errormsg.Text = "<font color='red'>" + ex.Message + "</font>";
        }
    }
}