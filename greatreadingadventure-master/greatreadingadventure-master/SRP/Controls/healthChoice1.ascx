﻿<%@ Control Language="C#"  AutoEventWireup="true" CodeBehind="healthChoice.ascx.cs" Inherits="GRA.SRP.Controls.healthChoice" %>
<div class="row hidden-print">
    <div class="col-sm-12">
        <span class="h1">
            <asp:Label runat="server" Text="books-read-title"></asp:Label></span>
    </div>
</div>

<div class="row margin-1em-top hidden-print margin-halfem-top">
    <div class="col-xs-12 col-sm-5 col-md-4">
        <div class="pull-right margin-halfem-bottom">
            <button class="btn btn-default" type="button" onclick="window.print();"><span class="glyphicon glyphicon-print"></span></button>

            <asp:HyperLink runat="server" NavigateUrl="~/Account/ActivityHistory.aspx" CssClass="btn btn-default"><span class="glyphicon glyphicon-folder-open margin-halfem-right"></span> Activity History</asp:HyperLink>
        </div>
    </div>
</div>

<div class="row margin-1em-top">
    <div class="col-xs-12 col-md-10 col-md-offset-1">
        <asp:Panel ID="healthPanel" runat="server" Visible="true">
            <table class="table table-compact table-alternating">
                <thead>
                    <tr>
                        <th>Health Choice</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater runat="server" ID="rptrOne">
                        <ItemTemplate>
                            <tr>
                                <td>
                                    <%#Eval("healthChoice") %>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>
        </asp:Panel>
        <asp:Label Text="books-read-none" runat="server" ID="noHealthLabel" Visible="false"></asp:Label>
    </div>
</div>
