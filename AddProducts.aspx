<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddProducts.aspx.cs" Inherits="AddProducts" %>

<%@ Register Src="~/WebUserControl.ascx" TagPrefix="uc1" TagName="UserMenu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="css/bootstrap.css" rel="stylesheet" />
    <%--<link href="css/CustomStyle.css" rel="stylesheet" />--%>
    <link href="css/CustomCss.css" rel="stylesheet" />
     <style>
       body {
            background: url(Images/Disabled_Work1.jpeg) no-repeat;
            background-repeat: no-repeat;
            background-size: cover;
        }
        .abc{
            background:#6008045c !important;
            padding:30px;
        }
        label{
            color:white;
        }
          .table {
            background:#ffffffcc !important;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <uc1:UserMenu runat="server" ID="UserMenu" />
        <div class="container containers abc">
            <h1 class="col-md-offset-2" style="color:white">Add Products</h1>\
            <hr />
            <div class="form-horizontal">
                <div class="form-group">
                    <label class="col-md-2">Category</label>
                    <div class="col-md-4">
                        <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-control"></asp:DropDownList>
                        <asp:RequiredFieldValidator ForeColor="Red" InitialValue="Select" ControlToValidate="ddlCategory" ID="RequiredFieldValidator5" runat="server" ErrorMessage="Select Category" Display="Dynamic" ValidationGroup="g1"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-2">Prodcut Name</label>
                    <div class="col-md-4">
                        <asp:TextBox placeholder="Prodcut Name" ID="txtPrdName" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ForeColor="Red" ControlToValidate="txtPrdName" ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" Display="Dynamic" ValidationGroup="g1"> </asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-2">Upload Image</label>
                    <div class="col-md-4">
                        <asp:FileUpload ID="file" runat="server" />
                        <asp:RequiredFieldValidator ForeColor="Red" ControlToValidate="file" ID="RequiredFieldValidator2" runat="server" ErrorMessage="Upload Image" Display="Dynamic" ValidationGroup="g1"> </asp:RequiredFieldValidator>

                    </div>
                </div>

                <div class="form-group">
                    <label class="col-md-2">Price</label>
                    <div class="col-md-4">
                        <asp:TextBox placeholder="Price" ID="txtPrice" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ForeColor="Red" ControlToValidate="txtPrice" ID="RequiredFieldValidator3" runat="server" ErrorMessage="Enter Price" Display="Dynamic" ValidationGroup="g1"> </asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ValidationExpression="[0-9]+" ValidationGroup="g1" ControlToValidate="txtPrice" ID="RegularExpressionValidator1" runat="server" ErrorMessage="Enter Only Numbers" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-2">Product Description</label>
                    <div class="col-md-4">
                        <asp:TextBox placeholder="Product Description" TextMode="MultiLine" ID="txtProdescri" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ForeColor="Red" ControlToValidate="txtProdescri" ID="RequiredFieldValidator4" runat="server" ErrorMessage="Enter Description" Display="Dynamic" ValidationGroup="g1"> </asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-1 col-md-offset-2">
                        <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-primary" Text="Add" ValidationGroup="g1" OnClick="btnAdd_Click" />
                    </div>
                </div>
            </div>
            <h1 style="text-align:center">My Products</h1>
            <hr />
            <table class="table table-bordered table-condensed">
                <asp:Repeater ID="rpt" runat="server" OnItemCommand="rpt_ItemCommand">
                    <HeaderTemplate>
                        <tr>
                            <th>Category</th>
                            <th>Product Name</th>
                            <th>Image</th>
                            <th>Price</th>
                            <th>Product Description</th>
                            <th class="col-md-1 text-center">Delete</th>
                        </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td><%#Eval("CategoryName") %></td>
                            <td><%#Eval("ProductName") %></td>
                            <td>
                                <asp:Image ID="img" runat="server" ImageUrl='<%#Eval("PrdImg") %>' Height="50" Width="50" />
                            </td>
                            <td><%#Eval("Price") %></td>
                            <td><%#Eval("ProductDesc") %></td>
                            <td class="text-center">
                                <asp:LinkButton CssClass="btn btn-primary" CommandArgument='<%#Eval("ProductId") %>' ID="lknDelete" runat="server" CommandName="Delete">
                                    <i class="glyphicon glyphicon-remove"></i>
                                </asp:LinkButton>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </table>
        </div>
    </form>
</body>
</html>
