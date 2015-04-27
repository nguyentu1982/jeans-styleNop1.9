<%@ Control Language="C#" AutoEventWireup="true" Inherits="NopSolutions.NopCommerce.Web.Modules.HomePageServiceControl"
    CodeBehind="HomePageService.ascx.cs" %>
<div class="newslist">
    <div class="title">
        <table style="width: 100%;">
            <tr>
                <td style="text-align: left; vertical-align: middle;">
                    <%=GetLocaleResourceString("Service.Service")%>
                </td>
                <td style="text-align: right; vertical-align: middle;">
                    <a href="<%= GetServiceRSSUrl()%>">
                        <asp:Image ID="imgRSS" runat="server" ImageUrl="~/images/icon_rss.gif" ToolTip="<% $NopResources:ServiceRSS.Tooltip %>"
                            AlternateText="RSS" EnableViewState="false" /></a>
                </td>
            </tr>
        </table>
    </div>
    <div class="clear">
    </div>
    <div class="newsitems">
        <asp:Repeater ID="rptrService" runat="server" EnableViewState="false">
            <ItemTemplate>
                <div class="item">
                    <a class="newstitle" href="<%#SEOHelper.GetServiceUrl((NopSolutions.NopCommerce.BusinessLogic.Content.ServiceManagement.Service)Container.DataItem)%>">
                        <%#Server.HtmlEncode(Eval("Title").ToString())%></a> 
                     
                        
                        <%--<span class="newsdate">-
                            <%#DateTimeHelper.ConvertToUserTime((DateTime)Eval("CreatedOn"), DateTimeKind.Utc).ToString("D")%>
                        </span>--%>
                    <div class="serviceshortdescription">
                        <a class="serviceimage" href="<%#SEOHelper.GetServiceUrl((NopSolutions.NopCommerce.BusinessLogic.Content.ServiceManagement.Service)Container.DataItem)%>">                        
                            <img alt="" src="<%#this.PictureService.GetPictureUrl(((NopSolutions.NopCommerce.BusinessLogic.Content.ServiceManagement.Service)Container.DataItem).PictureId, this.SettingManager.GetSettingValueInteger("Media.Category.ThumbnailImageSize", 125), true) %>" />    
                        </a>

                        <div class="seriveshort">
                            <%#Eval("Short")%>
                        </div>
                    </div>
                    <div>                               
                         <a href="<%#SEOHelper.GetServiceUrl((NopSolutions.NopCommerce.BusinessLogic.Content.ServiceManagement.Service)Container.DataItem)%>" class="readmoreservice">
                        <%=GetLocaleResourceString("Service.MoreInfo")%></a>
                    </div>
                </div>
                
            </ItemTemplate>
        </asp:Repeater>
        <div class="viewall">
            <a href="<%=CommonHelper.GetStoreLocation()%>newsarchive.aspx">
                <%=GetLocaleResourceString("Service.ViewAll")%></a>
        </div>
    </div>
</div>
