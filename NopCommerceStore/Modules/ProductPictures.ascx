<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProductPictures.ascx.cs" Inherits="NopSolutions.NopCommerce.Web.Modules.ProductPictures" %>

<asp:Label runat="server" ID="lProductPictureDescription" CssClass="product-image-caption"></asp:Label>
<br/>
<asp:HyperLink ID="linkProductPictureURL" runat="server" class='fresco'
         data-fresco-group='example'>
      <asp:Image runat="server" ID="iProductPicuture" Width="100%"/>
</asp:HyperLink>


