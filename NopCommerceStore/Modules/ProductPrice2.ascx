<%@ Control Language="C#" AutoEventWireup="true" Inherits="NopSolutions.NopCommerce.Web.Modules.ProductPrice2Control"
    CodeBehind="ProductPrice2.ascx.cs" %>
<asp:Label ID="lblOldPrice" runat="server" CssClass="oldproductPrice" /> 
<% if (lblOldPrice.Text != string.Empty)
{ %>
	
<% } %>
<asp:Label ID="lblPrice" runat="server" CssClass="productPrice" />