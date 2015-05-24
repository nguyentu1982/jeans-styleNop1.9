<%@ Page Language="C#" MasterPageFile="~/MasterPages/OneColumn.master" AutoEventWireup="true"
    Inherits="NopSolutions.NopCommerce.Web.ContactUsPage" CodeBehind="ContactUs.aspx.cs"
     %>

<%@ Register TagPrefix="nopCommerce" TagName="ContactUs" Src="~/Modules/ContactUs.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cph1" runat="Server">
    <nopCommerce:ContactUs ID="ctrlContactUs" runat="server" />
</asp:Content>
