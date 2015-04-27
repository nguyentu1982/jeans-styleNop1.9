<%@ Control Language="C#" AutoEventWireup="true" Inherits="NopSolutions.NopCommerce.Web.Administration.Modules.ServiceHomeControl"
    CodeBehind="ServiceHome.ascx.cs" %>
<div class="section-title">
    <img src="Common/ico-content.png" alt="<%=GetLocaleResourceString("Admin.ServiceHome.ServiceHome")%>" />
    <%=GetLocaleResourceString("Admin.ServiceHome.ServiceHome")%>
</div>
<div class="homepage">
    <div class="intro">
        <p>
            <%=GetLocaleResourceString("Admin.ServiceHome.intro")%>
        </p>
    </div>
    <div class="options">
        <ul>
            <li>
                <div class="title">
                    <a href="servicesettings.aspx" title="<%=GetLocaleResourceString("Admin.ServiceHome.ServiceSettings.TitleDescription")%>">
                        <%=GetLocaleResourceString("Admin.ServiceHome.ServiceSettings.Title")%></a>
                </div>
                <div class="description">
                    <p>
                        <%=GetLocaleResourceString("Admin.ServiceHome.ServiceSettings.Description")%>
                    </p>
                </div>
            </li>
            <li>
                <div class="title">
                    <a href="service.aspx" title="<%=GetLocaleResourceString("Admin.ServiceHome.Service.TitleDescription")%>">
                        <%=GetLocaleResourceString("Admin.ServiceHome.Service.Title")%>
                    </a>
                </div>
                <div class="description">
                    <p>
                        <%=GetLocaleResourceString("Admin.ServiceHome.Service.Description")%>
                    </p>
                </div>
            </li>
            <li>
                <div class="title">
                    <a href="servicecomments.aspx" title="<%=GetLocaleResourceString("Admin.ServiceHome.ServiceComments.TitleDescription")%>">
                        <%=GetLocaleResourceString("Admin.ServiceHome.ServiceComments.Title")%></a>
                </div>
                <div class="description">
                    <p>
                        <%=GetLocaleResourceString("Admin.ServiceHome.ServiceComments.Description")%>
                    </p>
                </div>
            </li>
        </ul>
    </div>
</div>
