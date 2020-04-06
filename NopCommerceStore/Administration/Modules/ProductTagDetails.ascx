<%@ Control Language="C#" AutoEventWireup="true" Inherits="NopSolutions.NopCommerce.Web.Administration.Modules.ProductTagDetailsControl"
    CodeBehind="ProductTagDetails.ascx.cs" %>
<%@ Register TagPrefix="nopCommerce" TagName="ProductTagInfo" Src="ProductTagInfo.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="ProductTagSeo" Src="ProductTagSeo.ascx" %>
<%@ Register TagPrefix="nopCommerce" TagName="TagsProduct" Src="TagsProduct.ascx" %>

<asp:TextBox runat="server" ID="txtProductTagName" CssClass="adminInput" Width="500px"> </asp:TextBox>
<ajaxToolkit:TabContainer runat="server" ID="ProductTagTabs" ActiveTabIndex="3">
    <ajaxToolkit:TabPanel runat="server" ID="pnlProductTagInfo" HeaderText="<% $NopResources: Admin.ProductTagDetails.ProductTagDetailsInfo%>">
        <ContentTemplate>
            <nopCommerce:ProductTagInfo ID="ctrlProductTagInfo" runat="server" />
        </ContentTemplate>
    </ajaxToolkit:TabPanel>
    <ajaxToolkit:TabPanel runat="server" ID="pnlProductTagSeo" HeaderText="<% $NopResources: Admin.ProductTagDetails.ProductTagSeo%>">
        <ContentTemplate>
            <nopCommerce:ProductTagSeo ID="ctrProductTagSeo" runat="server" />
        </ContentTemplate>
    </ajaxToolkit:TabPanel>

    <ajaxToolkit:TabPanel ID="pnlTagsProduct" runat="server" HeaderText="<% $NopResources: Admin.ProductTagDetails.TagsProduct%>">
       <ContentTemplate>
            <nopCommerce:TagsProduct ID="ctrTagsProduct" runat="server" />
        </ContentTemplate>
    </ajaxToolkit:TabPanel>

</ajaxToolkit:TabContainer>
<p></p>
<asp:Button ID="buttonSave" runat="server" Text="SAVE" class="adminButtonBlue" OnClick="buttonSave_Click"/>
