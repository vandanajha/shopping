<%@ Page Title="" Language="C#" MasterPageFile="~/administrator/admin.master" AutoEventWireup="true" CodeFile="product-category.aspx.cs" Inherits="administrator_product_category" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="add-a-category">

    <table class="tablestyle">
        <tr>
           <th colspan="2"> New Product Category </th>
        </tr>
        <tr>
           <td>Category Name :</td><td><asp:TextBox ID="txtcategoryname" runat="server" CssClass="textbox"></asp:TextBox></td>
        </tr>
        
          <tr>
           <td>&nbsp;</td><td><asp:CheckBox ID="chkLive" runat="server" Text="Is Live Product Category" /></td>
        </tr>
         <tr>
           <td colspan="2"><asp:Literal ID="errormsg" runat="server"></asp:Literal></td>
        </tr>
         <tr>
           <td colspan="2">
           <asp:Button ID="btnsave" runat="server" Text="Save" onclick="btnsave_Click" CssClass="button" 
                   />&nbsp;&nbsp;<input type="reset" value="Cancel" class="button"/></td>
        </tr>
    </table>
    </div>

    <div id="list-of-category">
     <asp:Button ID="btndelete" runat="server" Text="Delete Selected Records" CssClass="button" 
          Width="200px" onclick="btndelete_Click" />
     <br />
     <br />
       <asp:GridView ID="gdvcategory" runat="server" DataKeyNames="product_category_Id"  CssClass="tablestyle"
            AutoGenerateColumns="false" AllowPaging="true" PageSize="10" 
            onpageindexchanging="gdvcategory_PageIndexChanging" 
            onrowcancelingedit="gdvcategory_RowCancelingEdit" 
            onrowcommand="gdvcategory_RowCommand" 
            onrowediting="gdvcategory_RowEditing" onrowdeleting="gdvcategory_RowDeleting" 
            onrowupdating="gdvcategory_RowUpdating">
          <EmptyDataTemplate>
             Sorry , No Record(s) Available
          </EmptyDataTemplate>

          <Columns>

          <asp:TemplateField HeaderText="Select Record(s)">
             <ItemTemplate>
            <asp:CheckBox runat="server" ID="chkDelete" />
            </ItemTemplate>
          </asp:TemplateField>
         

             <asp:TemplateField HeaderText="Category Name">

                 <ItemTemplate>
                    <%#Eval("product_category_name") %>
                 </ItemTemplate>

                 <EditItemTemplate>
                    <asp:TextBox ID="txtproductcategory" runat="server" Text='<%#Bind("product_category_name") %>' CssClass="textbox"></asp:TextBox>
                 </EditItemTemplate>

             </asp:TemplateField>

             <asp:TemplateField HeaderText="Is Live Category">

                 <ItemTemplate>
                    <asp:CheckBox ID="chkLive1" runat="server" Checked='<%#Eval("IsLiveProductCategory") %>' Enabled="false" />
                 </ItemTemplate>

                 <EditItemTemplate>
                   <asp:CheckBox ID="chkLive2" runat="server" Checked='<%#Bind("IsLiveProductCategory") %>' />
                 </EditItemTemplate>

             </asp:TemplateField>

              <asp:TemplateField>

                 <ItemTemplate>
                   <asp:Button ID="btnaddproduct" runat="server" Text="New Product" CommandName="add_a_product" CommandArgument='<%#Eval("product_category_Id") %>' CssClass="button" />
                   <asp:Button ID="btnedit" runat="server" Text="Edit" CommandName="Edit" CommandArgument='<%#Eval("product_category_Id") %>' CssClass="button"/>
                    <asp:Button ID="btndelete" runat="server" Text="Delete" CommandName="Delete" CommandArgument='<%#Eval("product_category_Id") %>' CssClass="button"/>
                 </ItemTemplate>

                 <EditItemTemplate>
                   <asp:Button ID="btnupdate" runat="server" Text="Update" CommandName="Update" CommandArgument='<%#Eval("product_category_Id") %>' CssClass="button"/>
                   <asp:Button ID="btncancel" runat="server" Text="Cancel" CommandName="Cancel" CommandArgument='<%#Eval("product_category_Id") %>' CssClass="button"/>
                 </EditItemTemplate>

             </asp:TemplateField>


          </Columns>
       </asp:GridView>

    </div>
</asp:Content>

