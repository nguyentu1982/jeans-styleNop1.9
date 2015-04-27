<%@ Page Language="C#" MasterPageFile="~/MasterPages/OneColumnHomePage.master" AutoEventWireup="true"
    Inherits="NopSolutions.NopCommerce.Web.Default" CodeBehind="Default.aspx.cs"
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
   
       <div id="wrapper">

                <div class="slider-wrapper theme-default">
                    <div id="slider" class="nivoSlider">
                        <a href="<%=Page.ResolveUrl("~/topic/11/huong-dan-mua-hang-tai-jeans-style.aspx") %>"><img src="nivo-slider/demo/images/toystory.jpg" data-thumb="nivo-slider/demo/images/toystory.jpg" alt="" /></a>
                        <img src="nivo-slider/demo/images/up.jpg" data-thumb="nivo-slider/demo/images/up.jpg" alt=""  />
                        <a href="<%=Page.ResolveUrl("~/topic/11/huong-dan-mua-hang-tai-jeans-style.aspx") %>"><img src="nivo-slider/demo/images/walle.jpg" data-thumb="nivo-slider/demo/images/walle.jpg" alt="" data-transition="slideInLeft" /></a>
                        <img src="nivo-slider/demo/images/nemo.jpg" data-thumb="nivo-slider/demo/images/nemo.jpg" alt="" />
                    </div>
                </div>

            </div>
         <script type="text/javascript" src="/Scripts/jquery-1.9.0.min.js"></script>        
        <script type="text/javascript" src="../nivo-slider/jquery.nivo.slider.js"></script>
        <script type="text/javascript">
            $(window).load(function () {
                $('#slider').nivoSlider(10);
            });
                </script>
       
    
    
    <nopCommerce:RelatedProductsOnHomepage runat="server" ID="ctrRelatedRecentlyViewProductsOnHomepage"/>
    <div class="clear"></div>
    <nopCommerce:RecentlyAddedProductsOnHomepage runat="server" ID="ctrRecentlyAddedProductsOnHomepage"/>
    

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
