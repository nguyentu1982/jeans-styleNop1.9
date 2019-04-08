<%@ Control Language="C#" AutoEventWireup="true" Inherits="NopSolutions.NopCommerce.Web.Modules.ProductBox1Control"
    CodeBehind="ProductBox1.ascx.cs" %>
<%@ Register TagPrefix="nopCommerce" TagName="ProductPrice1" Src="~/Modules/ProductPrice1.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="ProductPrice2" Src="~/Modules/ProductPrice2.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="ProductAttributesOnProductBox" Src="~/Modules/ProductAttributes1.ascx" %>

<div class="product-item"  onmouseover="getNextProductPicture('<%=hlImageLink.ImageUrl %>','<%=this.hiddenProductImageUrls.Value%>','<%=hlImageLink.ClientID %>')" onmouseout="getPreviosProductPicture('<%=this.hiddenProductImageUrls.Value%>','<%=hlImageLink.ClientID %>')" >
    <asp:HiddenField Id="hiddenProductImageUrls" runat="server" />
    <em class="picture-previous" style="display:none" id="<%=hlImageLink.ClientID +"picture-previous" %>" onclick="getPreviosProductPicture('<%=this.hiddenProductImageUrls.Value%>','<%=hlImageLink.ClientID %>')"></em>
    <div class="discount-tag" runat="server" ID="divDiscount" visible="false"><asp:Label runat="server" ID="lbDiscount" Visible="false" /></div>
    <div class="picture" >
        <asp:HyperLink ID="hlImageLink" runat="server" />
    </div>
    <em class="picture-next" id="<%=hlImageLink.ClientID +"picture-next" %>" style="display:none" onclick="getNextProductPicture('<%=hlImageLink.ImageUrl %>','<%=this.hiddenProductImageUrls.Value%>','<%=hlImageLink.ClientID %>')"></em>
    <div class="shipping-info">
        <div class="freeShipping-cate-page">
            <asp:Image ID="imgFreeShiping" runat="server" Visible="false" />
        </div>
        <%--<div id="divFreeShiping" runat="server" class="freeShipping-cate-page" visible="false">
            <%=GetLocaleResourceString("FreeShipping.Description")%>
        </div>--%>
    </div>
    <h3 class="product-title">
        <asp:HyperLink ID="hlProduct" runat="server" />
    </h3>
    <div class="description">
        <asp:Literal runat="server" ID="lShortDescription"></asp:Literal>

    </div>
    <div class="add-info">
        <div class="prices">
            <nopCommerce:ProductPrice1 ID="ctrlProductPrice1" runat="server" ProductID='<%#Eval("ProductId") %>' />
            <nopCommerce:ProductPrice2 ID="ctrlProductPrice" runat="server" ProductId='<%#Eval("ProductId") %>' />

        </div>
    </div>
    <asp:Panel ID="pnlStockAvailablity" runat="server" class="stock">
        <asp:Label ID="lblStockAvailablity" runat="server" />
    </asp:Panel>

    <div class="attributes">
        <nopCommerce:ProductAttributesOnProductBox ID="ctrlProductAttributes1" runat="server" />
    </div>



    <div class="add-info-2">
        <div class="buttons" runat="server" id="btProductBox" visible="false">
            <asp:Button runat="server" ID="btnProductDetails" OnCommand="btnProductDetails_Click"
                Text="<% $NopResources:Products.ProductDetails %>" ValidationGroup="ProductDetails"
                CommandArgument='<%# Eval("ProductId") %>' CssClass="productgridproductdetailbutton" /><br />
            <asp:Button runat="server" ID="btnAddToCart" OnCommand="btnAddToCart_Click" Text="<% $NopResources:Products.AddToCart %>"
                ValidationGroup="ProductDetails" CommandArgument='<%# Eval("ProductId") %>' CssClass="productgridaddtocartbutton" />
        </div>
    </div>

</div>

