<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GuestImages.aspx.cs" Inherits="GuestImages" %>

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
            height: 320px;
            width: 280px;
            box-shadow: 0 2px 4px 0 rgba(0,0,0,0.16),0 2px 10px 0 rgba(0,0,0,0.12);
            background: #fff;
            padding: 20px 20px 50px 20px;
            margin-bottom: 20px;
        }

            .colmd3:hover {
                -webkit-transform: scale(1.1); /* Safari and Chrome */
                -moz-transform: scale(1.1); /* Firefox */
                -ms-transform: scale(1.1); /* IE 9 */
                -o-transform: scale(1.1); /* Opera */
                transform: scale(1.1);
                cursor: pointer;
            }

        img {
            width: 100%;
            height: 100%;
        }

        body {
            background: rgba(236, 227, 226, 0.82);
            font-family: 'Century Gothic';
        }

        .col-md-3 {
            text-align: left;
        }

        .containers {
            background: #fff;
            min-height: 550px;
            margin-top: 55px;
        }

        body {
            font-family: 'Century Gothic';
        }


        .col-md-2 {
            text-align: left;
        }

        .anc {
            font-family: 'Century Gothic';
        }

        h1 {
            font-size: 40px;
        }

        #txtSearch {
            height: 80px;
            font-size: 50px;
        }

        .ancs {
            text-decoration: none !important;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <uc1:UserMenu runat="server" ID="UserMenu" />
        <br />
        <div class="container-fluid containers">
            <div class="form-horizontal">
                <div class="form-group">
                    <div class="col-md-4" style="margin-top: 25px;">
                        <asp:DropDownList AutoPostBack="true" ID="ddlCategory" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged">
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Repeater ID="rpt" runat="server">
                        <ItemTemplate>
                            <div class="col-md-3">
                                <div class="colmd3">
                                    <a class="ancs" href="BuyDetails.aspx?Id=<%#Eval("ProductId") %>">
                                        <asp:Image ID="img" runat="server" ImageUrl='<%#Eval("PrdImg")%>' />
                                        <b><%#Eval("ProductName") %> </b>
                                        <br />
                                        <b>Price :<%#Eval("Price") %>/- </b>
                                    </a>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
            <div id="divSearch" class="alert alert-danger" runat="server">
                <h2 class="text-center">Search Not Found</h2>
            </div>
        </div>
    </form>
</body>
</html>
