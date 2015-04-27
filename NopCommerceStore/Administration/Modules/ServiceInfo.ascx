<%@ Control Language="C#" AutoEventWireup="true" Inherits="NopSolutions.NopCommerce.Web.Administration.Modules.ServiceInfoControl" CodeBehind="ServiceInfo.ascx.cs" %>
<%@ Register TagPrefix="nopCommerce" TagName="ToolTipLabel" Src="ToolTipLabelControl.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="SimpleTextBox" Src="SimpleTextBox.ascx" %>
<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>

    
<table class="adminContent">
    <tr>
        <td class="adminTitle">
            <nopCommerce:ToolTipLabel runat="server" ID="lblLanguage" Text="<% $NopResources:Admin.ServiceInfo.Language %>"
                ToolTip="<% $NopResources:Admin.ServiceInfo.Language.Tooltip %>" ToolTipImage="~/Administration/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <asp:DropDownList ID="ddlLanguage" AutoPostBack="False" CssClass="adminInput" runat="server">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td class="adminTitle">
            <nopCommerce:ToolTipLabel runat="server" ID="lblTitle" Text="<% $NopResources:Admin.ServiceInfo.Title %>"
                ToolTip="<% $NopResources:Admin.ServiceInfo.Title.Tooltip %>" ToolTipImage="~/Administration/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <nopCommerce:SimpleTextBox runat="server" ID="txtTitle" CssClass="adminInput" ErrorMessage="<% $NopResources:Admin.ServiceInfo.Title.ErrorMessage %>">
            </nopCommerce:SimpleTextBox>
        </td>
    </tr>
    <tr>
        <td class="adminTitle">
            <nopCommerce:ToolTipLabel runat="server" ID="lblShort" Text="<% $NopResources:Admin.ServiceInfo.Short %>"
                ToolTip="<% $NopResources:Admin.ServiceInfo.Short.Tooltip %>" ToolTipImage="~/Administration/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <asp:TextBox ID="txtShort" runat="server" CssClass="adminInput" TextMode="MultiLine"
                Height="100"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="adminTitle">
            <nopCommerce:ToolTipLabel runat="server" ID="lblFull" Text="<% $NopResources:Admin.ServiceInfo.Full %>"
                ToolTip="<% $NopResources:Admin.ServiceInfo.Full.Tooltip %>" ToolTipImage="~/Administration/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <FCKeditorV2:FCKeditor ID="txtFull" runat="server" AutoDetectLanguage="false" Height="350"
                Width="800px" />
        </td>
    </tr>
    <tr>
        <td class="adminTitle">
            <nopcommerce:tooltiplabel runat="server" id="lblImage" text="<% $NopResources:Admin.ServiceInfo.Image %>"
                tooltip="<% $NopResources:Admin.ServiceInfo.Image.Tooltip %>" tooltipimage="~/Administration/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <asp:Image ID="iServicePicture" runat="server" />
            <br />
            <asp:Button ID="btnRemoveServiceImage" CssClass="adminButton" CausesValidation="false"
                runat="server" Text="<% $NopResources:Admin.ServiceInfo.RemoveImage %>"
                OnClick="btnRemoveServiceImage_Click" Visible="false"/>
            <asp:FileUpload ID="fuServicePicture" CssClass="adminInput" runat="server" />
        </td>
    </tr>
    <tr>
        <td class="adminTitle">
            <nopCommerce:ToolTipLabel runat="server" ID="lblPublished" Text="<% $NopResources:Admin.ServiceInfo.Published %>"
                ToolTip="<% $NopResources:Admin.ServiceInfo.Published.Tooltip %>" ToolTipImage="~/Administration/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <asp:CheckBox ID="cbPublished" runat="server" Checked="True"></asp:CheckBox>
        </td>
    </tr>
    <tr>
        <td class="adminTitle">
            <nopCommerce:ToolTipLabel runat="server" ID="lblAllowComments" Text="<% $NopResources:Admin.ServiceInfo.AllowComments %>"
                ToolTip="<% $NopResources:Admin.ServiceInfo.AllowComments.Tooltip %>" ToolTipImage="~/Administration/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <asp:CheckBox ID="cbAllowComments" runat="server" Checked="False" Enabled="false"></asp:CheckBox>
        </td>
    </tr>
    <tr runat="server" id="pnlCreatedOn">
        <td class="adminTitle">
            <nopCommerce:ToolTipLabel runat="server" ID="lblCreatedOnTitle" Text="<% $NopResources:Admin.ServiceInfo.CreatedOn %>"
                ToolTip="<% $NopResources:Admin.ServiceInfo.CreatedOn.Tooltip %>" ToolTipImage="~/Administration/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <asp:Label ID="lblCreatedOn" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:HyperLink ID="hlViewComments" runat="server" Text="View Comments" ToolTip="<% $NopResources:Admin.ServiceInfo.ViewComments.Tooltip %>" />
        </td>
    </tr>
</table>
