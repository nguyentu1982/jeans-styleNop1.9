<%@ Page Language="C#" MasterPageFile="~/Administration/main.master" AutoEventWireup="true"
    CodeBehind="ServiceHome.aspx.cs" Inherits="NopSolutions.NopCommerce.Web.Administration.ServiceHome" %>

<%@ Register Src="Modules/ServiceHome.ascx" TagName="ServiceHome" TagPrefix="nopCommerce" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="cph1">
    <nopCommerce:ServiceHome ID="ctrlServiceHome" runat="server" />
</asp:Content>
