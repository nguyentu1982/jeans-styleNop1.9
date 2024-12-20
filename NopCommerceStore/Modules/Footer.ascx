﻿<%@ Control Language="C#" AutoEventWireup="true" Inherits="NopSolutions.NopCommerce.Web.Modules.FooterControl"
    CodeBehind="Footer.ascx.cs" %>
<%@ Register TagPrefix="nopCommerce" TagName="StoreThemeSelector" Src="~/Modules/StoreThemeSelector.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="InfoBlock" Src="~/Modules/InfoBlock.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="ShopsInfo" Src="~/Modules/ShopsInfo.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="PopularTags" Src="~/Modules/PopularTags1.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="RecentlyViewedProducts" Src="~/Modules/RecentlyViewedProducts.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="NewsLetterSubscriptionBoxControl" Src="~/Modules/NewsLetterSubscriptionBoxControl.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="RelatedProducts" Src="~/Modules/RelatedProducts.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="Topic" Src="~/Modules/Topic.ascx" %>


<div class="footer-bf">
    <nopCommerce:RecentlyViewedProducts ID="ctrlRecentlyViewedProducts" runat="server" />
    <div class="clear"></div>
    <nopCommerce:RelatedProducts ID="ctrlRelatedProducts" runat="server" />


</div>
<nopCommerce:Topic ID="topicHomePageText" runat="server" TopicName="HomePageText"
        OverrideSEO="false"></nopCommerce:Topic>
<div class="clear"></div>
<div class="footer">
    <div class="footer-info">
        <div class="listbox">
            <b><%=GetLocaleResourceString("Content.AboutUs")%></b>
            <ul>
                <li><a href="<%=Page.ResolveUrl("~/contactus.aspx")%>">
                    <%=GetLocaleResourceString("ContactUs.ContactUs")%></a> </li>
                <li><a href="<%=Page.ResolveUrl("~/aboutus.aspx")%>">
                    <%=GetLocaleResourceString("Content.AboutUs")%></a></li>
                <% if (this.BlogService.BlogEnabled)
                   { %>
                <li><a href="<%= SEOHelper.GetBlogUrl()%>">
                    <%=GetLocaleResourceString("Blog.Blog")%></a></li>
                <%} %>
                <% if (this.ForumService.ForumsEnabled)
                   { %>
                <li><a href="<%= SEOHelper.GetForumMainUrl()%> ">
                    <%=GetLocaleResourceString("Forum.Forums")%></a></li>
                <%} %>
                <li>
                    <%=GetLocaleResourceString("Content.TeleHelp")%>
                </li>
            </ul>
        </div>
    </div>

    <div class="footer-info">
        <div class="listbox">
            <b><%=GetLocaleResourceString("Content.HowToOrder")%></b>
            <ul>
                <li>
                    <a href="<%=Page.ResolveUrl("~/topic/11/huong-dan-mua-hang-tai-jeans-style.aspx")%>">
                        <%=GetLocaleResourceString("Guide.Shipping")%></a>
                </li>
                <li>
                    <a href="<%=Page.ResolveUrl("~/topic/15/phuong-thuc-thanh-toan.aspx")%>">
                        <%=GetLocaleResourceString("Guide.Payment")%></a>
                </li>
                <li><a href="<%=Page.ResolveUrl("~/shippinginfo.aspx")%>">
                    <%=GetLocaleResourceString("Content.Shipping&Returns")%></a></li>
            </ul>
        </div>

        <div class="listbox">
            <b><%=GetLocaleResourceString("Content.CustomerService")%></b>
            <ul>
                <li><a href="<%=Page.ResolveUrl("~/privacyinfo.aspx")%>">
                    <%=GetLocaleResourceString("Content.PrivacyNotice")%></a></li>
                <li><a href="<%=Page.ResolveUrl("~/conditionsinfo.aspx")%>">
                    <%=GetLocaleResourceString("Content.ConditionsOfUse")%></a></li>
            </ul>
        </div>
    </div>

    <div class="footer-info">
        <a href="http://online.gov.vn/HomePage/CustomWebsiteDisplay.aspx?DocId=13056">
            <img src="../../images/20150827110756-dathongbao.png" width="180" />
        </a>
    </div>

    <div class="footer-info">
        <div class="listbox">
            <nopCommerce:NewsLetterSubscriptionBoxControl runat="server" ID="ctrlNewsLetterSubscriptionBoxControl" />
        </div>
    </div>

    <div class="footer-info-face">
        <div class="listbox">
            <div class="fb-page" data-href="https://www.facebook.com/JeansStyleVN" data-tabs="" data-width="" data-height="" data-small-header="false" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true"><blockquote cite="https://www.facebook.com/JeansStyleVN" class="fb-xfbml-parse-ignore"><a href="https://www.facebook.com/JeansStyleVN">Jeans Style</a></blockquote></div>
        </div>

    </div>


    

    <%--<div class="footer-payment">
                        
        </div>--%>
</div>
<div class="clear">
</div>
<div class="footer-tags">
    <nopCommerce:PopularTags ID="ctrlPopularTags" runat="server" />
</div>

<div class="clear">
</div>
<div class="footer-shops">
        <nopCommerce:ShopsInfo ID="ShopsInfo" runat="server" />
</div>

<div style="text-align:center;background:#fff;padding-top: 5px;">
    <b style="text-transform: uppercase;">Thông tin chủ sở hữu và chịu trách nhiệm</b><br />
    Ông: Nguyễn Anh Tú - Số 55 Đội Cấn, Ba Đình, Hà Nội - ĐT: 0988.084.657
			<br />
    Số ĐK KD: 01A8016476 Đăng ký lần đầu ngày 18/03/2014

    <div class="footer-disclaimer">
        <%=String.Format(GetLocaleResourceString("Content.CopyrightNotice"), 
                                        DateTime.Now.Year.ToString(), 
                                        this.SettingManager.StoreName)%>
    </div>

    <div class="footer-poweredby">
        Powered by <a href="http://www.nopcommerce.com/" rel="nofollow">nopCommerce</a>
        <span id="_author2" itemprop="author" itemscope itemtype="http://schema.org/Person"><span itemprop="name"><a href="https://plus.google.com/100770162889339370650?rel=author">Jeans Phong Cách (Jeans Style)</a></span></span>
    </div>
    <div class="footer-storetheme">
        <nopCommerce:StoreThemeSelector ID="ctrlStoreTheme" runat="server" />
    </div>
</div>


