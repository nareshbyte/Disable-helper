<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BuyDetails.aspx.cs" Inherits="BuyDetails" %>

<%@ Register Src="~/WebUserControl.ascx" TagPrefix="uc1" TagName="UserMenu" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="css/bootstrap.css" rel="stylesheet" />
    <link href="css/CustomStyle.css" rel="stylesheet" />
    <style>
        .colmd3 {
            transition: all 1s ease;
            min-height: 350px;
            box-shadow: 0 2px 4px 0 rgba(0,0,0,0.16),0 2px 10px 0 rgba(0,0,0,0.12);
            background: #fff;
            padding: 20px 20px 20px 20px;
            margin-bottom: 20px;
        }

        img {
            width: 100% !important;
            height: 250px !important;
        }

        body {
            background: whitesmoke;
            font-family: 'Century Gothic';
        }

        .colmd1 {
            margin-top: -20px;
            margin-left: -16px;
        }

        .containers {
            margin-top: 0px;
        }

        .colmd6 {
            box-shadow: 0 2px 4px 0 rgba(0,0,0,0.16),0 2px 10px 0 rgba(0,0,0,0.12);
            background: #fff;
            padding: 20px 20px 20px 20px;
        }

        hr {
            margin-bottom: 0px;
        }

        h1 {
            margin-left: 18px !important;
        }

        .page-header {
            border-bottom: 1px solid;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <uc1:UserMenu runat="server" ID="UserMenu" />
        <br />
        <br />
        <br />
        <div class="container-fluid containers">
            <div id="divmenu" runat="server">
                <h1 class="page-header text-uppercase">Product Details</h1>
                <asp:Repeater ID="rpt" runat="server" OnItemCommand="rpt_ItemCommand">
                    <ItemTemplate>
                        <div class="col-md-5">
                            <div class="colmd3 ">
                                <asp:Image ID="img" runat="server" CssClass="img-responsive" ImageUrl='<%#Eval("PrdImg")%>' />
                                <b>Price :<asp:Label ID="lblPrice" runat="server" Text='<%#Eval("Price") %>'></asp:Label>/-</b>
                                <hr style="margin-bottom: 0px;" />
                                <b>Description :<%#Eval("ProductDesc") %></b><hr />
                                <b>Qty: </b>

                                <asp:DropDownList ID="ddlQty" runat="server">
                                    <asp:ListItem>1</asp:ListItem>
                                    <asp:ListItem>2</asp:ListItem>
                                    <asp:ListItem>3</asp:ListItem>
                                    <asp:ListItem>4</asp:ListItem>
                                    <asp:ListItem>5</asp:ListItem>
                                    <asp:ListItem>6</asp:ListItem>
                                </asp:DropDownList><hr />
                                <br />
                                <div class="col-md-4 col-md-offset-3 colmd1">
                                    <asp:Button CommandArgument='<%#Eval("ProductId") %>' CommandName="Cart" CssClass="btn btn-primary" ID="BtnCart" runat="server" Text="Add To Cart" />
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            <div class="col-md-6 col-md-offset-3" id="divBankDetails" runat="server">
                <div class="colmd6">
                    <h2 class="col-md-offset-2">Address Details</h2>
                    <hr />
                    <div class="form-horizontal">
                        <div class="form-group">
                            <label class="col-md-2">PinCode</label>
                            <div class="col-md-6">
                                <asp:TextBox ID="txtPinCode" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ForeColor="Red" ControlToValidate="txtPinCode" Display="Dynamic" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter PinCode" ValidationGroup="g1"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ForeColor="Red" ControlToValidate="txtPinCode" Display="Dynamic" ValidationExpression="[0-9]+" runat="server" ErrorMessage="Enter Only Numbers"></asp:RegularExpressionValidator>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2">Address</label>
                            <div class="col-md-6">
                                <asp:TextBox ID="txtAddress" TextMode="MultiLine" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ForeColor="Red" ControlToValidate="txtAddress" Display="Dynamic" ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Address" ValidationGroup="g1"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-1 col-md-offset-2">
                                <asp:Button ValidationGroup="g1" ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-primary" OnClick="btnSubmit_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
