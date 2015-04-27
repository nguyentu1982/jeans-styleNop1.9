<%@ Page Language="C#" MasterPageFile="~/Administration/main.master" AutoEventWireup="true"
    Inherits="NopSolutions.NopCommerce.Web.Administration.Administration_Service" CodeBehind="Service.aspx.cs" %>

<%@ Register TagPrefix="nopCommerce" TagName="Service" Src="Modules/Service.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cph1" runat="server">
    <nopCommerce:Service runat="server" ID="ctrlService" />
</asp:Content>