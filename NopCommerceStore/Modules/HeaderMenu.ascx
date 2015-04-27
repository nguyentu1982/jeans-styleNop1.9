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
       
        <li><a href="<%=CommonHelper.GetStoreLocation()%>danh-muc-jean/13/quan-jean-nu.aspx" id="megaanchor"><span class="menu-woman">QUẦN JEAN NỮ </span></a></li>
        
        <li><a href="<%=CommonHelper.GetStoreLocation()%>danh-muc-jean/14/quan-jean-nam.aspx" id="megaanchor2"> <span class="menu-man">QUẦN JEAN NAM </span></a></li>

        <li><a href="<%=CommonHelper.GetStoreLocation()%>danh-muc-jean/41/ao-bo-nu.aspx" > <span class="menu-man">Áo bò nữ</span></a></li>
        
        <li><a href="<%=CommonHelper.GetStoreLocation()%>danh-muc-jean/40/ao-bo-nam.aspx" > <span class="menu-man">Áo bò nam</span></a></li>

        <li><a href="<%=CommonHelper.GetStoreLocation()%>danh-muc-jean/44/quan-vai-nu.aspx" > <span class="menu-man">Quần vải nữ</span></a></li>

        <li><a href="<%=CommonHelper.GetStoreLocation()%>danh-muc-jean/33/quan-jean-nam-nu-gia-re-tai-ha-noi.aspx" > <span class="sales-menu">Sales</span></a></li>

        <li><a href="<%=CommonHelper.GetStoreLocation()%>search.aspx" > <span class="sales-menu">Tìm sản phẩm</span></a></li>
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
        <li><span class="menu-right-conner"></span></li>
    </ul>   
</div>
<div class="clear"></div>
<div class="header-bottom-seach">
    <div style="text-align:center;font-weight: bold;font-style:italic;font-size:larger;">
        <h1>
            <a href="<%=CommonHelper.GetStoreLocation()%>"><%=GetLocaleResourceString("Homepage.SeoKeyWord")%></a>
        </h1>
    </div>
<%--<div class="searchbox">
    <nopCommerce:SearchBox runat="server" ID="ctrlSearchBox">
    </nopCommerce:SearchBox>
</div> --%>   
</div>
