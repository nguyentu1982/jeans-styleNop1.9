<%@ Control Language="C#" AutoEventWireup="true" Inherits="NopSolutions.NopCommerce.Web.Templates.Categories.ProductsInGrid2"
    CodeBehind="ProductsInGrid2.ascx.cs" %>
<%@ Register TagPrefix="nopCommerce" TagName="ProductBox1" Src="~/Modules/ProductBox1.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="PriceRangeFilter" Src="~/Modules/PriceRangeFilter.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="ProductSpecificationFilter" Src="~/Modules/ProductSpecificationFilter.ascx" %>
<div class="category-page">
    <div class="category-description">
        <asp:Literal runat="server" ID="lDescription"></asp:Literal>
    </div>    
    
    <div class="clear">
    </div>

    <div class="sub-category-grid">
                <asp:ListView ID="dlSubCategories" runat="server" OnItemDataBound="dlSubCategories_ItemDataBound"   ItemStyle-CssClass="item-box" Visible="false">
                    <ItemTemplate>
                        <div class="sub-category-item">
                            <h2 class="category-title">
                                <asp:HyperLink ID="hlCategory" runat="server" />
                            </h2>
                            <%--<div class="picture">
                        <asp:HyperLink ID="hlImageLink" runat="server" />
                    </div>--%>
                        </div>
                    </ItemTemplate>
                </asp:ListView>
            </div>
     <div class="clear">
    </div>

    <div class="product-grid">
        <asp:ListView ID="dlProducts" runat="server">
                    <ItemTemplate>
                        <div class="item-box">
                            <nopCommerce:ProductBox1 ID="ctrlProductBox" Product='<%# Container.DataItem %>' runat="server" />
                        </div>

                    </ItemTemplate>
                </asp:ListView>

    </div>
</div>
