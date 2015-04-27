<%@ Control Language="C#" AutoEventWireup="true" Inherits="NopSolutions.NopCommerce.Web.Modules.ServiceItemControl"
    CodeBehind="ServiceItem.ascx.cs" %>
<%--<%@ Register TagPrefix="nopCommerce" TagName="ServiceComment" Src="~/Modules/ServiceComment.ascx" %>--%>
<div class="serviceitem">
    <div class="page-title">
        <h1><asp:Literal runat="server" ID="lTitle" EnableViewState="false"></asp:Literal></h1>
    </div>
    <div class="clear">
    </div>
    <div>
    <%--<div class="servicedate">
        <asp:Literal runat="server" ID="lCreatedOn" EnableViewState="false" Visible="false"></asp:Literal>

    </div>--%>
    
        <asp:Image runat="server" ID="lImage" EnableViewState="false" class="serviceimage"/>
    
    
    <div class="servicebody">
        <asp:Literal runat="server" ID="lFull" EnableViewState="false"></asp:Literal>
    </div>
    </div>
    
    <div id="pnlComments" runat="server" class="newscomments">
        <div class="title">
            <%=GetLocaleResourceString("Service.Comments")%>
        </div>
        <div class="clear">
        </div>
        <div class="newcomment">
            <table>
                <tr>
                    <td colspan="2" class="leavetitle">
                        <strong>
                            <asp:Literal runat="server" ID="lblLeaveYourComment" EnableViewState="false"></asp:Literal>
                        </strong>
                    </td>
                </tr>
                <tr>
                    <td>
                        <%=GetLocaleResourceString("Service.CommentTitle")%>:
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="txtTitle" SkinID="ServiceAddCommentTitleText"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <%=GetLocaleResourceString("Service.CommentText")%>:
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="txtComment" TextMode="MultiLine" ValidationGroup="NewComment"
                            SkinID="ServiceAddCommentCommentText"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvComment" runat="server" ControlToValidate="txtComment"
                            ErrorMessage="<% $NopResources:Service.PleaseEnterCommentText %>" ToolTip="<% $NopResources:Service.PleaseEnterCommentText %>"
                            ValidationGroup="NewComment">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr runat="server" id="pnlError">
                    <td class="message-error" colspan="2">
                        <asp:Literal ID="lErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                    <td class="button">
                        <asp:Button runat="server" ID="btnComment" Text="<% $NopResources:Service.NewCommentButton %>"
                            ValidationGroup="NewComment" OnClick="btnComment_Click" CssClass="newsitemaddcommentbutton">
                        </asp:Button>
                    </td>
                </tr>
            </table>
        </div>
        <div class="clear">
        </div>
        <div class="commentlist">
            <asp:Repeater ID="rptrComments" runat="server">
                <ItemTemplate>
                   <%-- <nopCommerce:ServiceComment ID="ctrlServiceComment" runat="server" ServiceComment='<%# Container.DataItem %>' />--%>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</div>
