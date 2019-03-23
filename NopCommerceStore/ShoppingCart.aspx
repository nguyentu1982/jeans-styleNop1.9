<%@ Page Language="C#" MasterPageFile="~/MasterPages/OneColumn.master" AutoEventWireup="true"
    Inherits="NopSolutions.NopCommerce.Web.ShoppingCartPage" CodeBehind="ShoppingCart.aspx.cs"
     %>
<%@ Register TagPrefix="nopCommerce" TagName="OrderSummary" Src="~/Modules/OrderSummary.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="OrderProgress" Src="~/Modules/OrderProgress.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cph1" runat="Server">
    <nopCommerce:OrderProgress ID="OrderProgressControl" runat="server" OrderProgressStep="Cart" />
    <div class="shoppingcart-page">
        <div class="page-title">
            <h1><%=GetLocaleResourceString("Account.ShoppingCart")%></h1>
        </div>
        <div class="clear">
        </div>
        <div class="body">
            <nopCommerce:OrderSummary ID="OrderSummaryControl" runat="server" IsShoppingCart="true">
            </nopCommerce:OrderSummary>
        </div>
    </div>
    <script>
        document.addEventListener("DOMContentLoaded", function (event) {
            jQuery('#ctl00_ctl00_cph1_cph1_OrderSummaryControl_btnCheckout').on('click', function () {
                gtag('event', 'conversion', { 'send_to': 'AW-971689623/TU1aCMDv5pYBEJedq88D' });
            });
        });
</script>
</asp:Content>
