<%@ Control Language="C#" AutoEventWireup="true" Inherits="NopSolutions.NopCommerce.Web.Modules.HomePageCategories"
    CodeBehind="HomePageCategories.ascx.cs" %>
<%@ Register TagPrefix="nopCommerce" TagName="ProductsInGrid2" Src="~/Templates/Categories/ProductsInGrid2.ascx" %>
<div class="home-page-category-grid">
    <asp:DataList ID="dlCategories" runat="server" RepeatColumns="1" RepeatDirection="Horizontal" 
        RepeatLayout="Table" OnItemDataBound="dlCategories_ItemDataBound" ItemStyle-CssClass="item-box-cate" EnableViewState="false">
        <ItemTemplate>
            <div class="category-item">
                <h2 class="title">
                    <asp:HyperLink ID="hlCategory" runat="server" Text='<%#Server.HtmlEncode(Eval("LocalizedName").ToString()) + " " + GetLocaleResourceString("NewArivalText") %>' />
                    </h2>
               <%-- <div class="picture">
                    <asp:HyperLink ID="hlImageLink" runat="server" />
                </div>--%>
            </div>
                <nopCommerce:ProductsInGrid2 runat="server" ID="ProductInGrid" />     
                
        </ItemTemplate>
    </asp:DataList>
</div>
