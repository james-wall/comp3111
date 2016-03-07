﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using HKeInvestWebApplication.Code_File;
using HKeInvestWebApplication.ExternalSystems.Code_File;

namespace HKeInvestWebApplication
{
    public partial class SecurityHoldingDetails : System.Web.UI.Page
    {
        HKeInvestData myHKeInvestData = new HKeInvestData();
        HKeInvestCode myHKeInvestCode = new HKeInvestCode();
        ExternalFunctions myExternalFunctions = new ExternalFunctions();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Get the available currencies to populate the DropDownList.
                DataTable dtCurrency = myExternalFunctions.getCurrencyData();
                foreach (DataRow row in dtCurrency.Rows)
                {
                    ddlCurrency.Items.Add(row["currency"].ToString().Trim());
                }
            }
        }

        protected void ddlSecurityType_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Reset visbility of controls and initialize values.
            lblResultMessage.Visible = false;
            ddlCurrency.Visible = false;
            gvSecurityHolding.Visible = false;
            ddlCurrency.SelectedIndex = 0;
            string sql = "";

            // *******************************************************************
            // TODO: Set the account number and security type from the web page. *
            // *******************************************************************
            string accountNumber = txtAccountNumber.Text; // Set the account number from a web form control!
            string securityType = ddlSecurityType.Text; // Set the securityType from a web form control!

            // Check if an account number has been specified.
            if (accountNumber == "")
            {
                lblResultMessage.Text = "Please specify an account number.";
                lblResultMessage.Visible = true;
                ddlSecurityType.SelectedIndex = 0;
                return;
            }

            // No action when the first item in the DropDownList is selected.
            if (securityType == "0") { return; }

            // *****************************************************************************************
            // TODO: Construct the SQL statement to retrieve the first and last name of the client(s). *
            // *****************************************************************************************
            sql = "SELECT lastName, firstName from Client where accountNumber = '" + accountNumber + "';"; // Complete the SQL statement.

            DataTable dtClient = myHKeInvestData.getData(sql);
            if (dtClient == null) { return; } // If the DataSet is null, a SQL error occurred.

            // If no result is returned by the SQL statement, then display a message.
            if (dtClient.Rows.Count == 0)
            {
                lblResultMessage.Text = "No such account number.";
                lblResultMessage.Visible = true;
                lblClientName.Visible = false;
                gvSecurityHolding.Visible = false;
                return;
            }

            // Show the client name(s) on the web page.
            string clientName = "Client(s): ";
            int i = 1;
            foreach (DataRow row in dtClient.Rows)
            {
                clientName = clientName + row["lastName"] + ", " + row["firstName"];
                if (dtClient.Rows.Count != i)
                {
                    clientName = clientName + "and ";
                }
                i = i + 1;
            }
            lblClientName.Text = clientName;
            lblClientName.Visible = true;

            // *****************************************************************************************************************************
            // TODO: Construct the SQL select statement to get the code, name, shares and base of the security holdings of a specific type *
            //       in an account. The select statement should also return three additonal columns -- price, value and convertedValue --  *
            //       whose values are not actually in the database, but are set to the constant 0.00 by the select statement. (HINT: see   *
            //       http://stackoverflow.com/questions/2504163/include-in-select-a-column-that-isnt-actually-in-the-database.)            *   
            // *****************************************************************************************************************************
            sql = "SELECT code, name, shares, base, '0.00' AS price, '0.00' AS value, '0.00' AS convertedValue FROM SecurityHolding where accountNumber = '" + accountNumber + "' and type = '"+ securityType + "';"; // Complete the SQL statement.

            DataTable dtSecurityHolding = myHKeInvestData.getData(sql);
            if (dtSecurityHolding == null) { return; } // If the DataSet is null, a SQL error occurred.

            // If no result is returned, then display a message that the account does not hold this type of security.
            if (dtSecurityHolding.Rows.Count == 0)
            {
                lblResultMessage.Text = "No " + securityType + "s held in this account.";
                lblResultMessage.Visible = true;
                gvSecurityHolding.Visible = false;
                return;
            }

            // For each security in the result, get its current price from an external system, calculate the total value
            // of the security and change the current price and total value columns of the security in the result.
            int dtRow = 0;
            foreach (DataRow row in dtSecurityHolding.Rows)
            {
                string securityCode = row["code"].ToString();
                decimal shares = Convert.ToDecimal(row["shares"]);
                decimal price = myExternalFunctions.getSecuritiesPrice(securityType, securityCode);
                decimal value = Math.Round(shares * price - (decimal).005, 2);
                dtSecurityHolding.Rows[dtRow]["price"] = price;
                dtSecurityHolding.Rows[dtRow]["value"] = value;
                dtRow = dtRow + 1;
            }

            // Set the initial sort expression and sort direction for sorting the GridView in ViewState.
            ViewState["SortExpression"] = "name";
            ViewState["SortDirection"] = "ASC";

            // Bind the GridView to the DataTable.
            gvSecurityHolding.DataSource = dtSecurityHolding;
            gvSecurityHolding.DataBind();

            // Set the visibility of controls and GridView data.
            gvSecurityHolding.Visible = true;
            ddlCurrency.Visible = true;
            gvSecurityHolding.Columns[myHKeInvestCode.getColumnIndexByName(gvSecurityHolding, "convertedValue")].Visible = false;
        }

        protected void ddlCurrency_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Get the index value of the convertedValue column in the GridView using the helper method "getColumnIndexByName".
            int convertedValueIndex = myHKeInvestCode.getColumnIndexByName(gvSecurityHolding, "convertedValue");

            // Get the currency to convert to from the ddlCurrency dropdownlist.
            // Hide the converted currency column if no currency is selected.
            string toCurrency = ddlCurrency.SelectedValue;
            if (toCurrency == "0")
            {
                gvSecurityHolding.Columns[convertedValueIndex].Visible = false;
                return;
            }

            // Make the convertedValue column visible and create a DataTable from the GridView.
            // Since a GridView cannot be updated directly, it is first loaded into a DataTable using the helper method 'unloadGridView'.
            gvSecurityHolding.Columns[convertedValueIndex].Visible = true;
            DataTable dtSecurityHolding = myHKeInvestCode.unloadGridView(gvSecurityHolding);

            // ***********************************************************************************************************
            // TODO: For each row in the DataTable, get the base currency of the security, convert the current value to  *
            //       the selected currency and assign the converted value to the convertedValue column in the DataTable. *
            // ***********************************************************************************************************
            foreach (DataRow row in dtSecurityHolding.Rows)
            {
                if (toCurrency.Equals("USD")) {
                    if (row["Base"].Equals("HKD "))
                    {
                        row["convertedValue"] = System.Convert.ToDecimal(.13 * System.Convert.ToDouble(row["value"]));
                    }
                    else if (row["Base"].Equals("EUR "))
                    {
                        row["convertedValue"] = System.Convert.ToDecimal(1.09 * System.Convert.ToDouble(row["value"]));
                    }
                    else if (row["Base"].Equals("JPY "))
                    {
                        row["convertedValue"] = System.Convert.ToDecimal(.0087 * System.Convert.ToDouble(row["value"]));
                    }
                    else if (row["Base"].Equals("GBP "))
                    {
                        row["convertedValue"] = System.Convert.ToDecimal(1.4 * System.Convert.ToDouble(row["value"]));
                    }
                    else if (row["Base"].Equals("USD "))
                    {
                        row["convertedValue"] = row["value"];
                    }
                }
                if (toCurrency.Equals("HKD"))
                {
                    if (row["Base"].Equals("USD "))
                    {
                        row["convertedValue"] = System.Convert.ToDecimal(7.77 * System.Convert.ToDouble(row["value"]));
                    }
                    else if (row["Base"].Equals("EUR "))
                    {
                        row["convertedValue"] = System.Convert.ToDecimal(8.44 * System.Convert.ToDouble(row["value"]));
                    }
                    else if (row["Base"].Equals("JPY "))
                    {
                        row["convertedValue"] = System.Convert.ToDecimal(.068 * System.Convert.ToDouble(row["value"]));
                    }
                    else if (row["Base"].Equals("GBP "))
                    {
                        row["convertedValue"] = System.Convert.ToDecimal(10.85 * System.Convert.ToDouble(row["value"]));
                    }
                    else if (row["Base"].Equals("HKD "))
                    {
                        row["convertedValue"] = row["value"];
                    }
                }
                if (toCurrency.Equals("EUR"))
                {
                    if (row["Base"].Equals("USD "))
                    {
                        row["convertedValue"] = System.Convert.ToDecimal(.92 * System.Convert.ToDouble(row["value"]));
                    }
                    else if (row["Base"].Equals("HKD "))
                    {
                        row["convertedValue"] = System.Convert.ToDecimal(.12 * System.Convert.ToDouble(row["value"]));
                    }
                    else if (row["Base"].Equals("JPY "))
                    {
                        row["convertedValue"] = System.Convert.ToDecimal(.0081 * System.Convert.ToDouble(row["value"]));
                    }
                    else if (row["Base"].Equals("GBP "))
                    {
                        row["convertedValue"] = System.Convert.ToDecimal(1.28 * System.Convert.ToDouble(row["value"]));
                    }
                    else if (row["Base"].Equals("EUR "))
                    {
                        row["convertedValue"] = row["value"];
                    }
                }
                if (toCurrency.Equals("JPY"))
                {
                    if (row["Base"].Equals("HKD "))
                    {
                        row["convertedValue"] = System.Convert.ToDecimal(14.7 * System.Convert.ToDouble(row["value"]));
                    }
                    else if (row["Base"].Equals("EUR "))
                    {
                        row["convertedValue"] = System.Convert.ToDecimal(124.23 * System.Convert.ToDouble(row["value"]));
                    }
                    else if (row["Base"].Equals("USD "))
                    {
                        row["convertedValue"] = System.Convert.ToDecimal(114.28 * System.Convert.ToDouble(row["value"]));
                    }
                    else if (row["Base"].Equals("GBP "))
                    {
                        row["convertedValue"] = System.Convert.ToDecimal(159.73 * System.Convert.ToDouble(row["value"]));
                    }
                    else if (row["Base"].Equals("JPY "))
                    {
                        row["convertedValue"] = row["value"];
                    }
                }
                if (toCurrency.Equals("GBP"))
                {
                    if (row["Base"].Equals("HKD "))
                    {
                        row["convertedValue"] = System.Convert.ToDecimal(.092 * System.Convert.ToDouble(row["value"]));
                    }
                    else if (row["Base"].Equals("EUR "))
                    {
                        row["convertedValue"] = System.Convert.ToDecimal(.78 * System.Convert.ToDouble(row["value"]));
                    }
                    else if (row["Base"].Equals("JPY "))
                    {
                        row["convertedValue"] = System.Convert.ToDecimal(.0063 * System.Convert.ToDouble(row["value"]));
                    }
                    else if (row["Base"].Equals("USD "))
                    {
                        row["convertedValue"] = System.Convert.ToDecimal(.72 * System.Convert.ToDouble(row["value"]));
                    }
                    else if (row["Base"].Equals("GBP "))
                    {
                        row["convertedValue"] = row["value"];
                    }
                }
            }

            // Change the header text of the convertedValue column to indicate the currency. 
            gvSecurityHolding.Columns[convertedValueIndex].HeaderText = "Value in " + toCurrency;

            // Bind the DataTable to the GridView.
            gvSecurityHolding.DataSource = dtSecurityHolding;
            gvSecurityHolding.DataBind();
        }

        protected void gvSecurityHolding_Sorting(object sender, GridViewSortEventArgs e)
        {
            // Since a GridView cannot be sorted directly, it is first loaded into a DataTable using the helper method 'unloadGridView'.
            // Create a DataTable from the GridView.
            DataTable dtSecurityHolding = myHKeInvestCode.unloadGridView(gvSecurityHolding);

            // Set the sort expression in ViewState for correct toggling of sort direction,
            // Sort the DataTable and bind it to the GridView.
            string sortExpression = e.SortExpression.ToLower();
            ViewState["SortExpression"] = sortExpression;
            dtSecurityHolding.DefaultView.Sort = sortExpression + " " + myHKeInvestCode.getSortDirection(ViewState, e.SortExpression);
            dtSecurityHolding.AcceptChanges();

            // Bind the DataTable to the GridView.
            gvSecurityHolding.DataSource = dtSecurityHolding.DefaultView;
            gvSecurityHolding.DataBind();
        }
    }
}