<%@ Control Language="C#" AutoEventWireup="true" Inherits="NopSolutions.NopCommerce.Web.Modules.PopularTagsControl"
    CodeBehind="PopularTags.ascx.cs" %>
<div class="popular-tags block block-popular-tags">
    <div class="title">
        <%=GetLocaleResourceString("ProductTagsCloud.Title")%>
    </div>
    <div class="clear">
    </div>
    <div class="tags-listbox">
        <asp:ListView ID="lvTagCloud" runat="server" EnableViewState="false">
            <LayoutTemplate>
                <div class="tags">
                    <ul>
                        <asp:PlaceHolder ID="itemPlaceholder" runat="server" />
                    </ul>
                </div>
            </LayoutTemplate>
            <%--<ItemTemplate>
                <li><b><a style='font-size: <%# GetFontSize((int)Eval("ProductCount")) %>%' href="<%# SEOHelper.GetProductTagUrl((ProductTag)(Container.DataItem)) %>" rel="tag">
                    <%#Server.HtmlEncode((string)Eval("Name"))%></a></b></li>
            </ItemTemplate>--%>

            <ItemTemplate>
                <li><b><a style='font-size: 12px' href="<%# SEOHelper.GetProductTagUrl((ProductTag)(Container.DataItem)) %>" rel="tag">
                    <%#Server.HtmlEncode((string)Eval("Name"))%></a></b></li>
            </ItemTemplate>
            <ItemSeparatorTemplate>|</ItemSeparatorTemplate>
        </asp:ListView>
    </div>
</div>
