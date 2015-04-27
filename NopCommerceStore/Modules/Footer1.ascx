<%@ Control Language="C#" AutoEventWireup="true" Inherits="NopSolutions.NopCommerce.Web.Modules.Footer1Control"
    CodeBehind="Footer1.ascx.cs" %>
<%@ Register TagPrefix="nopCommerce" TagName="StoreThemeSelector" Src="~/Modules/StoreThemeSelector.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="InfoBlock" Src="~/Modules/InfoBlock.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="ShopsInfo" Src="~/Modules/ShopsInfo.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="PopularTags" Src="~/Modules/PopularTags1.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="NewsLetterSubscriptionBoxControl" Src="~/Modules/NewsLetterSubscriptionBoxControl.ascx" %>



<div style="margin: auto; background: #fff; text-align: center;padding-bottom:5px;">
    <div class="footer-tags">
        <nopCommerce:PopularTags ID="ctrlPopularTags" runat="server" />
    </div>
    <div class="fb-like-box" data-href="https://www.facebook.com/pages/Jeans-Style/488824521136196" data-width="990px" data-height="200" data-show-faces="true" data-stream="false" data-header="false"></div>
</div>
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
            <!-- AddThis Follow BEGIN -->
            <p>Follow Us</p>
            <div class="addthis_toolbox addthis_vertical_style">
                <a class="addthis_button_facebook_follow" addthis:userid="pages/Jeans-Style/488824521136196" rel="nofollow"></a>
                <a class="addthis_button_twitter_follow" addthis:userid="quanjeandep" rel="nofollow"></a>
                <a class="addthis_button_google_follow" addthis:userid="100770162889339370650" rel="nofollow"></a>
                <a class="addthis_button_pinterest_follow" addthis:userid="quanjeandep" rel="nofollow"></a>
            </div>
            <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-51a6d4ab1549ecbe"></script>
            <!-- AddThis Follow END -->


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
    </div>

    <div class="footer-info">
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
        <div class="listbox">
            <nopCommerce:NewsLetterSubscriptionBoxControl runat="server" ID="ctrlNewsLetterSubscriptionBoxControl" />
        </div>
    </div>

    <div class="footer-shops">
        <nopCommerce:ShopsInfo ID="ShopsInfo" runat="server" />
    </div>
    <div class="clear">
    </div>
    <%--<div class="footer-payment">
                        
        </div>--%>

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
