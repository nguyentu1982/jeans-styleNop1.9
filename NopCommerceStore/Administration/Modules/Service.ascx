<%@ Control Language="C#" AutoEventWireup="true" Inherits="NopSolutions.NopCommerce.Web.Administration.Modules.ServiceControl"
    CodeBehind="Service.ascx.cs" %>
<%@ Register TagPrefix="nopCommerce" TagName="ToolTipLabel" Src="ToolTipLabelControl.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="NumericTextBox" Src="NumericTextBox.ascx" %>
<div class="section-header">
    <div class="title">
        <img src="Common/ico-content.png" alt="<%=GetLocaleResourceString("Admin.Service.Title")%>" />
        <%=GetLocaleResourceString("Admin.Service.Title")%>
    </div>
    <div class="options">
        <input type="button" onclick="location.href='ServiceAdd.aspx'" value="<%=GetLocaleResourceString("Admin.Service.AddNewButton.Text")%>"
            id="btnAddNew" class="adminButtonBlue" title="<%=GetLocaleResourceString("Admin.Service.AddNewButton.Tooltip")%>" />
    </div>
</div>
<p>
</p>
<asp:GridView ID="gvService" runat="server" AutoGenerateColumns="False" Width="100%"
    OnPageIndexChanging="gvService_PageIndexChanging" AllowPaging="true" PageSize="15">
    <Columns>
        <asp:TemplateField HeaderText="<% $NopResources:Admin.Service.ServiceTitle %>" ItemStyle-Width="30%">
            <ItemTemplate>
                <%#Server.HtmlEncode(Eval("Title").ToString())%>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="<% $NopResources:Admin.Service.Language %>" HeaderStyle-HorizontalAlign="Center"
            ItemStyle-Width="15%" ItemStyle-HorizontalAlign="Center">
            <ItemTemplate>
                <%#((Language)Eval("Language")).Name%>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="<% $NopResources:Admin.Service.ViewComments %>" HeaderStyle-HorizontalAlign="Center"
            ItemStyle-Width="15%" ItemStyle-HorizontalAlign="Center">
            <ItemTemplate>
                <a href="ServiceComments.aspx?ServiceID=<%#Eval("ServiceId")%>" title="<%#GetLocaleResourceString("Admin.Service.ViewComments.Tooltip")%>">
                    <%# string.Format(GetLocaleResourceString("Admin.Service.ViewComments.Link"), ((ICollection<NopSolutions.NopCommerce.BusinessLogic.Content.ServiceManagement.ServiceComment>)Eval("ServiceComments")).Count)%>
                </a>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="<% $NopResources:Admin.Service.Published %>" HeaderStyle-HorizontalAlign="Center"
            ItemStyle-Width="15%" ItemStyle-HorizontalAlign="Center">
            <ItemTemplate>
                <nopCommerce:ImageCheckBox runat="server" ID="cbPublished" Checked='<%# Eval("Published") %>'>
                </nopCommerce:ImageCheckBox>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="<% $NopResources:Admin.Service.CreatedOn %>" HeaderStyle-HorizontalAlign="Center"
            ItemStyle-Width="20%" ItemStyle-HorizontalAlign="Center">
            <ItemTemplate>
                <%#DateTimeHelper.ConvertToUserTime((DateTime)Eval("CreatedOn"), DateTimeKind.Utc).ToString()%>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="<% $NopResources:Admin.Service.Edit %>" HeaderStyle-HorizontalAlign="Center"
            ItemStyle-Width="10%" ItemStyle-HorizontalAlign="Center">
            <ItemTemplate>
                <a href="ServiceDetails.aspx?ServiceID=<%#Eval("ServiceId")%>" title="<%#GetLocaleResourceString("Admin.Service.Edit.Tooltip")%>">
                    <%#GetLocaleResourceString("Admin.Service.Edit")%></a>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
    <PagerSettings PageButtonCount="50" Position="TopAndBottom" />
</asp:GridView>
