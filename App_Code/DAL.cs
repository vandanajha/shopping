using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

/// <summary>
/// Summary description for DAL
/// </summary>
public static class DAL
{
    public static SqlConnection get_connection()
    {
        SqlConnection cn = new SqlConnection();
        cn.ConnectionString = ConfigurationManager.ConnectionStrings["sewaherbs"].ConnectionString;
        return (cn);
    }


    //product_category_master
    public static int add_a_product_category(string product_category_name, bool IsLiveProductCategory, Guid user_Id)
    {
        SqlConnection cn = DAL.get_connection();

        if (cn.State == ConnectionState.Open)
        {
            cn.Close();
        }

        cn.Open();
        SqlCommand cmd = new SqlCommand("add_a_product_category", cn);

        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.AddWithValue("@product_category_name", product_category_name);
        cmd.Parameters.AddWithValue("@IsLiveProductCategory", IsLiveProductCategory);
        cmd.Parameters.AddWithValue("@user_Id", user_Id);

        int result = cmd.ExecuteNonQuery();
        return (result);
    }

    public static int update_a_product_category(int product_category_Id,string product_category_name, bool IsLiveProductCategory, Guid user_Id)
    {
        SqlConnection cn = DAL.get_connection();

        if (cn.State == ConnectionState.Open)
        {
            cn.Close();
        }

        cn.Open();
        SqlCommand cmd = new SqlCommand("update_a_product_category", cn);

        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.AddWithValue("@product_category_Id", product_category_Id);
        cmd.Parameters.AddWithValue("@product_category_name", product_category_name);
        cmd.Parameters.AddWithValue("@IsLiveProductCategory", IsLiveProductCategory);
        cmd.Parameters.AddWithValue("@user_Id", user_Id);

        int result = cmd.ExecuteNonQuery();
        return (result);
    }

    public static int delete_a_product_category(int product_category_Id)
    {
        SqlConnection cn = DAL.get_connection();

        if (cn.State == ConnectionState.Open)
        {
            cn.Close();
        }

        cn.Open();
        SqlCommand cmd = new SqlCommand("delete_a_product_category", cn);

        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.AddWithValue("@product_category_Id", product_category_Id);
      

        int result = cmd.ExecuteNonQuery();
        return (result);
    }

    public static DataSet get_a_product_category(int product_category_Id)
    {
        SqlConnection cn = DAL.get_connection();
        if (cn.State == ConnectionState.Open)
        {
            cn.Close();
        }

        cn.Open();
        SqlCommand cmd = new SqlCommand("get_a_product_category", cn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@product_category_Id", product_category_Id);
        SqlDataAdapter dacategories = new SqlDataAdapter(cmd);
        DataSet dscategories = new DataSet();
        dacategories.Fill(dscategories, "get_a_product_category");
        return (dscategories);
    }


    public static DataSet get_all_product_categories()
    {
        SqlConnection cn = DAL.get_connection();
        if (cn.State == ConnectionState.Open)
        {
            cn.Close();
        }

        cn.Open();
        SqlCommand cmd = new SqlCommand("get_all_product_categories", cn);
        cmd.CommandType = CommandType.StoredProcedure;
        SqlDataAdapter dacategories = new SqlDataAdapter(cmd);
        DataSet dscategories = new DataSet();
        dacategories.Fill(dscategories, "product_category_master");
        return (dscategories);
    }

    public static DataSet get_all_live_product_categories()
    {
        SqlConnection cn = DAL.get_connection();
        if (cn.State == ConnectionState.Open)
        {
            cn.Close();
        }

        cn.Open();
        SqlCommand cmd = new SqlCommand("get_all_live_product_categories", cn);
        cmd.CommandType = CommandType.StoredProcedure;
        SqlDataAdapter dacategories = new SqlDataAdapter(cmd);
        DataSet dscategories = new DataSet();
        dacategories.Fill(dscategories, "product_category_master");
        return (dscategories);
    }



    //product_master

    public static int add_a_product(string product_name,string product_scientific_name,string product_description,byte[] product_photo,string product_keywords,string product_intake,int product_category_Id, bool IsLiveProduct,bool IsInStock, Guid user_Id)
    {
        SqlConnection cn = DAL.get_connection();

        if (cn.State == ConnectionState.Open)
        {
            cn.Close();
        }

        cn.Open();
        SqlCommand cmd = new SqlCommand("add_a_product", cn);

        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.AddWithValue("@product_name", product_name);
        cmd.Parameters.AddWithValue("@product_scientific_name", product_scientific_name);
        cmd.Parameters.AddWithValue("@product_description", product_description);
        cmd.Parameters.AddWithValue("@product_photo", product_photo);
        cmd.Parameters.AddWithValue("@product_keywords", product_keywords);
        cmd.Parameters.AddWithValue("@product_intake", product_intake);
        cmd.Parameters.AddWithValue("@product_category_Id", product_category_Id);        
        cmd.Parameters.AddWithValue("@IsLiveProduct", IsLiveProduct);
        cmd.Parameters.AddWithValue("@IsInStock", IsInStock);
        cmd.Parameters.AddWithValue("@user_Id", user_Id);

        int result = cmd.ExecuteNonQuery();
        return (result);
    }

    public static int update_a_product(int product_Id,string product_name, string product_scientific_name, string product_description, string product_keywords, string product_intake, int product_category_Id, bool IsLiveProduct, bool IsInStock, Guid user_Id)
    {
        SqlConnection cn = DAL.get_connection();

        if (cn.State == ConnectionState.Open)
        {
            cn.Close();
        }

        cn.Open();
        SqlCommand cmd = new SqlCommand("update_a_product", cn);

        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@product_Id", product_Id);
        cmd.Parameters.AddWithValue("@product_name", product_name);
        cmd.Parameters.AddWithValue("@product_scientific_name", product_scientific_name);
        cmd.Parameters.AddWithValue("@product_description", product_description);      
        cmd.Parameters.AddWithValue("@product_keywords", product_keywords);
        cmd.Parameters.AddWithValue("@product_intake", product_intake);
        cmd.Parameters.AddWithValue("@product_category_Id", product_category_Id);
        cmd.Parameters.AddWithValue("@IsLiveProduct", IsLiveProduct);
        cmd.Parameters.AddWithValue("@IsInStock", IsInStock);
        cmd.Parameters.AddWithValue("@user_Id", user_Id);

        int result = cmd.ExecuteNonQuery();
        return (result);
    }


    public static int update_a_product_photo(int product_Id, byte [] product_photo, Guid user_Id)
    {
        SqlConnection cn = DAL.get_connection();

        if (cn.State == ConnectionState.Open)
        {
            cn.Close();
        }

        cn.Open();
        SqlCommand cmd = new SqlCommand("update_a_product_photo", cn);

        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@product_Id", product_Id);
        cmd.Parameters.AddWithValue("@product_photo", product_photo);
        cmd.Parameters.AddWithValue("@user_Id", user_Id);

        int result = cmd.ExecuteNonQuery();
        return (result);
    }


    public static int delete_a_product(int product_Id)
    {
        SqlConnection cn = DAL.get_connection();

        if (cn.State == ConnectionState.Open)
        {
            cn.Close();
        }

        cn.Open();
        SqlCommand cmd = new SqlCommand("delete_a_product", cn);

        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@product_Id", product_Id);
       

        int result = cmd.ExecuteNonQuery();
        return (result);
    }


    public static DataSet get_a_product(int product_Id)
    {
        SqlConnection cn = DAL.get_connection();
        if (cn.State == ConnectionState.Open)
        {
            cn.Close();
        }

        cn.Open();
        SqlCommand cmd = new SqlCommand("get_a_product", cn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@product_Id", product_Id);
        SqlDataAdapter daproduct = new SqlDataAdapter(cmd);
        DataSet dsproduct = new DataSet();
        daproduct.Fill(dsproduct, "get_a_product");
        return (dsproduct);
    }


    public static DataSet get_all_products()
    {
        SqlConnection cn = DAL.get_connection();
        if (cn.State == ConnectionState.Open)
        {
            cn.Close();
        }

        cn.Open();
        SqlCommand cmd = new SqlCommand("get_all_products", cn);
        cmd.CommandType = CommandType.StoredProcedure;
        SqlDataAdapter daproducts = new SqlDataAdapter(cmd);
        DataSet dsproducts = new DataSet();
        daproducts.Fill(dsproducts, "product_master");
        return (dsproducts);
    }

    public static DataSet get_all_live_products()
    {
        SqlConnection cn = DAL.get_connection();
        if (cn.State == ConnectionState.Open)
        {
            cn.Close();
        }

        cn.Open();
        SqlCommand cmd = new SqlCommand("get_all_live_products", cn);
        cmd.CommandType = CommandType.StoredProcedure;
        SqlDataAdapter daproducts = new SqlDataAdapter(cmd);
        DataSet dsproducts = new DataSet();
        daproducts.Fill(dsproducts, "product_master");
        return (dsproducts);
    }


    

    public static DataSet get_all_products_of_category(int product_category_Id)
    {
        SqlConnection cn = DAL.get_connection();
        if (cn.State == ConnectionState.Open)
        {
            cn.Close();
        }

        cn.Open();
        SqlCommand cmd = new SqlCommand("get_all_products_of_category", cn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("product_category_Id", product_category_Id);
        SqlDataAdapter daproducts = new SqlDataAdapter(cmd);
        DataSet dsproducts = new DataSet();
        daproducts.Fill(dsproducts, "product_master");
        return (dsproducts);
    }

    public static DataSet get_all_live_products_of_category(int product_category_Id)
    {
        SqlConnection cn = DAL.get_connection();
        if (cn.State == ConnectionState.Open)
        {
            cn.Close();
        }

        cn.Open();
        SqlCommand cmd = new SqlCommand("get_all_live_products_of_category", cn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("product_category_Id", product_category_Id);
        SqlDataAdapter daproducts = new SqlDataAdapter(cmd);
        DataSet dsproducts = new DataSet();
        daproducts.Fill(dsproducts, "product_master");
        return (dsproducts);
    }


    public static byte[] get_a_product_photo(int product_Id)
    {
        SqlConnection cn = get_connection();
        if (cn.State == ConnectionState.Open)
        {
            cn.Close();
        }

        cn.Open();
        SqlCommand cmd = new SqlCommand("get_a_product_photo", cn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@product_Id",product_Id);
        byte[] photo = (byte[])cmd.ExecuteScalar();

        return (photo);
    }

    //product_unit_master

    public static int add_a_product_unit(int product_Id, string product_unit,double product_unit_rate, Guid user_Id)
    {
        SqlConnection cn = DAL.get_connection();

        if (cn.State == ConnectionState.Open)
        {
            cn.Close();
        }

        cn.Open();
        SqlCommand cmd = new SqlCommand("add_a_product_unit", cn);

        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.AddWithValue("@product_Id", product_Id);
        cmd.Parameters.AddWithValue("@product_unit", product_unit);
        cmd.Parameters.AddWithValue("@product_unit_rate", product_unit_rate);
        
        cmd.Parameters.AddWithValue("@user_Id", user_Id);

        int result = cmd.ExecuteNonQuery();
        return (result);
    }

    public static DataSet get_all_units_of_a_product(int product_Id)
    {
        SqlConnection cn = DAL.get_connection();
        if (cn.State == ConnectionState.Open)
        {
            cn.Close();
        }

        cn.Open();
        SqlCommand cmd = new SqlCommand("get_all_units_of_a_product", cn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("product_Id", product_Id);
        SqlDataAdapter daunits = new SqlDataAdapter(cmd);
        DataSet dsunits = new DataSet();
        daunits.Fill(dsunits, "vw_product_unit_master");
        return (dsunits);
    }

}