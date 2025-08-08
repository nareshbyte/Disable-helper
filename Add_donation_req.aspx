<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Add_donation_req.aspx.cs" Inherits="Add_donation_req" %>

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
        label{
            color:white;
        }
        .table {
            background:#ffffffcc !important;
        }
    </style>
    <title></title>
</head>
<body>
    <uc1:WebUserControl runat="server" ID="WebUserControl" />
    <form id="form1" runat="server">
        <div class="container abc containers" style="margin-top: 140px;">
            <h1 style="margin-left: 210px;color:white">Donation Request</h1>
            <hr />
            <div class="form-horizontal">
                <div class="form-group">
                    <label class="col-md-2">Donation Type</label>
                    <div class="col-md-4">
                        <asp:TextBox runat="server" ID="txtfname" CssClass="form-control " />
                        <asp:RequiredFieldValidator ForeColor="Red" ControlToValidate="txtfname" ID="RequiredFieldValidator3" runat="server" ErrorMessage="Enter Name" Display="Dynamic" ValidationGroup="g1"> </asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ValidationExpression="[a-z A-Z]+" ValidationGroup="g1" ControlToValidate="txtfname" ID="RegularExpressionValidator1" runat="server" ErrorMessage="Enter Only Alphabates" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-md-2">Upload Image</label>
                    <div class="col-md-4">
                        <asp:FileUpload CssClass="form-control" ID="file" runat="server" />
                        <asp:RequiredFieldValidator ForeColor="Red" ControlToValidate="file" ID="RequiredFieldValidator2" runat="server" ErrorMessage="Upload Image" Display="Dynamic" ValidationGroup="g1"> </asp:RequiredFieldValidator>

                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-2">Description</label>
                    <div class="col-md-4">
                        <asp:TextBox runat="server" ID="txtdescr" TextMode="MultiLine"
                            CssClass="form-control " />
                        <asp:RequiredFieldValidator ForeColor="Red" ControlToValidate="txtfname" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Description" Display="Dynamic" ValidationGroup="g1"> </asp:RequiredFieldValidator>

                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-1 col-md-offset-2">
                        <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-primary" Text="Add" OnClick="btnAdd_Click" ValidationGroup="g1" />
                    </div>


                </div>
            </div>
             <table class="table table-bordered table-condensed" style=" margin: 0 auto;">
                    <asp:Repeater ID="rpt" runat="server" OnItemCommand="rpt_ItemCommand">
                        <HeaderTemplate>
                            <tr>
                                <th>Sl.No</th>
                                <th>Donation Type</th>
                                <th>Image</th>
                                <th>Description</th>
                                

                                <th class="col-md-1 text-center">Delete</th>
                            </tr>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td><%#Container.ItemIndex+1 %></td>
                                <td><%#Eval("Donation_type") %></td>
                                 <td> <asp:Image ID="img" Height="50" Width="50" runat="server" ImageUrl='<%#Eval("Desc_pic") %>' /></td>
                                <td><%#Eval("Description") %></td>
                               
                                
                                <td class="text-center">
                                    <asp:LinkButton ID="lnkDelete" runat="server" CssClass="btn btn-primary" CommandArgument='<%#Eval("Donation_req_id") %>' CommandName="Delete">
                                    <i class="glyphicon glyphicon-remove"></i>
                                    </asp:LinkButton>
                                </td>

                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </table>
        </div>

        </div>
    </form>
</body>
</html>
