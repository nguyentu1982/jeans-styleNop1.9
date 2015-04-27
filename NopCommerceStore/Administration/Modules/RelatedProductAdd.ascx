<%@ Control Language="C#" AutoEventWireup="true" Inherits="NopSolutions.NopCommerce.Web.Administration.Modules.RelatedProductAddControl"
    CodeBehind="RelatedProductAdd.ascx.cs" %>
<%@ Register TagPrefix="nopCommerce" TagName="ToolTipLabel" Src="ToolTipLabelControl.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="SelectCategoryControl" Src="SelectCategoryControl.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="NumericTextBox" Src="NumericTextBox.ascx" %>
<div class="section-header">
    <div class="title">
        <img src="Common/ico-catalog.png" alt="<%=GetLocaleResourceString("Admin.AddRelatedProduct.Title")%>" />
        <%=GetLocaleResourceString("Admin.AddRelatedProduct.Title")%>
    </div>
</div>
<table width="100%">
    <tr>
        <td class="adminTitle">
            <nopCommerce:ToolTipLabel runat="server" ID="lblProductName" Text="<% $NopResources:Admin.AddRelatedProduct.ProductName %>"
                ToolTip="<% $NopResources:Admin.AddRelatedProduct.ProductName.Tooltip %>" ToolTipImage="~/Administration/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <asp:TextBox ID="txtProductName" CssClass="adminInput" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="adminTitle">
            <nopCommerce:ToolTipLabel runat="server" ID="lblCategory" Text="<% $NopResources:Admin.AddRelatedProduct.Category %>"
                ToolTip="<% $NopResources:Admin.AddRelatedProduct.Category.Tooltip %>" ToolTipImage="~/Administration/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <nopCommerce:SelectCategoryControl ID="ParentCategory" CssClass="adminInput" runat="server">
            </nopCommerce:SelectCategoryControl>
        </td>
    </tr>
    <tr>
        <td class="adminTitle">
            <nopCommerce:ToolTipLabel runat="server" ID="lblManufacturer" Text="<% $NopResources:Admin.AddRelatedProduct.Manufacturer %>"
                ToolTip="<% $NopResources:Admin.AddRelatedProduct.Manufacturer.Tooltip %>" ToolTipImage="~/Administration/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <asp:DropDownList ID="ddlManufacturer" runat="server" CssClass="adminInput">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td colspan="2" class="adminData">
            <asp:Button ID="SearchButton" runat="server" Text="<% $NopResources:Admin.AddRelatedProduct.SearchButton.Text %>"
                CssClass="adminButtonBlue" OnClick="SearchButton_Click" ToolTip="<% $NopResources:Admin.AddRelatedProduct.SearchButton.Tooltip %>" />
        </td>
    </tr>
</table>
<p>
</p>
<script type="text/javascript">

    $(window).bind('load', function () {
        var cbHeader = $(".cbHeader input");
        var cbRowItem = $(".cbRowItem input");
        cbHeader.bind("click", function () {
            cbRowItem.each(function () { this.checked = cbHeader[0].checked; })
        });
        cbRowItem.bind("click", function () { if ($(this).checked == false) cbHeader[0].checked = false; });
    });
    
</script>
<asp:GridView ID="gvProducts" runat="server" AutoGenerateColumns="False" Width="100%"
    OnPageIndexChanging="gvProducts_PageIndexChanging" AllowPaging="true"
    PageSize="10">
    <Columns>
        <asp:TemplateField ItemStyle-Width="10%" ItemStyle-HorizontalAlign="Center">
            <HeaderTemplate>
                <asp:CheckBox ID="cbSelectAll" runat="server" CssClass="cbHeader" />
            </HeaderTemplate>
            <ItemTemplate>
                <asp:CheckBox ID="cbProductInfo" runat="server" CssClass="cbRowItem"
                 ToolTip="<% $NopResources:Admin.AddRelatedProduct.ProductColumn.Tooltip %>"  />
                <asp:HiddenField ID="hfProductId" runat="server" Value='<%# Eval("ProductId") %>' />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="<% $NopResources:Admin.AddRelatedProduct.ProductColumn %>"
            ItemStyle-Width="60%">
            <ItemTemplate>
                <%# Server.HtmlEncode(Eval("Name").ToString()) %>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="<% $NopResources:Admin.AddRelatedProduct.Image %>">
            <ItemTemplate>
                <asp:Image runat="server" ID="imgProduct" ImageUrl='<%#GetProductImageUrl((Product)Container.DataItem)%>' />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="<% $NopResources:Admin.AddRelatedProduct.PublishedColumn %>"
            HeaderStyle-HorizontalAlign="Center" ItemStyle-Width="15%" ItemStyle-HorizontalAlign="Center">
            <ItemTemplate>
                <nopCommerce:ImageCheckBox runat="server" ID="cbPublished" Checked='<%# Eval("Published") %>'>
                </nopCommerce:ImageCheckBox>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="<% $NopResources:Admin.AddRelatedProduct.DisplayOrderColumn %>"
            HeaderStyle-HorizontalAlign="Center" ItemStyle-Width="15%" ItemStyle-HorizontalAlign="Center">
            <ItemTemplate>
                <nopCommerce:NumericTextBox runat="server" CssClass="adminInput" Width="50px" ID="txtDisplayOrder"
                    Value="1" RequiredErrorMessage="<% $NopResources:Admin.AddRelatedProduct.DisplayOrderColumn.RequiredErrorMessage %>"
                    RangeErrorMessage="<% $NopResources:Admin.AddRelatedProduct.DisplayOrderColumn.RangeErrorMessage %>"
                    MinimumValue="-99999" MaximumValue="99999"></nopCommerce:NumericTextBox>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
    <PagerSettings PageButtonCount="50" Position="TopAndBottom" />
</asp:GridView>
<br />
<asp:Label runat="server" ID="lblNoProductsFound" Text="<% $NopResources:Admin.AddRelatedProduct.NoProductsFound %>"
    Visible="false"></asp:Label>
<br />
<asp:Button ID="btnSave" runat="server" CssClass="adminButton" Text="<% $NopResources:Admin.AddRelatedProduct.SaveColumn %>"
    ToolTip="<% $NopResources:Admin.AddRelatedProduct.SaveColumn.Tooltip %>" OnClick="btnSave_Click"
    Visible="false" />
