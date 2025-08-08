<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Donation_req_to_user.aspx.cs" Inherits="Donation_req_to_user" %>

<%@ Register Src="~/WebUserControl.ascx" TagPrefix="uc1" TagName="WebUserControl" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/CustomCss.css" rel="stylesheet" />
    <style>
        body {
            background: url(Images/diable2.jpg) no-repeat;
            background-repeat: no-repeat;
            background-size: cover;
        }
        .abc{
            background:#6008045c !important;
            padding:30px;
        }

        .box {
            padding: 20px;
            text-align: center;
            margin: 20px;
            border: 1px solid black;
                color: white;
        }
    </style>
    <title></title>
</head>
<body>
    <uc1:WebUserControl runat="server" ID="WebUserControl" />
    <form id="form1" runat="server">
        <div class="container abc containers">
            
                <h1 style="text-align: center;color:white">Donation Request </h1>
            <div class="">
                <div class="table table-bordered">
                    <asp:Repeater ID="rpt" runat="server">
                        <ItemTemplate>
                            <div class="col-md-3 box">
                                <tr>
                                    <div class="form-group">
                                        <td>
                                            <asp:Image ID="img" Height="250px" Width="250px" runat="server" ImageUrl='<%#Eval("Desc_pic") %>' /></td>
                                        <hr />
                                    </div>
                                </tr>
                                <tr>


                                    <label>Donation Type:</label>
                                    <td><%#Eval("Donation_type") %></td>

                                </tr>
                                <tr>


                                    <label>Description :</label>
                                    <td><%#Eval("Description") %></td>

                                </tr>
                                <br>
                                <tr>


                                    <label>Name:</label>
                                    <td><%#Eval("Name") %></td>

                                </tr>
                                <br />
                                <tr>


                                    <label>Mobilenumber:</label>
                                    <td><%#Eval("Mobilenumber") %></td>

                                </tr>
                                <br />
                                <tr>


                                    <label>Address:</label>
                                    <td><%#Eval("Address") %></td>

                                </tr>
                                <br />

                                <br />
                                <td class="text-center">
                                    <a href="Donation.aspx?donation=<%#Eval("Donation_req_id")%>&handid=<%#Eval("Handicap_id")%>" class="btn btn-success">Helpus</a>
                                </td>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
                  </div>
            </div>
      

    </form>
</body>
</html>
