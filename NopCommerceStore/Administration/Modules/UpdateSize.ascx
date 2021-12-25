<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UpdateSize.ascx.cs" Inherits="NopSolutions.NopCommerce.Web.Administration.Modules.UpdateSize1" %>
<%@ Register TagPrefix="nopCommerce" TagName="ToolTipLabel" Src="ToolTipLabelControl.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="SimpleTextBox" Src="SimpleTextBox.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="DatePicker" Src="DatePicker.ascx" %>
<table width="100%">
    <tr>
        <td class="adminTitle">
            <nopCommerce:ToolTipLabel runat="server" ID="lblStartDate" Text="<% $NopResources:Admin.Orders.StartDate %>"
                ToolTip="<% $NopResources:Admin.Orders.StartDate.Tooltip %>" ToolTipImage="~/Administration/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <nopCommerce:DatePicker runat="server" ID="ctrlStartDatePicker" />
        </td>
    </tr>
    <tr>
        <td class="adminTitle">
            <nopCommerce:ToolTipLabel runat="server" ID="lblEndDate" Text="<% $NopResources:Admin.Orders.EndDate %>"
                ToolTip="<% $NopResources:Admin.Orders.EndDate.Tooltip %>" ToolTipImage="~/Administration/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <nopCommerce:DatePicker runat="server" ID="ctrlEndDatePicker" />
        </td>
    </tr>
    
    
    
    
    
    
    <tr>
        
        <td class="adminData">
           
            <asp:Button runat="server" Text="<% $NopResources:Admin.UpdateSize.GoButton.Text %>"
                CssClass="adminButtonBlue" ID="btnGoDirectlyToOrderNumber" 
                ValidationGroup="GoDirectly" ToolTip="<% $NopResources:Admin.Orders.GoButton.Tooltip %>" OnClick="btnGoDirectlyToOrderNumber_Click" />
           
            <asp:Button runat="server" Text="Expression: Admin.UpdateSize.ViewOutOfStockProduct.Text"
                CssClass="adminButtonBlue" ID="btnViewOutOfStockProduct" 
                ValidationGroup="GoDirectly" ToolTip="<% $NopResources:Admin.Orders.GoButton.Tooltip %>" OnClick="btnViewOutOfStockProduct_Click" />
             <asp:Button runat="server" Text="Expression: Admin.UpdateSize.UpdateIamgeUrls.Text"
                CssClass="adminButtonBlue" ID="btUpdateProducturl" 
                ValidationGroup="GoDirectly" ToolTip="<% $NopResources:Admin.Orders.GoButton.Tooltip %>" OnClick="btnUpdateProductUrl_Click" />
            <asp:Button runat="server" Text="Expression: Admin.UpdateSize.GetDefaultImage.Text"
                CssClass="adminButtonBlue" ID="btGetDefaultImage" 
                ValidationGroup="GoDirectly" ToolTip="<% $NopResources:Admin.Orders.GoButton.Tooltip %>" OnClick="btnbtGetDefaultImage_Click" />
        </td>
    </tr>
</table>
<asp:GridView ID="grvOutOfStockProducts" runat="server">
</asp:GridView>

