<%@ Page Title="" Language="C#" MasterPageFile="~/administrator/admin.master" AutoEventWireup="true" CodeFile="list-of-products.aspx.cs" Inherits="administrator_list_of_products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  
  <div id="add-a-product">
     <table class="tablestyle">
        <tr>
           <th colspan="2">New Product</th>
        </tr>
         <tr>
           <td colspan="2"><asp:Literal ID="errormsg" runat="server"></asp:Literal></td>
        </tr>
        <tr>
           <td>Product Name :</td><td><asp:TextBox ID="txtproductname" runat="server" CssClass="textbox"></asp:TextBox></td>
        </tr>
         <tr>
           <td>Scientific Name :</td><td><asp:TextBox ID="txtscientificname" runat="server" CssClass="textbox"></asp:TextBox></td>
         </tr>
         <tr>
           <td>Description :</td><td><asp:TextBox ID="txtdescription" runat="server" 
                 CssClass="textbox" TextMode="MultiLine" Height="100px"></asp:TextBox></td>
         </tr>
         <tr>
           <td>Upload Photo :</td><td><asp:FileUpload ID="photoUploader" runat="server" CssClass="textbox"></asp:FileUpload></td>
         </tr>
         <tr>
           <td>Keywords :</td><td><asp:TextBox ID="txtkeywords" runat="server" CssClass="textbox" TextMode="MultiLine" Height="75px"></asp:TextBox></td>
         </tr>

         <tr>
           <td>Recomended Intake :</td><td><asp:TextBox ID="txtintake" runat="server" CssClass="textbox" TextMode="MultiLine" Height="75px"></asp:TextBox></td>
         </tr>

          <tr>
           <td>&nbsp;</td><td><asp:CheckBox ID="chkLive" runat="server" Text="Is Live Product ?" /></td>
         </tr>

         <tr>
           <td>&nbsp;</td><td><asp:CheckBox ID="chkavailable" runat="server" Text="Is InStock?" /></td>
         </tr>

        
         <tr>
           <td colspan="2"><asp:Button ID="btnsave" runat="server" Text="Save" 
                   onclick="btnsave_Click" CssClass="button"/>&nbsp;&nbsp;<input type="reset" value="Cancel" class="button"/></td>
        </tr>
     </table>
  </div>

  <div id="search-product">
     
  </div>

   <div id="list-of-products">
      <asp:Button ID="btndelete" runat="server" Text="Delete Selected Records" CssClass="button" 
          Width="200px" onclick="btndelete_Click" />
     <br />
     <br />
       <asp:GridView ID="gdvproduct" runat="server" DataKeyNames="product_Id"  CssClass="tablestyle"
            AutoGenerateColumns="false" AllowPaging="true" PageSize="10" 
           onrowcommand="gdvproduct_RowCommand" 
           onpageindexchanging="gdvproduct_PageIndexChanging" onrowdeleting="gdvproduct_RowDeleting">
          <EmptyDataTemplate>
             Sorry , No Record(s) Available
          </EmptyDataTemplate>

          <Columns>

          <asp:TemplateField HeaderText="Select Record(s)">
             <ItemTemplate>
            <asp:CheckBox runat="server" ID="chkDelete" />
            </ItemTemplate>
          </asp:TemplateField>
         

           <asp:TemplateField HeaderText="Photo">

                 <ItemTemplate>
                    <img src='../process-image.ashx?product=<%#Eval("product_Id") %>' width="50" height="50" />
                 </ItemTemplate>

                 

             </asp:TemplateField>

             <asp:TemplateField HeaderText="Product Name">

                 <ItemTemplate>
                    <%#Eval("product_name") %>
                 </ItemTemplate>

                 

             </asp:TemplateField>

               <asp:TemplateField HeaderText="Scientific Name">

                 <ItemTemplate>
                    <%#Eval("product_scientific_name") %>
                 </ItemTemplate>

                 

             </asp:TemplateField>

              <asp:TemplateField HeaderText="Keywords">

                 <ItemTemplate>
                    <%#Eval("product_keywords") %>
                 </ItemTemplate>

                 

             </asp:TemplateField>

              <asp:TemplateField HeaderText="Recommended Intake">

                 <ItemTemplate>
                    <%#Eval("product_intake") %>
                 </ItemTemplate>

                 

             </asp:TemplateField>

             <asp:TemplateField HeaderText="Is Live Product">

                 <ItemTemplate>
                    <asp:CheckBox ID="chkLive1" runat="server" Checked='<%#Eval("IsLiveProduct") %>' Enabled="false" />
                 </ItemTemplate>

                

             </asp:TemplateField>

              <asp:TemplateField HeaderText="InStock">

                 <ItemTemplate>
                    <asp:CheckBox ID="chkstock" runat="server" Checked='<%#Eval("IsInStock") %>' Enabled="false" />
                 </ItemTemplate>

                

             </asp:TemplateField>

              <asp:TemplateField>

                 <ItemTemplate>
                   <asp:Button ID="btnaddprice" runat="server" Text="Add Price" CommandName="Rate" CommandArgument='<%#Eval("product_Id") %>' CssClass="button" />
                   <asp:Button ID="btnedit" runat="server" Text="Edit" CommandName="Modify" CommandArgument='<%#Eval("product_Id") %>' CssClass="button"/>
                    <asp:Button ID="btndelete" runat="server" Text="Delete" CommandName="Delete" CommandArgument='<%#Eval("product_Id") %>' CssClass="button"/>
                 </ItemTemplate>

                

             </asp:TemplateField>


          </Columns>
       </asp:GridView>

  </div>
</asp:Content>

