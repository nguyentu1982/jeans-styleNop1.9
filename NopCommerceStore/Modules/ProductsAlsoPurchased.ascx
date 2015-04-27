<%@ Control Language="C#" AutoEventWireup="true" Inherits="NopSolutions.NopCommerce.Web.Modules.ProductsAlsoPurchasedControl"
    CodeBehind="ProductsAlsoPurchased.ascx.cs" %>
<%@ Register TagPrefix="nopCommerce" TagName="ProductBox1" Src="~/Modules/ProductBox1.ascx" %>

<div class="also-purchased-products-grid">
    <div class="title">
        <%=GetLocaleResourceString("Products.AlsoPurchased")%>
    </div>
    <div class="clear">
    </div>
    <div class="product-grid">
        <asp:DataList ID="dlAlsoPurchasedProducts" runat="server" RepeatColumns="3" RepeatDirection="Horizontal"
            RepeatLayout="Table" OnItemDataBound="dlAlsoPurchasedProducts_ItemDataBound"
            ItemStyle-CssClass="item-box">
            <ItemTemplate>
                <nopCommerce:ProductBox1 ID="ctrlProductBox" Product='<%# Container.DataItem %>'
                        runat="server" />
            </ItemTemplate>
        </asp:DataList>
    </div>
</div>
