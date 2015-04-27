<%@ Control Language="C#" AutoEventWireup="true" Inherits="NopSolutions.NopCommerce.Web.Modules.PopularTags1Control"
    CodeBehind="PopularTags1.ascx.cs" %>
<div class="popular-tags block-popular-tags">
    <div class="title">
        <%=GetLocaleResourceString("ProductTagsCloud.Title")%>
    </div>
    <div class="clear">
    </div>
    <div class="tags-listbox">        
        <asp:ListView ID="lvTagCloud" runat="server" EnableViewState="false">
            <ItemTemplate>
                <div class="tag-item">
                    <a style='font-size: 12px' href="<%# SEOHelper.GetProductTagUrl((ProductTag)(Container.DataItem)) %>" rel="tag">
                    <%#Server.HtmlEncode((string)Eval("Name"))%></a>
                </div>                
            </ItemTemplate>            
        </asp:ListView>
    </div>
</div>
