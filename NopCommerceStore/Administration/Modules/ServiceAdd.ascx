<%@ Control Language="C#" AutoEventWireup="true" Inherits="NopSolutions.NopCommerce.Web.Administration.Modules.ServiceAddControl"
    CodeBehind="ServiceAdd.ascx.cs" %>
<%@ Register TagPrefix="nopCommerce" TagName="ServiceInfo" Src="ServiceInfo.ascx" %>
<div class="section-header">
    <div class="title">
        <img src="Common/ico-content.png" alt="<%=GetLocaleResourceString("Admin.ServiceAdd.Title")%>" />
        <%=GetLocaleResourceString("Admin.ServiceAdd.Title")%>
        <a href="..\Service.aspx" title="<%=GetLocaleResourceString("Admin.ServiceAdd.BackToService")%>">
            (<%=GetLocaleResourceString("Admin.ServiceAdd.BackToService")%>)</a>
    </div>
    <div class="options">
        <asp:Button ID="SaveButton" runat="server" Text="<% $NopResources:Admin.ServiceAdd.SaveButton.Text %>"
            CssClass="adminButtonBlue" OnClick="SaveButton_Click" ToolTip="<% $NopResources:Admin.ServiceAdd.SaveButton.Tooltip %>" />
        <asp:Button ID="SaveAndStayButton" runat="server" CssClass="adminButtonBlue" Text="<% $NopResources:Admin.ServiceAdd.SaveAndStayButton.Text %>"
            OnClick="SaveAndStayButton_Click" />
    </div>
</div>
<nopCommerce:ServiceInfo ID="ctrlServiceInfo" runat="server" />
