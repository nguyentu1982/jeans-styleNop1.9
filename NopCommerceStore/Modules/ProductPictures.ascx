<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProductPictures.ascx.cs" Inherits="NopSolutions.NopCommerce.Web.Modules.ProductPictures" %>
<asp:HyperLink ID="linkProductPictureURL" runat="server" class='fresco'
         data-fresco-group='example'>
      <asp:Image runat="server" ID="iProductPicuture" />
</asp:HyperLink>
<br/>
<asp:Label runat="server" ID="lProductPictureDescription" CssClass="product-image-caption"></asp:Label>
