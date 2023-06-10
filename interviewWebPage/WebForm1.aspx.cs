using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Xml.Linq;
using System.Web.Services.Description;

namespace interviewWebPage
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        string con2 = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                Getid();
                state();
               
            }
        }
        void Getid()
        {
            SqlConnection con = new SqlConnection(con2);
            string query = "select * from interviewtbl";
            SqlDataAdapter ad = new SqlDataAdapter(query, con);
            DataTable dt = new DataTable();
            ad.Fill(dt);

            if (dt.Rows.Count < 1)
            {
                txtid.Text = "SEED101";
            }
            else
            {
                //string query1 = "select max(Employee_id) from interviewtbl";
                //SqlCommand cmd = new SqlCommand(query1, con);
                //con.Open();
                //int i = Convert.ToInt32(cmd.ExecuteScalar());
                //i = i + 1;
                //txtid.Text = i.ToString();
                string query1 = "select Employee_id from interviewtbl";
                SqlCommand cmd1 = new SqlCommand(query1, con);
                con.Open();
                SqlDataAdapter ad1=new SqlDataAdapter(cmd1);
                DataTable dt1= new DataTable();
                ad1.Fill(dt1);
                int maxsno = 0;
                var part1 = "0";
                var part2 = "0";
                foreach(DataRow dr in dt.Rows)
                {
                    var Employee_id = dr["Employee_id"].ToString();
                    part1 = Employee_id.Substring(0, 4);
                    part2 = Employee_id.Substring(4, (Employee_id.Length) - 4);
                    if (maxsno < Convert.ToInt16(part2))
                    {
                        maxsno = Convert.ToInt16(part2);
                    }
                }
                maxsno = maxsno + 1;

                var newserial = part1 + maxsno.ToString();
                txtid.Text = newserial.ToString();
                con.Close();

            }

        }
        protected void btninsert_Click(object sender, EventArgs e)
        {
            txtfname.Attributes.Add("maxlength", txtfname.MaxLength.ToString());
            txtlname.Attributes.Add("maxlength", txtlname.MaxLength.ToString());
            SqlConnection con = new SqlConnection(con2);
            con.Open();
            SqlCommand cmd = new SqlCommand("prointerview1", con);
            cmd.CommandType = CommandType.StoredProcedure;
            string gender = rdomale.Checked ? "Male" : "Female";
            cmd.Parameters.AddWithValue("@Employee_id",txtid.Text);
            cmd.Parameters.AddWithValue("@First_Name", txtfname.Text);
            cmd.Parameters.AddWithValue("@Last_Name", txtlname.Text);
            cmd.Parameters.AddWithValue("@Department_Nmae",txtdepartment.Text);
            cmd.Parameters.AddWithValue("@Gender", gender);
            cmd.Parameters.AddWithValue("@Designation", txtdesignation.Text);
            cmd.Parameters.AddWithValue("@Email", txtemail.Text);
            cmd.Parameters.AddWithValue("@Mobile_Number", txtmobile.Text);
            cmd.Parameters.AddWithValue("@State",stateDropDownList.SelectedItem.ToString());
            cmd.Parameters.AddWithValue("@City",cityDropDownList.SelectedItem.ToString());
            cmd.Parameters.AddWithValue("@Salary",txtsalary.Text);
            cmd.ExecuteNonQuery();
            Getid();
            con.Close();

        }
        void state()
        {
            SqlConnection con3 = new SqlConnection(con2);
            string query = "select * from country";
            SqlDataAdapter sda=new SqlDataAdapter(query, con3);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            stateDropDownList.DataSource = dt;
            stateDropDownList.DataTextField= "countryName";
            stateDropDownList.DataValueField = "country_id";
            stateDropDownList.DataBind();
            ListItem selectitem = new ListItem("Select Country", "select Country");
            selectitem.Selected = true;
            stateDropDownList.Items.Insert(0,selectitem);
        }
        void city(int country_id)
        {
            SqlConnection con3 = new SqlConnection(con2);
            string query = "select * from city where c_id=@country_id";
            SqlDataAdapter sda = new SqlDataAdapter(query, con3);
            sda.SelectCommand.Parameters.AddWithValue("@country_id",country_id);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            cityDropDownList.DataSource = dt;
            cityDropDownList.DataTextField = "City_name";
            cityDropDownList.DataValueField = "City_id";
            cityDropDownList.DataBind();
            ListItem selectitem = new ListItem("Select City", "select City");
            selectitem.Selected = true;
            cityDropDownList.Items.Insert(0, selectitem);
        }

        protected void stateDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                int country_id = Convert.ToInt32(stateDropDownList.SelectedValue);
                city(country_id);
            }
            catch(Exception  ex)
            {
                Response.Write("<script>alert('Please Select State')</script>");
            }
        }

        protected void btndelete_Click(object sender, EventArgs e)
        { 
            SqlConnection con = new SqlConnection(con2);
            con.Open();
            string query = "delete from interviewtbl where Employee_id='" + txtid.Text + "'";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.ExecuteNonQuery();
            con.Close();
        }
        protected void btnclear_Click(object sender, EventArgs e)
        {
            
            txtfname.Text = string.Empty;
            txtlname.Text = string.Empty;
            txtmobile.Text = string.Empty;
            txtsalary.Text = string.Empty;
            txtemail.Text = string.Empty;
            txtdesignation.Text = string.Empty;
            txtdepartment.Text = string.Empty;
            stateDropDownList.ClearSelection();
            cityDropDownList.ClearSelection();
            rdomale.Checked = false;
            rdofemle.Checked = false;
        }

        protected void btnupdate_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(con2);
            con.Open();
            string query1 = "update interviewtbl set First_Name=@First_Name,Last_Name=@Last_Name,Department_Nmae=@Department_Nmae,Gender=@Gender,Designation=@Designation,Email=@Email,Mobile_Number=@Mobile_Number,State=@State,City=@City,Salary=@Salary where Employee_id=@Employee_id";
            SqlCommand cmd = new SqlCommand(query1, con);
            string gender= rdomale.Checked ? "Male" : "Female"; ;
            cmd.Parameters.AddWithValue("@Employee_id", txtid.Text);
            cmd.Parameters.AddWithValue("@First_Name", txtfname.Text);
            cmd.Parameters.AddWithValue("@Last_Name", txtlname.Text);
            cmd.Parameters.AddWithValue("@Department_Nmae", txtdepartment.Text);
            cmd.Parameters.AddWithValue("@Gender", gender);
            cmd.Parameters.AddWithValue("@Designation", txtdesignation.Text);
            cmd.Parameters.AddWithValue("@Email", txtemail.Text);
            cmd.Parameters.AddWithValue("@Mobile_Number", txtmobile.Text);
            cmd.Parameters.AddWithValue("@State", stateDropDownList.SelectedItem.ToString());
            cmd.Parameters.AddWithValue("@City", cityDropDownList.SelectedItem.ToString());
            cmd.Parameters.AddWithValue("@Salary", txtsalary.Text);
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Write("<script>alert('Data Updated successfully!!')</script>");

               
        }

        protected void btnget_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(con2);
            con.Open();
            string query = "select * from interviewtbl where Employee_id=@Employee_id";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@Employee_id", int.Parse(txtid.Text));
            SqlDataReader rd = cmd.ExecuteReader();
            while (rd.Read())
            {
                txtfname.Text = rd.GetValue(1).ToString();
                txtlname.Text = rd.GetValue(2).ToString();
                txtmobile.Text = rd.GetValue(7).ToString();
                txtsalary.Text = rd.GetValue(10).ToString();
                txtemail.Text = rd.GetValue(6).ToString();
                txtdesignation.Text = rd.GetValue(5).ToString();
                txtdepartment.Text = rd.GetValue(3).ToString();
                stateDropDownList.SelectedValue = rd.GetValue(8).ToString();
                cityDropDownList.SelectedValue = rd.GetValue(9).ToString();
                rdomale.Text = rd.GetValue(5).ToString();
                rdofemle.Text = rd.GetValue(5).ToString();
            }
            con.Close();
        }
    }
}