<%@ Control Language="C#" AutoEventWireup="true" Inherits="NopSolutions.NopCommerce.Web.Administration.Modules.ProductsControl" CodeBehind="Products.ascx.cs" %>
<%@ Register TagPrefix="nopCommerce" TagName="ToolTipLabel" Src="ToolTipLabelControl.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="SelectCategoryControl" Src="SelectCategoryControl.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="SimpleTextBox" Src="SimpleTextBox.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="ConfirmationBox" Src="ConfirmationBox.ascx" %>

<div class="section-header">
    <div class="title">
        <img src="Common/ico-catalog.png" alt="<%=GetLocaleResourceString("Admin.Products.ManageProducts")%>" />
        <%=GetLocaleResourceString("Admin.Products.ManageProducts")%>
    </div>
    <div class="options">
        <asp:Button ID="SearchButton" runat="server" Text="<% $NopResources:Admin.Products.SearchButton.Text %>"
            CssClass="adminButtonBlue" OnClick="SearchButton_Click" ToolTip="<% $NopResources:Admin.Products.SearchButton.Tooltip %>" />
        <asp:Button ID="btnPDFExport" runat="server" Text="<% $NopResources:Admin.Products.BtnPDFExport.Text %>"
            CssClass="adminButtonBlue" OnClick="BtnPDFExport_OnClick" ToolTip="<% $NopResources:Admin.Products.BtnPDFExport.Tooltip %>" />
        <asp:Button runat="server" Text="<% $NopResources:Admin.Products.ExportXMLButton.Text %>"
            CssClass="adminButtonBlue" ID="btnExportXML" OnClick="btnExportXML_Click" ValidationGroup="ExportXML"
            ToolTip="<% $NopResources:Admin.Products.ExportXMLButton.Tooltip %>" />
        <asp:Button runat="server" Text="<% $NopResources:Admin.Products.ExportXLSButton.Text %>"
            CssClass="adminButtonBlue" ID="btnExportXLS" OnClick="btnExportXLS_Click" ValidationGroup="ExportXLS"
            ToolTip="<% $NopResources:Admin.Products.ExportXLSButton.Tooltip %>" />

        <asp:Button runat="server" Text="<% $NopResources:Admin.Products.ExportXLSButtonRemarketing.Text %>"
            CssClass="adminButtonBlue" ID="btnExportXLSRemarketing" OnClick="btnExportXLSRemarketing_Click" ValidationGroup="ExportXLS"
            ToolTip="<% $NopResources:Admin.Products.ExportXLSButtonRemarketing.Tooltip %>" />

        <asp:Button runat="server" Text="<% $NopResources:Admin.Products.ExportXLSButtonRemarketingFace.Text %>"
            CssClass="adminButtonBlue" ID="Button1" OnClick="btnExportXLSRemarketingFace_Click" ValidationGroup="ExportXLS"
            ToolTip="<% $NopResources:Admin.Products.ExportXLSButtonRemarketingFace.Tooltip %>" />

        <asp:Button runat="server" Text="<% $NopResources:Admin.Products.DownLoadImgs.Text %>"
            CssClass="adminButtonBlue" ID="Button2" OnClick="btnDownLoadImgs_Click" ValidationGroup="ExportXLS"
            ToolTip="<% $NopResources:Admin.Products.DownLoadImgs.Tooltip %>" />
        <asp:CheckBox runat="server" ID="cbOnlyDefault" Text="<% $NopResources:Admin.Products.DownLoadImgs.OnlyDefault %>"/>

        <asp:Button runat="server" Text="<% $NopResources:Admin.Products.ImportXLSButton.Text %>"
            CssClass="adminButtonBlue" ID="btnImportXLS" OnClick="btnImportXLS_Click" ToolTip="<% $NopResources:Admin.Products.ImportXLSButton.Tooltip %>" />
        <input type="button" onclick="location.href = 'ProductAdd.aspx'" value="<%=GetLocaleResourceString("Admin.Products.AddButton.Text")%>"
            id="btnAddNew" class="adminButtonBlue" title="<%=GetLocaleResourceString("Admin.Products.AddButton.Tooltip")%>" />
        <asp:Button runat="server" Text="<% $NopResources:Admin.Products.DeleteButton.Text %>"
            CssClass="adminButtonBlue" ID="btnDelete" OnClick="btnDelete_Click" />
        <asp:Button runat="server" Text="<% $NopResources:Admin.Products.UpdatePicURL.Text %>"
            CssClass="adminButtonBlue" ID="btnUpdatePicURLs" OnClick="btnUpdatePicURL_Click" />

        <nopCommerce:ConfirmationBox runat="server" ID="cbDelete" TargetControlID="btnDelete"
            YesText="<% $NopResources:Admin.Common.Yes %>" NoText="<% $NopResources:Admin.Common.No %>"
            ConfirmText="<% $NopResources:Admin.Common.AreYouSure %>" />
        <nopCommerce:ConfirmationBox runat="server" ID="ConfirmationBox3" TargetControlID="Button2"
            YesText="<% $NopResources:Admin.Common.Yes %>" NoText="<% $NopResources:Admin.Common.No %>"
            ConfirmText="<% $NopResources:Admin.Common.AreYouSure %>" />
    </div>
</div>
<table width="100%">
    <tr>
        <td class="adminTitle">
            <nopCommerce:ToolTipLabel runat="server" ID="lblProductName" Text="<% $NopResources:Admin.Products.ProductName %>"
                ToolTip="<% $NopResources:Admin.Products.ProductName.Tooltip %>" ToolTipImage="~/Administration/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <asp:TextBox ID="txtProductName" CssClass="adminInput" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="adminTitle">
            <nopCommerce:ToolTipLabel runat="server" ID="lblCategory" Text="<% $NopResources:Admin.Products.Category %>"
                ToolTip="<% $NopResources:Admin.Products.Category.Tooltip %>" ToolTipImage="~/Administration/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <nopCommerce:SelectCategoryControl ID="ParentCategory" CssClass="adminInput" runat="server"></nopCommerce:SelectCategoryControl>
        </td>
    </tr>
    <tr>
        <td class="adminTitle">
            <nopCommerce:ToolTipLabel runat="server" ID="lblManufacturer" Text="<% $NopResources:Admin.Products.Manufacturer %>"
                ToolTip="<% $NopResources:Admin.Products.Manufacturer.Tooltip %>" ToolTipImage="~/Administration/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <asp:DropDownList ID="ddlManufacturer" runat="server" CssClass="adminInput">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td class="adminTitle">
            <nopCommerce:ToolTipLabel runat="server" ID="lblGoDirectlyToSKU" Text="<% $NopResources:Admin.Products.GoDirectlySKU %>"
                ToolTip="<% $NopResources:Admin.Products.GoDirectlySKU.Tooltip %>" ToolTipImage="~/Administration/Common/ico-help.gif" />
        </td>
        <td class="adminData">
            <nopCommerce:SimpleTextBox runat="server" CssClass="adminInput" ID="txtSKU" Width="150px"
                ValidationGroup="GoDirectlySKU" ErrorMessage="<% $NopResources:Admin.Products.GoDirectlySKU.ErrorMessage %>"></nopCommerce:SimpleTextBox>
            <asp:Button runat="server" Text="<% $NopResources:Admin.Products.GoSKUButton.Text %>"
                CssClass="adminButtonBlue" ID="btnGoDirectlyToSKU" OnClick="btnGoDirectlyToSKU_Click"
                ValidationGroup="GoDirectlySKU" />
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

    function ChildBlock(img, obj) {
        if (obj.style.display == 'none') {
            obj.style.display = '';
            img.src = "<%=CommonHelper.GetStoreLocation()%>images/collapse.png";
        }
        else {
            obj.style.display = 'none';
            img.src = "<%=CommonHelper.GetStoreLocation()%>images/expand.png";
        }
    }
</script>
<asp:GridView ID="gvProducts" runat="server" AutoGenerateColumns="False" Width="100%"
    OnPageIndexChanging="gvProducts_PageIndexChanging" AllowPaging="true" PageSize="15"
    OnRowDataBound="gvProducts_RowDataBound" OnRowCommand="gvProducts_RowCommand" DataKeyNames="ProductId">
    <Columns>
        <asp:TemplateField ItemStyle-Width="5%" ItemStyle-HorizontalAlign="Center">
            <HeaderTemplate>
                <asp:CheckBox ID="cbSelectAll" runat="server" CssClass="cbHeader" />
            </HeaderTemplate>
            <ItemTemplate>
                <asp:CheckBox ID="cbProduct" runat="server" CssClass="cbRowItem" />
                <asp:HiddenField ID="hfProductId" runat="server" Value='<%# Eval("ProductId") %>' />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="<% $NopResources:Admin.Products.Name %>" ItemStyle-Width="35%">
            <ItemTemplate>
                <asp:Image runat="server" ID="imgProduct" Style="margin-right: 10px;" /><%#Server.HtmlEncode(Eval("Name").ToString())%>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="<% $NopResources:Admin.Products.ProductVariants %>"
            HeaderStyle-HorizontalAlign="Center" ItemStyle-Width="40%" ItemStyle-HorizontalAlign="Center">
            <ItemTemplate>
                <asp:Panel runat="server" ID="pnlVariants" Style="text-align: left">
                    <img src='<%#Page.ResolveUrl("~/images/expand.png") %>' alt="variants" onclick="ChildBlock(this,document.getElementById('pvGrid<%#Eval("ProductId") %>'));" />
                    <div id='pvGrid<%#Eval("ProductId") %>' style="display: none">
                        <asp:GridView runat="server" ID="gvVariants" DataKeyNames="ProductVariantId" AutoGenerateColumns="false" Width="100%">
                            <Columns>
                                <asp:TemplateField HeaderText="<% $NopResources:Admin.Products.ProductVariants.Name %>"
                                    ItemStyle-Width="40%">
                                    <ItemTemplate>
                                        <a href="ProductVariantDetails.aspx?ProductVariantID=<%#Eval("ProductVariantId")%>">
                                            <%#Server.HtmlEncode(GetProductVariantName(Container.DataItem as ProductVariant))%>
                                        </a>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="SKU" HeaderText="<% $NopResources:Admin.Products.ProductVariants.SKU %>"
                                    HeaderStyle-HorizontalAlign="Center" ItemStyle-Width="20%" ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                                <asp:BoundField DataField="Price" HeaderText="<% $NopResources:Admin.Products.ProductVariants.Price %>"
                                    HeaderStyle-HorizontalAlign="Center" ItemStyle-Width="20%" ItemStyle-HorizontalAlign="Center" DataFormatString="{0:G}"></asp:BoundField>
                                <asp:TemplateField HeaderText="<% $NopResources:Admin.Products.ProductVariants.Published %>"
                                    HeaderStyle-HorizontalAlign="Center" ItemStyle-Width="20%" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <nopCommerce:ImageCheckBox runat="server" ID="cbPublished" Checked='<%# Eval("Published") %>'></nopCommerce:ImageCheckBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </asp:Panel>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="<% $NopResources:Admin.Products.Published %>" HeaderStyle-HorizontalAlign="Center"
            ItemStyle-Width="10%" ItemStyle-HorizontalAlign="Center">
            <ItemTemplate>
                <nopCommerce:ImageCheckBox runat="server" ID="cbPublished" Checked='<%# Eval("Published") %>'></nopCommerce:ImageCheckBox>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="<% $NopResources:Admin.Products.Edit %>" HeaderStyle-HorizontalAlign="Center"
            ItemStyle-Width="10%" ItemStyle-HorizontalAlign="Center">
            <ItemTemplate>
                <a href="ProductDetails.aspx?ProductId=<%#Eval("ProductId")%>" title="<%#GetLocaleResourceString("Admin.Products.Edit.Tooltip")%>">
                    <%#GetLocaleResourceString("Admin.Products.Edit")%>
                </a>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="<% $NopResources:Admin.Products.Up %>" HeaderStyle-HorizontalAlign="Center"
            ItemStyle-Width="10%" ItemStyle-HorizontalAlign="Center">
            <ItemTemplate>
                <asp:Button ID="btnUpTop" runat="server" CssClass="adminButton" Text="<% $NopResources:Admin.Products.Up %>"
                    CommandName="UpTop" CommandArgument="<%# Container.DataItemIndex %>" />
                <nopCommerce:ConfirmationBox runat="server" ID="ConfirmationBox1" TargetControlID="btnUpTop"
                    YesText="<% $NopResources:Admin.Common.Yes %>" NoText="<% $NopResources:Admin.Common.No %>"
                    ConfirmText="<% $NopResources:Admin.Common.AreYouSure %>" />
            </ItemTemplate>


        </asp:TemplateField>
        <asp:TemplateField HeaderText="<% $NopResources:Admin.Products.Up %>" HeaderStyle-HorizontalAlign="Center"
            ItemStyle-Width="10%" ItemStyle-HorizontalAlign="Center">
            <ItemTemplate>
                <asp:Button ID="btnUpdatePic" runat="server" CssClass="adminButton" Text="<% $NopResources:Admin.Products.UpdatePic %>"
                    CommandName="UpdatePic" CommandArgument="<%# Container.DataItemIndex %>" />
                <nopCommerce:ConfirmationBox runat="server" ID="ConfirmationBox2" TargetControlID="btnUpdatePic"
                    YesText="<% $NopResources:Admin.Common.Yes %>" NoText="<% $NopResources:Admin.Common.No %>"
                    ConfirmText="<% $NopResources:Admin.Common.AreYouSure %>" />
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
    <PagerSettings PageButtonCount="50" Position="TopAndBottom" />
</asp:GridView>

<br />
<asp:Label runat="server" ID="lblNoProductsFound" Text="<% $NopResources: Admin.Products.NoProductsFound%>"
    Visible="false"></asp:Label>
<ajaxToolkit:ConfirmButtonExtender ID="cbeImportXLS" runat="server" TargetControlID="btnImportXLS"
    DisplayModalPopupID="mpeImportXLS" />
<ajaxToolkit:ModalPopupExtender runat="server" ID="mpeImportXLS" TargetControlID="btnImportXLS"
    OkControlID="btnImportXLSOk" CancelControlID="btnImportXLSCancel" PopupControlID="pnlImportXLSPopupPanel"
    BackgroundCssClass="modalBackground" />
<asp:Panel runat="server" ID="pnlImportXLSPopupPanel" Style="display: none; width: 250px; background-color: White; border-width: 2px; border-color: Black; border-style: solid; padding: 20px;">
    <div style="text-align: center;">
        <%=GetLocaleResourceString("Admin.Products.ImportXLS.ExcelFile")%>
        <asp:FileUpload runat="server" ID="fuXlsFile" />
        <asp:Button ID="btnImportXLSOk" runat="server" Text="<% $NopResources:Admin.Common.OK %>"
            CssClass="adminButton" CausesValidation="false" />
        <asp:Button ID="btnImportXLSCancel" runat="server" Text="<% $NopResources:Admin.Common.Cancel %>"
            CssClass="adminButton" CausesValidation="false" />
    </div>
</asp:Panel>
