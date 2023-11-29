<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="Online_Payment_System.Product" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Telerik RadGrid with Selection</title>
    <telerik:RadStyleSheetManager ID="RadStyleSheetManager1" runat="server" />
    <telerik:RadPanelBar ID="RadPanelBarHeader" Width="1480" runat="server" ExpandMode="SingleExpandedItem">
        <Items>
            <telerik:RadPanelItem Text="Products" ForeColor="White" BackColor="#003399">
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

        <telerik:RadGrid ID="radGridProducts" runat="server" OnSelectedIndexChanged="radGridProducts_SelectedIndexChanged" AllowSorting="true" AllowPaging="true" AllowMultiRowSelection="false" AutoGenerateColumns="false">
            <MasterTableView DataKeyNames="ProductId">
                <Columns>
                    <telerik:GridBoundColumn DataField="ProductId" HeaderText="Product Id" UniqueName="ProductId" />
                    <telerik:GridBoundColumn DataField="ProductName" HeaderText="Product Name" UniqueName="ProductName" />
                    <telerik:GridBoundColumn DataField="Price" HeaderText="Price" UniqueName="Price" />
                </Columns>
            </MasterTableView>
            <ClientSettings>
                <Selecting AllowRowSelect="true" />
            </ClientSettings>
        </telerik:RadGrid>
        <div>
            <br />
            <telerik:RadFormDecorator ID="RadFormDecorator1" runat="server" DecoratedControls="All" />
            <fieldset>
                <legend>Selected Product</legend>
                <table style="width: 100%;">
                    <tr>
                        <td>
                            <label for="txtProductName">Product Name:</label>
                        </td>
                        <td>
                            <telerik:RadTextBox ID="txtProductName" ReadOnly="true" runat="server"></telerik:RadTextBox>
                        </td>
                    </tr>
                    <tr>
                    </tr>
                    <tr>
                        <td>
                            <label for="txtPrice">Price:</label>
                        </td>
                        <td>
                            <telerik:RadTextBox ID="txtPrice" ReadOnly="true" runat="server"></telerik:RadTextBox>
                        </td>
                    </tr>
                    <tr></tr>
                    <tr>
                        <td>
                            <telerik:RadButton ID="btnPurchase" runat="server" Text="Purchase" OnClick="btnPurchase_Click" />
                        </td>
                    </tr>
                </table>
            </fieldset>
            </telerik:RadFormDecorator>
                        <asp:Label ID="lblMessage" runat="server"></asp:Label>
        </div>
        </div>
        <telerik:RadPanelBar ID="RadPanelBarFooter" Width="1480" runat="server" ExpandMode="SingleExpandedItem">
            <Items>
                <telerik:RadPanelItem Text="All CopyRights Reserved @2023">
                </telerik:RadPanelItem>
            </Items>
        </telerik:RadPanelBar>
    </form>
</body>
</html>
