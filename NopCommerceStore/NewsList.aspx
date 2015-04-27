<%@ Page Language="C#" MasterPageFile="~/MasterPages/ThreeColumn.master" AutoEventWireup="true"
    Inherits="NopSolutions.NopCommerce.Web.NewsPage" CodeBehind="News.aspx.cs"  %>

<%@ Register TagPrefix="nopCommerce" TagName="HomePageNews" Src="~/Modules/HomePageNews.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cph1" runat="Server">
    <nopCommerce:HomePageNews ID="ctrlHomePageNews" runat="server" />
</asp:Content>