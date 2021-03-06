﻿<%@ Page Title="Program Home" Language="C#" MasterPageFile="~/Layout/SRP.Master" AutoEventWireup="true"
    CodeBehind="Dashboard.aspx.cs" Inherits="GRA.SRP.MyProgram" %>

<%@ Register Src="~/Controls/Welcome.ascx" TagPrefix="uc1" TagName="Welcome" %>
<%@ Register Src="~/Controls/Avatar.ascx" TagPrefix="uc1" TagName="Avatar" %>
<%@ Register Src="~/Controls/MyPointsControl.ascx" TagPrefix="uc1" TagName="MyPointsControl" %>
<%@ Register Src="~/Controls/ReadingLogControl.ascx" TagPrefix="rlc" TagName="ReadingLogControl" %>
<%@ Register Src="~/Controls/CodeControl.ascx" TagPrefix="cc" TagName="CodeControl" %>
<%@ Register Src="~/Controls/Status.ascx" TagPrefix="cc" TagName="Status" %>
<%@ Register Src="~/Controls/Feed.ascx" TagPrefix="cc" TagName="Feed" %>
<%@ Register Src="~/Controls/LeaderBoardControl.ascx" TagPrefix="uc1" TagName="LeaderBoardControl" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeaderContent">
    <script src="<%=ResolveUrl("~/Scripts/odometer.min.js")%>"></script>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div class="row">
        <div class="col-sm-3">
            <div class="row">
                <div class="col-xs-12 text-center">
                    <uc1:Avatar runat="server" ID="Avatar" />
                </div>
            </div>
            <div class="row margin-1em-bottom">
                <div class="col-xs-12 text-center margin-halfem-top margin-halfem-bottom">
                    <uc1:MyPointsControl runat="server" ID="MyPointsControl" />
                </div>
            </div>
        </div>
        <div class="col-sm-6">
            <div class="text-center hidden-xs">
                <uc1:Welcome runat="server" ID="Welcome" />
            </div>


            <div class="text-center text-danger margin-1em-top">
                <strong style="font-size: larger;">
                    <asp:Label runat="server" ID="ProgramNotOpenText" Visible="false"></asp:Label>
                </strong>
            </div>


            <rlc:ReadingLogControl runat="server" ID="ReadingLogControl" />

            <br />
        </div>
        <div class="col-sm-3">
            <uc1:LeaderBoardControl runat="server" ID="LeaderBoardControl" />  
        </div>
    </div>
    <div class="row">
        <div class="col-sm-3">
            <div class="row" style="margin-top: 2em;">
                <div class="col-xs-12">
                   <%-- <cc:Feed runat="server" ID="Feed" /> --%> 
                    <img src="childbike.jpg" style="width:100%" />
                </div>
            </div>
        </div>
        <div class="col-sm-3 col-sm-push-6">
            <div class="text-center" style="margin-top: 2em;">
                <cc:Status runat="server" ID="Status" />
            </div>
        </div>
        <div class="col-sm-6 col-sm-pull-3">
            <hr style="margin-bottom: 5px !important; margin-top: 2em !important;" class="visible-xs" />
            <asp:Label ID="SponsorText" runat="server" Text="Label"></asp:Label>
            <asp:Label ID="FooterText" runat="server" Text="Label"></asp:Label>
        </div>
    </div>
</asp:Content>
