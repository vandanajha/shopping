<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <table class="tablestyle">
        <tr>
           <th colspan="2">Login</th>
        </tr>

        <tr>
           <td>User Name :</td><td><asp:TextBox ID="txtusername" runat="server" CssClass="textbox"></asp:TextBox></td>
        </tr>
         <tr>
           <td>Password :</td><td><asp:TextBox ID="txtpassword" runat="server" TextMode="Password" CssClass="textbox"></asp:TextBox></td>
        </tr>

          <tr>
           <td>&nbsp;</td><td><asp:CheckBox ID="chkremember" runat="server" Text="Remember Me" /></td>
        </tr>
         <tr>
           <td colspan="2"><asp:Literal ID="errormsg" runat="server"></asp:Literal></td>
        </tr>
         <tr>
           <td colspan="2"><asp:Button ID="btnlogin" runat="server" Text="Login" 
                   onclick="btnlogin_Click" CssClass="button"/>&nbsp;&nbsp;<input type="reset" value="Cancel" class="button"/></td>
        </tr>
    </table>
</asp:Content>

