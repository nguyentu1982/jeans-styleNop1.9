<%@ Control Language="C#" AutoEventWireup="true" Inherits="NopSolutions.NopCommerce.Web.Modules.SearchControl"
    CodeBehind="Search.ascx.cs" %>
<%@ Register TagPrefix="nopCommerce" TagName="ProductBox1" Src="~/Modules/ProductBox1.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="NumericTextBox" Src="~/Modules/NumericTextBox.ascx" %>

<script type="text/javascript">
    $(document).ready(function() {
        toggleAdvancedSearch();
    });
    
    function toggleAdvancedSearch() {
        if (getE('<%=cbAdvancedSearch.ClientID %>').checked) {
            $('#<%=pnlAdvancedSearch.ClientID %>').show();
        }
        else {
            $('#<%=pnlAdvancedSearch.ClientID %>').hide();
        }
    }

</script>

<div class="search-panel">
    <div class="page-title">
        <h1>
            <%=GetLocaleResourceString("Search.Search")%></h1>
    </div>
    <div class="clear">
    </div>
    <div class="search-input">
        <table class="basic-search">
            <tbody>
                <tr>
                    <td class="title">
                        <%=GetLocaleResourceString("Search.SearchKeyword")%>
                    </td>
                    <td class="data">
                        <asp:TextBox runat="server" ID="txtSearchTerm" Width="100%" SkinID="SearchText"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="title" colspan="2">
                        <asp:CheckBox runat="server" ID="cbAdvancedSearch" Text="<% $NopResources:Search.AdvancedSearch %>" />
                    </td>
                </tr>
            </tbody>
        </table>

        <table class="adv-search" runat="server" id="pnlAdvancedSearch">
            <tbody>
                <tr runat="server" id="trCategories">
                    <td class="title">
                        <%=GetLocaleResourceString("Search.Categories")%>
                    </td>
                    <td class="data">
                        <asp:DropDownList runat="server" ID="ddlCategories" style="width: 200px;">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr runat="server" id="trManufacturers">
                    <td class="title">
                        <%=GetLocaleResourceString("Search.Manufacturers")%>
                    </td>
                    <td class="data">
                        <asp:DropDownList ID="ddlManufacturers" runat="server" style="width: 200px;">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="title">
                        <%=GetLocaleResourceString("Search.PriceRange")%>
                    </td>
                    <td class="data">
                        <%=GetLocaleResourceString("Search.From")%>
                        <asp:TextBox runat="server" ID="txtPriceFrom" Width="100" />
                        <%=GetLocaleResourceString("Search.To")%>
                        <asp:TextBox runat="server" ID="txtPriceTo" Width="100" />
                    </td>
                </tr>
                <tr>
                    <td class="title" colspan="2">
                        <asp:CheckBox runat="server" ID="cbSearchInProductDescriptions" Text="<% $NopResources:Search.SearchInProductDescriptions %>" />
                    </td>
                </tr>
            </tbody>
        </table>

        <asp:Button runat="server" ID="btnSearch" OnClick="btnSearch_Click" Text="<% $NopResources:Search.SearchButton %>"
                            CssClass="searchbutton" />
        <u>
            <asp:Label runat="server" ID="lblError" EnableViewState="false"></asp:Label>
        </u>

    </div>
    <div class="clear">
    </div>
    <div class="search-results">
        <asp:Label runat="server" ID="lblNoResults" Text="<% $NopResources:Search.NoResultsText %>"
            Visible="false" CssClass="result" />
        <div class="product-grid">
            <asp:ListView ID="lvProducts" runat="server"  OnPagePropertiesChanging="lvProducts_OnPagePropertiesChanging"> <%--OnPagePropertiesChanging="lvProducts_OnPagePropertiesChanging"--%>
                <%--<LayoutTemplate>
                    <asp:PlaceHolder ID="itemPlaceholder" runat="server"></asp:PlaceHolder>
                </LayoutTemplate>--%>
                <ItemTemplate>
                <div class="item-box">
                        <nopCommerce:ProductBox1 ID="ctrlProductBox" Product='<%# Container.DataItem %>'
                            runat="server" />
                </div>
                </ItemTemplate>
            </asp:ListView>
        </div>        
    </div>
    <div class="clear"></div>
    <div class="pager" style="float:right;">
            <asp:DataPager ID="pagerProducts" runat="server" PagedControlID="lvProducts" PageSize="10">
                <Fields>
                    <asp:NextPreviousPagerField ShowNextPageButton="false" PreviousPageText="<% $NopResources:Search.Previous %>" />
                    <asp:NumericPagerField ButtonType="Link" Visible="true"  />
                    <asp:NextPreviousPagerField ShowPreviousPageButton="false" NextPageText="<% $NopResources:Search.Next %>" />
                    
                </Fields>
            </asp:DataPager>
        </div>
</div>
