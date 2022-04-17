using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace Dropdown17042022
{

    public partial class WebForm1 : System.Web.UI.Page
    {
        // SqlConnection con = new SqlConnection("data source= Data Source=SUMAN\\SQLEXPRESS;Initial Catalog=testDropdown17042022;Integrated Security=True");
        SqlConnection con = new SqlConnection("Data Source=SUMAN\\SQLEXPRESS;Initial Catalog=testDropdown17042022;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            DisplayEmployee();

        }
    

    
    public void DisplayEmployee()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("select * from Employee", con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        con.Close();
        gv_employee.DataSource = dt;
        gv_employee.DataBind();  
    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        if (btnsubmit.Text == "Submit")
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("insert into Employee(EmployeeName,City,Salary,Gender,Country)values('" + txtname.Text + "','" + txtcity.Text + "','" + txtsalary.Text + "','" + rblgender.SelectedValue + "','" + ddlcountry.SelectedValue + "')", con);
            cmd.ExecuteNonQuery();
            con.Close();
            DisplayEmployee();
        }
        else if (btnsubmit.Text == "Update")
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("update Employee set EmployeeName='" + txtname.Text + "',City='" + txtcity.Text + "',Salary='" + txtsalary.Text + "',Gender='" + rblgender.SelectedValue + "',Country='" + ddlcountry.SelectedValue + "' where EmployeeID='" + ViewState["pp"] + "'", con);
            cmd.ExecuteNonQuery();
            con.Close();
            DisplayEmployee();
            btnsubmit.Text = "Submit";
        }
    }
    protected void gv_employee_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "India")
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("delete from Employee where EmployeeID='" + e.CommandArgument + "'", con);
            cmd.ExecuteNonQuery();
            con.Close();
            DisplayEmployee();
        }
        else if (e.CommandName == "China")
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from Employee where EmployeeID='" + e.CommandArgument + "'", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            txtname.Text = dt.Rows[0]["EmployeeName"].ToString();
            txtcity.Text = dt.Rows[0]["City"].ToString();
            txtsalary.Text = dt.Rows[0]["Salary"].ToString();
            rblgender.SelectedValue = dt.Rows[0]["Gender"].ToString();
            ddlcountry.SelectedValue = dt.Rows[0]["Country"].ToString();
            btnsubmit.Text = "Update";
            ViewState["pp"] = e.CommandArgument;
        }
    }
}
}

