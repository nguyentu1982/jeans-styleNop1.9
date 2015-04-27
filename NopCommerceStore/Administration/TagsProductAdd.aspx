<%@ Page Language="C#" MasterPageFile="~/Administration/popup.master" AutoEventWireup="true"
    Inherits="NopSolutions.NopCommerce.Web.Administration.Administration_TagsProductAdd"
    CodeBehind="TagsProductAdd.aspx.cs" %>

<%@ Register TagPrefix="nopCommerce" TagName="TagsProductAdd" Src="Modules/TagsProductAdd.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cph1" runat="server">
    <nopCommerce:TagsProductAdd runat="server" ID="ctrlTagsProductAdd" />
</asp:Content>
