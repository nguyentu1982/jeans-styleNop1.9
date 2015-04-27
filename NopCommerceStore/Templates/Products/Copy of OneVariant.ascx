<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="OneVariant.ascx.cs"
    Inherits="NopSolutions.NopCommerce.Web.Templates.Products.OneVariant" %>
<%@ Register TagPrefix="nopCommerce" TagName="ProductCategoryBreadcrumb" Src="~/Modules/ProductCategoryBreadcrumb.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="ProductRating" Src="~/Modules/ProductRating.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="ProductEmailAFriendButton" Src="~/Modules/ProductEmailAFriendButton.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="ProductAddToCompareList" Src="~/Modules/ProductAddToCompareList.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="ProductSpecs" Src="~/Modules/ProductSpecifications.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="RelatedProducts" Src="~/Modules/RelatedProducts.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="ProductReviews" Src="~/Modules/ProductReviews.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="ProductsAlsoPurchased" Src="~/Modules/ProductsAlsoPurchased.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="SimpleTextBox" Src="~/Modules/SimpleTextBox.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="NumericTextBox" Src="~/Modules/NumericTextBox.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="DecimalTextBox" Src="~/Modules/DecimalTextBox.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="ProductAttributes" Src="~/Modules/ProductAttributes.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="GiftCardAttributes" Src="~/Modules/GiftCardAttributes.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="ProductPrice1" Src="~/Modules/ProductPrice1.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="TierPrices" Src="~/Modules/TierPrices.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="ProductTags" Src="~/Modules/ProductTags.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="ProductShareButton" Src="~/Modules/ProductShareButton.ascx" %>

<ajaxToolkit:ToolkitScriptManager runat="Server" EnableScriptGlobalization="true"
    EnableScriptLocalization="true" ID="sm1" ScriptMode="Release" CompositeScript-ScriptMode="Release" />
<% if (this.SettingManager.GetSettingValueBoolean("Media.CategoryBreadcrumbEnabled"))
   { %>
<nopCommerce:ProductCategoryBreadcrumb ID="ctrlProductCategoryBreadcrumb" runat="server" />
<% } %>
<div class="clear">
</div>
<div class="product-details-page">
    <div class="product-essential product-details-info">

        <script language="javascript" type="text/javascript">
            function UpdateMainImage(url) {
                var imgMain = document.getElementById('<%=defaultImage.ClientID%>');
                imgMain.src = url;
                
            }
        </script>

        <div class="picture">
            <a runat="server" id="lnkMainLightbox" class ="cloud-zoom" rel="position:'inside', showTitle: false, adjustX:-4, adjustY:-4">
                <asp:Image ID="defaultImage" runat="server" Height="415"/>
            </a>
            <asp:ListView ID="lvProductPictures" runat="server" GroupItemCount="3">
                <LayoutTemplate>
                   <%-- <table style="margin-top: 10px;">--%>
                        <asp:PlaceHolder runat="server" ID="groupPlaceHolder"></asp:PlaceHolder>
                   <%-- </table>--%>
                </LayoutTemplate>
                <GroupTemplate>
                    <%--<tr>--%>
                        <asp:PlaceHolder runat="server" ID="itemPlaceHolder"></asp:PlaceHolder>
                    <%--</tr>--%>
                </GroupTemplate>
                <ItemTemplate>
                    <%--<td align="left">--%>
                        <a href="<%#this.PictureService.GetPictureUrl((Picture)Container.DataItem)%>" class="cloud-zoom-gallery" rel="useZoom:'ctl00_ctl00_cph1_cph1_ctl00_lnkMainLightbox', smallImage:'<%#this.PictureService.GetPictureUrl((Picture)Container.DataItem)%>'"
                            title="<%= lProductName.Text%>">
                            <img src="<%#this.PictureService.GetPictureUrl((Picture)Container.DataItem, 70)%>" alt="Product image" /></a>
                    <%--</td>--%>
                </ItemTemplate>
            </asp:ListView>
        </div>
        <div class="overview">
            <h1 class="productname">
                <asp:Literal ID="lProductName" runat="server" />
            </h1>
            <div class="clear">
            </div>
            <div class="shortdescription">
                <asp:Literal ID="lShortDescription" runat="server" />
            </div>
            <asp:PlaceHolder runat="server" ID="phSKU">
                <div class="clear">
                </div>
                <div class="sku">
                    <%=GetLocaleResourceString("Products.SKU")%> <asp:Literal runat="server" ID="lSKU" />
                </div>
            </asp:PlaceHolder>
            <asp:PlaceHolder runat="server" ID="phManufacturerPartNumber">
                <div class="clear">
                </div>
                <div class="manufacturerpartnumber">
                    <%=GetLocaleResourceString("Products.ManufacturerPartNumber")%> <asp:Literal runat="server" ID="lManufacturerPartNumber" />
                </div>
            </asp:PlaceHolder>
            <div class="clear">
            </div>
            <asp:PlaceHolder runat="server" ID="phManufacturers">
                <div class="manufacturers">
                    <asp:Literal ID="lManufacturersTitle" runat="server" />
                    <asp:Repeater runat="server" ID="rptrManufacturers">
                        <ItemTemplate>
                            <asp:HyperLink ID="hlManufacturer" runat="server" Text='<%#Server.HtmlEncode(Eval("LocalizedName").ToString()) %>' NavigateUrl='<%#SEOHelper.GetManufacturerUrl((Manufacturer)(Container.DataItem)) %>' />
                        </ItemTemplate>
                        <SeparatorTemplate>
                            ,
                        </SeparatorTemplate>
                    </asp:Repeater>
                </div>
            </asp:PlaceHolder>
            <div class="clear">
            </div>
        <div class="clear">
        </div>
            <div class="product-collateral">
                <nopCommerce:ProductRating ID="ctrlProductRating" runat="server" />
                <br />
                <div class="one-variant-price">
                    <nopCommerce:ProductPrice1 ID="ctrlProductPrice" runat="server" />
                    <nopCommerce:DecimalTextBox runat="server" ID="txtCustomerEnteredPrice" Value="1"
                        RequiredErrorMessage="<% $NopResources:Products.CustomerEnteredPrice.EnterPrice %>"
                        MinimumValue="0" MaximumValue="100000000" Width="100" />
                </div>
                <div class="add-info">
                    <div class="attributes">
                        <nopCommerce:ProductAttributes ID="ctrlProductAttributes" runat="server" />
                    </div>
                    <br />
                    <nopCommerce:NumericTextBox runat="server" ID="txtQuantity" Value="1" RequiredErrorMessage="<% $NopResources:Products.EnterQuantity %>"
                        RangeErrorMessage="<% $NopResources:Products.QuantityRange %>" MinimumValue="1"
                        MaximumValue="999999" Width="50" />
                    <asp:Button ID="btnAddToCart" runat="server" OnCommand="OnCommand" Text="<% $NopResources:Products.AddToCart %>"
                        CommandName="AddToCart" CommandArgument='<%#Eval("ProductVariantId")%>' CssClass="productvariantaddtocartbutton" />
                    <asp:Button ID="btnAddToWishlist" runat="server" OnCommand="OnCommand" Text="<% $NopResources:Wishlist.AddToWishlist %>"
                        CommandName="AddToWishlist" CommandArgument='<%#Eval("ProductVariantId")%>' CssClass="productvariantaddtowishlistbutton" />
                </div>
                <asp:Panel runat="server" ID="pnlDownloadSample" Visible="false" CssClass="one-variant-download-sample">
                    <span class="downloadsamplebutton">
                        <asp:HyperLink runat="server" ID="hlDownloadSample" Text="<% $NopResources:Products.DownloadSample %>" />
                    </span>
                </asp:Panel>
                
                <asp:Panel ID="pnlStockAvailablity" runat="server" class="stock">
                    <asp:Label ID="lblStockAvailablity" runat="server" />
                </asp:Panel>
                <br />
                <nopCommerce:ProductEmailAFriendButton ID="ctrlProductEmailAFriendButton" runat="server" />
                <nopCommerce:ProductAddToCompareList ID="ctrlProductAddToCompareList" runat="server" />
                <div class="clear">
                </div>
                <nopCommerce:ProductShareButton ID="ctrlProductShareButton" runat="server" />
                <br/>
                <div class="contact-info">
                    <p />
                    <a href="http://quanjeandep.com/topic/11/huong-dan-mua-hang-tai-jeans-style.aspx" target="_blank"><b>[Xem hướng dẫn mua hàng]</b></a>
                     <table style="border-top:2px solid silver;border-bottom:2px solid silver">
                     <tr>
                        <td colspan="2">Hỗ trợ trực tuyến</td>
                     </tr>
                    <tr>
                        <td  class="tele"></td>
                        <td style="width:100px">
                        0979 10 2265 <br/>
                       </td>                    
                        <td><a class="yahoo" href="ymsgr:sendIM?quanjeandep"></a></td><td>Jeans Style Khâm Thiên</td>                    
                    </tr> 
                    <tr>
                        <td  class="tele"></td>
                        <td style="width:100px">
                        0988 08 4657<br/>
                       </td>                    
                        <td><a class="yahoo" href="ymsgr:sendIM?quanjeandep"></a></td><td>Jeans Style Khâm Thiên</td>                    
                    </tr>                
                    <tr>
                        <td  class="tele"></td>
                        <td style="width:100px">
                        0983 25 4657 <br/>
                       </td>                    
                        <td><a class="yahoo" href="ymsgr:sendIM?quanjeandep.banle2"></a></td><td>Jeans Style Long Biên</td>                    
                    </tr>                
                    </table>
                    <div style="text-align:center;height:100px;padding-top:5px">                        
                        <table style=" font-weight:bold; text-align:left" cellpadding="2" cellspacing="1">
                            <tr>
                                <td>SHOPPING:</td>
                                <td></td>
                            </tr>    
                            <tr>
                                <td style="text-align:right">Jeans Style:</td>
                                <td>139 Khâm Thiên, Đống Đa, Hà Nội</td>                                
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td style="text-align:right">Tại kho:<br />
                                    (Tâm Jeans)</td>
                                <td style="width:250px">
                                  Ngõ 99/47 Đức Giang, Long Biên, Hà Nội<br />
                                  (Khu TT 310, Thượng Thanh, Long Biên)
                                </td>
                            </tr>
                        </table> 
                         
                         <b></b>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="clear">
    </div>
    <div class="product-collateral">
        <div class="product-variant-line">
            <asp:Label runat="server" ID="lblError" EnableViewState="false" CssClass="error" />
            <div class="clear">
            </div>
            <nopCommerce:TierPrices ID="ctrlTierPrices" runat="server" />
            <div class="clear">
            </div>
            
            <nopCommerce:GiftCardAttributes ID="ctrlGiftCardAttributes" runat="server" />
            <div class="clear">
            </div>
            <div class="fulldescription">
                <asp:Literal ID="lFullDescription" runat="server" />
            </div>
        </div>

        <div class="clear">
        </div>
        <ajaxToolkit:TabContainer runat="server" ID="ProductsTabs" ActiveTabIndex="0" CssClass="grey">
            
            <ajaxToolkit:TabPanel runat="server" ID="pnlProductSpecs" HeaderText="<% $NopResources:Products.ProductSpecs %>">
                <ContentTemplate>
                    <nopCommerce:ProductSpecs ID="ctrlProductSpecs" runat="server" />
                </ContentTemplate>
            </ajaxToolkit:TabPanel>
            <ajaxToolkit:TabPanel runat="server" ID="pnlProductReviews" HeaderText="<% $NopResources:Products.ProductReviews %>">
                <ContentTemplate>
                    <nopCommerce:ProductReviews ID="ctrlProductReviews" runat="server" ShowWriteReview="true" />
                </ContentTemplate>
            </ajaxToolkit:TabPanel>
            <ajaxToolkit:TabPanel runat="server" ID="pnlProductTags" HeaderText="<% $NopResources:Products.ProductTags %>">
                <ContentTemplate>
                    <nopCommerce:ProductTags ID="ctrlProductTags" runat="server" />
                </ContentTemplate>
            </ajaxToolkit:TabPanel>
        </ajaxToolkit:TabContainer>
                <div class="clear">
        
    </div>
    </div>
    <div>
        <nopCommerce:ProductsAlsoPurchased ID="ctrlProductsAlsoPurchased" runat="server" />
    </div>
    <div class="clear">
    </div>
    <div>
        <nopCommerce:RelatedProducts ID="ctrlRelatedProducts" runat="server" />
    </div>
</div>
