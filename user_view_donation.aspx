<%@ Page Language="C#" AutoEventWireup="true" CodeFile="user_view_donation.aspx.cs" Inherits="user_view_donation" %>

<%@ Register Src="~/WebUserControl.ascx" TagPrefix="uc1" TagName="WebUserControl" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/CustomCss.css" rel="stylesheet" />
       <style>
        .containers {
            box-shadow: 0 2px 4px 0 rgba(0,0,0,0.16),0 2px 10px 0 rgba(0,0,0,0.12);
             margin-top: 150px;
        }

        .page-header {
            border-bottom: 1px solid;
        }
           </style>
    <title></title>
</head>
<body>
    <uc1:WebUserControl runat="server" ID="WebUserControl" />
    <form id="form1" runat="server">
          <div class="container containers">
         <h1 style="text-align:center">My Donations</h1>
            <hr />
            <table class="table table-bordered table-condensed">
                <asp:Repeater ID="rpt" runat="server">
                    <HeaderTemplate>
                        <tr>
                             <th>Donor Name</th>
                            <th>Donation Type</th>
                            <th> Donation</th>
                             <th> Mobile</th>
                             <th> Email</th>
                           
                            
                           
                        </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td><%#Eval("First_Name") %></td>
                             <td><%#Eval("Donation_type") %></td>
                            <td><%#Eval("Donation_des") %></td>
                            <td><%#Eval("Mob_no") %></td>
                            <td><%#Eval("Email_id") %></td>
                          
                           
                            
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </table>
        </div>
    </form>
</body>
</html>
