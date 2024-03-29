<%@ Page Language="C#" MasterPageFile="~/MasterPages/OneColumn.master" AutoEventWireup="true"
    Inherits="NopSolutions.NopCommerce.Web.CheckoutConfirmPage" CodeBehind="CheckoutConfirm.aspx.cs" %>

<%@ Register Src="~/Modules/OrderProgress.ascx" TagName="OrderProgress" TagPrefix="nopCommerce" %>
<%@ Register TagPrefix="nopCommerce" TagName="CheckoutConfirm" Src="~/Modules/CheckoutConfirm.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="OrderSummary" Src="~/Modules/OrderSummary.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="AdressDisplayConfirmPage" Src="~/Modules/AddressDisplayConfirmPage.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cph1" runat="Server">
    <div class="checkout-page">
        <nopCommerce:OrderProgress ID="OrderProgressControl" runat="server" OrderProgressStep="Confirm" />
        <div class="clear">
        </div>
        <div class="page-title">
            <span><%=GetLocaleResourceString("Checkout.ConfirmYourOrder")%></span>
        </div>

        <div class="order-summary-title">
            <%=GetLocaleResourceString("Checkout.OrderSummary")%>
        </div>

        <div>
            <nopCommerce:AdressDisplayConfirmPage ID="AddressDisplayControl" runat="server" />
        </div>
        <div class="clear">
        </div>

        <div class="order-summary-body">
            <nopCommerce:OrderSummary ID="OrderSummaryControl" runat="server" IsShoppingCart="false" IsCheckOutConfirm="true"></nopCommerce:OrderSummary>
        </div>
        <div class="clear">
        </div>
        <nopCommerce:CheckoutConfirm ID="ctrlCheckoutConfirm" runat="server" />
        <div class="clear">
        </div>

    </div>
</asp:Content>
