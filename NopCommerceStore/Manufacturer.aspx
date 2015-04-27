<%@ Page Language="C#" MasterPageFile="~/MasterPages/TwoColumn.master" AutoEventWireup="true"
    Inherits="NopSolutions.NopCommerce.Web.ManufacturerPage" CodeBehind="Manufacturer.aspx.cs"
     %>

<%@ Register TagPrefix="nopCommerce" TagName="HomePageCategories" Src="~/Modules/HomePageCategories.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cph1" runat="Server">
     <nopCommerce:HomePageCategories ID="ctrlHomePageCategories" runat="server" />
    <asp:PlaceHolder runat="server" ID="ManufacturerPlaceHolder"></asp:PlaceHolder>
     <nopCommerce:HomePageCategories ID="HomePageCategories1" runat="server" />
</asp:Content>
