<%@ Control Language="C#" AutoEventWireup="true" CodeFile="WebUserControl.ascx.cs" Inherits="WebUserControl" %>
<link href="bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet" />
<style>
    .navbar-default {
        height: 80px;
        padding-top: 15px;
        background-color:#60ec19c7 !important;
        border-color: black;
        border-radius: 0px;
    }
    .navbar-default .navbar-nav > li > a:hover, .navbar-default .navbar-nav > li > a:focus {
    color: black !important;
    background-color: white !important;
}

    .anc {
        font-size: 18px;
        font-family: 'Century Gothic';
        color: #fff !important;
    }

        .anc:hover {
         
            color: #F44336 !important;
        }

    .heading {
        font-size: 18px;
        font-family: 'Century Gothic';
        color: #fff !important;
    }
   
    /*.navbar-nav {
       background-color: #ec1928 !important;
    }*/
</style>


<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <%-- <a class="navbar-brand" href="#"><img src="img/tvs8.jpg" /></a>--%>
            <a class="navbar-brand text-capitalize" style="color: white; font-size: 25px;" href="#">Disable  helper</a>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <%if (Session["AdminId"] != null)
                  {  %>
                 <li>
                    <a class="anc" href="Add_Disable.aspx"><i class="glyphicon glyphicon glyphicon-plus"></i>Add Disables</a>
                </li>
                 <li>
                    <a class="anc" href="view_donation.aspx"><i class="glyphicon glyphicon glyphicon-plus"></i>Donation Box</a>
                </li>
                 <li>
                    <a class="anc" href="user_list.aspx"><i class="glyphicon glyphicon glyphicon-list"></i>User List</a>
                </li>
                 <li>
                    <a class="anc" href="AddCategory.aspx"><i class="glyphicon glyphicon glyphicon-plus"></i>Add Category</a>
                </li>
               
              
                   <li>
                    <a class="anc" href="LOGOUT.aspx">Logout</a>
                </li>
               
                
              <%--  <li>
                    <a class="anc" href="Appliedusers.aspx">Request List</a>
                </li>
                 <li>
                    <a class="anc" href="Userpaymentlist.aspx">Payment List</a>
                </li>
                <li>
                    <a class="anc" href="Logout.aspx">Logout</a>
                </li>--%>
                <%}
                  else if (Session["User_id"] != null)
                  { %>
               
                <li>
                    <a class="anc" href="Donation_req_to_user.aspx">Donation Req</a>
                </li>
                  <li>
                    <a class="anc" href="user_donation.aspx"> My Donation</a>
                </li>
                 <li>
                    <a class="anc" href="GuestImages.aspx"> Products</a>
                </li>
               
                
                 <li>
                    <a class="anc" href="MyCart.aspx"><i class="glyphicon glyphicon-shopping-cart"></i> My Cart</a>
                </li>
                <li>
                    <a class="anc" href="MyPurchaseDetails.aspx"><i class="glyphicon glyphicon-shopping-cart"></i> My Purchase</a>
                </li>
                 <li>
                    <a class="anc" href="LOGOUT.aspx">Logout</a>
                </li>
                 <%--<li>
                    <a class="anc" href="Mystatus.aspx">Mystatus</a>
                </li>
                 <li>
                    <a class="anc" href="Emidetails.aspx">EMI-Details</a>
                </li>--%>
                 <%--<li>
                    <a class="anc" href="Services.aspx">Services</a>
                </li>--%>
               
               
                <%}
                  else if (Session["Handicap_id"] != null)
                  { %>
                 <li>
                    <a class="anc" href="Add_donation_req.aspx">Donation Req</a>
                </li>
                 <li>
                    <a class="anc" href="user_view_donation.aspx"><i class="glyphicon glyphicon glyphicon-plus"></i>Donors Help</a>
                </li>
                 <li>
                    <a class="anc" href="AddProducts.aspx">Add Products</a>
                </li>
                
                <li>
                    <a class="anc" href="mysale.aspx">My Sale </a>
                </li>
                <li>
                    <a class="anc" href="LOGOUT.aspx">Logout</a>
                </li>
                <%}
                  else
                  {%>
                <li>
                    <a class="anc" href="Default.aspx"><i class="glyphicon glyphicon glyphicon-home"></i>Home</a>
                </li>
                 <li>
                    <a class="anc" href="User_registration.aspx"><i class="glyphicon glyphicon glyphicon-list"></i>Register</a>
                </li>
                <li>
                    <a class="anc" href="Login.aspx"><i class="glyphicon glyphicon glyphicon-log-in"></i>Admin Login</a>
                </li>
               
                 <li>
                    <a class="anc" href="User_login.aspx"><i class="glyphicon glyphicon glyphicon-log-in"></i>User Login</a>
                </li>
                <li>
                    <a class="anc" href="Ngo_login.aspx"><i class="glyphicon glyphicon glyphicon-log-in"></i>Disable Login</a>
                </li>
               <%-- <li>
                    <a class="anc" href="home.aspx"><i class="glyphicon glyphicon glyphicon-list"></i>showroom</a>
                </li>--%>

                <%} %>
            </ul>

        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container -->
</nav>
<%--<img src="img/farmer_bg.jpg" class="img-responsive" />--%>

 