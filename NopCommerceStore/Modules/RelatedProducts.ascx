<%@ Control Language="C#" AutoEventWireup="true" Inherits="NopSolutions.NopCommerce.Web.Modules.RelatedProductsControl"
    CodeBehind="RelatedProducts.ascx.cs" %>
<%@ Register TagPrefix="nopCommerce" TagName="ProductBoxRelatedProduct" Src="~/Modules/ProductBoxRelatedProduct.ascx" %>

<div class="related-products-grid">
    <div class="title">
        <h4><%=GetLocaleResourceString("Products.RelatedProducts")%></h4>
    </div>
    <div class="clear">
    </div>
    <div class="recently-product-grid">
        <asp:ListView ID="dlRelatedProducts" runat="server" OnItemDataBound="dlRelatedProducts_ItemDataBound">
            <ItemTemplate>
                <div class="item-box">
                    <nopCommerce:ProductBoxRelatedProduct ID="ctrlProductBox" Product='<%# Container.DataItem %>'
                        runat="server" />
                </div>                
            </ItemTemplate>
        </asp:ListView>
    </div>
</div>
