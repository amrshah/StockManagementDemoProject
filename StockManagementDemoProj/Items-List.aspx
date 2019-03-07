<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Items-List.aspx.cs" Inherits="StockManagementDemoProj.Pages.InventoryItems.Items_List" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Inventory Items</h2>
    <%
        var items = new SMDPBusinessLayer.ItemHandler().GetAll();
        %>
    <table class="table table-striped">
      <thead>
        <tr>
          <th scope="col">#</th>
          <th scope="col">Name</th>
          <th scope="col">Description</th>
          <th scope="col">Actions</th>
        </tr>
      </thead>
      <tbody>
          <%
    var baseUrl = "Pages/InventoryItems/";
    if (items.Count > 0)
    {
        foreach (var item in items)
        {

            var editUrl = "Items-Edit.aspx?id=" + item.Id;
            var deleteUrl = "Items-Delete.aspx?id=" + item.Id;
                  %>
        <tr>
          <th scope="row">1</th>
          <td><%= item.Name %></td>
          <td><%= item.Description %></td>
          <td>
              <a href="<%=editUrl %>">Edit</a>
              <a href="<%=deleteUrl %>" onclick="javascript:return confirmDelete(<%=item.Id %>);">Delete</a>
          </td>
        </tr>
          <%
                  }
              }
              else
              {
                  %>
          <tr><td colspan="3">There are no items in the stock!</td></tr>
          <%
              }
              %>
        
      </tbody>
    </table>
<script type="text/javascript">
    function confirmDelete(id) {
        if (window.confirm("Are you sure to delete this record??? Sachi main?")) {
            window.location.href = "Items-Delete.aspx?id=" + id;

        }
        else return false;
    }
</script>
</asp:Content>
