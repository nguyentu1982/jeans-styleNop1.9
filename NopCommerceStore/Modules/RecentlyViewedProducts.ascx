<%@ Control Language="C#" AutoEventWireup="true"
    Inherits="NopSolutions.NopCommerce.Web.Modules.RecentlyViewedProductsControl" Codebehind="RecentlyViewedProducts.ascx.cs" %>
<%@ Register TagPrefix="nopCommerce" TagName="ProductBoxRecentlyViewProduct" Src="~/Modules/ProductBoxRecentlyViewProduct.ascx" %>
<div class="recently-viewed-products">
    <div class="page-title">
        <h4><%=GetLocaleResourceString("Products.RecentlyViewedProducts")%></h4>
    </div>
    <div class="recently-product-grid">
        <asp:DataList ID="dlCatalog" runat="server" RepeatColumns="8" RepeatDirection="Horizontal"
            RepeatLayout="Table" ItemStyle-CssClass="item-box">
            <ItemTemplate>
                <nopCommerce:ProductBoxRecentlyViewProduct ID="ctrlProductBox" Product='<%# Container.DataItem %>' runat="server" />
            </ItemTemplate>
        </asp:DataList>
    </div>
</div>
