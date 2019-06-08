<%@ Page Title="" Language="C#" MasterPageFile="~/Administration/main.master" AutoEventWireup="true" CodeBehind="UpdateSize.aspx.cs" Inherits="NopSolutions.NopCommerce.Web.Administration.UpdateSize" %>
<%@ Register TagPrefix="nopCommerce" TagName="UpdateSize" Src="Modules/UpdateSize.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cph1" runat="server">
    <nopCommerce:UpdateSize runat="server" ID="ctrlUpdateSize" />
</asp:Content>
