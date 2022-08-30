using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ZigZag
{
    public partial class staffmemberpage : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        { 
            GridView1.DataBind();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (checkIfEmpNoExists())
            {
                Response.Write("<script>alert('Staff with this Email already Exist. You cannot add another Email with the same Staff ID');</script>");
            }
            else
            {
                addNewStaffMember();
            }
            
        }
        //Clear TExt Feild
        void clearForm()
        {
            empno.Text = "";
            empname.Text = "";
            dob.Text = "";
            line1.Text = "";
            mobilenumber.Text = "";
            line2.Text = "";
            line3.Text = "";
            gender.Text = "";

        }
        bool checkIfEmpNoExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * from Employee where empno='" +empno.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
                    return true;
                }
                else
                {
                    return false;
                }


            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }

        }
        //Add New Employee Function
        void addNewStaffMember()
        {

            SqlConnection con = new SqlConnection(strcon);
            con.Open();
            Int32 EmpNo = Int32.Parse(empno.Text);
            SqlCommand cmd = new SqlCommand("INSERT INTO Employee(empno,empname,addressline1,addressline2,addressline3,dob,gender,nic,mobilenumber,experience) values" +
                    "(@empno,@empname,@line1,@line2,@line3,@dob,@gender,@nic,@mobilenumber,@experience)", con);
            cmd.Parameters.AddWithValue("@empno", EmpNo);
            cmd.Parameters.AddWithValue("@empname", empname.Text.Trim());
            cmd.Parameters.AddWithValue("@line1", line1.Text.Trim());
            cmd.Parameters.AddWithValue("@line2", line2.Text.Trim());
            cmd.Parameters.AddWithValue("@line3", line3.Text.Trim());
            cmd.Parameters.AddWithValue("@dob", dob.Text.Trim());
            cmd.Parameters.AddWithValue("@gender", gender.Text.Trim());
            cmd.Parameters.AddWithValue("@nic", nic.Text.Trim());
            cmd.Parameters.AddWithValue("@mobilenumber", mobilenumber.Text.Trim());
            cmd.Parameters.AddWithValue("@experience", experience.Text.Trim());

            cmd.ExecuteNonQuery();
            con.Close();
            Response.Write("<script>alert('Employee added Successfully');</script>");
            clearForm();
            GridView1.DataBind();
            

        }
        void getEmployeeByID()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();

                }
                Int32 EmpNo = Int32.Parse(empno.Text);
                SqlCommand cmd = new SqlCommand("select * from Employee where empno='" + EmpNo + "'", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        empno.Text = dr.GetValue(0).ToString();
                        empname.Text = dr.GetValue(1).ToString();
                        line1.Text = dr.GetValue(2).ToString();
                        line2.Text = dr.GetValue(3).ToString();
                        line3.Text = dr.GetValue(4).ToString();
                        dob.Text = dr.GetValue(5).ToString();
                        gender.Text = dr.GetValue(6).ToString();
                        nic.Text = dr.GetValue(7).ToString();
                        mobilenumber.Text = dr.GetValue(8).ToString();
                        experience.Text = dr.GetValue(9).ToString();
                    }

                }
                else
                {
                    Response.Write("<script>alert('Invalid credentials');</script>");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void go_Click(object sender, EventArgs e)
        {
            getEmployeeByID();
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            if (checkIfEmpNoExists())
            {
                deleteEmployee();

            }
            else
            {
                Response.Write("<script>alert('Staff Member does not exist');</script>");
            }
        }
        //Delete Staff Member Function
        void deleteEmployee()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                Int32 EmpNo = Int32.Parse(empno.Text);
                SqlCommand cmd = new SqlCommand("DELETE from Employee WHERE empno='" + EmpNo + "'", con);

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Employee Deleted Successfully');</script>");
                clearForm();
                GridView1.DataBind();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        //Update Staff Member Function
        void updateEmployee()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                Int32 EmpNo = Int32.Parse(empno.Text);
                
                SqlCommand cmd = new SqlCommand("UPDATE Employee SET empname=@empname,addressline1=@line1,addressline2=@line2,addressline3=@line3,dob=@dob,gender=@gender,nic=@nic,mobilenumber=@mobilenumber,experience=@experience WHERE empno='" + EmpNo + "'", con);

                cmd.Parameters.AddWithValue("@empname", empname.Text.Trim());
                cmd.Parameters.AddWithValue("@line1", line1.Text.Trim());
                cmd.Parameters.AddWithValue("@line2", line2.Text.Trim());
                cmd.Parameters.AddWithValue("@line3", line3.Text.Trim());
                cmd.Parameters.AddWithValue("@dob", dob.Text.Trim());
                cmd.Parameters.AddWithValue("@gender", gender.Text.Trim());
                cmd.Parameters.AddWithValue("@nic", nic.Text.Trim());
                cmd.Parameters.AddWithValue("@mobilenumber", mobilenumber.Text.Trim());
                cmd.Parameters.AddWithValue("@experience", experience.Text.Trim());

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Employee Updated Successfully');</script>");
                clearForm();
                GridView1.DataBind();
                
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            if (checkIfEmpNoExists())
            {
                updateEmployee();

            }
            else
            {
                Response.Write("<script>alert('Staff Member does not exist');</script>");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("homepage.aspx");
        }
    }
}