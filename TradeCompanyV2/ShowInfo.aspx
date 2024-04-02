<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShowInfo.aspx.cs" Inherits="TradeCompanyV2.ShowInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" AutoGenerateSelectButton="True" DataKeyNames="Id" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Номер" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                    <asp:BoundField DataField="Name" HeaderText="Имя" SortExpression="Name" />
                    <asp:BoundField DataField="Surname" HeaderText="Фамилия" SortExpression="Surname" />
                    <asp:BoundField DataField="BirthYear" HeaderText="Год рождения" SortExpression="BirthYear" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TradeCompanyDBConnectionString %>" ProviderName="<%$ ConnectionStrings:TradeCompanyDBConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Customers]"></asp:SqlDataSource>
            <br />
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource2">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Номер" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                    <asp:BoundField DataField="Title" HeaderText="Название товара" SortExpression="Title" />
                    <asp:BoundField DataField="CustomerId" HeaderText="Номер заказчика" SortExpression="CustomerId" ReadOnly="True" />
                    <asp:BoundField DataField="Price" HeaderText="Цена" SortExpression="Price" />
                    <asp:BoundField DataField="Quantity" HeaderText="Кол-во" SortExpression="Quantity" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:TradeCompanyDBConnectionString %>" InsertCommand="INSERT INTO Orders(Title, CustomerId, Price, Quantity) VALUES (@Title, @CustomerId, @Price, @Quantity)" SelectCommand="SELECT * FROM [Orders] WHERE ([CustomerId] = @CustomerId)" UpdateCommand="UPDATE Orders 
SET 
Title = @Title, 
Price = @Price, 
CustomerId = @CustomerId,
Quantity = @Quantity 
WHERE (Id = @Id)">
                <InsertParameters>
                    <asp:ControlParameter ControlID="ProductName" Name="Title" PropertyName="Text" />
                    <asp:ControlParameter ControlID="GridView1" Name="CustomerId" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="ProductPrice" Name="Price" PropertyName="Text" />
                    <asp:ControlParameter ControlID="ProductCount" Name="Quantity" PropertyName="Text" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridView1" Name="CustomerId" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:ControlParameter ControlID="GridView2" Name="Title" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="GridView2" Name="Price" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="GridView2" Name="Quantity" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="GridView2" Name="Id" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="GridView1" Name="CustomerId" PropertyName="SelectedValue" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:Button ID="ButtonOrderAdd" runat="server" Text="Добавить заказ" OnClick="ButtonOrderAdd_Click"  />
            <asp:Button ID="ButtonOrderEdit" runat="server" Text="Редактировать заказы" OnClick="ButtonOrderEdit_Click" />
            <br />
            <asp:Panel ID="PanelNewOrder" runat="server" Visible="False">
                Название товара
                <asp:TextBox ID="ProductName" runat="server"></asp:TextBox>
                <br />
                Цена
                <asp:TextBox ID="ProductPrice" runat="server"></asp:TextBox>
                <br />
                Кол-во
                <asp:TextBox ID="ProductCount" runat="server"></asp:TextBox>
                <br />
                <asp:Button ID="ButtonSaveOrder" runat="server" Text="Добавить" OnClick="ButtonSaveOrder_Click" />
                <asp:Button ID="ButtonCancelOrder" runat="server" Text="Отменить" OnClick="ButtonCancelOrder_Click" />
            </asp:Panel>
        </div>
    </form>
</body>
</html>
