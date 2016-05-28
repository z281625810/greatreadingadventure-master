<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MyPointsControl.ascx.cs" Inherits="GRA.SRP.Controls.MyPointsControl" %>

<span class="points-display animated bounceInLeft">I have read <strong><asp:Label ID="lblPoints" runat="server" Text="Label"></asp:Label> days.</strong></span>
<br /><asp:Label ID="lblNextLevel" runat="server" Text=""></asp:Label><br />
See my <asp:HyperLink runat="server" NavigateUrl="~/Account/ActivityHistory.aspx">activity history</asp:HyperLink>.