<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/Administration/main.master"
    Inherits="NopSolutions.NopCommerce.Web.Administration.Administration_ServiceAdd"
    CodeBehind="ServiceAdd.aspx.cs" %>

<%@ Register TagPrefix="nopCommerce" TagName="ServiceAdd" Src="Modules/ServiceAdd.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cph1" runat="server">
    <nopCommerce:ServiceAdd runat="server" ID="ctrlServiceAdd" />
</asp:Content>
