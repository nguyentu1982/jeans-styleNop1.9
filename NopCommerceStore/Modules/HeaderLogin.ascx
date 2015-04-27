<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="HeaderLogin.ascx.cs" Inherits="NopSolutions.NopCommerce.Web.Modules.HeaderLogin" %>

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
                    <%=GetLocaleResourceString("Wishlist.Wishlist")%></a> <a href="<%= SEOHelper.GetWishlistUrl()%>">
                        (<%=this.ShoppingCartService.GetCurrentShoppingCart(ShoppingCartTypeEnum.Wishlist).TotalProducts%>)</a></li>
                <%} %>
                <% if (NopContext.Current.User != null && NopContext.Current.User.IsAdmin)
                   { %>
                <li><a href="<%=Page.ResolveUrl("~/administration/")%>" class="ico-admin">
                    <%=GetLocaleResourceString("Account.Administration")%></a> </li>
                <%} %>
            </ul>
        </div>