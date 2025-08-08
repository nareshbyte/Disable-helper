<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Ngo_login.aspx.cs" Inherits="Ngo_login" %>

<%@ Register Src="~/WebUserControl.ascx" TagPrefix="uc1" TagName="WebUserControl" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
      <link href="css/bootstrap.min.css" rel="stylesheet" />

    <style>
        body {
            background: url('Images/handicap7.jpg') center center fixed;
            background-size: cover;
           
           
        }

        .form-area {
            width: 500px;
            height: 450px;
            margin: 60px auto 0;
            position: relative;
            background: rgba(0,0,0,0.4);
            text-align: center;
            margin-top: 60px;
            padding: 35px;
            border: 3px solid #fff;
            -webkit-border-radius: 70px 0 70px 0;
            -moz-border-radius: 70px 0 70px 0;
            border-radius: 70px 0 70px 0;
            top: 50px;
        }

        input {
            width: 100%;
            height: 50px;
            border-radius: 15px 0 15px 0;
            border: 2px solid #fff;
            margin-bottom: 15px;
            background-color: transparent;
            color: #fff;
        }

        .form-area p {
            text-align: left;
            color: #fff;
            text-transform: uppercase;
            font-weight: bold;
        }

        .btn1 {
            display: inline-block;
            height: 40px;
            width: 150px;
            overflow: hidden;
            position: relative;
            text-align: center;
            background: #6dd124 !important;
            border-radius: 25px;
            color: #fff;
            text-transform: uppercase;
            margin-top: 20px;
            cursor: pointer;
        }

        .btn1 {
            text-align: center;
            width: 90%;
        }

            .btn1:hover {
                color: yellow;
            }
            #txt_Email{
                color:white;
            }
             #txt_Password{
                color:white;
            }
    </style>
    <title></title>
</head>
<body>
    <uc1:WebUserControl runat="server" ID="WebUserControl" />
    <form id="form1" runat="server">
        <div class="form-area">
            <h2 style="color: white">Disable Login</h2>
            <p>Emailid</p>
            <asp:TextBox AutoCompleteType="Disabled" ID="txt_Email" required runat="server" />
            <p>Password</p>
            <asp:TextBox TextMode="Password" ID="txt_Password" required  runat="server" />
            <asp:Button Text="Submit" ID="btnsave" CssClass="btn1 btn btn-primary" OnClick="btnsave_Click" runat="server" />
       <%--<a href="ForgotPassword.aspx" style="color:white; font-size:medium">Forgot Password</a>--%>
            </div>
    </form>
</body>
</html>
