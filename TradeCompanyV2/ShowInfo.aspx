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
                <EditRowStyle BackColor="#FF6699" />
                <SelectedRowStyle BackColor="Yellow" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TradeCompanyDBConnectionString %>" ProviderName="<%$ ConnectionStrings:TradeCompanyDBConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Customers]" InsertCommand="insert into customers (name, surname, birthyear)
values (@name, @surname, @birthyear)" UpdateCommand="update customers
set
name = @name,
surname = @surname,
birthyear = @birthyear
where id = @id" DeleteCommand="delete from customers where id = @id;
delete from orders where customerid = @id;">
                <DeleteParameters>
                    <asp:ControlParameter ControlID="GridView1" Name="id" PropertyName="SelectedValue" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="CustomerName" Name="name" PropertyName="Text" />
                    <asp:ControlParameter ControlID="CustomerSurname" Name="surname" PropertyName="Text" />
                    <asp:ControlParameter ControlID="CustomerBirthYear" Name="birthyear" PropertyName="Text" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:ControlParameter ControlID="GridView1" Name="name" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="GridView1" Name="surname" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="GridView1" Name="birthyear" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="GridView1" Name="id" PropertyName="SelectedValue" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            ПОКУПАТЕЛЬ<br />
            <asp:Button ID="ButtonCustomerNew" runat="server" OnClick="ButtonCustomerNew_Click" Text="Добавить нового" />
            <asp:Button ID="ButtonCustomerEdit" runat="server" OnClick="ButtonCustomerEdit_Click" Text="Редактировать" />
            <asp:Button ID="ButtonCustomerDelete" runat="server" Text="Удалить" OnClick="ButtonCustomerDelete_Click" />
            <br />
            <asp:Panel ID="PanelCustomerAdd" runat="server" Visible="False">
                <asp:Label ID="Label1" runat="server" Text="Имя"></asp:Label>
                &nbsp;<asp:TextBox ID="CustomerName" runat="server"></asp:TextBox>
                <br />
                <asp:Label ID="Label2" runat="server" Text="Фамилия"></asp:Label>
                &nbsp;<asp:TextBox ID="CustomerSurname" runat="server"></asp:TextBox>
                <br />
                <asp:Label ID="Label3" runat="server" Text="Год рождения"></asp:Label>
                &nbsp;<asp:TextBox ID="CustomerBirthYear" runat="server"></asp:TextBox>
                <br />
                <asp:Button ID="ButtonCustomerSave" runat="server" OnClick="ButtonCustomerSave_Click" Text="Сохранить" />
                <asp:Button ID="ButtonCustomerSaveCancel" runat="server" OnClick="ButtonCustomerSaveCancel_Click" Text="Отменить" />
            </asp:Panel>
            <br />
            <br />
            <br />
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource2">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Номер" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                    <asp:BoundField DataField="Title" HeaderText="Название товара" SortExpression="Title" />
                    <asp:BoundField DataField="CustomerId" HeaderText="Номер заказчика" SortExpression="CustomerId" ReadOnly="True" />
                    <asp:BoundField DataField="Price" HeaderText="Цена" SortExpression="Price" />
                    <asp:BoundField DataField="Quantity" HeaderText="Кол-во" SortExpression="Quantity" />
                </Columns>
                <EditRowStyle BackColor="#FF6699" />
                <SelectedRowStyle BackColor="Yellow" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:TradeCompanyDBConnectionString %>" InsertCommand="INSERT INTO Orders(Title, CustomerId, Price, Quantity) VALUES (@Title, @CustomerId, @Price, @Quantity)" SelectCommand="SELECT * FROM [Orders] WHERE ([CustomerId] = @CustomerId)" UpdateCommand="UPDATE Orders 
SET 
Title = @Title, 
Price = @Price, 
CustomerId = @CustomerId,
Quantity = @Quantity 
WHERE (Id = @Id)" DeleteCommand="DELETE FROM Orders WHERE Id = @Id">
                <DeleteParameters>
                    <asp:ControlParameter ControlID="GridView2" Name="Id" PropertyName="SelectedValue" />
                </DeleteParameters>
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
            <br />
            <asp:Label ID="Label4" runat="server" Text="ЗАКАЗ"></asp:Label>
            <br />
            <asp:Button ID="ButtonOrderAdd" runat="server" Text="Добавить новый" OnClick="ButtonOrderAdd_Click"  />
            <asp:Button ID="ButtonOrderEdit" runat="server" Text="Редактировать" OnClick="ButtonOrderEdit_Click" />
            <asp:Button ID="ButtonOrderDelete" runat="server" OnClick="ButtonOrderDelete_Click" Text="Удалить" />
            <br />
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
