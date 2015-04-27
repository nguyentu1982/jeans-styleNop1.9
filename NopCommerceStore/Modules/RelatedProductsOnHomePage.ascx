<%@ Control Language="C#" AutoEventWireup="true" Inherits="NopSolutions.NopCommerce.Web.Modules.RelatedProductsOnHomePageControl"
    CodeBehind="RelatedProductsOnHomePage.ascx.cs" %>
<%@ Register TagPrefix="nopCommerce" TagName="ProductBoxRelatedProduct" Src="~/Modules/ProductBoxRelatedProduct.ascx" %>

<div class="related-products-grid">
    <div class="title">
        <%=GetLocaleResourceString("Products.RelatedProductsOnHomePage")%>
    </div>
    <div class="clear">
    </div>
    <div class="related-product-grid">
        <ul id="flexiselDemo1">
            <asp:Repeater ID="dlRelatedProducts" runat="server">
                <ItemTemplate>
                    <li>
                        <div class="item-box">
                            <nopCommerce:ProductBoxRelatedProduct ID="ctrlProductBox" Product='<%# Container.DataItem %>'
                                runat="server" />
                        </div>
                    </li>
                </ItemTemplate>
            </asp:Repeater>
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
<script type="text/javascript">

    $(window).load(function () {
        $("#flexiselDemo1").flexisel();
    })
</script>
