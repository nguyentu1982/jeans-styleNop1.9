<%@ Control Language="C#" AutoEventWireup="true" Inherits="NopSolutions.NopCommerce.Web.Templates.Manufacturers.ProductsInGrid"
    CodeBehind="ProductsInGrid.ascx.cs" %>
<%@ Register TagPrefix="nopCommerce" TagName="ProductBox1" Src="~/Modules/ProductBox1.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="PriceRangeFilter" Src="~/Modules/PriceRangeFilter.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="ProductSpecificationFilter1" Src="~/Modules/ProductSpecificationFilter1.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="ProductBoxRecentlyAddedProductOnHomepage" Src="~/Modules/ProductBoxRecentlyAddedProductOnHomepage.ascx" %>
<div class="manufacturer-page">
    <div class="page-title">
        <h1><asp:Literal runat="server" ID="lName"></asp:Literal></h1>
    </div>
    <div class="clear">
    </div>
    <div class="manufacturer-description">
        <asp:Literal runat="server" ID="lDescription"></asp:Literal>
    </div>
    <div class="clear">
    </div>
    <asp:Panel runat="server" ID="pnlFeaturedProducts" class="featured-product-grid">
        <div class="title">
            <%=GetLocaleResourceString("Products.FeaturedProducts")%>
        </div>
        <div>
            <asp:DataList ID="dlFeaturedProducts" runat="server" RepeatColumns="5" RepeatDirection="Horizontal"
                RepeatLayout="Table" ItemStyle-CssClass="item-box">
                <ItemTemplate>
                    
                </ItemTemplate>
            </asp:DataList>
        </div>
    </asp:Panel>
    <div class="clear">
    </div>
    <asp:Panel runat="server" ID="pnlSorting" CssClass="product-sorting">
        <%=GetLocaleResourceString("ProductSorting.SortBy")%>
        <asp:DropDownList ID="ddlSorting" runat="server" OnSelectedIndexChanged="ddlSorting_SelectedIndexChanged"
            AutoPostBack="true" />
    </asp:Panel>
    <div class="clear">
    </div>
    <asp:Panel runat="server" ID="pnlFilters" CssClass="product-filters">
        <div class="filter-title">
            <asp:Label runat="server" ID="lblProductFilterTitle">
                <%=GetLocaleResourceString("Products.FilterOptionsTitle")%>
            </asp:Label>
        </div>
        <div class="filter-item">
            <nopCommerce:PriceRangeFilter ID="ctrlPriceRangeFilter" runat="server" />
        </div>

        <div class="filter-item">
            <nopCommerce:ProductSpecificationFilter1 ID="ctrlProductSpecificationFilter1" runat="server" />
        </div>

    </asp:Panel>
    <div class="clear">
    </div>
    <div class="product-grid">
        <%--<asp:DataList ID="dlProducts" runat="server" RepeatColumns="3" RepeatDirection="Horizontal"
            RepeatLayout="Table" ItemStyle-CssClass="item-box">
            <ItemTemplate>
                <nopCommerce:ProductBox1 ID="ctrlProductBox" Product='<%# Container.DataItem %>'
                    runat="server" />
            </ItemTemplate>
        </asp:DataList>--%>
        <asp:ListView ID="dlProducts" runat="server">
                    <ItemTemplate>
                        <div class="item-box">
                            <nopCommerce:ProductBox1 ID="ctrlProductBox" Product='<%# Container.DataItem %>' runat="server" />
                        </div>

                    </ItemTemplate>
                </asp:ListView>
    </div>
    <div class="clear">
    </div>
    <div class="product-pager">
        <nopCommerce:Pager runat="server" ID="productsPager" FirstButtonText="<% $NopResources:Pager.First %>"
            LastButtonText="<% $NopResources:Pager.Last %>" NextButtonText="<% $NopResources:Pager.Next %>"
            PreviousButtonText="<% $NopResources:Pager.Previous %>" CurrentPageText="Pager.CurrentPage" />
    </div>
</div>
