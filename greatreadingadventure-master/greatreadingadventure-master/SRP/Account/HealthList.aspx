<%@ Page Title="Health Choice List" Language="C#" MasterPageFile="~/Layout/SRP.Master" AutoEventWireup="true" CodeBehind="HealthList.aspx.cs" Inherits="GRA.SRP.ViewHealthList" %>

<%@ Register Src="~/Controls/HealthChoice.ascx" TagPrefix="uc1" TagName="HealthChoice" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <uc1:HealthChoice runat="server" ID="HealthChoice" />
</asp:Content>