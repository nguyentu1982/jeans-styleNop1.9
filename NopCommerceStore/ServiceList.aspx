<%@ Page Language="C#" MasterPageFile="~/MasterPages/ThreeColumn.master" AutoEventWireup="true"
    Inherits="NopSolutions.NopCommerce.Web.ServiceListPage" CodeBehind="ServiceList.aspx.cs"  %>

<%@ Register TagPrefix="nopCommerce" TagName="HomePageService" Src="~/Modules/HomePageService.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cph1" runat="Server">
    
    <nopCommerce:HomePageService ID="HomePageSerive1" runat="server" />
    
</asp:Content>