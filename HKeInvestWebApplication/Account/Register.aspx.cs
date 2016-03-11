using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using HKeInvestWebApplication.Models;

using System.Web.UI.WebControls;
using System.Text.RegularExpressions;

namespace HKeInvestWebApplication.Account
{
    public partial class Register : Page
    {
        protected void CreateUser_Click(object sender, EventArgs e)
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var signInManager = Context.GetOwinContext().Get<ApplicationSignInManager>();
            var user = new ApplicationUser() { UserName = UserName.Text, Email = Email.Text };
            IdentityResult result = manager.Create(user, Password.Text);
            if (result.Succeeded)
            {
                // For more information on how to enable account confirmation and password reset please visit http://go.microsoft.com/fwlink/?LinkID=320771
                //string code = manager.GenerateEmailConfirmationToken(user.Id);
                //string callbackUrl = IdentityHelper.GetUserConfirmationRedirectUrl(code, user.Id, Request);
                //manager.SendEmail(user.Id, "Confirm your account", "Please confirm your account by clicking <a href=\"" + callbackUrl + "\">here</a>.");

                signInManager.SignIn( user, isPersistent: false, rememberBrowser: false);
                IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
            }
            else 
            {
                ErrorMessage.Text = result.Errors.FirstOrDefault();
            }
        }
        protected void cvAccountNumber_ServerValidate(object source, ServerValidateEventArgs args)
        {
            string accountNumber = AccountNumber.Text.Trim();
            string clientLastName = LastName.Text.Trim();

            if (clientLastName.Length == 0)
            {
                args.IsValid = false;
                cvAccountNumber.ErrorMessage = "Last Name is required";
            }

            string firstLetter = clientLastName.Substring(0, 1).ToUpper();
            string firstTwoLetters = clientLastName.Substring(0, 2).ToUpper();

            var regex = @"^\w[\p{Lu}]{1,2}\d{8}$"; //1-2 uppercase letters, followed by 8 digits

            var match1 = Regex.Match(accountNumber, regex, RegexOptions.IgnoreCase);

            if (!match1.Success) //does not match
            {
                args.IsValid = false;
                cvAccountNumber.ErrorMessage = "The account number does not match the client's last name";

            } //otherwise we have a match
            if (accountNumber.Length == 0)
            {
                args.IsValid = false;
                cvAccountNumber.ErrorMessage = "The account number does not match the client's last name";
            }
            else if (!(accountNumber.Substring(0, 1).Equals(firstLetter) || accountNumber.Substring(0, 2).Equals(firstTwoLetters)))
            { //checks that the first letter fo the account number contains capitalized letter of first letter of client's last name or if the first two letters are the capitalized client's last name's first two letters
                args.IsValid = false;
                cvAccountNumber.ErrorMessage = "The account number does not match the client's last name";
            }//if we pass, than we have a valid string!


        }
    }
}