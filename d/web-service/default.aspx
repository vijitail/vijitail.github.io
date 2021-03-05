<%@ Page Language="C#" AutoEventWireup="true" Inherits="_Default" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"> <head runat="server">
<title></title> </head>
<body>
CodeFile="Default.aspx.cs"
1.0 Transitional//EN"
<form id="form1" runat="server"> <div>
<table border="2" cellpadding="2" cellspacing="2"> <tr>
<td align="right"> <asp:Label
Number"></asp:Label> </td>
ID="Label1"
runat="server"
Text="Enter 1st
<td align="left">
<asp:TextBox ID="txtFno" runat="server"></asp:TextBox>
</td> </tr>
<tr>
<td align="right">
<asp:Label Number"></asp:Label>
</td>
<td align="left">
ID="Label2"
runat="server"
Text="Enter 2nd
<asp:TextBox ID="txtSno" runat="server"></asp:TextBox> </td>
</tr> <tr>
<td align="right">
<asp:Label ID="Label3" runat="server" Text="Result"></asp:Label>
</td>
<td align="left">
<asp:Label ID="lblResult" runat="server"></asp:Label> </td>
</tr> <tr>
<td align="center"> <asp:Button
OnClick="btnAdd_Click" /> </td>
<td align="center"> <asp:Button
OnClick="btnSub_Click" /> </td>
</tr> <tr>
<td align="center"> <asp:Button
OnClick="BtnMul_Click" />
ID="btnAdd"
ID="btnSub"
ID="BtnMul"
runat="server"
runat="server"
runat="server"
Text="Add(+)"
Text="Sub(-)"
Text="Mul(*)"
</td>
<td align="center">
<asp:Button OnClick="btnDiv_Click" />
</td> </tr>
</table> </div>
</form> </body>
</html>
