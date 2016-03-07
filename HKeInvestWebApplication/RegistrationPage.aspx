<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RegistrationPage.aspx.cs" Inherits="HKeInvestWebApplication.RegistrationPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h4>Create a new login account</h4>
    <div class="form-horizontal">
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="text-danger" EnableClientScript="False" />
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="FirstName" CssClass="control-label col-md-2" Text="First Name"></asp:Label>
            <div class=”col-md-4”><asp:TextBox ID="FirstName" runat="server" CssClass="form-control" MaxLength="35"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="FirstName" CssClass="text-danger" EnableClientScript="False" ErrorMessage="First Name is required.">*</asp:RequiredFieldValidator>
            </div>
            <asp:Label runat="server" AssociatedControlID="LastName" CssClass="control-label col-md-2" Text="Last Name"></asp:Label>
            <div class=”col-md-4”><asp:TextBox ID="LastName" runat="server" CssClass="form-control" MaxLength="35"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="LastName" CssClass="text-danger" EnableClientScript="False" ErrorMessage="Last Name  is required.">*</asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="AccountNumber" CssClass="control-label col-md-2" Text="Account #"></asp:Label>
            <div class=”col-md-4”>
                <asp:CustomValidator ID="cvAccountNumber" runat="server" ControlToValidate="AccountNumber" CssClass="text-danger" EnableClientScript="False" ErrorMessage="Account Number should contain the first or first two letters of the clients last name in uppercase followed by 8 digits" OnServerValidate="cvAccountNumber_ServerValidate" ValidateEmptyText="True">*</asp:CustomValidator>
                <asp:TextBox ID="AccountNumber" runat="server" CssClass="form-control" MaxLength="10"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="AccountNumber" CssClass="text-danger" EnableClientScript="False" ErrorMessage="Account #  is required.">*</asp:RequiredFieldValidator>
            </div>
            <asp:Label runat="server" AssociatedControlID="HKID" CssClass="control-label col-md-2" Text="HKID/Passport#"></asp:Label>
            <div class=”col-md-4”><asp:TextBox ID="HKID" runat="server" CssClass="form-control" MaxLength="8"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="HKID" CssClass="text-danger" EnableClientScript="False" ErrorMessage="A HKID or Passport is required.">*</asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="DateOfBirth" CssClass="control-label col-md-2" Text="Date of Birth"></asp:Label>
            <div class=”col-md-4”>
                <asp:RegularExpressionValidator runat="server" ControlToValidate="DateOfBirth" CssClass="text-danger" EnableClientScript="False" ErrorMessage="Date of birth is not valid." ValidationExpression="^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[1,3-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$">*</asp:RegularExpressionValidator>
                <asp:TextBox ID="DateOfBirth" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="DateOfBirth" CssClass="text-danger" EnableClientScript="False" ErrorMessage="&quot;Date of Birth&quot; is a required field">*</asp:RequiredFieldValidator>
            </div>
            <asp:Label runat="server" AssociatedControlID="Email" CssClass="control-label col-md-2" Text="Email"></asp:Label>
            <div class=”col-md-4”><asp:TextBox ID="Email" runat="server" CssClass="form-control" TextMode="Email" MaxLength="30"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Email" CssClass="text-danger" EnableClientScript="False" ErrorMessage="Email address is required.">*</asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="UserName" CssClass="control-label col-md-2" Text="User Name"></asp:Label>
            <div class=”col-md-4”>
                <asp:RegularExpressionValidator runat="server" CssClass="text-danger" EnableClientScript="False" ErrorMessage="&quot;Username&quot; must be between 6 and 10 characters, and may only contain letters and digits" ValidationExpression="^[a-zA-Z0-9]{6,10}$/i" ControlToValidate="UserName">*</asp:RegularExpressionValidator>
                <asp:TextBox ID="UserName" runat="server" CssClass="form-control" MaxLength="10"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="UserName" CssClass="text-danger" EnableClientScript="False" ErrorMessage="&quot;Username&quot; is a required field">*</asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Password" CssClass="control-label col-md-2" Text="Password"></asp:Label>
            <div class=”col-md-4”>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" CssClass="text-danger" EnableClientScript="False" ErrorMessage="&quot;Password&quot; must be between 8 and 15 characters and contain at least two non-alphanumeric characters " ValidationExpression="^(?=.{8,15}$)(?=.*[^a-zA-Z][^a-zA-Z])/c" ControlToValidate="Password">*</asp:RegularExpressionValidator>
                <asp:TextBox ID="Password" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Password" CssClass="text-danger" EnableClientScript="False" ErrorMessage="&quot;Password&quot; is a required field">*</asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="ConfirmPassword" CssClass="control-label col-md-2" Text="Confirm Password"></asp:Label>
            <div class=”col-md-4”>
                <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword" CssClass="text-danger" EnableClientScript="False" ErrorMessage="Password and Confirm Password must match.">*</asp:CompareValidator>
                <asp:TextBox ID="ConfirmPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword" CssClass="text-danger" EnableClientScript="False" ErrorMessage="Confirm Password must match Password">*</asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="form-group">
            <div class=”col-md-offset-2”><asp:Button ID="Register" runat="server" Text="Register" CssClass="btn button-default" /></div>
        </div>
    </div>
</asp:Content>
