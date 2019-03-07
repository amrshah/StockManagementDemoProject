<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="StockManagementDemoProj._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>Stock Management Demo</h1>
        <p class="lead">SMDP is a web based Stock Management App for making Inventory Management as efficient as possible, especially for organizations like Hospitals, Medical Facilities and more.
            <a href="About.aspx">Find more</a>
        </p>
    </div>

    <div class="row">
        <div class="col-md-4">
            <h2>1. Getting started</h2>
            <p>
                <b>Database Setup.</b>
                <ul>
                    <li>Execute the InitialDBSetup.sql script found in the Databasse folder in your MSSQL Server or SQLExpress Server. </li>
                    <li>Modify the connection string according to your database server name and name of the database with user/password info etc</li>
                    <li>Connection String can be set in code or a config file. Please edit line 12 in SqlDBHelper.cs class in the SMDPDataAccess project.</li>
                </ul>
            </p>
            <p>
                <a class="btn btn-default" href="#">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>2. Build the solution</h2>
            <p>
                After database setup is complete build the solution and press F5 to start it in web browser.
            </p>
            <p>
                There is an initial Inventory Management menu along with basic intro pages. Find a list of features being implemented <a href="About.aspx">here</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Web Hosting</h2>
            <p>
                You can easily find a web hosting company that offers the right mix of features and price for hosting a Asp.Net web application.
            </p>
            <p>
                <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301950">Learn more &raquo;</a>
            </p>
        </div>
    </div>

</asp:Content>
