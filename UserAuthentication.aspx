<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserAuthentication.aspx.cs" Inherits="Online_Payment_System.UserAuthentication" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Login</title>
    <telerik:RadStyleSheetManager ID="RadStyleSheetManager1" runat="server" />
    <telerik:RadPanelBar ID="RadPanelBarHeader" Width="1480" runat="server" ExpandMode="SingleExpandedItem">
        <Items>
            <telerik:RadPanelItem Text="User Authentication" ForeColor="White" BackColor="#003399">
            </telerik:RadPanelItem>
        </Items>
    </telerik:RadPanelBar>
    <br />
</head>
<body>
    <form id="form1" runat="server">
        <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
            <Scripts>
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.Core.js" />
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQuery.js" />
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQueryInclude.js" />
            </Scripts>
        </telerik:RadScriptManager>
        <telerik:RadFormDecorator ID="RadFormDecorator1" runat="server" DecoratedControls="All" />
        <fieldset>
            <legend>User Authentication</legend>
            <table style="width: 100%;">
                <tr>
                    <td>
                        <label for="txtLoginUsername">UserName:</label>

                    </td>
                    <td>
                        <telerik:RadTextBox ID="txtLoginUsername" runat="server" /><br />

                    </td>
                </tr>
                <tr></tr>
                <tr>
                    <td>
                        <label for="txtLoginPassword">Password:</label>

                    </td>
                    <td>
                        <telerik:RadTextBox ID="txtLoginPassword" runat="server" TextMode="Password" /><br />

                    </td>
                </tr>
                <tr>
                </tr>
                <tr>
                    <td>
                        <telerik:RadButton ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" />

                    </td>

                </tr>
            </table>
        </fieldset>
        </telerik:RadFormDecorator>
        

        <telerik:RadPanelBar ID="RadPanelBarFooter" Width="1480" runat="server" ExpandMode="SingleExpandedItem">
            <Items>
                <telerik:RadPanelItem Text="All CopyRights Reserved @2023">
                </telerik:RadPanelItem>
            </Items>
        </telerik:RadPanelBar>
    </form>
</body>
</html>
