<%@ Page Language="C#" MasterPageFile="~/MasterPages/ThreeColumn.master" AutoEventWireup="true"
    Inherits="NopSolutions.NopCommerce.Web.ServicePage" CodeBehind="Service.aspx.cs"  %>

<%@ Register TagPrefix="nopCommerce" TagName="ServiceItem" Src="~/Modules/ServiceItem.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cph1" runat="Server">
    <nopCommerce:ServiceItem ID="ctrlServiceItem" runat="server" />
</asp:Content>
