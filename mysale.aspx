<%@ Page Language="C#" AutoEventWireup="true" CodeFile="mysale.aspx.cs" Inherits="mysale" %>

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
    <form id="form1" runat="server">
        <uc1:WebUserControl runat="server" ID="WebUserControl" />
        <div class="container containers">
            <h2 class="page-header">My Sales Details</h2>
            <table class="table table-bordered table-condensed">
                <asp:Repeater ID="rpt" runat="server">
                    <HeaderTemplate>
                        <tr>
                            
                           
                            <th>Product Name</th>
                            <th class="col-md-2" style="text-align: left">Product Image</th>
                            <th>Price</th>
                            <th>Qty</th>
                            <th>Total</th>
                        </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                             
                            <td><%#Eval("ProductName") %></td>
                            <td>
                                <asp:Image ID="img" runat="server" Height="50" Width="50" ImageUrl='<%#Eval("PrdImg") %>' />
                            </td>
                            <td><%#Eval("Price") %></td>
                            <td><%#Eval("Qty") %></td>
                            <td><%#Eval("SubTotal") %></td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </table>
            <div id="divresult" runat="server" class="alert alert-danger">
                <h2 class="text-center">No Records Available</h2>
            </div>
        </div>
    </form>
</body>
</html>
