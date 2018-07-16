<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="product-details.aspx.cs" Inherits="product_details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!-- InstanceBeginEditable name="EditRegion1" -->

            <asp:Repeater ID="rptproducts" runat="server" 
        onitemcommand="rptproducts_ItemCommand" 
        onitemdatabound="rptproducts_ItemDataBound">
             <ItemTemplate>
              <table width="100%" cellpadding="0" cellspacing="0">
                <tr>
                  <td><span class="style5"><asp:Literal ID="lblcaption" runat="server"></asp:Literal></span></td>
                </tr>
                <tr>
                  <td height="10"><hr /></td>
                </tr>
                <tr>
                  <td class="bottom-menu"><a href="index.aspx">Home</a> - <a href="herbs.html">Herbs</a></td>
                </tr>
                <tr>
                  <td><p class="heading1">&nbsp;<%#Eval("product_name") %><span class="style7">(<%#Eval("product_scientific_name") %>)</span></p></td>
                </tr>
                <tr>
                  <td><table width="100%" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="38%"><img src='process-image.ashx?product=<%#Eval("product_Id") %>' width="300" height="237" /></td>
                      <td width="62%"><table width="100%" cellspacing="0" cellpadding="8">
                        <tr>
                          <td><span class="heading1"><asp:Literal ID="lblproductname" runat="server" Text='<%#Eval("product_name") %>'></asp:Literal></span></td>
                        </tr>
                        <tr>
                          <td>
                              <p class="style9"><asp:Literal ID="lblproductdescription" runat="server" Text='<%#Eval("product_description") %>'></asp:Literal> </p>
                              <p class="style9"><strong><span class="style11">Recommended Intake </span>: </strong><%#Eval("product_intake") %></p>
                              <p class="style9"><span class="style11">Price:</span> 25gm-100/- INR,  50gm-200/- INR, 100gm-400/- INR</p>
                          </td>
                        </tr>
                        <tr>
                          <td><table width="100%" cellspacing="0" cellpadding="0">
                            <tr>
                              <td width="73%"><table width="123%" cellspacing="0" cellpadding="4">
                                <tr>
                                  <td width="28%">
                                    Weight:
                                    <br />                                    
                                 </td>
                                  <td width="72%">
                                     25 gm 
                                    <input type="radio" name="radio" id="radio" value="radio" />
                                     &nbsp;&nbsp;&nbsp;&nbsp;50gm 
                                    <input type="radio" name="radio" id="radio2" value="radio" />
                                     &nbsp;&nbsp;&nbsp;&nbsp;100gm 
                                    <input type="radio" name="radio" id="radio3" value="radio" />
                                     &nbsp;&nbsp;
                                 </td>
                                </tr>
                                <tr>
                                  <td>Quantity:</td>
                                  <td><input name="quantity" type="number" class="qui1" value="1" min="1" /></td>
                                </tr>
                                <tr>
                                  <td><div align="right"><img src="images/basket1.jpg" width="30" height="29" /></div></td>
                                  <td class="style8">
                                  <!--<script async="async" src="https://www.paypalobjects.com/js/external/paypal-button-minicart.min.js?merchant=ZHPC6MMXTS59W" 
                                    data-button="cart" 
                                    data-name='<%#Eval("product_Id") %>' 
                                    data-amount="1"></script>
                                    -->
                                  <!--<asp:Button ID="btnaddtocart" runat="server" CommandName="addTocart" Text="Add To Cart" />
                                  -->
                                  <a id="addToCart" runat="server">ADD TO CART</a>

                                  
                                  </td>
                                </tr>
                                <tr>
                                  <td>&nbsp;</td>
                                  <td><table width="100%" cellspacing="0" cellpadding="4">
                                      
                                      <tr>
                                        <td><table width="91%" cellspacing="0" cellpadding="0">
                                          <tr>
                                            <td width="43%"><span class="style8">&gt;&gt; Share this </span></td>
                                            <td width="17%"><div align="center"><a href="#"><img src="images/facebook.png" width="24" height="24" border="0" /></a></div></td>
                                            <td width="40%"><div align="left"><a href="#"><img src="images/twitter.png" width="24" height="24" border="0" /></a></div></td>
                                          </tr>
                                        </table></td>
                                      </tr>
                                      <tr>
                                        <td><table cellspacing="0" cellpadding="0">
                                            <tbody>
                                              <tr>
                                                <td width="57" valign="top"><img src="images/like.jpg" width="48" height="22" /></td>
                                                <td width="213"><div><span id="u_0_2">45 people like this.<br />
                                                          <a href="#" target="_blank">Sign Up</a> to see what your friends like.</span></div></td>
                                              </tr>
                                            </tbody>
                                        </table></td>
                                      </tr>
                                    </table></td>
                                </tr>
                              </table></td>
                              <td width="27%" valign="top">&nbsp;</td>
                            </tr>
                          </table></td>
                        </tr>
                      </table></td>
                    </tr>
                  </table></td>
                </tr>
                <tr>
                  <td>&nbsp;</td>
                </tr>
              </table>
              </ItemTemplate>
               </asp:Repeater>
            <!-- InstanceEndEditable -->
</asp:Content>

