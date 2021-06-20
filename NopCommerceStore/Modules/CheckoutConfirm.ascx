<%@ Control Language="C#" AutoEventWireup="true" Inherits="NopSolutions.NopCommerce.Web.Modules.CheckoutConfirmControl"
    CodeBehind="CheckoutConfirm.ascx.cs" %>
<div class="checkout-data">
    <div class="confirm-order">
        <div class="select-button">
            <asp:Label runat="server" ID="lMinOrderTotalAmount" />
            <asp:ScriptManager ID="ScriptManager2" runat="server">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:Button runat="server" ID="btnNextStep" Text="<% $NopResources:Checkout.ConfirmButton %>"
                        OnClick="btnNextStep_Click" CssClass="confirmordernextstepbutton" ValidationGroup="CheckoutConfirm" />
                </ContentTemplate>
            </asp:UpdatePanel>
            >
        </div>
        <div class="clear">
        </div>
        <div class="error-block">
            <div class="message-error">
                <asp:Literal runat="server" ID="lConfirmOrderError" EnableViewState="false" />
            </div>
        </div>
    </div>
</div>
