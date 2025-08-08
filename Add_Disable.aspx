<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Add_Disable.aspx.cs" Inherits="Add_Disable" %>

<%@ Register Src="~/WebUserControl.ascx" TagPrefix="uc1" TagName="WebUserControl" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/Custom.css" rel="stylesheet" />
    <style>
        .btn-primary {
            background-color: rgba(255, 0, 0, 0.48);
        }

        /*.css::first-line {
                background-color: rgba(255, 0, 188, 0.48);
                border-radius: 10px;
                /*box-shadow: 4px 7px 11px #EFEFEF;
                border-radius: 10px;
            }*/
        body {
            background: url('Images/handicap4.jpg') no-repeat;
            background-size: cover;
        }

        .panel {
            background-color: #4141417a !important;
        }

        .panel-success {
            margin-top: 86px !important;
        }

            .panel-success > .panel-heading {
                background-color: #37644570;
            }

            .panel-success > .panel-heading {
                color: white;
                text-align: center;
            }

        label {
            color: white;
        }

        .form-control {
            color: white !important;
            background-color: #a0502185 !important;
        }
    </style>
    <title></title>
</head>
<body>
    <uc1:WebUserControl runat="server" ID="WebUserControl" />
    <form id="form1" runat="server">
        <div class="container">
            <div class="form-horizontal">
                <div class="panel panel-success">

                    <div class="panel panel-heading">
                        <h2>Add Disable Person</h2>
                    </div>

                    <div class="panel panel-body">
                        <div class=" col-md-offset-3">
                            <div class="form-group">
                                <label class="col-md-2">Name</label>
                                <div class="col-md-4">
                                    <asp:TextBox runat="server" ID="txtfname" placeholder="Firstname"
                                        CssClass="form-control " />
                                    <asp:RequiredFieldValidator ForeColor="Red" ControlToValidate="txtfname" ID="RequiredFieldValidator3" runat="server" ErrorMessage="Enter Name" Display="Dynamic" ValidationGroup="g1"> </asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ValidationExpression="[a-z A-Z]+" ValidationGroup="g1" ControlToValidate="txtfname" ID="RegularExpressionValidator1" runat="server" ErrorMessage="Enter Only Alphabates" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-2">Gender</label>
                                <div class="col-md-4">
                                    <asp:DropDownList runat="server" ID="ddlgender" CssClass="form-control ">
                                        <asp:ListItem>Select</asp:ListItem>
                                        <asp:ListItem>Male</asp:ListItem>
                                        <asp:ListItem>FeMale</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ForeColor="Red" InitialValue="Select" ControlToValidate="ddlgender" ID="RequiredFieldValidator5" runat="server" ErrorMessage="Select Gender" Display="Dynamic" ValidationGroup="g1"> </asp:RequiredFieldValidator>

                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2">Email Id</label>
                                <div class="col-md-4">
                                    <asp:TextBox runat="server" ID="txtemailid" placeholder="Enter Email Id"
                                        CssClass="form-control " />
                                    <asp:RequiredFieldValidator ForeColor="Red" ControlToValidate="txtemailid" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Email" Display="Dynamic" ValidationGroup="g1"> </asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="g1" ControlToValidate="txtemailid" ID="RegularExpressionValidator2" runat="server" ErrorMessage="Enter Proper Email ID" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2">Password</label>
                                <div class="col-md-4">
                                    <asp:TextBox runat="server" TextMode="Password" ID="txtpwd" placeholder="Password"
                                        CssClass="form-control " />
                                    <asp:RequiredFieldValidator ForeColor="Red" ControlToValidate="txtpwd" ID="RequiredFieldValidator8" runat="server" ErrorMessage="Enter Email" Display="Dynamic" ValidationGroup="g1"> </asp:RequiredFieldValidator>
                                    <%--<asp:RegularExpressionValidator ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="g1" ControlToValidate="txtemailid" ID="RegularExpressionValidator5" runat="server" ErrorMessage="Enter Proper Email ID" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>--%>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2">Mobile Number</label>
                                <div class="col-md-4">
                                    <asp:TextBox runat="server" ID="txtmbnumber" placeholder=" Mobile Number"
                                        CssClass="form-control " />
                                    <asp:RequiredFieldValidator ForeColor="Red" ControlToValidate="txtmbnumber" ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Mobile Number" Display="Dynamic" ValidationGroup="g1"> </asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ValidationExpression="^[6789]\d{9}$" ValidationGroup="g1" ControlToValidate="txtmbnumber" ID="RegularExpressionValidator3" runat="server" ErrorMessage="Enter Only Alphabates" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
                                </div>
                            </div>


                            <div class="form-group">
                                <label class="col-md-2">Adress</label>
                                <div class="col-md-4">
                                    <asp:TextBox runat="server" TextMode="MultiLine" ID="txtadress" placeholder="Enter Adress"
                                        CssClass="form-control " />
                                    <asp:RequiredFieldValidator ForeColor="Red" ControlToValidate="txtadress" ID="RequiredFieldValidator7" runat="server" ErrorMessage="Enter Address" Display="Dynamic" ValidationGroup="g1"> </asp:RequiredFieldValidator>

                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Button Style="margin-left: 185px;" ValidationGroup="g1" Text="Submit" CssClass="btn  col-md-3 btn-primary" ID="btnlogin" runat="server" OnClick="btnlogin_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <table class="table table-bordered table-condensed" style=" margin: 0 auto;background:#414e4596">
                    <asp:Repeater ID="rpt" runat="server" OnItemCommand="rpt_ItemCommand">
                        <HeaderTemplate>
                            <tr>
                                <th>Sl.No</th>
                                <th>Name</th>
                                <th>Mobile No.</th>
                                <th>Email</th>
                                <th>Password</th>
                                <th>Gender</th>
                                <th>Address</th>

                                <th class="col-md-1 text-center">Delete</th>
                            </tr>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td><%#Container.ItemIndex+1 %></td>
                                <td><%#Eval("Name") %></td>
                                <td><%#Eval("Mobilenumber") %></td>
                                <td><%#Eval("Email") %></td>
                                <td><%#Eval("Password") %></td>
                                <td><%#Eval("Gender") %></td>
                                <td><%#Eval("Address") %></td>
                                
                                <td class="text-center">
                                    <asp:LinkButton ID="lnkDelete" runat="server" CssClass="btn btn-primary" CommandArgument='<%#Eval("Handicap_id") %>' CommandName="Delete">
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
