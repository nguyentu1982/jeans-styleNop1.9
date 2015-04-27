<%@ Control Language="C#" AutoEventWireup="true" Inherits="NopSolutions.NopCommerce.Web.Modules.ProductCategoryBreadcrumb"
    CodeBehind="ProductCategoryBreadcrumb.ascx.cs" %>
<div class="breadcrumb">
    <div itemscope itemtype="http://data-vocabulary.org/Breadcrumb" >
        <a itemprop="url" href='<%=CommonHelper.GetStoreLocation()%>' title='<%=GetLocaleResourceString("Breadcrumb.Top")%>'>
            <span itemprop="title"> <%=GetLocaleResourceString("Breadcrumb.Top")%></span></a> <span> > </span>
        <asp:Repeater ID="rptrCategoryBreadcrumb" runat="server">               
            <ItemTemplate>
                <div itemscope itemtype="http://data-vocabulary.org/Breadcrumb" itemprop="child">
                <a itemprop="url" href='<%#SEOHelper.GetCategoryUrl(Convert.ToInt32(Eval("CategoryId"))) %>' title='<%#Server.HtmlEncode(Eval("LocalizedName").ToString())%>'>
                   <span itemprop="title"> <%#Server.HtmlEncode(Eval("LocalizedName").ToString())%></span> </a>
             
            </ItemTemplate>
            <SeparatorTemplate>
                <span> > </span>
            </SeparatorTemplate>
            <FooterTemplate>
               <span> > </span>
            </FooterTemplate>
        </asp:Repeater>
        
        
        <div itemscope itemtype="http://data-vocabulary.org/Breadcrumb" itemprop="child">
        <asp:HyperLink itemprop="url" runat="server" ID="hlProduct">
            <asp:Label ID="hlProductName" itemprop="title" runat="server"></asp:Label>
        </asp:HyperLink>
            <% for (int i=0; i<rptrCategoryBreadcrumb.Items.Count; i++ )
            {
                Response.Write("</div>");
            }
                
            %>
        </div>
    </div>
    
</div>
