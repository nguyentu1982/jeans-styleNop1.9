<%@ Control Language="C#" AutoEventWireup="true" Inherits="NopSolutions.NopCommerce.Web.Modules.RelatedProductsControl"
    CodeBehind="RelatedProducts.ascx.cs" %>
<%@ Register TagPrefix="nopCommerce" TagName="ProductBoxRelatedProduct" Src="~/Modules/ProductBoxRelatedProduct.ascx" %>

<div class="related-products-grid">
    <div class="title">
        <%=GetLocaleResourceString("Products.RelatedProducts")%>
    </div>
    <div class="clear">
    </div>
    <div class="related-product-grid">
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
