<%@ Page Title="" Language="C#" MasterPageFile="~/Administration/main.master" AutoEventWireup="true" CodeBehind="UpdateSizeToFilterInCategoryPage.aspx.cs" Inherits="NopSolutions.NopCommerce.Web.Administration.UpdateSizeToFilterInCategoryPage" %>
<%@ Register TagPrefix="nopCommerce" TagName="ConfirmationBox" Src="~/Administration/Modules/ConfirmationBox.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cph1" runat="server">
    <div class="section-header">
    <div class="title">
        <img src="Common/ico-catalog.png" alt="<%=GetLocaleResourceString("Admin.Products.UpdateSizeToFilter")%>" />
        <%=GetLocaleResourceString("Admin.Products.UpdateSizeToFilter")%>
    </div>
     <div class="options">
        
        
        
        
        
        <asp:Button runat="server" Text="<% $NopResources:Admin.Products.UpdateSizeToFilter %>"
            CssClass="adminButtonBlue" ID="btnUpdateSize" OnClick="btnUpdateSize_Click" Enabled="false" />
        <nopCommerce:ConfirmationBox runat="server" ID="cbUpdateSize" TargetControlID="btnUpdateSize"
            YesText="<% $NopResources:Admin.Common.Yes %>" NoText="<% $NopResources:Admin.Common.No %>"
            ConfirmText="<% $NopResources:Admin.Common.AreYouSure %>" />
    </div>

    </div>
    <div class="section-body">
        <%=GetLocaleResourceString("Admin.Products.UpdateSizeToFilterDescription")%>
    </div>
</asp:Content>
