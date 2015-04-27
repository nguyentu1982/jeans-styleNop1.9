<%@ Control Language="C#" AutoEventWireup="true" Inherits="NopSolutions.NopCommerce.Web.Modules.ProductSpecificationFilterControl3"
    CodeBehind="ProductSpecificationFilter3.ascx.cs" %>
<div class="product-spec-filter3">     
    <asp:Panel runat="server" ID="pnlPSOSelector" CssClass="select-filter">       
        <asp:Repeater ID="rptFilterByPSO" runat="server" OnItemDataBound="rptFilterByPSO_OnItemDataBound">           
            <ItemTemplate>                     
                    <%#addSpecificationAttribute()%>                                                  
            </ItemTemplate>            
        </asp:Repeater>              
    </asp:Panel>  
    <asp:Panel runat="server" ID="pnlRemoveFilter" CssClass="remove-filter">
        <asp:HyperLink ID="hlRemoveFilter" runat="server" CssClass="remove-product-spec-filter">
            <%=GetLocaleResourceString("Common.SpecificationFilterRemove")%>
        </asp:HyperLink>
    </asp:Panel> 
</div>
