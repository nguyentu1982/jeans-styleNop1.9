<%@ Control Language="C#" AutoEventWireup="true" Inherits="NopSolutions.NopCommerce.Web.Modules.ProductBox3Control"
    CodeBehind="ProductBox3.ascx.cs" %>
<%@ Register TagPrefix="nopCommerce" TagName="ProductPrice1" Src="~/Modules/ProductPrice1.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="ProductPrice2" Src="~/Modules/ProductPrice2.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="ProductAttributes1" Src="~/Modules/ProductAttributes1.ascx" %>
<div class="product-item">
    <h2 class="product-title">
        <asp:HyperLink ID="hlProduct" runat="server" />
    </h2>
    <div class="picture">
        <asp:HyperLink ID="hlImageLink" runat="server" />
    </div>
    <div class="description">
        <asp:Literal runat="server" ID="lShortDescription"></asp:Literal>
        
    </div>    
    
    <asp:Panel ID="pnlStockAvailablity" runat="server" class="stock">
                    <asp:Label ID="lblStockAvailablity" runat="server" />
                </asp:Panel>

    <div class="attributes">            
        <nopCommerce:ProductAttributes1 ID="ctrlProductAttributes1" runat="server"/>
    </div>
        
    <div class="shipping-info">
    <div ID="divFreeShiping" runat="server" class="freeShipping" visible="false">
        <a href="http://quanjeandep.com/topic/11/huong-dan-mua-hang-tai-jeans-style.aspx" target="_blank"><%=GetLocaleResourceString("FreeShipping.Description")%></a>
    </div>
    </div>
       
    <div class="add-info">
        <div class="prices">
            <nopCommerce:ProductPrice1 ID="ctrlProductPrice1" runat="server" ProductID='<%#Eval("ProductId") %>'/>
            <nopCommerce:ProductPrice2 ID="ctrlProductPrice" runat="server" ProductID='<%#Eval("ProductId") %>' />
            
        </div>
    </div>
</div>
