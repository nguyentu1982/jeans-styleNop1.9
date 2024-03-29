<%@ Control Language="C#" AutoEventWireup="true" Inherits="NopSolutions.NopCommerce.Web.Modules.HomePageNewsControl"
    CodeBehind="HomePageNews.ascx.cs" %>
<div class="newslist">
    <div class="title">
        <table style="width: 100%;">
            <tr>
                <td style="text-align: left; vertical-align: middle;">
                    <a href="<%=CommonHelper.GetStoreLocation()%>newsarchive.aspx">
                <%=GetLocaleResourceString("News.News")%></a>
                </td>
                <td style="text-align: right; vertical-align: middle;">
                    <a href="<%= GetNewsRSSUrl()%>">
                        <asp:Image ID="imgRSS" runat="server" ImageUrl="~/images/icon_rss.gif" ToolTip="<% $NopResources:NewsRSS.Tooltip %>"
                            AlternateText="RSS" EnableViewState="false" /></a>
                </td>
            </tr>
        </table>
    </div>

    <div class="newsitemshomepage">    
        <asp:Repeater ID="rptrNews" runat="server" EnableViewState="false">
            <ItemTemplate>
                <div class="item">
                    
                    <div class="newspicture">
                    <a class="newsimage" href="<%#SEOHelper.GetNewsUrl((NopSolutions.NopCommerce.BusinessLogic.Content.NewsManagement.News)Container.DataItem)%>">
                            <img alt="<%#Server.HtmlEncode(Eval("Title").ToString())%>" src="<%#this.PictureService.GetPictureUrl(((NopSolutions.NopCommerce.BusinessLogic.Content.NewsManagement.News)Container.DataItem).PictureId, this.SettingManager.GetSettingValueInteger("Media.HomepageNews.ThumbnailImageSize", 100), true) %>" />
                        </a>
                        </div>
               <a href="<%#SEOHelper.GetNewsUrl((News)Container.DataItem)%>">
                        <%#Server.HtmlEncode(Eval("Title").ToString())%></a>
                     <%--<span class="newsdate">-
                            <%#DateTimeHelper.ConvertToUserTime((DateTime)Eval("CreatedOn"), DateTimeKind.Utc).ToString("D")%>
                        </span>--%>
                    <%--<div class="serviceshortdescription">
                        <a class="serviceimage" href="<%#SEOHelper.GetNewsUrl((NopSolutions.NopCommerce.BusinessLogic.Content.NewsManagement.News)Container.DataItem)%>">
                            <img alt="<%#Server.HtmlEncode(Eval("Title").ToString())%>" src="<%#this.PictureService.GetPictureUrl(((NopSolutions.NopCommerce.BusinessLogic.Content.NewsManagement.News)Container.DataItem).PictureId, this.SettingManager.GetSettingValueInteger("Media.Category.ThumbnailImageSize", 125), true) %>" />
                        </a>
                        <div class="newsdetails">
                            <%#Eval("Short")%>
                        </div>
                        <a href="<%#SEOHelper.GetNewsUrl((News)Container.DataItem)%>" class="readmore">
                            <%=GetLocaleResourceString("News.MoreInfo")%></a>
                    </div>--%>

                </div>
            </ItemTemplate>
        </asp:Repeater>
        <%--<div class="viewall">
            <a href="<%=CommonHelper.GetStoreLocation()%>newsarchive.aspx">
                <%=GetLocaleResourceString("News.ViewAll")%></a>
        </div>--%>
    </div>
</div>
