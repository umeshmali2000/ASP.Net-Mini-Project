<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="interviewWebPage.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            font-size: x-large;
        }
        .auto-style2 {
            color: #FF0000;
        }
        .auto-style3 {
            font-size: large;
        }
        .auto-style4 {
            margin-left: 120px;
        }
        .auto-style5 {
            font-weight: bold;
            font-size: large;
            background-color: #666666;
        }
        .auto-style6 {
            margin-left: 280px;
            color: #FF0000;
        }
        .auto-style7 {
            font-size: x-small;
        }
        .auto-style8 {
            margin-left: 280px;
        }
        .auto-style9 {
            margin-left: 200px;
        }
        .divbox{
            border: 2px outset black;
             background-position: center;
             background-repeat: no-repeat;
             background-size: cover;
             position: relative;
            background-image:url("https://wallpapercave.com/wp/wp10364283.jpg");

        }
        .container{
            position: absolute;
            margin: 20px;
            background-color:darkgrey;
        }
       
    </style>
</head>
<body>
  <script>
      function ValidateCheckBoxList()
      {
            var fname,lname, gender,email,mobile,department,designeation;
           fname = document.getElementById('<%=txtfname.ClientID%>').value;
          if (fname == '')
          {
                alert('Enter your First Name');
                document.getElementById('<%=txtfname.ClientID%>').focus();
                return false;
          }
          lname = document.getElementById('<%=txtlname.ClientID%>').value;
          if (lname == '')
          {
                alert('Enter your Last Name');
              document.getElementById('<%=txtlname.ClientID%>').focus();
              return false;
          }
          email = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;
          if (!input.value.match(email))
          {
              alert("Invalid email address!");
              document.getElementById('<%=txtemail.ClientID%>').focus();
              return false;
          }
          gender = document.getElementsByName('Gender');
          var genValue = false;

          for (var i = 0; i < gender.length; i++)
          {
              if (gender[i].checked == true)
              {
                    genValue = true;
              }
          }
          if (!genValue)
          {
              alert("Please Choose the gender");
                return false;
          }
          mobile = document.getElementById('<%=txtmobile.ClientID%>').value;
          if (contact == '')
          {
                alert('Enter your Mobile Number');
                document.getElementById('<%=txtmobile.ClientID%>');
                return false;
          }
          department = document.getElementById('<%=txtdepartment.ClientID%>').value;
          if (lname == '')
          {
                alert('Enter your Department Name');
              document.getElementById('<%=txtdepartment.ClientID%>').focus();
              return false;
          }
          designeation = document.getElementById('<%=txtdesignation.ClientID%>').value;
          if (lname == '')
          {
                alert('Enter your Department Name');
              document.getElementById('<%=txtdesignation.ClientID%>').focus();
              return false;
          }


        }
  </script>
    <div>

    <form runat="server" class="divbox">
        <div>
            <strong>
            <asp:Label ID="Label1" runat="server" BorderColor="Black" CssClass="auto-style1" Text="Employee ID"></asp:Label>
            <span class="auto-style2">*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="txtid" runat="server" Height="32px" Width="207px"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnget" runat="server" BorderStyle="Solid" CssClass="auto-style5" Height="44px" Text="Get" Width="115px" OnClick="btnget_Click" />
            </span></strong>
        </div>
        <p>
            <strong>
            <asp:Label ID="Label2" runat="server" BorderColor="Black" CssClass="auto-style1" Text="First Name"></asp:Label>
            <span class="auto-style2">*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtfname" runat="server" Height="32px" Width="207px" MaxLength="10"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtfname" Display="Dynamic" ErrorMessage="Required"></asp:RequiredFieldValidator>
            </span></strong>
        </p>
        <p class="auto-style9">
            &nbsp;<asp:Label ID="Label12" runat="server" CssClass="auto-style7" Text="Only 10 character excepted"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="txtfname" CssClass="auto-style7" ErrorMessage="Accept only Characters " ForeColor="Red" ValidationExpression="[a-zA-Z]+"></asp:RegularExpressionValidator>
            </p>
        <p>
            <strong>
            <asp:Label ID="Label3" runat="server" BorderColor="Black" CssClass="auto-style1" Text="Last Name"></asp:Label>
            <span class="auto-style2">*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtlname" runat="server" Height="32px" Width="207px" MaxLength="10"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtlname" Display="Dynamic" ErrorMessage="Required"></asp:RequiredFieldValidator>
            </span></strong>
        </p>
        <p class="auto-style9">
            <asp:Label ID="Label13" runat="server" CssClass="auto-style7" Text="Only 10 character excepted"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp; 
            <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="txtlname" CssClass="auto-style7" ErrorMessage="Accept only Characters " ForeColor="Red" ValidationExpression="[a-zA-Z]+"></asp:RegularExpressionValidator>
        </p>
        <p>
            <strong>
            <asp:Label ID="Label4" runat="server" BorderColor="Black" CssClass="auto-style1" Text="Department Name"></asp:Label>
            <span class="auto-style2">*&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtdepartment" runat="server" Height="32px" Width="207px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtdepartment" Display="Dynamic" ErrorMessage="Required"></asp:RequiredFieldValidator>
            </span></strong>
        </p>
        <p>
            <strong>
            <asp:Label ID="Label5" runat="server" BorderColor="Black" CssClass="auto-style1" Text="Gender"></asp:Label>
            <span class="auto-style2">*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:RadioButton ID="rdomale" runat="server" CssClass="auto-style3" ForeColor="Black" GroupName="gender" Text="Male" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:RadioButton ID="rdofemle" runat="server" CssClass="auto-style3" ForeColor="Black" GroupName="gender" Text="Female" />
            &nbsp;&nbsp;&nbsp;&nbsp;
            </span></strong>
        </p>
        <p>
            <strong>
            <asp:Label ID="Label6" runat="server" BorderColor="Black" CssClass="auto-style1" Text="Designation"></asp:Label>
            <span class="auto-style2">*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtdesignation" runat="server" Height="32px" Width="207px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtdesignation" Display="Dynamic" ErrorMessage="Required"></asp:RequiredFieldValidator>
            </span></strong>
        </p>
        <p>
            <strong>
            <asp:Label ID="Label7" runat="server" BorderColor="Black" CssClass="auto-style1" Text="Email"></asp:Label>
            <span class="auto-style2">*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtemail" runat="server" Height="32px" Width="207px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtemail" Display="Dynamic" ErrorMessage="Required"></asp:RequiredFieldValidator>
            </span></strong>
        </p>
        <p class="auto-style8">
            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtemail" CssClass="auto-style7" Display="Dynamic" ErrorMessage="Email Format -abcd@gmail.com" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="Red"></asp:RegularExpressionValidator>
        </p>
        <p>
            <strong>
            <asp:Label ID="Label8" runat="server" BorderColor="Black" CssClass="auto-style1" Text="Mobile no."></asp:Label>
            <span class="auto-style2">*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtmobile" runat="server" Height="32px" Width="207px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtmobile" Display="Dynamic" ErrorMessage="Required"></asp:RequiredFieldValidator>
            </span></strong>
        </p>
        <p class="auto-style6">
            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtmobile" CssClass="auto-style7" Display="Dynamic" ErrorMessage="Number should be between 0 to 9" ForeColor="Red" SetFocusOnError="True" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
        </p>
        <p class="auto-style6">
            &nbsp;</p>
        <p>
            <strong>
            <asp:Label ID="Label9" runat="server" BorderColor="Black" CssClass="auto-style1" Text="State"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="stateDropDownList" runat="server" Height="25px" Width="169px" AutoPostBack="True" OnSelectedIndexChanged="stateDropDownList_SelectedIndexChanged">
            </asp:DropDownList>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label11" runat="server" BorderColor="Black" CssClass="auto-style1" Text="City"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="cityDropDownList" runat="server" Height="25px" Width="169px">
            </asp:DropDownList>
            </strong>
        </p>
        <p>
            <strong>
            <asp:Label ID="Label10" runat="server" BorderColor="Black" CssClass="auto-style1" Text="Salary"></asp:Label>
            <span class="auto-style2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtsalary" runat="server" Height="32px" Width="207px"></asp:TextBox>
            </span></strong>
        </p>
        <div class="auto-style4">
            <strong>
            <asp:Button ID="btninsert" runat="server" BorderStyle="Solid" CssClass="auto-style5" Height="44px" OnClientClick="return alert(&quot;Data Inserted Successfully...&quot;);" Text="Insert" Width="115px" OnClick="btninsert_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnupdate" runat="server" BorderStyle="Solid" CssClass="auto-style5" Height="44px" OnClientClick="return alert(&quot;Data Updated Successfully...&quot;);" Text="Update" Width="115px" OnClick="btnupdate_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btndelete" runat="server" BorderStyle="Solid" CssClass="auto-style5" Height="44px" OnClientClick="return alert(&quot;Data Deleted Successfully...&quot;);" Text="Delete" Width="115px" OnClick="btndelete_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnclear" runat="server" BorderStyle="Solid" CssClass="auto-style5" Height="44px" Text="Clear" Width="115px" OnClick="btnclear_Click" />
            </strong>
        </div>
    </form>
        </div>

</body>
</html>
