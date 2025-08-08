<%@ Page Language="C#" AutoEventWireup="true" CodeFile="user_list.aspx.cs" Inherits="user_list" %>

<%@ Register Src="~/WebUserControl.ascx" TagPrefix="uc1" TagName="WebUserControl" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <link href="css/bootstrap.css" rel="stylesheet" />
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
            <h2 class="page-header">User List</h2>
            <table class="table table-bordered table-condensed">
                <asp:Repeater ID="rpt" runat="server" OnItemCommand="rpt_ItemCommand">
                    <HeaderTemplate>
                        <tr>
                            <th>First  Name</th>
                           <th>Last Name</th>
                            <th>Gender</th>
                            <th>Mobile Number</th>
                            <th>Email Id </th>
                            
                            <th>Address</th>
                             <th>Delete</th>
                            
                        </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td><%#Eval("First_Name") %></td>
                            
                            <td><%#Eval("Last_Name") %></td>
                             <td><%#Eval("Gender") %></td>
                            <td><%#Eval("Mob_no") %></td>
                            <td><%#Eval("Email_id") %></td>
                            
                            <td><%#Eval("Address") %></td>
                            <td class="text-center">
                                    <asp:LinkButton ID="lnkDelete" runat="server" CssClass="btn btn-primary" CommandArgument='<%#Eval("User_id") %>' CommandName="Delete">
                                    <i class="glyphicon glyphicon-remove"></i>
                                    </asp:LinkButton>
                                </td>
                           
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </table>
          <%--  <div id="divresult" runat="server" class="alert alert-danger">
                <h2 class="text-center">No Records Available</h2>
            </div>--%>
        </div>
    </form>
</body>
</html>
