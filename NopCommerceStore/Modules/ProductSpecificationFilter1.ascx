<%@ Control Language="C#" AutoEventWireup="true" Inherits="NopSolutions.NopCommerce.Web.Modules.ProductSpecificationFilterControl1"
    CodeBehind="ProductSpecificationFilter1.ascx.cs" %>
<div class="product-spec-filter">
    <asp:Panel runat="server" ID="pnlAlreadyFilteredPSO">

        <asp:Repeater ID="rptAlreadyFilteredPSO" runat="server" OnItemDataBound="rptAlreadyFilteredPSO_OnItemDataBound">
            <HeaderTemplate>
                >
            </HeaderTemplate>
            <ItemTemplate>
                <%#Server.HtmlEncode(Eval("SpecificationAttributeName").ToString())%>:                                
                            <%#Server.HtmlEncode(Eval("SpecificationAttributeOptionName").ToString())%>
            </ItemTemplate>
            <SeparatorTemplate>
                ,
            </SeparatorTemplate>
        </asp:Repeater>

    </asp:Panel>
    <asp:Panel runat="server" ID="pnlRemoveFilter" CssClass="remove-filter">
        <asp:HyperLink ID="hlRemoveFilter" runat="server" CssClass="remove-product-spec-filter">
            <%=GetLocaleResourceString("Common.SpecificationFilterRemove")%>
        </asp:HyperLink>
    </asp:Panel>
</div>
