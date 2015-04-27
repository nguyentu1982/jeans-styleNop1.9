<%@ Control Language="C#" AutoEventWireup="true" Inherits="NopSolutions.NopCommerce.Web.Modules.ProductPrice1Control"
    CodeBehind="ProductPrice1.ascx.cs" %>
<asp:PlaceHolder runat="server" ID="phOldPrice">
    <span class="old-price-label"><%=GetLocaleResourceString("Products.OldPrice")%>&nbsp;</span>
    <asp:Label ID="lblOldPrice" runat="server" CssClass="oldProductPrice" />
</asp:PlaceHolder>
<asp:Label ID="lblCustomerEnterPrice" runat="server" Visible="false" />
<p></p>
<asp:Label ID="lblPrice" runat="server" Visible="true" CssClass="price-label" />
<asp:Label ID="lblPriceValue" runat="server" CssClass="productPrice" />
<p></p>
<asp:PlaceHolder runat="server" ID="phDiscount">
    <span class="price-label"><%=GetLocaleResourceString("Products.FinalPriceWithDiscount")%>&nbsp;&nbsp;</span> 
    <asp:Label ID="lblFinalPriceWithDiscount" runat="server" CssClass="productPrice" />
    
</asp:PlaceHolder>