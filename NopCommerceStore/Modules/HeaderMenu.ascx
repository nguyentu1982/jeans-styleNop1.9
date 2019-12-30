<%@ Control Language="C#" AutoEventWireup="true" Inherits="NopSolutions.NopCommerce.Web.Modules.HeaderMenuControl"
    CodeBehind="HeaderMenu.ascx.cs" %>
<%@ Register TagPrefix="nopCommerce" TagName="SearchBox" Src="~/Modules/SearchBox.ascx" %>
<div class="headermenu">
    <%--<div class="searchbox">
        <nopCommerce:SearchBox runat="server" ID="ctrlSearchBox">
        </nopCommerce:SearchBox>
    </div>--%>
    
    <ul class="topmenu">
        
        <li><a href="<%=CommonHelper.GetStoreLocation()%>">
            <span class="menu-home"><%=GetLocaleResourceString("Content.HomePage")%></span></a> </li>
               
        <li><a href="<%=CommonHelper.GetStoreLocation()%>danh-muc-jean/14/quan-jean-nam.aspx" id="megaanchor2"> JEANS NAM <i class="angle-down"></i></a></li>

        <li><a href="<%=CommonHelper.GetStoreLocation()%>danh-muc-jean/13/quan-jean-nu.aspx" id="megaanchor">JEANS NỮ<i class="angle-down"></i></a></li>

        <li><a href="<%=CommonHelper.GetStoreLocation()%>danh-muc-jean/80/big-size-nam.aspx" id="megaanchor3"> BIG SIZE NAM <i class="angle-down"></i></a></li>

        <li><a href="<%=CommonHelper.GetStoreLocation()%>danh-muc-jean/26/quan-jean-nu-size-lon-big-size.aspx" id="megaanchor4">BIG SIZE NỮ </a></li>
           

        <%--<li><a href="<%=Page.ResolveUrl("~/customers.aspx")%>">
            <%=GetLocaleResourceString("Customer.Customer")%></a> </li>
--%>
        <%--<% if (this.ProductService.RecentlyAddedProductsEnabled)
           { %>
        <li><a href="<%=Page.ResolveUrl("~/recentlyaddedproducts.aspx")%>">
            <%=GetLocaleResourceString("Products.NewProducts")%></a> </li>
        <li class="meu-seperator"></li>
        <%} %>--%>
        <%--<li><a href="<%=Page.ResolveUrl("~/search.aspx")%>">
            <%=GetLocaleResourceString("Search.Search")%></a> </li>
        <li><a href="<%= SEOHelper.GetMyAccountUrl()%>">
            <%=GetLocaleResourceString("Account.MyAccount")%></a> </li>--%>
    
         
        <%--<li><a href="<%= SEOHelper.GetServiceUrl()%>">
        <%=GetLocaleResourceString("Support.Support")%></a> </li>--%>       
        <%--<% if (this.NewsService.NewsEnabled)
           { %>
            <li><a href="<%=Page.ResolveUrl("~/NewsArchive.aspx")%>">
            <%=GetLocaleResourceString("News.News")%></a> </li>
        <li class="meu-seperator"></li>
          <%} %>--%>

        
        <%--<% if (this.ForumService.ForumsEnabled)
           { %>
        <li><a href="<%= SEOHelper.GetForumMainUrl()%>">
            <%=GetLocaleResourceString("Forum.Forums")%></a></li>
        
        <%} %>--%>
        
        <%-- <li><a href="<%=Page.ResolveUrl("~/aboutus.aspx")%>">
            <%=GetLocaleResourceString("Content.AboutUs")%></a></li>--%>
        
        
         <%--<li><a href="<%=CommonHelper.GetStoreLocation()%>topic/11/huong-dan-mua-hang-tai-jeans-style.aspx">HƯỚNG DẪN MUA HÀNG</a></li>--%>
        
          <%--<li><a href="<%=CommonHelper.GetStoreLocation()%>topic/14/he-thong-cua-hang.aspx">HỆ THỐNG CỬA HÀNG</a></li>--%>
        
        <%--<% if (this.BlogService.BlogEnabled)
           { %>
        <li><a href="<%= SEOHelper.GetBlogUrl()%>">
            <%=GetLocaleResourceString("Blog.Blog")%></a> </li>
       
        <%} %>--%>

        <%--<li><a href="<%=Page.ResolveUrl("~/contactus.aspx")%>">
            <%=GetLocaleResourceString("ContactUs.ContactUs")%></a> </li>--%>
        
       <%--<li><a href="<%= SEOHelper.GetMyAccountUrl()%>">
            <%=GetLocaleResourceString("Account.MyAccount")%></a> </li>--%>
        
    </ul>

</div>
<div class="clear"></div>

<%--<div class="header-bottom-seach">--%>
        
        <%--<%=GetLocaleResourceString("Homepage.SeoKeyWord")%>--%>
        
<%--<div class="searchbox">
    <nopCommerce:SearchBox runat="server" ID="ctrlSearchBox">
    </nopCommerce:SearchBox>
</div> --%>   
<%--</div>--%>
