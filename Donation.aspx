<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Donation.aspx.cs" Inherits="Donation" %>

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
        <div class="container containers" style="margin-top: 140px;">
            <h1 style="margin-left: 210px;">Help Us </h1>
            <hr />
            <div class="form-horizontal">
                <div class="form-group">
                    <label class="col-md-2">Donation Type</label>
                    <div class="col-md-4">
                        <asp:TextBox runat="server" ID="txtfname" CssClass="form-control " />
                        <asp:RequiredFieldValidator ForeColor="Red" ControlToValidate="txtfname" ID="RequiredFieldValidator3" runat="server" ErrorMessage="Enter Name" Display="Dynamic" ValidationGroup="g1"> </asp:RequiredFieldValidator>
                        
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-1 col-md-offset-2">
                        <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-primary" Text="Add" OnClick="btnAdd_Click" ValidationGroup="g1" />
                    </div>


                </div>
            </div>
        </div>

    </form>
</body>
</html>
