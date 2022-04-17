<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Dropdown17042022.WebForm1" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title></title>
</head>
<body>
<form id="form1" runat="server">
<div>
<table>
<tr>
<td>Name :</td>
<td><asp:TextBox ID="txtname" runat="server"></asp:TextBox></td>
</tr>
<tr>
<td>City :</td>
<td><asp:TextBox ID="txtcity" runat="server"></asp:TextBox></td>
</tr>
<tr>
<td>Salary :</td>
<td><asp:TextBox ID="txtsalary" runat="server"></asp:TextBox></td>
</tr>
<tr>
<td>Gender :</td>
<td><asp:RadioButtonList ID="rblgender" runat="server" RepeatColumns="3">
<asp:ListItem Text="male" Value="1"></asp:ListItem>
<asp:ListItem Text="female" Value="2"></asp:ListItem>
<asp:ListItem Text="others" Value="3"></asp:ListItem>
</asp:RadioButtonList></td>
</tr>
<tr>
<td>Country :</td>
<td><asp:DropDownList ID="ddlcountry" runat="server">
<asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
<asp:ListItem Text="India" Value="1"></asp:ListItem>
<asp:ListItem Text="Russia" Value="2"></asp:ListItem>
<asp:ListItem Text="USA" Value="3"></asp:ListItem>
<asp:ListItem Text="China" Value="4"></asp:ListItem>
</asp:DropDownList></td>
</tr>
<tr>
<td></td>
<td><asp:Button ID="btnsubmit" runat="server" Text="Submit" OnClick="btnsubmit_Click" /></td>
</tr>
<tr>
<td></td>
<td><asp:GridView ID="gv_employee" runat="server" OnRowCommand="gv_employee_RowCommand" AutoGenerateColumns="false">
<Columns>
<asp:TemplateField HeaderText="Employee ID">
<ItemTemplate>
<%#Eval("EmployeeID") %>
</ItemTemplate>
</asp:TemplateField>

<asp:TemplateField HeaderText="Employee Name">
<ItemTemplate>
<%#Eval("EmployeeName") %>
</ItemTemplate>
</asp:TemplateField>

<asp:TemplateField HeaderText="Employee City">
<ItemTemplate>
<%#Eval("City") %>
</ItemTemplate>
</asp:TemplateField>

<asp:TemplateField HeaderText="Employee Salary">
<ItemTemplate>
<%#Eval("Salary") %>
</ItemTemplate>
</asp:TemplateField>

<asp:TemplateField HeaderText="Employee Gender">
<ItemTemplate>
<%#Eval("Gender").ToString()=="1" ? "male" :Eval("Gender").ToString()=="2" ?"female" : "others" %>
</ItemTemplate>
</asp:TemplateField>

<asp:TemplateField HeaderText="Employee Country">  
<ItemTemplate>
<%#Eval("Country").ToString()=="1" ? "India" :Eval("Country").ToString()=="2" ? "Russia" : Eval("country").ToString()=="3" ? "USA" : "China" %>
</ItemTemplate>
</asp:TemplateField>

<asp:TemplateField>
<ItemTemplate>
<asp:LinkButton ID="btndelete" runat="server" Text="Delete" CommandName="India" CommandArgument='<%#Eval("EmployeeID") %>'></asp:LinkButton>
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField>
<ItemTemplate>
<asp:LinkButton ID="btnedit" runat="server" Text="Edit" CommandName="China" CommandArgument='<%#Eval("EmployeeID") %>'></asp:LinkButton>
</ItemTemplate>
</asp:TemplateField>
</Columns>
</asp:GridView></td>
</tr>
</table>
</div>
</form>
</body>
</html>

