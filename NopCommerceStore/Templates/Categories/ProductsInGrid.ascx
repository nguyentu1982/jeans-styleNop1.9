<%@ Control Language="C#" AutoEventWireup="true" Inherits="NopSolutions.NopCommerce.Web.Templates.Categories.ProductsInGrid"
    CodeBehind="ProductsInGrid.ascx.cs" %>
<%@ Register TagPrefix="nopCommerce" TagName="ProductBoxRecentlyAddedProductOnHomepage" Src="~/Modules/ProductBoxRecentlyAddedProductOnHomepage.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="ProductBox1" Src="~/Modules/ProductBox1.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="PriceRangeFilter" Src="~/Modules/PriceRangeFilter.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="ProductSpecificationFilter" Src="~/Modules/ProductSpecificationFilter.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="ProductSpecificationFilter1" Src="~/Modules/ProductSpecificationFilter1.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="MiniShoppingCartBox" Src="~/Modules/MiniShoppingCartBox.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="CategoryNavigation" Src="~/Modules/CategoryNavigation.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="ManufacturerNavigation" Src="~/Modules/ManufacturerNavigation.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="LiveChatBlock" Src="~/Modules/LiveChatBlock.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="ContactInfoHotline" Src="~/Modules/ContactInfoHotline.ascx" %>

<div class="master-wrapper-leftside-2">

    <nopCommerce:LiveChatBlock ID="ctrlLiveChatBlock" runat="server" />
    <div class="clear">
    </div>

    <nopCommerce:MiniShoppingCartBox ID="ctrlMiniShoppingCartBox" runat="server" />
    <div class="clear">
    </div>
    <nopCommerce:CategoryNavigation ID="ctrlCategoryNavigation" runat="server" />
    <div class="clear">
    </div>
    <%--<nopCommerce:ManufacturerNavigation ID="ctrlManufacturerNavigation" runat="server" />
    <div class="clear">--%>
   
    <asp:Panel runat="server" ID="pnlFilters" CssClass="block product-filters">
        <div class="filter-title">
            <asp:Label runat="server" ID="lblProductFilterTitle">
                <%=GetLocaleResourceString("Products.FilterOptionsTitle")%>
            </asp:Label>
        </div>
        <div class="filter-item">
            <nopCommerce:PriceRangeFilter ID="ctrlPriceRangeFilter" runat="server" />
        </div>
        <div class="filter-item">
            <nopCommerce:ProductSpecificationFilter ID="ctrlProductSpecificationFilter" runat="server" />
        </div>

    </asp:Panel>
    <div class="clear">
    </div>
    <nopCommerce:ContactInfoHotline ID="ctrlContactInfoHotline" runat="server" />
    <div class="clear">
    </div>

    <div class="block">
        <img src="/images/image/mien-phi-sua-quan-jean.jpg" alt="Miễn phí sửa quần jean bán tại Jeans Style 55 Đội Cấn" width="184px" />
    </div>
    <%--<nopCommerce:InfoBlock ID="ctrlInfoBlock" runat="server" />
            <div class="clear">
            </div> --%>



    <div class="block">
        <div class="title">CHẤP NHẬN THANH TOÁN</div>

        <div class="payment-availabe">
            <a target="_blank" href="http://help.nganluong.vn/quanjeandep.com.html" title="Hướng dẫn thanh toán qua NgânLượng.vn" rel="nofollow">

                <img src="https://www.nganluong.vn/data/images/merchant/logo/accepted-payment-help-yellow.png" border="0" />
            </a>
            <p></p>

            <a href=" https://www.baokim.vn/payment_guide/ quanjeandepcom.html" target="_blank" rel="nofollow">
                <img src="https://www.baokim.vn/application/uploads/integrate/baokim_integrate_5.jpg" alt="thanh toán qua Bảo Kim" width="152" border="0" />
            </a>

        </div>
    </div>
    <div class="clear">
    </div>

    <%--<nopCommerce:HomePageNewsOnLefOrRightColumnControl ID="ctrHomePageNewsOnLefOrRightColumnControl" runat="server" />--%>
</div>
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
                <asp:Literal runat="server" ID="litProductCount"></asp:Literal>
            </div>
            <% } %>
            <div class="category-description">
                <asp:Literal runat="server" ID="lDescription"></asp:Literal>
            </div>
            <div class="clear">
            </div>
            <div class="sub-category-grid">
                <asp:DataList ID="dlSubCategories" runat="server" RepeatColumns="3" RepeatDirection="Horizontal"
                    RepeatLayout="Table" OnItemDataBound="dlSubCategories_ItemDataBound" ItemStyle-CssClass="item-box" Visible="true">
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
                </asp:DataList>
            </div>

            <asp:Panel runat="server" ID="pnlFeaturedProducts" class="featured-product-grid">
                <div class="title">
                    <%=GetLocaleResourceString("Products.FeaturedProducts")%>
                </div>
                <div>
                    <asp:DataList ID="dlFeaturedProducts" runat="server" RepeatColumns="5" RepeatDirection="Horizontal"
                        RepeatLayout="Table" ItemStyle-CssClass="item-box">
                        <ItemTemplate>
                            <nopCommerce:ProductBoxRecentlyAddedProductOnHomepage ID="ctrlProductBox" Product='<%# Container.DataItem %>'
                                runat="server" />
                        </ItemTemplate>
                    </asp:DataList>
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



            <div class="product-pager">
                <nopCommerce:Pager runat="server" ID="productsPagerTop" FirstButtonText="<% $NopResources:Pager.First %>"
                    LastButtonText="<% $NopResources:Pager.Last %>" NextButtonText="<% $NopResources:Pager.Next %>"
                    PreviousButtonText="<% $NopResources:Pager.Previous %>" CurrentPageText="Pager.CurrentPage" ShowFirst="True" ShowLast="True" />
            </div>
            <div class="clear">
            </div>

            <div class="product-grid">
                <asp:DataList ID="dlProducts" runat="server" RepeatColumns="4" RepeatDirection="Horizontal"
                    RepeatLayout="Table" ItemStyle-CssClass="item-box">
                    <ItemTemplate>
                        <nopCommerce:ProductBox1 ID="ctrlProductBox" Product='<%# Container.DataItem %>'
                            runat="server" />
                    </ItemTemplate>
                </asp:DataList>
            </div>
            <div class="clear">
            </div>
            <div class="product-pager">
                <nopCommerce:Pager runat="server" ID="productsPager" FirstButtonText="<% $NopResources:Pager.First %>"
                    LastButtonText="<% $NopResources:Pager.Last %>" NextButtonText="<% $NopResources:Pager.Next %>"
                    PreviousButtonText="<% $NopResources:Pager.Previous %>" CurrentPageText="Pager.CurrentPage" ShowLast="True" ShowFirst="True" />

            </div>
        </div>
    </div>
</div>
