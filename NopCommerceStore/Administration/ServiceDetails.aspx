<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/Administration/main.master"
    Inherits="NopSolutions.NopCommerce.Web.Administration.Administration_ServiceDetails"
    CodeBehind="ServiceDetails.aspx.cs" %>

<%@ Register TagPrefix="nopCommerce" TagName="ServiceDetails" Src="Modules/ServiceDetails.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cph1" runat="server">
    <nopCommerce:ServiceDetails runat="server" ID="ctrlServiceDetails" />
</asp:Content>