<%@ Page Title="" Language="C#" MasterPageFile="~/administrator/admin.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="administrator_index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table width="50%" class="tablestyle">
        <tr>
            <td>
                <a href="product-category.aspx">
                    <p>
                        <img src="" alt="pic" vspace="5px" hspace="10px" width="100px" height="100px" border="0" />
                    </p>
                    <p>
                        Category Manager
                    </p>
                </a>
            </td>
            <td>
                <a href="list-of-products.aspx">
                    <p>
                        <img src="" alt="pic" vspace="5px" hspace="10px" width="100px" height="100px" border="0" />
                    </p>
                    <p>
                        Product Manager
                    </p>
                </a>
            </td>
            <td>
                <a href="#">
                    <p>
                        <img src="" alt="pic" vspace="5px" hspace="10px" width="100px" height="100px" border="0" />
                    </p>
                    <p>
                        Customer Manager
                    </p>
                </a>
            </td>
            <td>
                <a href="#">
                    <p>
                        <img src="" alt="pic" vspace="5px" hspace="10px" width="100px" height="100px" border="0" />
                    </p>
                    <p>
                        Send Emails/SMS
                    </p>
                </a>
            </td>
        </tr>



    </table>
</asp:Content>

