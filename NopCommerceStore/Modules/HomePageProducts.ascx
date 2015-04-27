<%@ Control Language="C#" AutoEventWireup="true" Inherits="NopSolutions.NopCommerce.Web.Modules.HomePageProductsControl"
    CodeBehind="HomePageProducts.ascx.cs" %>
<%@ Register TagPrefix="nopCommerce" TagName="ProductBox1" Src="~/Modules/ProductBox1.ascx" %>
<div class="category-page"><%-- "home-page-product-grid"--%>
    <div class="boxtitle">
        <h1><%=GetLocaleResourceString("HomePage.FeaturedProducts")%></h1>
    </div>
    <div class="clear">
    </div>
    <div class="product-grid">
        <asp:DataList ID="dlCatalog" runat="server" RepeatColumns="3" RepeatDirection="Horizontal"
            RepeatLayout="Table" OnItemDataBound="dlCatalog_ItemDataBound" ItemStyle-CssClass="item-box" EnableViewState="false">
            <ItemTemplate>
               
                    <%--<div class="picture">
                        <asp:HyperLink ID="hlImageLink" runat="server" />
                    </div>
                    <h4 class="product-title">
                        <asp:HyperLink ID="hlProduct" runat="server" />
                    </h4>--%>
                
                    <nopCommerce:ProductBox1 ID="ctrlProductBox" Product='<%# Container.DataItem %>'
                        runat="server" />
               
                </div>
            </ItemTemplate>
        </asp:DataList>
    </div>
</div>
