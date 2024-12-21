<%@ Control Language="C#" AutoEventWireup="true" Inherits="NopSolutions.NopCommerce.Web.Templates.Categories.ProductsInGrid3"
    CodeBehind="ProductsInGrid3.ascx.cs" %>
<%@ Register TagPrefix="nopCommerce" TagName="ProductBoxRecentlyAddedProductOnHomepage" Src="~/Modules/ProductBoxRecentlyAddedProductOnHomepage.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="ProductBox1" Src="~/Modules/ProductBox1.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="PriceRangeFilter" Src="~/Modules/PriceRangeFilter.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="ProductSpecificationFilter3" Src="~/Modules/ProductSpecificationFilter3.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="ProductSpecificationFilter1" Src="~/Modules/ProductSpecificationFilter1.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="MiniShoppingCartBox" Src="~/Modules/MiniShoppingCartBox.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="CategoryNavigation" Src="~/Modules/CategoryNavigation.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="ManufacturerNavigation" Src="~/Modules/ManufacturerNavigation.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="LiveChatBlock" Src="~/Modules/LiveChatBlock.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="ContactInfoHotline" Src="~/Modules/ContactInfoHotline.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="ProductBoxRelatedProduct" Src="~/Modules/ProductBoxRelatedProduct.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="Topic" Src="~/Modules/Topic.ascx" %>


<div class="master-wrapper-center-2">
    <div class="master-wrapper-cph-2">
        <div class="category-page">
            <% if (this.SettingManager.GetSettingValueBoolean("Media.CategoryBreadcrumbEnabled"))
               { %>
            <div class="breadcrumb">
                <div itemscope itemtype="http://data-vocabulary.org/Breadcrumb">
                    <a itemprop="url" href='<%=CommonHelper.GetStoreLocation()%>' title='<%=GetLocaleResourceString("Breadcrumb.Top")%>'>
                        <span itemprop="title"><%=GetLocaleResourceString("Breadcrumb.Top")%> </span></a><span>> </span>
                    <asp:Repeater ID="rptrCategoryBreadcrumb" runat="server">
                        <ItemTemplate>
                            <div itemscope itemtype="http://data-vocabulary.org/Breadcrumb" itemprop="child">
                                <a itemprop="url" href='<%#SEOHelper.GetCategoryUrl(Convert.ToInt32(Eval("CategoryId"))) %>' title='<%#Server.HtmlEncode(Eval("LocalizedName").ToString())%>'>
                                    <span itemprop="title">
                                        <%#Server.HtmlEncode(Eval("LocalizedName").ToString())%>
                                    </span></a>
                        </ItemTemplate>
                        <SeparatorTemplate>
                            <span>> </span>
                        </SeparatorTemplate>
                    </asp:Repeater>
                </div>
                <% for (int i = 0; i < rptrCategoryBreadcrumb.Items.Count; i++)
                   {
                       Response.Write("</div>");
                   }
                
                %>
                <div class="share-button">
                    <!-- AddThis Button BEGIN -->
                    <div class="addthis_toolbox addthis_default_style">
                        <a class="addthis_button_google_plusone" <%="g:plusone:size"%>="medium"></a>
                        <a class="addthis_button_facebook_like" <%="fb:like:layout"%>="button_count"></a>
                        <%--<a class="addthis_button_tweet"></a>
		<a class="addthis_button_pinterest_pinit"></a>--%>
                        <a class="addthis_counter addthis_pill_style"></a>
                    </div>
                    <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=undefined"></script>
                    <!-- AddThis Button END -->
                </div>
                <nopCommerce:ProductSpecificationFilter1 ID="ProductSpecificationFilter1" runat="server" />

            </div>
            <% } %>
            <div class="category-description">
                <asp:Literal runat="server" ID="lDescription"></asp:Literal>
            </div>

            <div class="sub-category-grid">
                <asp:ListView ID="dlSubCategories" runat="server" OnItemDataBound="dlSubCategories_ItemDataBound" ItemStyle-CssClass="item-box" Visible="true">
                    <ItemTemplate>
                        <div class="sub-category-item">
                            <h2 class="category-title">
                                <asp:HyperLink ID="hlCategory" runat="server" />
                            </h2>
                            <%--<div class="picture">
                        <asp:HyperLink ID="hlImageLink" runat="server" />
                    </div>--%>
                        </div>
                    </ItemTemplate>
                </asp:ListView>
            </div>

            <asp:Panel runat="server" ID="pnlFeaturedProducts" class="">
                <div class="title">
                    <%=GetLocaleResourceString("Products.FeaturedProducts")%>
                </div>

                <div class="recently-product-grid">
                    <ul id="flexiselDemo1">
                        <asp:ListView ID="dlFeaturedProducts" runat="server">
                            <ItemTemplate>

                                <li>
                                    <div class="item-box">
                                        <nopCommerce:ProductBoxRelatedProduct ID="ctrlProductBox" Product='<%# Container.DataItem %>'
                                            runat="server" />
                                    </div>
                                </li>

                            </ItemTemplate>
                        </asp:ListView>
                    </ul>
                </div>

            </asp:Panel>
            <div class="clear">
            </div>

            <asp:Panel runat="server" ID="pnlSorting" CssClass="product-sorting">
                <%=GetLocaleResourceString("ProductSorting.SortBy")%>
                <asp:DropDownList ID="ddlSorting" runat="server" OnSelectedIndexChanged="ddlSorting_SelectedIndexChanged"
                    AutoPostBack="true" />
                <%=GetLocaleResourceString("ProductSorting.SortBySize")%>
                <asp:DropDownList ID="ddlFillteringBySize" runat="server" OnSelectedIndexChanged="ddlFillteringBySize_SelectedIndexChanged"
                    AutoPostBack="true" />
            </asp:Panel>
            <div class="clear">
            </div>

            <asp:Panel runat="server" ID="pnlFilters" CssClass="product-filters">

                <asp:Label runat="server" ID="lblProductFilterTitle" Visible="false">
                <%=GetLocaleResourceString("Products.FilterOptionsTitle")%>
                </asp:Label>


                <nopCommerce:PriceRangeFilter ID="ctrlPriceRangeFilter" runat="server" />

                <nopCommerce:ProductSpecificationFilter3 ID="ctrlProductSpecificationFilter" runat="server" />


            </asp:Panel>
            <div class="product-count">

                <asp:Literal runat="server" ID="litProductCount"></asp:Literal>
            </div>

            <div class="clear">
            </div>
	    <nopCommerce:Topic ID="StoreInfo" runat="server" TopicName="StoreInfo" OverrideSEO="false"></nopCommerce:Topic>
<div class="clear">
            </div>
            <div class="product-grid">

                <asp:ListView ID="dlProducts" runat="server">
                    <ItemTemplate>
                        <div class="item-box">
                            <nopCommerce:ProductBox1 ID="ctrlProductBox" Product='<%# Container.DataItem %>' runat="server" />
                        </div>

                    </ItemTemplate>
                </asp:ListView>
            </div>
            <div class="clear">
            </div>
            <div class="product-pager">
                <nopCommerce:Pager runat="server" ID="productsPager" FirstButtonText="<% $NopResources:Pager.First %>"
                    LastButtonText="<% $NopResources:Pager.Last %>" NextButtonText="<% $NopResources:Pager.Next %>"
                    PreviousButtonText="<% $NopResources:Pager.Previous %>" CurrentPageText="Pager.CurrentPage" ShowLast="True" ShowFirst="True" />

            </div>
	<nopCommerce:Topic ID="StoreInfo2" runat="server" TopicName="StoreInfo" OverrideSEO="false"></nopCommerce:Topic>
<div class="clear">
            </div>
            

        </div>
    </div>
</div>
<script type="text/javascript" src="/9bitStudios-flexisel-c787002/js/jquery.flexisel.js"></script>
<script>
    jQuery(window).load(function () {
        jQuery("#flexiselDemo1").flexisel();
    });
</script>
