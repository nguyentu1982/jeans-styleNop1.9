<%@ Control Language="C#" AutoEventWireup="true" Inherits="NopSolutions.NopCommerce.Web.Modules.EmailTextBox"
    CodeBehind="EmailTextBox.ascx.cs" %>
<asp:TextBox ID="txtValue" runat="server" onkeydown="submitOnEnter(event);"></asp:TextBox>
<asp:RequiredFieldValidator ID="rfvValue" runat="server" ControlToValidate="txtValue"
    Display="Dynamic">*</asp:RequiredFieldValidator>
<asp:RegularExpressionValidator ID="revValue" runat="server" ControlToValidate="txtValue"
    ValidationExpression=".+@.+\..+" ErrorMessage="<% $NopResources:Account.WrongEmailFormat %>"
    Display="Dynamic" />

<script type="text/javascript">

function submitOnEnter(e) {
    var key;

    if (window.event)
        key = window.event.keyCode; //IE
    else
        key = e.which; //Firefox & others

    if (key == 13) {
        event.cancelBubble = true;
        event.returnValue = false;
    }
}
</script>