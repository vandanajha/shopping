<%@ Page Title="" Language="C#" MasterPageFile="~/administrator/admin.master" AutoEventWireup="true" CodeFile="product-rate.aspx.cs" Inherits="administrator_product_rate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="tablestyle">
        <tr>
           <th colspan="2">Unit Price</th>
        </tr>
         <tr>
           <td colspan="2"><asp:Literal ID="errormsg" runat="server"></asp:Literal></td>
        </tr>
        <tr>
           <td>Product Unit :</td><td><asp:TextBox ID="txtproductunit" runat="server" CssClass="textbox"></asp:TextBox></td>
        </tr>
         <tr>
           <td>Unit Rate :</td><td><asp:TextBox ID="txtproductrate" runat="server" CssClass="textbox"></asp:TextBox></td>
         </tr>
          <tr>
           <td colspan="2">
               <asp:Button ID="btnsave" runat="server" Text="Save" 
                   CssClass="button" onclick="btnsave_Click"/>&nbsp;&nbsp;<input type="reset" value="Cancel" class="button"/></td>
        </tr>
    </table>

    <br />
    <asp:GridView ID="gdvunit" runat="server" DataKeyNames="product_Id,product_unit"  CssClass="tablestyle"
            AutoGenerateColumns="false" AllowPaging="true" PageSize="10" 
            
           >
          <EmptyDataTemplate>
             Sorry , No Record(s) Available
          </EmptyDataTemplate>

          <Columns>

         

             <asp:TemplateField HeaderText="Product Name">

                 <ItemTemplate>
                    <%#Eval("product_name") %>
                 </ItemTemplate>

                 

             </asp:TemplateField>

                <asp:TemplateField HeaderText="Unit">

                 <ItemTemplate>
                    <%#Eval("product_unit") %>
                 </ItemTemplate>

                 

             </asp:TemplateField>

              <asp:TemplateField HeaderText="Rate/Unit">

                 <ItemTemplate>
                    <%#Eval("product_unit_rate") %>
                 </ItemTemplate>

                 

             </asp:TemplateField>

              <asp:TemplateField>

                 <ItemTemplate>
                   
                   <asp:Button ID="btnedit" runat="server" Text="Edit" CommandName="Modify" CommandArgument='<%#Eval("product_Id") %>' CssClass="button"/>
                    <asp:Button ID="btndelete" runat="server" Text="Delete" CommandName="Delete" CommandArgument='<%#Eval("product_Id") %>' CssClass="button"/>
                 </ItemTemplate>

                

             </asp:TemplateField>


          </Columns>
       </asp:GridView>
</asp:Content>

