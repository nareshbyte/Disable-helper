<%@ Page Language="C#" AutoEventWireup="true" CodeFile="view_donation.aspx.cs" Inherits="view_donation" %>

<%@ Register Src="~/WebUserControl.ascx" TagPrefix="uc1" TagName="WebUserControl" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/CustomCss.css" rel="stylesheet" />
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
                             <th>Disable Person Name </th>
                            <th>Donation Type</th>
                            
                             <th> Image</th>
                            <th>Description</th>
                             
                            <th> Donor Name </th>
                           
                            <th> Donor Help </th>
                           
                        </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td><%#Eval("Name") %></td>
                             <td><%#Eval("Donation_type") %></td>
                            <td>
                                    <asp:Image ID="img" runat="server" ImageUrl='<%#Eval("Desc_pic") %>' Height="50" Width="50" /></td>
                            <td><%#Eval("Description") %></td>
                             <td><%#Eval("First_Name") %></td>
                            <td><%#Eval("Donation_des") %></td>
                          
                          
                           
                            
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </table>
        </div>
    </form>
</body>
</html>
