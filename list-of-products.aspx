<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="list-of-products.aspx.cs" Inherits="list_of_products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!--InstanceBeginEditable name="EditRegion1" -->
              <table width="100%" cellpadding="0" cellspacing="0">
                <tr>
                  <td class="style5"><asp:Literal ID="lblcaption" runat="server"></asp:Literal></td>
                </tr>
                <tr>
                  <td height="10">

                  <table width="100%" border="0" cellspacing="0" cellpadding="2">
                    <tr>
                      <td><span class="bottom-menu"><a href="index.aspx">Home</a> - <a href="herbs.html">Herbs</a></span></td>
                      <td><div align="center"><a href="herbs.html">&lt;&lt; Prev </a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a 

href="#"> Next &gt;&gt; </a></div></td>
                    </tr>
                  </table>

                  </td>
                </tr>
                <tr>
                  <td height="10"><hr /></td>
                </tr>
                <tr>
                  <td>&nbsp;</td>
                </tr>
                <tr>
                   <td>


                     <asp:DataList ID="lstproducts" runat="server" RepeatColumns="3" RepeatDirection="Horizontal" Width="100%">
                        <ItemTemplate>
                            <table width="100%" cellpadding="4" cellspacing="0">
                                   <tr>

                                       <td>
                         <div id='dis<%#Eval("product_Id") %>' onmouseover="MM_showHideLayers('dis<%#Eval("product_Id") %>','','show')" onmouseout="MM_showHideLayers('dis<%#Eval("product_Id") %>','','hide')">
                             <span class="style6"><%#Eval("product_keywords") %>....</span>
                         </div>
                         <div align="center">
                             <img src='process-image.ashx?product=<%#Eval("product_Id") %>' width="260" height="130" border="0" style="border-color:#CCCCCC" onmouseover="MM_showHideLayers('dis<%#Eval("product_Id") %>','','show')" onmouseout="MM_showHideLayers('dis<%#Eval("product_Id") %>','','hide')" />
                         </div>
                                      </td>

                                    </tr>

                                    <tr>

                                       <td>
                                          <table width="90%" align="center" cellpadding="0" cellspacing="0" bgcolor="#F0F9F2" class="bbb1">
                                            <tr>
                                                 <td width="66%" class="heading2"><%#Eval("product_name") %></td>
                                                 <td width="34%"><div align="center" class="more"><a href='product-details.aspx?product=<%#Eval("product_Id") %>'>Detail</a></div></td>
                                            </tr>
                                         </table>
                                      </td>

                                    </tr>
                     
                            </table>
                      
                        </ItemTemplate>
                     </asp:DataList>


                    <p>&nbsp;</p>
                    <table width="60%" height="39" border="0" align="center" cellpadding="2" cellspacing="0" bordercolor="#CCCCCC" bgcolor="#F0F9F2">
                      <tr>
                        <td><span class="bottom-menu"><a href="index.aspx">Home</a> - <a href="herbs.html">Herbs</a></span></td>
                        <td><div align="center"><a href="herbs.html">&lt;&lt; Prev </a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a 

href="#"> Next &gt;&gt; </a></div></td>
                      </tr>
                    </table>
                    <p>&nbsp;</p>
                  </td>
                </tr>
              </table>
</asp:Content>

