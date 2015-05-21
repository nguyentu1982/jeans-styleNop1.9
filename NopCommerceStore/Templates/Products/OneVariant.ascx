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
<%@ Register TagPrefix="nopCommerce" TagName="ProductOthers" Src="~/Modules/ProductOthers.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="Topic" Src="~/Modules/Topic.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="StyleNote" Src="~/Modules/StyleNote.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="ProductPictures" Src="~/Modules/ProductPictures.ascx" %>

<ajaxToolkit:ToolkitScriptManager runat="Server" EnableScriptGlobalization="true"
    EnableScriptLocalization="true" ID="sm1" ScriptMode="Release" CompositeScript-ScriptMode="Release" />
<div class="product-details-page">
    <% if (this.SettingManager.GetSettingValueBoolean("Media.CategoryBreadcrumbEnabled"))
       { %>
    <nopCommerce:ProductCategoryBreadcrumb ID="ctrlProductCategoryBreadcrumb" runat="server" />
    <% } %>

    <nopCommerce:ProductShareButton ID="ctrlProductShareButton" runat="server" />

    <div class="product-essential product-details-info">
        
        <script lang="javascript" type="text/javascript">
            function UpdateMainImage(url) {
                var imgMain = document.getElementById('<%=defaultImage.ClientID%>');
                imgMain.src = url;

            }
        </script>

        <div class="picture">
            <a runat="server" id="lnkMainLightbox" class="cloud-zoom" rel="position:'inside', showTitle: false, adjustX:-4, adjustY:-4">
                <asp:Image ID="defaultImage" runat="server" Width="100%" />
            </a>
            <div class="picture-guide"> <%=GetLocaleResourceString("Products.Picture.Zoom.Guide")%></div>
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
                    <a href="<%#this.PictureService.GetPictureUrl((Picture)Container.DataItem,0, false, SEOHelper.GetSEName(this.ProductService.GetProductById(this.ProductId).LocalizedName))%>" class="cloud-zoom-gallery" rel="useZoom:'ctl00_ctl00_cph1_cph1_ctl00_lnkMainLightbox', smallImage:'<%#this.PictureService.GetPictureUrl((Picture)Container.DataItem,0, false, SEOHelper.GetSEName(this.ProductService.GetProductById(this.ProductId).LocalizedName))%>'"
                        title="<%= lProductName.Text%>">
                        <img src="<%#this.PictureService.GetPictureUrl((Picture)Container.DataItem, 70)%>" alt="Product image" style="border:1px solid #C0C0C0" /></a>
                    <%--</td>--%>
                </ItemTemplate>
            </asp:ListView>
        </div>
        <div class="overview">
            <div class="discount-tag" runat="server" ID="divDiscount" visible="false"><asp:Label runat="server" ID="lbDiscount" Visible="false" /></div>
            <asp:PlaceHolder runat="server" ID="phManufacturers">
                <div class="manufacturers">
                    <asp:Literal ID="lManufacturersTitle" runat="server" Visible="false" />
                    <asp:Repeater runat="server" ID="rptrManufacturers">
                        <ItemTemplate>
                            <asp:HyperLink ID="hlManufacturer" runat="server" Text='<%#Server.HtmlEncode(Eval("LocalizedName").ToString()) %>' ImageUrl='<%#this.PictureService.GetPictureUrl(((Manufacturer)(Container.DataItem)).Picture,this.SettingManager.GetSettingValueInteger("Media.Manufacture.ThumbnailImageSizeInProductPage", 75))%>' />
                        </ItemTemplate>
                        <SeparatorTemplate>
                        </SeparatorTemplate>
                    </asp:Repeater>

                </div>

            </asp:PlaceHolder>

            <div class="product-info">                
                <h1 class="productname">
                    <asp:Literal ID="lProductName" runat="server" />
                </h1>
                <div class="shortdescription">
                    <asp:Literal ID="lShortDescription" runat="server" />
                </div>
            </div>

            <asp:PlaceHolder runat="server" ID="phSKU">
                <div class="clear">
                </div>
                <div class="sku">
                    <%=GetLocaleResourceString("Products.SKU")%>
                    <asp:Literal runat="server" ID="lSKU" />
                </div>
            </asp:PlaceHolder>
            <asp:PlaceHolder runat="server" ID="phManufacturerPartNumber">
                <div class="manufacturerpartnumber">
                    <%=GetLocaleResourceString("Products.ManufacturerPartNumber")%>
                    <asp:Literal runat="server" ID="lManufacturerPartNumber" />
                </div>
            </asp:PlaceHolder>

            <div class="product-collateral">
                
                <nopCommerce:ProductRating ID="ctrlProductRating" runat="server" />
                <br />
                <div>
                    <div class="one-variant-price">
                        <nopCommerce:ProductPrice1 ID="ctrlProductPrice" runat="server" />

                        <nopCommerce:DecimalTextBox runat="server" ID="txtCustomerEnteredPrice" Value="1"
                            RequiredErrorMessage="<% $NopResources:Products.CustomerEnteredPrice.EnterPrice %>"
                            MinimumValue="0" MaximumValue="100000000" Width="100" />
                    </div>
                    <div class="freeShipping">
                        <asp:Image ID="imgFreeShiping" runat="server" Visible="false" />
                    </div>
                </div>
                <div class="add-info">
                    <div class="size-guide">
                        <a style="cursor: pointer; text-decoration: underline;" onclick="window.open('<%=CommonHelper.GetStoreLocation()%>topic/29/huong-dan-chon-size-quan-jean.aspx', 'window', 'toolbars=0,width=900,height=600,left=200,top=200,scrollbars=1,resizable=1');"><%=GetLocaleResourceString("Products.SizeGuide")%></a>
                    </div>
                    <div class="attributes">
                        <nopCommerce:ProductAttributes ID="ctrlProductAttributes" runat="server" />
                        <asp:Panel ID="pnlStockAvailablity" runat="server" class="stock">
                            <asp:Label ID="lblStockAvailablity" runat="server" />
                        </asp:Panel>
                    </div>
                    <br />

                    <nopCommerce:NumericTextBox runat="server" ID="txtQuantity" Value="1" RequiredErrorMessage="<% $NopResources:Products.EnterQuantity %>"
                        RangeErrorMessage="<% $NopResources:Products.QuantityRange %>" MinimumValue="1"
                        MaximumValue="999999" Width="50" />
                    <asp:Button ID="btnAddToCart" runat="server" OnCommand="OnCommand" Text="<% $NopResources:Products.AddToCart %>"
                        CommandName="AddToCart" CommandArgument='<%#Eval("ProductVariantId")%>' CssClass="productvariantaddtocartbutton" />
                    <asp:Label runat="server" ID="lblError" EnableViewState="false" CssClass="error" />
                </div>
                <asp:Panel runat="server" ID="pnlDownloadSample" Visible="false" CssClass="one-variant-download-sample">
                    <span class="downloadsamplebutton">
                        <asp:HyperLink runat="server" ID="hlDownloadSample" Text="<% $NopResources:Products.DownloadSample %>" />
                    </span>
                </asp:Panel>

                <% var warehouse = new List<Warehouse>();
                   foreach (ProductVariant pv in ProductVariants)
                   {
                       if (pv.Warehouse != null)
                       {
                           warehouse.Add(pv.Warehouse);
                       }
                   }
                   if (warehouse.Count > 0)
                   {%>
                <div style="border: dotted 1px #c0c0c0; padding: 5px; margin: 10px 0px 10px 0px; background-color: aqua;font-size:14px;max-width:350px;">
                    <div style="font-weight: bold; color: #3664A5; font-size: 14px; font-family: Tahoma, Verdana, Arial, Helvetica, sans-serif;">
                        <%=GetLocaleResourceString("Products.Warehouse")%>
                    </div>
                    <asp:Repeater ID="rptStored" runat="server">
                        <ItemTemplate>
                            <div style="width: 300px; font-weight: bold; margin-top: 5px"><%#Eval("Name") %></div>

                            <div style="margin-left: 20px"><%=GetLocaleResourceString("Warehouse.StreetAddress")%><%#Eval("Address1") %>- <%#Eval("City") %> </div>
                            <div style="margin-left: 20px"><%=GetLocaleResourceString("Warehouse.TelephoneNumber")%><%#Eval("PhoneNumber")%><br/><%#Eval("Email") %></div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
                <%}   
                %>
                <asp:Button ID="btnAddToWishlist" runat="server" OnCommand="OnCommand" Text="<% $NopResources:Wishlist.AddToWishlist %>"
                    CommandName="AddToWishlist" CommandArgument='<%#Eval("ProductVariantId")%>' CssClass="productvariantaddtowishlistbutton" />
                <nopCommerce:ProductEmailAFriendButton ID="ctrlProductEmailAFriendButton" runat="server" />
                <nopCommerce:ProductAddToCompareList ID="ctrlProductAddToCompareList" runat="server" />

                <table>
                    <tr>
                        <td>
                            <asp:HyperLink ID="lkNganLuong" runat="server" title="Thanh toán trực tuyến AN TOÀN và ĐƯỢC BẢO VỆ, sử dụng thẻ ngân hàng trong và ngoài nước hoặc nhiều hình thức tiện lợi khác.
Được bảo hộ & cấp phép bởi NGÂN HÀNG NHÀ NƯỚC, ví điện tử duy nhất được cộng đồng ƯA THÍCH NHẤT 2 năm liên tiếp, Bộ Thông tin Truyền thông trao giải thưởng Sao Khuê."
                                Target="_blank"><img src="https://www.nganluong.vn/data/images/merchant/button/btn-buynow-122.png" alt="Thanh toan qua Nganluong.vn"/></asp:HyperLink></td>
                        <td>
                            <asp:HyperLink ID="lkBaoKim" runat="server" Target="_blank"><img src="https://www.baokim.vn/
application/uploads/buttons/btn_safety_payment_1.png" alt="Thanh toán an toàn với Bảo Kim !"
border="0" title="Thanh toán trực tuyến an toàn dùng tài khoản Ngân hàng (VietcomBank,
TechcomBank, Đông Á, VietinBank, Quân Đội, VIB, SHB,... và thẻ Quốc tế (Visa, Master Card...) qua
Cổng thanh toán trực tuyến BảoKim.vn"/></asp:HyperLink></td>
                    </tr>
                    <tr>
                        <td><a target="_blank" href="http://help.nganluong.vn/quanjeandep.com.html" title="Hướng dẫn thanh toán qua NgânLượng.vn">[Hướng dẫn thanh toán]n]</a></td>
                        <td><a href="https://www.baokim.vn/payment_guide/quanjeandepcom.html" target="_blank"
                            style="font: Arial, Helvetica, sans-serif; text-decoration: none; color: #666; font-size: 12px">[Hướng dẫn
thanh toán]</a></td>
                    </tr>
                </table>
            </div>
        </div>

    </div>
    <div class="clear">
    </div>
    <div class="product-collateral">
        <div class="fb-comments" data-href="<%=SEOHelper.GetProductUrl(this.ProductId) %>" data-width="768" data-num-posts="10"></div>
        <div class="product-variant-line">

            <div class="clear">
            </div>
            <nopCommerce:TierPrices ID="ctrlTierPrices" runat="server" />
            <div class="clear">
            </div>

            <nopCommerce:GiftCardAttributes ID="ctrlGiftCardAttributes" runat="server" />
            <div class="clear">
            </div>

        </div>
        <ajaxToolkit:TabContainer runat="server" ID="ProductsTabs" ActiveTabIndex="0" CssClass="grey">
            <ajaxToolkit:TabPanel runat="server" ID="pnlStyleNote" HeaderText="<% $NopResources:Products.StyleNote %>" visible="false">
                <ContentTemplate>
                    <nopCommerce:StyleNote ID="ctrlStyleNote" runat="server" />
                </ContentTemplate>
            </ajaxToolkit:TabPanel>
            <ajaxToolkit:TabPanel runat="server" ID="pnlProductSpecs" HeaderText="<% $NopResources:Products.ProductSpecs %>">
                <ContentTemplate>
                    <nopCommerce:ProductSpecs ID="ctrlProductSpecs" runat="server" Visible="true" />
                </ContentTemplate>
            </ajaxToolkit:TabPanel>
            <ajaxToolkit:TabPanel runat="server" ID="pnlProductGuaranty" HeaderText="<% $NopResources:Products.Guaranty %>" visible="true">
                <ContentTemplate>
                    <nopCommerce:Topic ID="topicFreeShiping" runat="server" TopicName="FreeShipping" OverrideSEO="false"></nopCommerce:Topic>
                </ContentTemplate>
            </ajaxToolkit:TabPanel>
            <ajaxToolkit:TabPanel runat="server" ID="pnlReturnPolicy" HeaderText="<% $NopResources:Products.ReturnPolicy %>">
                <ContentTemplate>
                    <nopCommerce:Topic ID="topicReturnPolicy" runat="server" TopicName="ReturnPolicy" OverrideSEO="false"></nopCommerce:Topic>
                </ContentTemplate>
            </ajaxToolkit:TabPanel>
            <ajaxToolkit:TabPanel runat="server" ID="pnlSizeGuide" HeaderText="<% $NopResources:Products.SizeGuide %>">
                <ContentTemplate>
                    <nopCommerce:Topic ID="SizeGuide" runat="server" TopicName="SizeGuide" OverrideSEO="false"></nopCommerce:Topic>
                </ContentTemplate>
            </ajaxToolkit:TabPanel>
            <ajaxToolkit:TabPanel runat="server" ID="pnlProductReviews" HeaderText="<% $NopResources:Products.ProductReviews %>">
                <ContentTemplate>
                    
                </ContentTemplate>
            </ajaxToolkit:TabPanel>
            <ajaxToolkit:TabPanel runat="server" ID="pnlProductTags" HeaderText="<% $NopResources:Products.ProductTags %>" visible="false">
                <ContentTemplate>
                    <nopCommerce:ProductTags ID="ctrlProductTags" runat="server" Visible="false" />
                </ContentTemplate>
            </ajaxToolkit:TabPanel>
        </ajaxToolkit:TabContainer>





        <div class="fulldescription" runat="server" id="divFuffDesc" visible="false">
            <h2 class="productname-description">
                <%=GetLocaleResourceString("Product.FullDescriptionHeader")%>
                <asp:Literal ID="lProductName1" runat="server" />
            </h2>
            <div class="fulldescription-detail">
                <asp:Literal ID="lFullDescription" runat="server" />
            </div>

        </div>

        <h2 class="productname-description">
            <%=GetLocaleResourceString("Product.FullImageDescriptionHeader")%>
            <asp:Literal ID="lProductName2" runat="server" />
        </h2>
        <div class="image-description-detail">

            <asp:ListView ID="dlProductPictureDesciption" runat="server">
                <ItemTemplate>
                    <nopCommerce:ProductPictures ID="ctrlProductBox" ProductPicture='<%# Container.DataItem %>'
                        runat="server" />
                </ItemTemplate>
            </asp:ListView>
	
	
        </div>

	<ajaxToolkit:TabContainer runat="server" ID="ProductsTabs2" ActiveTabIndex="2" CssClass="grey">
         
            
           
            <ajaxToolkit:TabPanel runat="server" ID="pnlReturnPolicy2" HeaderText="<% $NopResources:Products.ReturnPolicy %>">
                <ContentTemplate>
                    <nopCommerce:Topic ID="topicReturnPolicy2" runat="server" TopicName="ReturnPolicy" OverrideSEO="false"></nopCommerce:Topic>
                </ContentTemplate>
            </ajaxToolkit:TabPanel>
            <ajaxToolkit:TabPanel runat="server" ID="pnlSizeGuide2" HeaderText="<% $NopResources:Products.SizeGuide %>">
                <ContentTemplate>
                    <nopCommerce:Topic ID="SizeGuide2" runat="server" TopicName="SizeGuide" OverrideSEO="false"></nopCommerce:Topic>
                </ContentTemplate>
            </ajaxToolkit:TabPanel>
            <ajaxToolkit:TabPanel runat="server" ID="pnlProductReviews2" HeaderText="<% $NopResources:Products.ProductReviews %>">
                <ContentTemplate>
                    <nopCommerce:ProductReviews ID="ctrlProductReviews2" runat="server" ShowWriteReview="true" Visible="true" />
                </ContentTemplate>
            </ajaxToolkit:TabPanel>
        </ajaxToolkit:TabContainer>

	<div style="border:1px solid #c0c0c0;float:left;">
	<nopCommerce:Topic ID="topicFreeShiping2" runat="server" TopicName="FreeShipping" OverrideSEO="false"></nopCommerce:Topic>
	</div>
        <div class="clear">
        </div>

        <div class="hot-search"><%=GetLocaleResourceString("Product.HotSearch")%> <%=lProductName1.Text %></div>
        <nopCommerce:ProductTags ID="ProductTags1" runat="server" />
        <div class="what_else">
            <%=GetLocaleResourceString("Product.WhatElse")%>
            <br />
            <a href="#top" rel="nofollow">Thêm vào giỏ hàng</a> | 
        <a href="javascript:history.back(-1)" rel="nofollow">Quay lại trang trước</a> |     
        <asp:HyperLink ID="hylinkCate" runat="server" />
        </div>
        <div>
            <nopCommerce:ProductsAlsoPurchased ID="ctrlProductsAlsoPurchased" runat="server" />
        </div>
        <div class="clear">
        </div>
        <div>
            <nopCommerce:ProductOthers ID="ProductOthers" runat="server" />
        </div>
        <div class="clear">
        </div>
        <%--<div>
        <nopCommerce:RelatedProducts ID="ctrlRelatedProducts" runat="server" />
    </div>--%>
    </div>

</div>
<script text="text/javascript">
$("#__tab_ctl00_ctl00_cph1_cph1_ctl00_ProductsTabs_pnlProductReviews").click(function() {
    $('html, body').animate({
        scrollTop: $("#__tab_ctl00_ctl00_cph1_cph1_ctl00_ProductsTabs2_pnlProductReviews2").offset().top
    }, 2000);
});

//$(document).scroll(function ()
//{
//    var offset = $(".buyer-guide").offset();
    
//    var w = $(window);
//    if (offset.top - w.scrollTop() < 207) {
//        $(".buyer-guide").css("position", "fixed");        
//    }
//    else {
       
//    }
   
    
//    //alert("(x,y): (" + (offset.left - w.scrollLeft()) + "," + (offset.top - w.scrollTop()) + ")");
//})
 
</script>