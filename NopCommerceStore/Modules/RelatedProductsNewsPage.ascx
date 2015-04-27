<%@ Control Language="C#" AutoEventWireup="true" Inherits="NopSolutions.NopCommerce.Web.Modules.RelatedProductsNewsPageControl"
    CodeBehind="RelatedProductsNewsPage.ascx.cs" %>
<%@ Register TagPrefix="nopCommerce" TagName="ProductBoxRelatedProductOnNewsPage" Src="~/Modules/ProductBoxRelatedProductOnNewsPage.ascx" %>

<div class="related-products-grid">
    <div class="title">
        <%=GetLocaleResourceString("Products.RelatedProductsOnNewsPage")%>
    </div>
    <div class="clear">
    </div>
    <div class="related-product-grid">
        <asp:ListView ID="dlRelatedProducts" runat="server" OnItemDataBound="dlRelatedProducts_ItemDataBound" >
            <ItemTemplate>
                <div class="item-box">
                <nopCommerce:ProductBoxRelatedProductOnNewsPage ID="ctrlProductBoxRelatedProductOnNewsPage" Product='<%# Container.DataItem %>'
                        runat="server" />
                </div>
            </ItemTemplate>
        </asp:ListView>
    </div>
</div>
