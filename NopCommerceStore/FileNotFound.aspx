<%@ Page Language="C#" MasterPageFile="~/MasterPages/OneColumnHomePage.master" AutoEventWireup="true"
    Inherits="NopSolutions.NopCommerce.Web.FileNotFound" CodeBehind="FileNotFound.aspx.cs"
     %>

<%@ Register TagPrefix="nopCommerce" TagName="HomePagePoll" Src="~/Modules/HomePagePoll.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="HomePageNews" Src="~/Modules/HomePageNews.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="HomePageCategories" Src="~/Modules/HomePageCategories.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="HomePageProducts" Src="~/Modules/HomePageProducts.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="BestSellers" Src="~/Modules/BestSellers.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="Topic" Src="~/Modules/Topic.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="RecentlyAddedProductsOnHomepage" Src="~/Modules/RecentlyAddedProductsOnHomepage.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="RelatedProductsOnHomepage" Src="~/Modules/RelatedProductsOnHomepage.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="RecentlyViewedProducts" Src="~/Modules/RecentlyViewedProducts.ascx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="cph1" runat="Server">
   
     <div id="wrapper" style="text-align: center; padding: 100px; background-color: #c0c0c0;">

                            <h1>Trang bạn yêu cầu không tồn tại</h1>
                            <div style="margin-top: 20px; font-size: 20px;">
                                Xin lỗi, trang web bạn yêu cầu không tồn tại, đã bị xóa hoặc chuyển sang địa chỉ khác!
                            </div>

                        </div> 
    
    

    <div class="shops-holder">
        <div class="shop-men">
            <a href="<%=Page.ResolveUrl("~/danh-muc-jean/14/quan-jean-nam.aspx") %>"><img src="images/shop-men.jpg" alt="quan-jean-nam" width="326px" height="210px"></a>

        </div>
        <div class="shop-woman">
            <a href="<%=Page.ResolveUrl("~/danh-muc-jean/13/quan-jean-nu.aspx") %>"><img src="images/shop-woman.jpg" alt="quan-jean-nu" width="326px" height="210px"></a>

        </div>
        <div class="shop-sales">
            <a href="<%=Page.ResolveUrl("~/danh-muc-jean/33/quan-jean-nam-nu-gia-re-tai-ha-noi.aspx") %>"><img src="images/shop-sales.jpg" alt="quan-jean-gia-re" width="326px" height="210px"></a>

        </div>
    </div>
    <nopCommerce:Topic ID="topicHomePageText" runat="server" TopicName="HomePageText"
        OverrideSEO="false"></nopCommerce:Topic>
    <div class="clear">
    </div>
    <nopCommerce:HomePageCategories ID="ctrlHomePageCategories" runat="server" />
    <div class="clear">
    </div>
    <nopCommerce:HomePageProducts ID="ctrlHomePageProducts" runat="server" />
    <div class="clear">
    </div>
    <nopCommerce:BestSellers ID="ctrlBestSellers" runat="server" />
    <%--<div class="clear">
    </div>
     <nopCommerce:HomePageCategories ID="HomePageCategories1" runat="server" />--%>
    <nopCommerce:RecentlyViewedProducts ID="ctrlRecentlyViewedProducts" runat="server" />
    <div class="clear">
    </div>
    <nopCommerce:HomePageNews ID="ctrlHomePageNews" runat="server" />
    <div class="clear">
    </div>
    <nopCommerce:HomePagePoll ID="ctrlPolls" runat="server" />
    <div class="clear">
    </div>
    
</asp:Content>
