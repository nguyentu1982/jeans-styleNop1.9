<%@ Control Language="C#" AutoEventWireup="true" Inherits="NopSolutions.NopCommerce.Web.Modules.SearchBoxControl"
    CodeBehind="SearchBox.ascx.cs" %>
<ul>
    <%--<li>
        <span class="search-guide-text"><%=GetLocaleResourceString("Search.GuideText") %></span>
    </li>--%>
    <li>
        <asp:TextBox ID="txtSearchTerms" runat="server" SkinID="SearchBoxText" Text="<% $NopResources:Search.SearchStoreTooltip %>"/>&nbsp;
    </li>
    <li>
        <asp:Button runat="server" ID="btnSearch" OnClick="btnSearch_Click" 
            CssClass="searchboxbutton" CausesValidation="false" />
    </li>
    <%--<li>
        <span class="advance-search-guide-text"><%=GetLocaleResourceString("Search.AdvanceGuideText") %></span>
    </li>--%>
</ul>
