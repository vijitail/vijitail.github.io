using System;
using System.Collections.Generic; using System.Linq; using System.Web; using System.Web.UI;
using System.Web.UI.WebControls;
ID="btnDiv"
runat="server"
Text="Div(/)"
public partial class _Default : System.Web.UI.Page {
Service obj = new Service();
int a, b, c;
protected void Page_Load(object sender, EventArgs e) {
}
protected void btnAdd_Click(object sender, EventArgs e) {
a = Convert.ToInt32(txtFno.Text); b = Convert.ToInt32(txtSno.Text); obj.Add(a, b);
lblResult.Text = c.ToString(); }
c =
protected void btnSub_Click(object sender, EventArgs e)
{
a = Convert.ToInt32(txtFno.Text);
b = Convert.ToInt32(txtSno.Text); c = obj.Sub(a, b);
lblResult.Text = c.ToString(); }
protected void BtnMul_Click(object sender, EventArgs e) {
a = Convert.ToInt32(txtFno.Text);
b = Convert.ToInt32(txtSno.Text); c = obj.Mul(a, b);
lblResult.Text = c.ToString(); }
protected void btnDiv_Click(object sender, EventArgs e) {
a = Convert.ToInt32(txtFno.Text); b = Convert.ToInt32(txtSno.Text); obj.Div(a, b);
lblResult.Text = c.ToString(); }
}
