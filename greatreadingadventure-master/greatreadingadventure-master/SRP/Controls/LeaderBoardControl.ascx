<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LeaderBoardControl.ascx.cs" Inherits="GRA.SRP.Controls.LeaderBoardControl" %>

<div class="row">
    <div class="col-xs-12">
        <table class="table table-striped table-hover table-condensed">
            <thead>
                <tr>
                    <th class="col-xs-12 text-center" colspan="4">
                        <span class="lead">Leaderboard</span>
                        <p style="text-align:left; font-size:smaller; font-style:normal">We have collectively met our reading goals!</p>
                    </th>
                </tr>
            </thead>
            
            <tbody>
                <tr>
                    <td><b>Grade</b></td>
                    <td><b>Days</b></td>
                </tr>    
                <asp:Repeater runat="server" ID="rptr" OnItemDataBound="rptr_ItemDataBound">
                    <ItemTemplate>
                        <tr>
                            <%-- <td><%# Eval("Rank") %></td>
                            <td><asp:Image runat="server" Width="24" Height="24" ImageUrl='<%#Eval("AvatarId", "~/Images/Avatars/sm_{0}.png") %>' id="SmallAvatar"/></td>
                            <td><%# Eval("Username") %></td>
                            <td><%# String.Format("{0:#,##0}", (int)Eval("TotalPoints"))%></td>--%>
                            <td><%# changeToGrade(Convert.ToInt32(Eval("SchoolGrade"))) %></td>
                            <td><%# Eval("TotalPoint") %></td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
        </table>
    </div>
</div>
