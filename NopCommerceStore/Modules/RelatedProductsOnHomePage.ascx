<%@ Control Language="C#" AutoEventWireup="true" Inherits="NopSolutions.NopCommerce.Web.Modules.RelatedProductsOnHomePageControl"
    CodeBehind="RelatedProductsOnHomePage.ascx.cs" %>
<%@ Register TagPrefix="nopCommerce" TagName="ProductBoxRelatedProduct" Src="~/Modules/ProductBoxRelatedProduct.ascx" %>

<div class="recently-viewed-products-home">
    <div class="page-title">
        <h4><%=GetLocaleResourceString("Products.RelatedProductsOnHomePage")%></h4>
    </div>
    <div class="clear">
    </div>
    <div class="recently-product-grid">
        <ul id="flexiselDemo1">
            <asp:ListView ID="dlRelatedProducts" runat="server" >
                <ItemTemplate>
                    
                    <li>
                        <div class="item-box">
                            <nopCommerce:ProductBoxRelatedProduct ID="ctrlProductBox" Product='<%# Container.DataItem %>'
                                runat="server" />
                        </div>
                    </li>
                       
                </ItemTemplate>
            </asp:ListView>
        </ul>
        <%--<asp:DataList ID="dlRelatedProducts" runat="server" RepeatColumns="1" RepeatDirection="Horizontal"
            RepeatLayout="Table" OnItemDataBound="dlRelatedProducts_ItemDataBound" ItemStyle-CssClass="item-box">
            <ItemTemplate>
                <nopCommerce:ProductBoxRelatedProduct ID="ctrlProductBox" Product='<%# Container.DataItem %>'
                        runat="server" />
            </ItemTemplate>
        </asp:DataList>--%>
    </div>
</div>

<script type="text/javascript" src="../9bitStudios-flexisel-c787002/js/jquery.flexisel.js"></script>
<script>
    jQuery(window).load(function () {        
        jQuery("#flexiselDemo1").flexisel();
    });
</script>