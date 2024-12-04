<%@ Page Language="C#" MasterPageFile="~/MasterPages/OneColumn.master" AutoEventWireup="true"
    Inherits="NopSolutions.NopCommerce.Web.ManufacturerPage" CodeBehind="Manufacturer.aspx.cs"
     %>

<%@ Register TagPrefix="nopCommerce" TagName="HomePageCategories" Src="~/Modules/HomePageCategories.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cph1" runat="Server">
     
    <asp:PlaceHolder runat="server" ID="ManufacturerPlaceHolder"></asp:PlaceHolder>
    
</asp:Content>
