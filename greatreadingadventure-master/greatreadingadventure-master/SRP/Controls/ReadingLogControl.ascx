﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ReadingLogControl.ascx.cs" Inherits="GRA.SRP.Controls.ReadingLogControl" %>
<asp:Panel runat="server" ID="readingLogControlPanel" DefaultButton="submitButton">
    <div class="row">
        <div class="col-xs-12 text-center">
            <span class="lead">
                <asp:Label runat="server" Text="readinglog-reading-log"></asp:Label></span>
            <hr style="margin-bottom: 5px !important; margin-top: 5px !important;" />
        </div>
    </div>
    <div class="row">
        <div class="col-xs-10 col-xs-offset-1 col-sm-10 col-sm-offset-1 text-center margin-1em-bottom">
            <em><asp:Label runat="server" Text="readinglog-description"></asp:Label></em>
        </div>
    </div>
    <div class="row">
        <div class="form-inline text-center">
            <%--  <div class="col-xs-12" style="display: none;" id="readingLogControlMessageError">
                <p class="text-danger" style="font-weight: bold;">Please enter how much you've read.</p>
            </div>--%>
            <div class="col-xs-12">
                <div class="form-group" id="readingLogControlFormGroup">
                    <label for="readingActivityField" runat="server" id="countSubmittedLabel" cssclass="readinglog-spacing">
                        <asp:Label runat="server" Text="readinglog-reading-prompt"></asp:Label></label>
                  <div class="block-center" style="display: inline-block;">
                       <%-- <asp:TextBox ID="readingActivityField"
                            runat="server"
                            CssClass="form-control"
                            MaxLength="3"
                            Width="4em"
                            text="15"
                            ReadOnly="true"></asp:TextBox>--%>  
                    </div> 
                    <asp:DropDownList ID="activityTypeSelector" CssClass="form-control readinglog-spacing" runat="server"></asp:DropDownList>
                    <label class="readinglog-spacing">
                        <asp:Label runat="server" ID="activityTypeSingleLabel" Visible="false"></asp:Label>
                    </label>

                    <asp:LinkButton runat="server"
                        CssClass="btn btn-info btn-lg reading-log-submit"
                        Text="readinglog-submit"
                        data-loading-text="Logging..."
                        ID="submitButton"
                        OnClientClick="return ValidateLogEntry();"
                        OnClick="submitButton_Click"></asp:LinkButton>
                </div>
            <asp:Panel id="pnlCalendar" runat="server" style="POSITION: center" >
                 <asp:calendar id="Calendar1" runat="server" CellPadding="4" 
                      BorderColor="#999999" Font-Names="Verdana" Font-Size="8pt" 
                      Height="100%" ForeColor="Black" DayNameFormat="full" ShowGridLines="true"
                      Width="100%" BackColor="White" style="margin-top: 40px; margin-left: auto; margin-right:auto;"
                     ondayrender="MyDayRenderer" SelectedDate ="<%# DateTime.Today %>" >
                  <TodayDayStyle ForeColor="Black" BackColor="#CCCCCC"></TodayDayStyle>
                  <SelectorStyle BackColor="#CCCCCC"></SelectorStyle>
                  <NextPrevStyle VerticalAlign="Bottom"></NextPrevStyle>
                  <DayHeaderStyle Font-Size="7pt" Font-Bold="True" BackColor="#CCCCCC">
                  </DayHeaderStyle>
                  <SelectedDayStyle Font-Bold="True" ForeColor="White" BackColor="#666666">
                  </SelectedDayStyle>
                  <TitleStyle Font-Bold="True" BorderColor="Black" BackColor="#999999">
                  </TitleStyle>
                  </asp:calendar>
            </asp:Panel>
            </div>

            <div class="col-xs-12" style="visibility:hidden">
                <div class="form-group">
                    <asp:CheckBox runat="server"
                        ID="enterBookDetails"
                        Text="I would like to share more about what I am reading."
                        checked="true"
                        CssClass="readinglog-checkbox checkbox-inline"></asp:CheckBox>
                    <asp:CheckBox runat="server"
                        ID="enterHealthChoiceDetails"
                        checked="true"
                        Text="I made a healthy choice today and would like to share more about this choice."
                        CssClass="readinglog-checkbox checkbox-inline"></asp:CheckBox>
                </div>
            </div>
        </div>
    </div>

    <asp:Panel ID="readingLogPopup"
        runat="server"
        Visible="false"
        CssClass="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <span class="lead">
                        <asp:Label runat="server" Text="readinglog-details-header"></asp:Label></span>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-xs-9 col-sm-10">
                            <asp:Label ID="lblDesc" runat="server" Visible="false"></asp:Label>
                            <asp:Label ID="lblPoints" runat="server" Visible="false"></asp:Label>
                        </div>
                        <div class="col-xs-3 col-sm-2" style="min-width: 64px;">
                            <asp:Label ID="BadgeImage"
                                runat="server"
                                CssClass="pull-right"></asp:Label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-12 margin-1em-bottom">
                            Enter the details and click Submit. <strong>Your reading won't be logged if you don't click submit!</strong>
                        </div>
                        <div class="col-xs-12 col-md-6">
                            <div class="form-group">
                                <label for="titleField">Title</label>
                                <asp:TextBox runat="server"
                                    ID="titleField"
                                    CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-xs-12 col-md-6">
                            <div class="form-group">
                                <label for="authorField">Author</label>
                                <asp:TextBox runat="server"
                                    ID="authorField"
                                    CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>                 
                    </div>

                    <%-- new staff --%>

                    <div class="row" runat="server" Visible="false" id ="healthDiv">
                        <div class="col-xs-12 margin-1em-bottom">
                            Healthy Choice I’ve made: 
                            <p>Some examples of healthy choices are: </p>
                            I was physically active. 
                            I chose to eat a healthy snack. 
                            I communicated my feelings. 
                            I practiced mindfulness. 
                            I played a sport. 
                            I tried something new today.
                        </div>
                        <div class="col-xs-12 col-md-6">
                            <div class="form-group">
                                <label for="healthField">Healthy Choice</label>
                                <asp:TextBox runat="server"
                                    ID="healthChoice"
                                    CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                                     
                    </div>

                    <%-- new staff --%>

                </div>
                <div class="modal-footer hidden-print">
                    <div class="pull-right clearfix">
                        <asp:Button ID="cancelButton"
                            runat="server"
                            Text="readinglog-details-cancel"
                            OnClick="cancelButton_Click"
                            CssClass="btn btn-default" />
                        <asp:Button ID="submitDetailsButton"
                            runat="server"
                            Text="readinglog-submit"
                            OnClick="submitDetailsButton_Click"
                            CssClass="btn btn-default btn-submit" />
                    </div>
                </div>
            </div>
        </div>
    </asp:Panel>
    <script>
        $(function () {
            if ("<%=this.ShowModal%>" == "True") {
                var elems = $("div[id$='readingLogPopup']");
                elems.each(function (index) {
                    $(this).modal('show');
                });
            }
        });
       /* function ValidateLogEntry() {
            $('.reading-log-submit').button('loading');
            var elems = $("input[id$='readingActivityField']");
            var valid = false;
            elems.each(function () {
                if (!valid && $(this).val().length > 0) {
                    valid = true;
                    return false;
                }
            });

            if (valid) {
                if ($('#readingLogControlFormGroup').hasClass('has-error')) {
                    $('#readingLogControlFormGroup').removeClass('has-error');
                }
                $('#readingLogControlMessageError').hide();

            } else {
                if (!$('#readingLogControlFormGroup').hasClass('has-error')) {
                    $('#readingLogControlFormGroup').addClass('has-error');
                }
                $('#readingLogControlMessageError').show();

            }
            if (!valid) {
                $('.reading-log-submit').button('reset');
            }
            return valid;
        }*/
    </script>
</asp:Panel>
