<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PaymentForm.aspx.cs" Inherits="Online_Payment_System.PaymentForm" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Payment Form</title>
    <link href="Styles/main.css" rel="stylesheet" />
    <telerik:RadStyleSheetManager ID="RadStyleSheetManager1" runat="server" />
    <telerik:RadPanelBar ID="RadPanelBarHeader" Width="1480" runat="server" ExpandMode="SingleExpandedItem">
        <Items>
            <telerik:RadPanelItem Text="Payments" ForeColor="White" BackColor="#003399">
            </telerik:RadPanelItem>
        </Items>
    </telerik:RadPanelBar>
    <br />
<%--    <script type="text/javascript">
        function validateForm() {
            var cardNumber = document.getElementById('<%= txtCardNumber.ClientID %>').value;
            var ExpirationDate = document.getElementById('<%= txtExpirationDate.ClientID %>').value;
            var CVV = document.getElementById('<%= txtCVV.ClientID %>').value;
            var Amount = document.getElementById('<%= txtAmount.ClientID %>').value;

            if (cardNumber.trim() === '') {
                alert('Card Number is required!');
                return false;
            }

            if (ExpirationDate.trim() === '') {
                alert('Expiration Date is required!');
                return false;
            }

         


            if (CVV.trim() === '') {
                alert('CVV is required!');
                return false;
            }


            if (Amount.trim() === '') {
                alert('Amount is required!');
                return false;
            }

            return true;
        }
    </script>--%>

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
            <legend>Payment Details</legend>
            <table style="width: 100%;">
                <tr>

                    <td>
                        <label for="txtCardNumber">Card Number:</label>

                    </td>
                    <td>
                        <telerik:RadTextBox ID="txtCardNumber" runat="server" />

                    </td>
                <%--    <td>
                        <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtCardNumber"
                            ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>--%>
                    <td>
                        <label for="txtExpirationDate">Expiration Date:</label>

                    </td>

                    <td>
                        <telerik:RadTextBox ID="txtExpirationDate" runat="server" />

                    </td>
                  <%--  <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtExpirationDate"
                            ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>--%>
                </tr>
                <tr>
                    <td>
                        <label for="txtCVV">CVV:</label>

                    </td>
                    <td>
                        <telerik:RadTextBox ID="txtCVV" runat="server" />

                    </td>
             <%--       <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtCVV"
                            ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>--%>
                    <td>
                        <label for="txtAmount">Amount:</label>

                    </td>
                    <td>
                        <telerik:RadNumericTextBox ID="txtAmount" ReadOnly="true" runat="server" />

                    </td>
                <%--    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtAmount"
                            ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>--%>
                </tr>
                <tr></tr>
                <tr>
                    <td>
                        <asp:Button ID="btnProcessPayment" runat="server" Text="Process Payment" OnClick="btnProcessPayment_Click" />

                    </td>
                    <asp:Label ID="lblMessage" runat="server"></asp:Label>
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
