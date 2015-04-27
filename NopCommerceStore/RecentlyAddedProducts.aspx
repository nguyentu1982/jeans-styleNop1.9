<%@ Page Language="C#" MasterPageFile="~/MasterPages/OneColumnHomepage.master" AutoEventWireup="true"
    Inherits="NopSolutions.NopCommerce.Web.RecentlyAddedProductsPage" CodeBehind="RecentlyAddedProducts.aspx.cs"
     %>

<%@ Register TagPrefix="nopCommerce" TagName="RecentlyAddedProducts" Src="~/Modules/RecentlyAddedProducts.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cph1" runat="Server">
    <a href="<%=Page.ResolveUrl("~/topic/11/huong-dan-mua-hang-tai-jeans-style.aspx") %>" target="_blank">
        <img src="<%=Page.ResolveUrl("~/nivo-slider/demo/images/toystory.jpg")%>" width="100%" alt="Các mẫu quần jean mới nhất"/>
    </a>
    <nopCommerce:RecentlyAddedProducts ID="ctrlRecentlyAddedProducts" runat="server" />
</asp:Content>
