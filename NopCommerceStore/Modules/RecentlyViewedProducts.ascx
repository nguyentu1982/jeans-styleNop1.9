<%@ Control Language="C#" AutoEventWireup="true"
    Inherits="NopSolutions.NopCommerce.Web.Modules.RecentlyViewedProductsControl" Codebehind="RecentlyViewedProducts.ascx.cs" %>
<%@ Register TagPrefix="nopCommerce" TagName="ProductBoxRecentlyViewProduct" Src="~/Modules/ProductBoxRecentlyViewProduct.ascx" %>
<div class="recently-viewed-products">
    <div class="title">
        <h4><%=GetLocaleResourceString("Products.RecentlyViewedProducts")%></h4>
    </div>
    <div class="recently-product-grid">
        <asp:ListView ID="dlCatalog" runat="server">
            <ItemTemplate>
                <div class="item-box">
                    <nopCommerce:ProductBoxRecentlyViewProduct ID="ctrlProductBox" Product='<%# Container.DataItem %>' runat="server" />
                </div>                
            </ItemTemplate>
        </asp:ListView>
    </div>
</div>
