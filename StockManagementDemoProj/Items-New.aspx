<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Items-New.aspx.cs" Inherits="StockManagementDemoProj.Items_New" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br /><br /><br />
    <h2>Add New Item</h2>
    <asp:Table ID="Table1" runat="server">
        <asp:TableRow>
            <asp:TableCell>
                <label>Name: </label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtItemName" runat="server"></asp:TextBox>
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
                <asp:Button runat="server" Text="Add Item" OnClick="Add_Item_Click" />
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
</asp:Content>
