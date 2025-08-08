<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddCategory.aspx.cs" Inherits="AddCategory" %>

<%@ Register Src="~/WebUserControl.ascx" TagPrefix="uc1" TagName="UserMenu" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="css/bootstrap.css" rel="stylesheet" />
   
    <link href="css/CustomCss.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <uc1:UserMenu runat="server" ID="UserMenu" />
        <div class="container containers">
            <h1 style="text-align:center">Add Category</h1>
            <hr />
            <div class="form-horizontal">
                <div class="form-group">
                    <label class="col-md-2 col-md-offset-2">Category Name</label>
                    <div class="col-md-4 ">
                        <asp:TextBox placeholder="Category Name" ID="txtCategory" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ForeColor="Red" ControlToValidate="txtCategory" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Category" Display="Dynamic" ValidationGroup="g1"> </asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group">
                    <div class=" col-md-offset-2">
                        <asp:Button ID="btnAdd" ValidationGroup="g1" CssClass="btn btn-primary col-md-offset-4 col-md-2" style="text-align:center" runat="server" Text="Add" OnClick="btnAdd_Click" />
                    </div>
                </div>
            </div>
            <table class="table table-bordered table-condensed">
                <asp:Repeater ID="rpt" runat="server" OnItemCommand="rpt_ItemCommand">
                    <HeaderTemplate>
                        <tr>
                            <th>Sl.No</th>
                            <th>Category Name</th>
                            <th class="text-center col-md-1">Delete</th>
                        </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td><%#Container.ItemIndex+1 %></td>
                            <td><%#Eval("CategoryName") %></td>
                            <td class="text-center">
                                <asp:LinkButton ID="lnkDelete" runat="server" CssClass="btn btn-primary" CommandArgument='<%#Eval("CategoryId") %>' CommandName="Delete">
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
