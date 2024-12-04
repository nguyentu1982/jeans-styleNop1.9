<%@ Control Language="C#" AutoEventWireup="true" Inherits="NopSolutions.NopCommerce.Web.Modules.ProductsByTagControl"
    CodeBehind="ProductsByTag.ascx.cs" %>
<%@ Register TagPrefix="nopCommerce" TagName="ProductBox1" Src="~/Modules/ProductBox1.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="Topic" Src="~/Modules/Topic.ascx" %>

<div class="producttag-page">
    <div class="page-title">
        <h1><asp:Literal runat="server" ID="lTitle"></asp:Literal></h1>
    </div>
    <div class="tag-description">
        <asp:Literal runat="server" ID="lDescription"></asp:Literal>
    </div>
    <div class="clear">
    </div>
   <nopCommerce:Topic ID="StoreInfo" runat="server" TopicName="StoreInfo" OverrideSEO="false"></nopCommerce:Topic>
<div class="clear">
            </div>
    <div class="product-grid">
        <asp:ListView ID="dlProducts" runat="server">
            <ItemTemplate>
                <div class="item-box">
                    <nopCommerce:ProductBox1 ID="ctrlProductBox" Product='<%# Container.DataItem %>'
                    runat="server" />
                </div>
                
            </ItemTemplate>
        </asp:ListView>
    </div>
    <div class="clear"></div>
    <div class="product-pager">
        <nopCommerce:Pager runat="server" ID="productsPager" FirstButtonText="<% $NopResources:Pager.First %>"
            LastButtonText="<% $NopResources:Pager.Last %>" NextButtonText="<% $NopResources:Pager.Next %>"
            PreviousButtonText="<% $NopResources:Pager.Previous %>" CurrentPageText="Pager.CurrentPage" />
    </div>
<nopCommerce:Topic ID="StoreInfo2" runat="server" TopicName="StoreInfo" OverrideSEO="false"></nopCommerce:Topic>
<div class="clear">
            </div>
</div>
