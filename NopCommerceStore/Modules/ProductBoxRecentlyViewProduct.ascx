<%@ Control Language="C#" AutoEventWireup="true" Inherits="NopSolutions.NopCommerce.Web.Modules.ProductBoxRecentlyViewProductControl"
    CodeBehind="ProductBoxRecentlyViewProduct.ascx.cs" %>
<%@ Register TagPrefix="nopCommerce" TagName="ProductPrice1" Src="~/Modules/ProductPrice1.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="ProductPrice2" Src="~/Modules/ProductPrice2.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="ProductAttributes1" Src="~/Modules/ProductAttributes1.ascx" %>
<div class="recentlyproduct-item">
    <div class="picture">
        <asp:HyperLink ID="hlImageLink" runat="server" />
    </div>
    <div class="product-title">
        <asp:HyperLink ID="hlProduct" runat="server" />
    </div>
    
    <div class="description">
        <asp:Literal runat="server" ID="lShortDescription" Visible="false"></asp:Literal>
        
    </div>    
    
    <asp:Panel ID="pnlStockAvailablity" runat="server" class="stock">
                    <asp:Label ID="lblStockAvailablity" runat="server" />
                </asp:Panel>
        
    
       
    <div class="add-info">
        <div class="prices">
            <nopCommerce:ProductPrice1 ID="ctrlProductPrice1" runat="server" ProductID='<%#Eval("ProductId") %>'/>
            <nopCommerce:ProductPrice2 ID="ctrlProductPrice" runat="server" ProductID='<%#Eval("ProductId") %>' />
            
        </div>        

        
    </div>
</div>
