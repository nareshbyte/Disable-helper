<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MyCart.aspx.cs" Inherits="MyCart" %>

<%@ Register Src="~/WebUserControl.ascx" TagPrefix="uc1" TagName="UserMenu" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
  
    <link href="css/bootstrap.css" rel="stylesheet" />
    <link href="css/CustomCss.css" rel="stylesheet" />
    <style>
      
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <uc1:UserMenu runat="server" ID="UserMenu" />
        <div class="container containers">
            <br />
            <div id="DivCart" runat="server">
                <h2 class="page-header">Cart Details</h2>
                <table class="table table-bordered table-condensed" style="">
                    <asp:Repeater ID="rpt" runat="server">
                        <HeaderTemplate>
                            <tr>
                                <th>Product Name</th>
                                <th>Image</th>
                                <th>Price</th>
                                <th>Qty</th>
                                <th>Total</th>
                            </tr>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td><%#Eval("ProductName") %></td>
                                <td>
                                    <asp:Image ID="img" runat="server" ImageUrl='<%#Eval("PrdImg") %>' Height="50" Width="50" /></td>
                                <td><%#Eval("Price") %></td>
                                <td><%#Eval("Qty") %></td>
                                <td class="total"><%#Eval("SubTotal") %></td>
                                <asp:HiddenField ID="hfProductId" runat="server" Value='<%#Eval("ProductId") %>' />
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </table>
                <b>
                    <h2 id="Total">Total amount:</h2>
                   
                </b>
                <div class="col-md-2" style="text-align: left;">
                    <asp:Button ID="btnConfirm" runat="server" Text="Confirm Order" CssClass="btn btn-primary" OnClick="btnConfirm_Click" />
                </div>
            </div>
            <div class="alert alert-danger" id="divstatus" runat="server">
                <h2 class="text-center">Your Cart Is Empty</h2>
            </div>

        </div>
        <div class="form-horizontal">
            <div class="container">
                <div id="divBankDetails" runat="server">
                    <div class="form-group">
                        <div class="col-md-4">
                            <label>Payment Type</label>
                            <asp:DropDownList AutoPostBack="true" ID="ddlType" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlType_SelectedIndexChanged">
                                <asp:ListItem>Select</asp:ListItem>
                                <asp:ListItem>Cash On Delivery</asp:ListItem>
                                <asp:ListItem>Net Banking</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>
                <div id="divAddress" runat="server">
                    <div class="form-group">
                        <div class="col-md-4">
                            <label>Area Code</label>
                            <asp:TextBox ID="txtCode" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-4">
                            <label>Address</label>
                            <asp:TextBox ID="txtAddress" TextMode="MultiLine" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div id="Divbank" runat="server">
                    <div class="form-group">
                        <div class="col-md-4">
                            <label>Account No</label>
                            <asp:TextBox ID="txtAccount" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-4">
                            <label>C.V.V</label>
                            <asp:TextBox ID="txtCvv" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group" id="divBtn" runat="server">
                <div class="col-md-1 col-md-offset-1">
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-primary" OnClick="btnSubmit_Click1" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>
<script src="js/jquery.js"></script>
<script>
    var Total = 0;
    $('.total').each(function () {
        Total += Number($(this).text());
    });
    $('#Total').html("Total amount: " + Total);
   // $('#Com').html("Total Commission: " + (Total * 20) / (100));
</script>
