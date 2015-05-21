<%@ Control Language="C#" AutoEventWireup="true" Inherits="NopSolutions.NopCommerce.Web.Modules.RecentlyAddedProductsOnHomepageControl"
    CodeBehind="RecentlyAddedProductsOnHomepage.ascx.cs" %>
<%@ Register TagPrefix="nopCommerce" TagName="ProductBox1" Src="~/Modules/ProductBoxRecentlyAddedProductOnHomepage.ascx" %>

<div class="recently-added-products">
    <div class="page-title">
        <table>
            <tr>
                <td style="text-align: left;">
                    <h1>
                        <a href="<%=Page.ResolveUrl("~/recentlyaddedproducts.aspx") %>"><%=GetLocaleResourceString("Products.NewProducts")%></a></h1>
                </td>
                <td style="text-align: right;">
                    <a href="<%=Page.ResolveUrl("~/recentlyaddedproductsrss.aspx")%>">
                        <asp:Image ID="imgRSS" runat="server" ImageUrl="~/images/icon_rss.gif" ToolTip="<% $NopResources:RecentlyAddedProductsRSS.Tooltip %>"
                            AlternateText="RSS" /></a>
                </td>
            </tr>
        </table>
    </div>

    <div class="recently-added-product-grid">
        <asp:ListView ID="dlCatalog" runat="server" >
            <ItemTemplate>
                <div class="item-box">
                    <nopCommerce:ProductBox1 ID="ctrlProductBox" Product='<%# Container.DataItem %>' runat="server" />
                </div>
            </ItemTemplate>
        </asp:ListView>
    </div>
</div>






