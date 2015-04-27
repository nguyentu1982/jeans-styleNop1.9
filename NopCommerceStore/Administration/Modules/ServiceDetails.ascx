<%@ Control Language="C#" AutoEventWireup="true" Inherits="NopSolutions.NopCommerce.Web.Administration.Modules.ServiceDetailsControl"
    CodeBehind="ServiceDetails.ascx.cs" %>
<%@ Register TagPrefix="nopCommerce" TagName="ServiceInfo" Src="ServiceInfo.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="ConfirmationBox" Src="ConfirmationBox.ascx" %>
<div class="section-header">
    <div class="title">
        <img src="Common/ico-content.png" alt="<%=GetLocaleResourceString("Admin.ServiceDetails.Title")%>" />
        <%=GetLocaleResourceString("Admin.ServiceDetails.Title")%>
        <a href="Service.aspx" title="<%=GetLocaleResourceString("Admin.ServiceDetails.BackToService")%>">
            (<%=GetLocaleResourceString("Admin.ServiceDetails.BackToService")%>)</a>
    </div>
    <div class="options">
        <asp:Button ID="SaveButton" runat="server" CssClass="adminButtonBlue" Text="<% $NopResources:Admin.ServiceDetails.SaveButton.Text %>"
            OnClick="SaveButton_Click" ToolTip="<% $NopResources:Admin.ServiceDetails.SaveButton.Tooltip %>" />
        <asp:Button ID="SaveAndStayButton" runat="server" CssClass="adminButtonBlue" Text="<% $NopResources:Admin.ServiceDetails.SaveAndStayButton.Text %>"
            OnClick="SaveAndStayButton_Click" />
        <asp:Button ID="DeleteButton" runat="server" CssClass="adminButtonBlue" Text="<% $NopResources:Admin.ServiceDetails.DeleteButton.Text %>"
            OnClick="DeleteButton_Click" CausesValidation="false" ToolTip="<% $NopResources:Admin.ServiceDetails.DeleteButton.Tooltip %>" />
    </div>
</div>
<nopCommerce:ServiceInfo ID="ctrlServiceInfo" runat="server" />
<nopCommerce:ConfirmationBox runat="server" ID="cbDelete" TargetControlID="DeleteButton"
    YesText="<% $NopResources:Admin.Common.Yes %>" NoText="<% $NopResources:Admin.Common.No %>"
    ConfirmText="<% $NopResources:Admin.Common.AreYouSure %>" />