<%@ Control Language="C#" AutoEventWireup="true" Inherits="NopSolutions.NopCommerce.Web.Modules.RelatedProductsNewsPageControl"
    CodeBehind="RelatedProductsNewsPage.ascx.cs" %>
<%@ Register TagPrefix="nopCommerce" TagName="ProductBoxRelatedProductOnNewsPage" Src="~/Modules/ProductBoxRelatedProductOnNewsPage.ascx" %>

<div class="recently-viewed-products">
    <h4 class="title">
        <%=GetLocaleResourceString("Products.RelatedProductsOnNewsPage")%>
    </h4>
    <div class="clear">
    </div>
    <div class="recently-product-grid">
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
