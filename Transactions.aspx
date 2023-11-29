<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Transactions.aspx.cs" Inherits="Online_Payment_System.Transactions" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>All Transactions</title>
    <h1>Transactions</h1>
    <br />
</head>
<body>
    <form id="form1" runat="server">
        <telerik:RadScriptManager ID="RadScriptManager1" runat="server" />
        <telerik:RadGrid ID="rgRecentTransactions" runat="server" AllowSorting="true" AllowPaging="true" AutoGenerateColumns="False">
            <MasterTableView>
                <Columns>
                    <telerik:GridBoundColumn DataField="TransactionID" HeaderText="Transaction ID" />
                    <telerik:GridBoundColumn DataField="TransactionDate" HeaderText="Date" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}" />
                    <telerik:GridBoundColumn DataField="Amount" HeaderText="Amount" DataFormatString="{0:C}" />
                    <telerik:GridBoundColumn DataField="Description" HeaderText="Description" />
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>

        <telerik:RadPanelBar ID="RadPanelBarFooter" Width="1480" runat="server" ExpandMode="SingleExpandedItem">
            <Items>
                <telerik:RadPanelItem Text="All CopyRights Reserved @2023">
                </telerik:RadPanelItem>
            </Items>
        </telerik:RadPanelBar>
    </form>
</body>
</html>
