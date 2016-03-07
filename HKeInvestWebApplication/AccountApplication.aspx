<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AccountApplication.aspx.cs" Inherits="HKeInvestWebApplication.AccountApplication" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   <div>
       <h3><b>Application Instructions</b></h3>
       <p>
           To open your <b><i>HKeInvest</i></b> account, please complete all sections below.<br />
           <b>Each account application must include the following:</b>
       </p>
       <ul>
           <li>
               A minimum initial deposit of HK$20,000 to open your account.
           </li>
           <li>
               A photocopy of your Hong Kong Identity Card or the inside pages of your passport(s), including photo,
               signature and personal information for each account applicant.
           </li>
           <li>
               One bank (or financial institution) statement and one utility bill dated within the last six months. One of
               the documents must be an original. In lieu of a bank statement and utility bill, you may provide a
               verifiable letter from a known bank or financial institution.
           </li>
           <li>
               Additional documents may be required if your application is not submitted in person.
           </li>
       </ul>      
      <p> 
           Please submit the completed application and all required documents to <b><i>Hong Kong Electronic Investments
          LLC</i>, Suite 8801, 3 IFC, Central, Hong Kong.</b><br />
          We respect your privacy. <b><i>HKeInvest</i></b> will use the information you provide to verify your identity, to open and
          service your account, communicate with you and provide information about products and services. 
      </p>
   </div>
    <div>
        <h4>1        Account Type</h4>
        <div>
            <asp:CheckBox ID="CheckBox1" runat="server" Text="Individual" />
            <asp:CheckBox ID="CheckBox2" runat="server" Text="Joint Tenants with Rights of Survivorship (If one owner dies, his/her interest passes to the surviving owner)" />
            <asp:CheckBox ID="CheckBox3" runat="server" Text="Joint Tenants in Common (If one owner dies, his/her interest passes to his/her estate.)" />
        </div>
    </div>
    <div>
        <h4>2        Client Information</h4>
        <p>Security industry regulations require that we collect the following information. </p>
        <div class="row">
            <div class="border col-xs-6">
                <p><b>Primary Account Holder </b></p>
                <div>
                    <asp:Label ID="Label7" runat="server" Text="Title:"></asp:Label>
                    <asp:CheckBox ID="CheckBox27" runat="server" Text="Mr." />
                    <asp:CheckBox ID="CheckBox28" runat="server" Text="Mrs." />
                    <asp:CheckBox ID="CheckBox29" runat="server" Text="Ms." />
                    <asp:CheckBox ID="CheckBox34" runat="server" Text="Dr." />
                </div>
                <div>
                    <asp:Label ID="Label8" runat="server" Text="First name:"></asp:Label>
                    <asp:TextBox ID="TextBox6" runat="server" MaxLength="35"></asp:TextBox>
                </div>
                <div>
                    <asp:Label ID="Label9" runat="server" Text="Last name:"></asp:Label>
                    <asp:TextBox ID="TextBox7" runat="server" MaxLength="35"></asp:TextBox>
                </div>
                <div>
                    <asp:Label ID="Label10" runat="server" Text="Date of birth (dd/mm/yyyy):"></asp:Label>
                    <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
                </div>
                <div>
                    <asp:Label ID="Label11" runat="server" Text="Email Address: "></asp:Label>
                    <asp:TextBox ID="TextBox9" runat="server" MaxLength="30"></asp:TextBox>
                </div>
                <div>
                    <asp:Label ID="Label12" runat="server" Text="Home Address (Cannot be a PO box):"></asp:Label>
                    <asp:Label ID="Label56" runat="server" Text="Building (if any): "></asp:Label>
                    <asp:TextBox ID="TextBox10" runat="server" MaxLength="50"></asp:TextBox>
                    <asp:Label ID="Label57" runat="server" Text="Street: "></asp:Label>
                    <asp:TextBox ID="TextBox42" runat="server" MaxLength="35"></asp:TextBox>
                    <asp:Label ID="Label58" runat="server" Text="District: "></asp:Label>
                    <asp:TextBox ID="TextBox43" runat="server" MaxLength="19"></asp:TextBox>
                </div>
                <div>
                    <asp:Label ID="Label13" runat="server" Text="Home phone: "></asp:Label>
                    <asp:TextBox ID="TextBox11" runat="server" MaxLength="8"></asp:TextBox>
                </div>
                <div>
                    <asp:Label ID="Label14" runat="server" Text="Home fax: "></asp:Label>
                    <asp:TextBox ID="TextBox12" runat="server" MaxLength="8"></asp:TextBox>
                </div>
                <div>
                    <asp:Label ID="Label15" runat="server" Text="Business phone: "></asp:Label>
                    <asp:TextBox ID="TextBox13" runat="server" MaxLength="8"></asp:TextBox>
                </div>
                <div>
                    <asp:Label ID="Label16" runat="server" Text="Mobile phone: "></asp:Label>
                    <asp:TextBox ID="TextBox14" runat="server" MaxLength="8"></asp:TextBox>
                </div>
                <div>
                    <asp:Label ID="Label17" runat="server" Text="Country of citizenship: "></asp:Label>
                    <asp:TextBox ID="TextBox15" runat="server" MaxLength="70"></asp:TextBox>
                </div>
                <div>
                    <asp:Label ID="Label18" runat="server" Text="Country of legal residence: "></asp:Label>
                    <asp:TextBox ID="TextBox16" runat="server" MaxLength="70"></asp:TextBox>
                </div>
                <div>
                    <asp:Label ID="Label19" runat="server" Text="HKID/passport number: "></asp:Label>
                    <asp:TextBox ID="TextBox17" runat="server" MaxLength="8"></asp:TextBox>
                </div>
                <div>
                    <asp:Label ID="Label20" runat="server" Text="Passport country of issue: "></asp:Label>
                    <asp:TextBox ID="TextBox18" runat="server" MaxLength="70"></asp:TextBox>
                </div>
            </div>
            <div class="border col-xs-6">
                <p><b>Co-Account Holder, if applicable </b></p>
                <div>
                    <asp:Label ID="Label59" runat="server" Text="Title:"></asp:Label>
                    <asp:CheckBox ID="CheckBox59" runat="server" Text="Mr." />
                    <asp:CheckBox ID="CheckBox60" runat="server" Text="Mrs." />
                    <asp:CheckBox ID="CheckBox61" runat="server" Text="Ms." />
                    <asp:CheckBox ID="CheckBox62" runat="server" Text="Dr." />
                </div>
                <div>
                    <asp:Label ID="Label60" runat="server" Text="First name:"></asp:Label>
                    <asp:TextBox ID="TextBox44" runat="server" MaxLength="35"></asp:TextBox>
                </div>
                <div>
                    <asp:Label ID="Label61" runat="server" Text="Last name:"></asp:Label>
                    <asp:TextBox ID="TextBox45" runat="server" MaxLength="35"></asp:TextBox>
                </div>
                <div>
                    <asp:Label ID="Label62" runat="server" Text="Date of birth (dd/mm/yyyy):"></asp:Label>
                    <asp:TextBox ID="TextBox46" runat="server"></asp:TextBox>
                </div>
                <div>
                    <asp:Label ID="Label63" runat="server" Text="Email Address: "></asp:Label>
                    <asp:TextBox ID="TextBox47" runat="server" MaxLength="30"></asp:TextBox>
                </div>
                <div>
                    <asp:Label ID="Label64" runat="server" Text="Home Address (Cannot be a PO box):"></asp:Label>
                    <asp:Label ID="Label65" runat="server" Text="Building (if any): "></asp:Label>
                    <asp:TextBox ID="TextBox48" runat="server" MaxLength="50"></asp:TextBox>
                    <asp:Label ID="Label66" runat="server" Text="Street: "></asp:Label>
                    <asp:TextBox ID="TextBox49" runat="server" MaxLength="35"></asp:TextBox>
                    <asp:Label ID="Label67" runat="server" Text="District: "></asp:Label>
                    <asp:TextBox ID="TextBox50" runat="server" MaxLength="19"></asp:TextBox>
                </div>
                <div>
                    <asp:Label ID="Label68" runat="server" Text="Home phone: "></asp:Label>
                    <asp:TextBox ID="TextBox51" runat="server" MaxLength="8"></asp:TextBox>
                </div>
                <div>
                    <asp:Label ID="Label69" runat="server" Text="Home fax: "></asp:Label>
                    <asp:TextBox ID="TextBox52" runat="server" MaxLength="8"></asp:TextBox>
                </div>
                <div>
                    <asp:Label ID="Label70" runat="server" Text="Business phone: "></asp:Label>
                    <asp:TextBox ID="TextBox53" runat="server" MaxLength="8"></asp:TextBox>
                </div>
                <div>
                    <asp:Label ID="Label71" runat="server" Text="Mobile phone: "></asp:Label>
                    <asp:TextBox ID="TextBox54" runat="server" MaxLength="8"></asp:TextBox>
                </div>
                <div>
                    <asp:Label ID="Label72" runat="server" Text="Country of citizenship: "></asp:Label>
                    <asp:TextBox ID="TextBox55" runat="server" MaxLength="70"></asp:TextBox>
                </div>
                <div>
                    <asp:Label ID="Label73" runat="server" Text="Country of legal residence: "></asp:Label>
                    <asp:TextBox ID="TextBox56" runat="server" MaxLength="70"></asp:TextBox>
                </div>
                <div>
                    <asp:Label ID="Label74" runat="server" Text="HKID/passport number: "></asp:Label>
                    <asp:TextBox ID="TextBox57" runat="server" MaxLength="8"></asp:TextBox>
                </div>
                <div>
                    <asp:Label ID="Label75" runat="server" Text="Passport country of issue: "></asp:Label>
                    <asp:TextBox ID="TextBox58" runat="server" MaxLength="70"></asp:TextBox>
                </div>
            </div>
        </div>
    </div>
    <div>
        <h4>3        Employment Information</h4>
        <p>Security industry regulations require that we collect the following information. </p>
        <div class="row">
            <div class="border col-xs-6">
                <p><b>Primary Account Holder </b></p>
                <div>
                    Employment Status:
                    <asp:CheckBox ID="CheckBox35" runat="server" Text="Employed" />
                    <asp:CheckBox ID="CheckBox36" runat="server" Text="Self-employed" />
                    <asp:CheckBox ID="CheckBox37" runat="server" Text="Retired" />
                    <asp:CheckBox ID="CheckBox38" runat="server" Text="Student" />
                    <asp:CheckBox ID="CheckBox39" runat="server" Text="Not Employed" />
                    <asp:CheckBox ID="CheckBox40" runat="server" Text="Homemaker" />
                </div>
                <div>
                    <asp:Label ID="Label35" runat="server" Text="Specific occupation: "></asp:Label>
                    <asp:TextBox ID="TextBox32" runat="server" MaxLength="20"></asp:TextBox>
                </div>
                <div>
                    <asp:Label ID="Label36" runat="server" Text="Years with employer: "></asp:Label>
                    <asp:TextBox ID="TextBox33" runat="server" MaxLength="2"></asp:TextBox>
                </div>
                <div>
                    <asp:Label ID="Label37" runat="server" Text="Emploter name: "></asp:Label>
                    <asp:TextBox ID="TextBox34" runat="server" MaxLength="25"></asp:TextBox>
                </div>
                <div>
                    <asp:Label ID="Label38" runat="server" Text="Employer phone: "></asp:Label>
                    <asp:TextBox ID="TextBox35" runat="server" MaxLength="8"></asp:TextBox>
                </div>
                <div>
                    <asp:Label ID="Label39" runat="server" Text="Nature of business: "></asp:Label>
                    <asp:TextBox ID="TextBox36" runat="server" MaxLength="20"></asp:TextBox>
                </div>
                </div>
            <div class="border col-xs-6">
                <p><b>Co-Account Holder, if applicable </b></p>
                <div>
                    Employment Status:
                    <asp:CheckBox ID="CheckBox63" runat="server" Text="Employed" />
                    <asp:CheckBox ID="CheckBox64" runat="server" Text="Self-employed" />
                    <asp:CheckBox ID="CheckBox65" runat="server" Text="Retired" />
                    <asp:CheckBox ID="CheckBox66" runat="server" Text="Student" />
                    <asp:CheckBox ID="CheckBox67" runat="server" Text="Not Employed" />
                    <asp:CheckBox ID="CheckBox72" runat="server" Text="Homemaker" />
                </div>
                <div>
                    <asp:Label ID="Label76" runat="server" Text="Specific occupation: "></asp:Label>
                    <asp:TextBox ID="TextBox59" runat="server" MaxLength="20"></asp:TextBox>
                </div>
                <div>
                    <asp:Label ID="Label77" runat="server" Text="Years with employer: "></asp:Label>
                    <asp:TextBox ID="TextBox60" runat="server" MaxLength="2"></asp:TextBox>
                </div>
                <div>
                    <asp:Label ID="Label78" runat="server" Text="Emploter name: "></asp:Label>
                    <asp:TextBox ID="TextBox61" runat="server" MaxLength="25"></asp:TextBox>
                </div>
                <div>
                    <asp:Label ID="Label79" runat="server" Text="Employer phone: "></asp:Label>
                    <asp:TextBox ID="TextBox62" runat="server" MaxLength="8"></asp:TextBox>
                </div>
                <div>
                    <asp:Label ID="Label80" runat="server" Text="Nature of business: "></asp:Label>
                    <asp:TextBox ID="TextBox63" runat="server" MaxLength="20"></asp:TextBox>
                </div>
            </div>
        </div>
    </div>
    <div>
        <h4>4        Disclosures and Regulatory Information</h4>
        <p>Security industry regulations require that we collect the following information. </p>
        <div class="row">
            <div class="border col-xs-6">
                <p><b>Primary Account Holder </b></p>
                <div>
                    <asp:Label ID="Label47" runat="server" Text="Are you employed by a registered securities broker/dealer, investment advisor, bank or other financial institution?"></asp:Label>
                    <asp:CheckBox ID="CheckBox47" runat="server" Text="No" />
                    <asp:CheckBox ID="CheckBox48" runat="server" Text="Yes (you must submit a compliance letter with this application)" />
                </div>
                <div>
                    <asp:Label ID="Label48" runat="server" Text="Are you a director, 10% shareholder or policy-making officer of a publicly traded company? "></asp:Label>
                    <asp:CheckBox ID="CheckBox49" runat="server" Text="No" />
                    <asp:CheckBox ID="CheckBox50" runat="server" Text="Yes" />
                </div>
            </div>
            <div class="border col-xs-6">
                <p><b>Co-Account Holder, if applicable </b></p>
                <div>
                    <asp:Label ID="Label49" runat="server" Text="Are you employed by a registered securities broker/dealer, investment advisor, bank or other financial institution?"></asp:Label>
                    <asp:CheckBox ID="CheckBox51" runat="server" Text="No" />
                    <asp:CheckBox ID="CheckBox52" runat="server" Text="Yes (you must submit a compliance letter with this application)" />
                </div>
                <div>
                    <asp:Label ID="Label50" runat="server" Text="Are you a director, 10% shareholder or policy-making officer of a publicly traded company? "></asp:Label>
                    <asp:CheckBox ID="CheckBox53" runat="server" Text="No" />
                    <asp:CheckBox ID="CheckBox54" runat="server" Text="Yes" />
                </div>
            </div>
        </div>
        <div>
            <asp:Label ID="Label51" runat="server" Text="Describe the primary source of funds deposited to this account: "></asp:Label>
            <asp:CheckBox ID="CheckBox55" runat="server" Text="salary/wages/savings" />
            <asp:CheckBox ID="CheckBox56" runat="server" Text="investment/capital gains" />
            <asp:CheckBox ID="CheckBox57" runat="server" Text="family/relatives/inheritance" />
            <asp:CheckBox ID="CheckBox58" runat="server" Text="Other (describe below) " />
            <asp:TextBox ID="TextBox1" runat="server" MaxLength="30"></asp:TextBox>
        </div>
    </div>
    <div>
        <h4>5        Investment Profile</h4>
        <p>Security industry regulations require that we collect the following information. For joint accounts, please include combined amounts. </p>
        <div>
            <asp:Label ID="Label1" runat="server" Text="Investment objective* for this account: "></asp:Label>
            <asp:CheckBox ID="CheckBox4" runat="server" Text="capital preservation " />
            <asp:CheckBox ID="CheckBox5" runat="server" Text="income" />
            <asp:CheckBox ID="CheckBox6" runat="server" Text="growth" />
            <asp:CheckBox ID="CheckBox7" runat="server" Text="speculation" />
        </div>
        <div>
            <asp:Label ID="Label2" runat="server" Text="Investment knowledge:"></asp:Label>
            <asp:CheckBox ID="CheckBox8" runat="server" Text="none" />
            <asp:CheckBox ID="CheckBox9" runat="server" Text="limited" />
            <asp:CheckBox ID="CheckBox10" runat="server" Text="good" />
            <asp:CheckBox ID="CheckBox11" runat="server" Text="extensive" />
            <asp:Label ID="Label3" runat="server" Text="Investment experience: "></asp:Label>
            <asp:CheckBox ID="CheckBox68" runat="server" Text="none" />
            <asp:CheckBox ID="CheckBox69" runat="server" Text="limited" />
            <asp:CheckBox ID="CheckBox70" runat="server" Text="good" />
            <asp:CheckBox ID="CheckBox71" runat="server" Text="extensive" />
        </div>
        <div>
            <asp:Label ID="Label4" runat="server" Text="Annual income: "></asp:Label>
            <asp:CheckBox ID="CheckBox16" runat="server" Text="under HK$20,000 " />
            <asp:CheckBox ID="CheckBox17" runat="server" Text="HK$20,001 - HK$200,000" />
            <asp:CheckBox ID="CheckBox18" runat="server" Text="HK$200,001 - HK$2,000,000" />
            <asp:CheckBox ID="CheckBox19" runat="server" Text="more than HK$2,000,000" />
        </div>
        <div>

            <asp:Label ID="Label5" runat="server" Text="Approximate liquid net worth (cash and securities): "></asp:Label>
            <asp:CheckBox ID="CheckBox20" runat="server" Text="under HK$100,000" />
            <asp:CheckBox ID="CheckBox21" runat="server" Text="HK$100,001 - HK$1,000,000 " />
            <asp:CheckBox ID="CheckBox22" runat="server" Text="HK$1,000,001 - HK$10,000,000 " />
            <asp:CheckBox ID="CheckBox23" runat="server" Text="more than HK$10,000,000" />

        </div>
        <p>Investment objective definitions:</p>
        <ul>
            <li>
                <b>Capital preservation:</b> The objective of a capital preservation strategy is to protect your initial investment by choosing investments that minimize the
                potential of any loss of principal. The long-term risk of capital preservation is that the returns may not be adequate to offset inflation. 
            </li>
            <li>
               <b>Income:</b>  The objective of an income strategy is to provide current income rather than long-term growth of principal.
            </li>
            <li>
                <b>Growth:</b> The objective of a growth strategy is to increase the value of your investment over time while recognizing a high likelihood of volatility.
            </li>
            <li>
               <b>Speculation:</b>  The objective of a speculation strategy is to assume a higher risk of loss in anticipation of potentially higher than average gain by taking
                advantage of expected price changes. 
            </li>
        </ul>
    </div>
    <div>
        <h4>6        Account Feature</h4>
        <div>
            <p>
                <b>Earn Income on Your Cash Balance </b><br />
                The Free Credit Balance in your <b><i>HKeInvest</i></b> account is not interest bearing. However, you may choose to earn
                interest on the Free Credit Balance in your account by having daily automatic investment in or redemption of
                (“sweep’) shares of our sweep fund (“Fund”). (The Free Credit Balance is the sum of the cash balances in your
                Cash Account and Margin Account (if applicable) offset by any debit balances and/or cash retained as
                collateral in the accounts.)<br />
                On any Exchange Business Day, the Free Credit Balance will be automatically invested in shares of the Fund
                on the following Exchange Business Day. Shares of the Fund will be automatically redeemed to satisfy a debit
                balance in your <b><i>HKeInvest</i></b> account, to provide necessary cash collateral in your Margin Account (if
                applicable) or to the extent necessary to settle securities transactions. 
            </p>
        </div>
        <div>
            <asp:CheckBox ID="CheckBox24" runat="server" Text="Yes, sweep my Free Credit Balance into the Fund." />
        </div>
    </div>
    <div>
        <h4>7        Initial Account Deposit</h4>
        <div>
            <p>A <b><i>HK$20,000 minimum deposit</i></b> is required to open an account.</p>
        </div>
        <div>
            <asp:Label ID="Label6" runat="server" Text="Check one or more:"></asp:Label>
        </div>
        <div>
            <asp:CheckBox ID="CheckBox25" runat="server" />
            <asp:Label ID="Label81" runat="server" Text="A cheque for HK$ "></asp:Label>
            <asp:TextBox ID="TextBox64" runat="server"></asp:TextBox>
            <asp:Label ID="Label82" runat="server" Text="made payable to Hong Kong Electronic Investments LLC is enclosed."></asp:Label>
        </div>
        <div>
            <asp:CheckBox ID="CheckBox26" runat="server" />
            <asp:Label ID="Label83" runat="server" Text=" A completed Account Transfer Form for HK$"></asp:Label>
            <asp:TextBox ID="TextBox65" runat="server"></asp:TextBox>
            <asp:Label ID="Label84" runat="server" Text="is attached. "></asp:Label>
        </div>
    </div>
    <div>
        <h4>8        Declaration and Signature</h4>
        <div>
            <blockquote>
                I am of legal age to enter into this contract. I acknowledge that I have received, read and agree to be bound by
                the terms and conditions as currently set forth in the HKeInvest Customer Agreement and as amended from
                time to time. I authorize HKeInvest to inquire from any source, including a consumer reporting agency, as to
                my identity, creditworthiness and ongoing eligibility for the account at account opening, at any time
                throughout the life of the account and thereafter for debt collection or investigative purposes. 
            </blockquote>
            <p><b>I acknowledge that <i>HKeInvest</i> does not provide investment, tax or legal advice.</b></p>
        </div>
        <div class="row">
            <div class="border col-xs-6">
                <asp:Label ID="Label52" runat="server" Text="Account Holder’s Signature"></asp:Label>
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                <asp:Label ID="Label53" runat="server" Text="Date: "></asp:Label>
                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            </div>
            <div class="border col-xs-6">
                <asp:Label ID="Label54" runat="server" Text="Co-Account Holder’s Signature, if applicable"></asp:Label>
                <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                <asp:Label ID="Label55" runat="server" Text="Date: "></asp:Label>
                <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
            </div>
        </div>
    </div>

</asp:Content>
