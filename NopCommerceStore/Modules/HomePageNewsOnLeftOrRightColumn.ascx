<%@ Control Language="C#" AutoEventWireup="true" Inherits="NopSolutions.NopCommerce.Web.Modules.HomePageNewsOnLefOrRightColumnControl"
    CodeBehind="HomePageNewsOnLeftOrRightColumn.ascx.cs" %>
<div class="newslist">
    <div class="title">
        <table style="width: 100%;">
            <tr>
                <td style="text-align: left; vertical-align: middle;">
                    <%=GetLocaleResourceString("News.News")%>
                </td>
                <td style="text-align: right; vertical-align: middle;">
                    <a href="<%= GetNewsRSSUrl()%>">
                        <asp:Image ID="imgRSS" runat="server" ImageUrl="~/images/icon_rss.gif" ToolTip="<% $NopResources:NewsRSS.Tooltip %>"
                            AlternateText="RSS" EnableViewState="false" /></a>
                </td>
            </tr>
        </table>
    </div>
    <div class="clear">
    </div>
    <div class="newsitems">
        <asp:Repeater ID="rptrNews" runat="server" EnableViewState="false">
            <ItemTemplate>
                <div class="item-on-left-or-right">
                    <a class="newstitle" href="<%#SEOHelper.GetNewsUrl((News)Container.DataItem)%>">
                        <%#Server.HtmlEncode(Eval("Title").ToString())%></a>
                        <div class="serviceshortdescription">
                            <a class="serviceimage" href="<%#SEOHelper.GetNewsUrl((NopSolutions.NopCommerce.BusinessLogic.Content.NewsManagement.News)Container.DataItem)%>">                        
                               <img alt="<%#Server.HtmlEncode(Eval("Title").ToString())%>" src="<%#this.PictureService.GetPictureUrl(((NopSolutions.NopCommerce.BusinessLogic.Content.NewsManagement.News)Container.DataItem).PictureId, this.SettingManager.GetSettingValueInteger("Media.Category.ThumbnailImageSize", 125), true) %>" />    
                             </a>                            
                        </div>
                    
                </div>
            </ItemTemplate>
        </asp:Repeater>
        <div class="viewall">
            <a href="<%=CommonHelper.GetStoreLocation()%>newsarchive.aspx">
                <%=GetLocaleResourceString("News.ViewAll")%></a>
        </div>
    </div>
</div>
