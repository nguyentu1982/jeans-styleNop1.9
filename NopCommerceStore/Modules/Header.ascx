<%@ Control Language="C#" AutoEventWireup="true" Inherits="NopSolutions.NopCommerce.Web.Modules.HeaderControl"
    CodeBehind="Header.ascx.cs" %>
<%@ Register TagPrefix="nopCommerce" TagName="CurrencySelector" Src="~/Modules/CurrencySelector.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="LanguageSelector" Src="~/Modules/LanguageSelector.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="TaxDisplayTypeSelector" Src="~/Modules/TaxDisplayTypeSelector.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="SearchBox" Src="~/Modules/SearchBox.ascx" %>

<%--<div class="header-links-wrapper">
        
    </div>--%>
<div class="top-header-links">
           
    <div class="top-header-share">
        <!-- AddThis Button BEGIN -->
        <div class="addthis_toolbox addthis_default_style ">
        <a class="addthis_button_preferred_1"></a>
        <a class="addthis_button_preferred_2"></a>
        <a class="addthis_button_preferred_3"></a>
        <a class="addthis_button_preferred_4"></a>
        <a class="addthis_button_compact"></a>
        <a class="addthis_counter addthis_bubble_style"></a>
        </div>
        <script type="text/javascript">var addthis_config = { "data_track_addressbar": false };</script>
        <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-516fab775e2ff840"></script>
        <!-- AddThis Button END -->
    </div>
              
    <div class="header-links-wapper">
        <div class="f-login-wapper">
            <div id="f-login">
                <fb:login-button scope="public_profile,email" onlogin="checkLoginState();">
        </fb:login-button>

            </div>
            <div id="status" style="float:right;display:none;">
                <a id="f-link">
                    <img id="f-image" />
                </a>
            </div>
            <a id="f-logout" class="f-logout" onclick="logoutFacebook();"></a>            
        </div>
        <div class="header-links">
            <ul>
                <asp:LoginView ID="topLoginView" runat="server">
                    <AnonymousTemplate>
                        <li><a href="<%=Page.ResolveUrl("~/register.aspx")%>" class="ico-register">
                            <%=GetLocaleResourceString("Account.Register")%></a></li>
                        <li><a href="<%=Page.ResolveUrl("~/login.aspx")%>" class="ico-login">
                            <%=GetLocaleResourceString("Account.Login")%></a></li>
                    </AnonymousTemplate>
                    <LoggedInTemplate>
                        <li>
                            <a href="<%= SEOHelper.GetMyAccountUrl()%>" class="account"><%=Page.User.Identity.Name %></a>
                            <% if (NopContext.Current.IsCurrentCustomerImpersonated)
                               { 
                            %>
                            <span class="impersonate">(<%=string.Format(GetLocaleResourceString("Account.ImpersonatedAs"), this.CustomerService.UsernamesEnabled ? Server.HtmlEncode(NopContext.Current.User.Username) : Server.HtmlEncode(NopContext.Current.User.Email))%>-
                                <asp:LinkButton runat="server" ID="lFinishImpersonate" Text="<% $NopResources:Account.ImpersonatedAs.Finish %>"
                                    ToolTip="<% $NopResources:Account.ImpersonatedAs.Finish.Tooltip %>" OnClick="lFinishImpersonate_Click"
                                    CssClass="finish-impersonation"></asp:LinkButton>)</span>
                            <%} %>
                        </li>
                        <li><a href="<%=Page.ResolveUrl("~/logout.aspx")%>" class="ico-logout">
                            <%=GetLocaleResourceString("Account.Logout")%></a> </li>
                        <% if (this.ForumService.AllowPrivateMessages)
                           { %>
                        <li><a href="<%=Page.ResolveUrl("~/privatemessages.aspx")%>" class="ico-inbox">
                            <%=GetLocaleResourceString("PrivateMessages.Inbox")%></a>
                            <asp:Literal runat="server" ID="lUnreadPrivateMessages" />
                        </li>
                        <%} %>
                    </LoggedInTemplate>
                </asp:LoginView>
                <% if (this.SettingManager.GetSettingValueBoolean("Common.EnableShoppingCard"))
                   { %>
                <li><a href="<%= SEOHelper.GetShoppingCartUrl()%>" class="ico-cart">
                    <%=GetLocaleResourceString("Account.ShoppingCart")%>
                </a><a href="<%= SEOHelper.GetShoppingCartUrl()%>">(<%=this.ShoppingCartService.GetCurrentShoppingCart(ShoppingCartTypeEnum.ShoppingCart).TotalProducts%>)</a>
                </li>
                <%} %>
                <% if (this.SettingManager.GetSettingValueBoolean("Common.EnableWishlist"))
                   { %>
                <li><a href="<%= SEOHelper.GetWishlistUrl()%>" class="ico-wishlist">
                    <%=GetLocaleResourceString("Wishlist.Wishlist")%></a> <a href="<%= SEOHelper.GetWishlistUrl()%>">(<%=this.ShoppingCartService.GetCurrentShoppingCart(ShoppingCartTypeEnum.Wishlist).TotalProducts%>)</a></li>
                <%} %>
                <% if (NopContext.Current.User != null && NopContext.Current.User.IsAdmin)
                   { %>
                <li><a href="<%=Page.ResolveUrl("~/administration/")%>" class="ico-admin">
                    <%=GetLocaleResourceString("Account.Administration")%></a> </li>
                <%} %>
            </ul>
        </div>
    </div>
        
    
</div>
<div class="clear"></div>
<div class="header">
     
    <div class="header-logo">
        <a href="<%=CommonHelper.GetStoreLocation()%>" class="logo"><img src="/App_Themes/NBlue1.5/images/logo.jpg"> </a>
    </div>
	
	
    <%--<div class="gplusone"><g:plusone size="medium"></g:plusone></div>
    <div class="free-shiping">
        <a href="/topic/11/huong-dan-mua-hang-tai-jeans-style.aspx" class="free-shiping-logo"></a>
    </div>
     --%> 
    <div class="searchbox">
        <nopCommerce:SearchBox runat="server" ID="ctrlSearchBox">
        </nopCommerce:SearchBox>
    </div> 
    <div class="header-selectors-wrapper">        
        <div class="header-taxDisplayTypeSelector">
            <nopCommerce:TaxDisplayTypeSelector runat="server" ID="ctrlTaxDisplayTypeSelector">
            </nopCommerce:TaxDisplayTypeSelector>
        </div>
        <div class="header-currencyselector">
            <nopCommerce:CurrencySelector runat="server" ID="ctrlCurrencySelector"></nopCommerce:CurrencySelector>
        </div>
        <div class="header-languageselector">
            <nopCommerce:LanguageSelector runat="server" ID="ctrlLanguageSelector"></nopCommerce:LanguageSelector>
        </div>
    </div>
    
</div>
