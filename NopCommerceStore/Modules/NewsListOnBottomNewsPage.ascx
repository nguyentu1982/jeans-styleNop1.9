<%@ Control Language="C#" AutoEventWireup="true" Inherits="NopSolutions.NopCommerce.Web.Modules.NewsListOnBottomNewsPageControl"
    CodeBehind="NewsListOnBottomNewsPage.ascx.cs" %>
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
  
    <div class="item-list">
        <asp:Repeater ID="rptrNews" runat="server" EnableViewState="false">
            <ItemTemplate>
                <div class="item">
                    <a class="newstitle" href="<%#SEOHelper.GetNewsUrl((News)Container.DataItem)%>">
                        <%#Server.HtmlEncode(Eval("Title").ToString())%></a> <span class="newsdate">-
                            <%#DateTimeHelper.ConvertToUserTime((DateTime)Eval("CreatedOn"), DateTimeKind.Utc).ToString("D")%>
                        </span>                  
                    
                </div>
            </ItemTemplate>
        </asp:Repeater>        
    </div>

    <div class="item">
            <a href="<%=CommonHelper.GetStoreLocation()%>newsarchive.aspx">
                <%=GetLocaleResourceString("News.ViewAll")%></a>
        </div>
</div>
