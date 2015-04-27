<%@ Page Language="C#" MasterPageFile="~/Administration/main.master" AutoEventWireup="true" CodeBehind="ProductTagDetails.aspx.cs" Inherits="NopSolutions.NopCommerce.Web.Administration.ProductTagDetails" %>
<%@ Register TagPrefix="nopCommerce" TagName="ProductTagDetails" Src="Modules/ProductTagDetails.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cph1" runat="server">
    <nopCommerce:ProductTagDetails runat="server" ID="ctrlProductTagDetails" />
</asp:Content>
