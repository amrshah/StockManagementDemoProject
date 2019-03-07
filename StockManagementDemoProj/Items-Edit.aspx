<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Items-Edit.aspx.cs" Inherits="StockManagementDemoProj.Pages.InventoryItems.Items_Edit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<br /><br /><br />
    <h2>Edit Item</h2>
    <asp:Table ID="Table1" runat="server">
        <asp:TableRow>
            <asp:TableCell>
                <label>Name: </label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtItemName" runat="server" ></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <label>Description: </label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtItemDescription" TextMode="MultiLine" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell ColumnSpan="2">
                <asp:Button runat="server" Text="Save Item" OnClick="Save_Item_Click" />
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>

</asp:Content>
