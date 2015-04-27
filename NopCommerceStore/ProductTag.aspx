<%@ Page Language="C#" MasterPageFile="~/MasterPages/OneColumn.master" AutoEventWireup="true"
    Inherits="NopSolutions.NopCommerce.Web.ProductTagPage" CodeBehind="ProductTag.aspx.cs"
     %>

<%@ Register TagPrefix="nopCommerce" TagName="ProductsByTag" Src="~/Modules/ProductsByTag.ascx" %>
<%--<%@ Register TagPrefix="nopCommerce" TagName="HomePageCategories" Src="~/Modules/HomePageCategories.ascx" %>--%>


<asp:Content ID="Content1" ContentPlaceHolderID="cph1" runat="Server">
    <%--<nopCommerce:HomePageCategories ID="ctrlHomePageCategories" runat="server" />--%>
    <nopCommerce:ProductsByTag ID="ctrlProductsByTag" runat="server" />
    <%--<nopCommerce:HomePageCategories ID="HomePageCategories1" runat="server" />--%>
</asp:Content>
