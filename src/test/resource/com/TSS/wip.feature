#Sample Feature Definition Template

@wip
Feature: WORK IN PROGRESS

 @wip
  Scenario Outline: DTSP-770: To update the information sent to PSRM in the declaration section
    #Scenario 1: Declaration on Summary Page of all forms
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Lodgements"
    Then I click on "Payroll Tax"
    And I check I am on "Payroll Lodgement Form" page
    Then I click on button "Discard"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value          |
      | s2id_autogen1_search | <Organisation> |
    Then I click on button "select2-results-1"
    Then I click on "Monthly Return"
    Then I select "2016" from "MonthlyObligationSelect"
    Then I click on button "NextSection"
    Then I wait for "5000" millisecond
    #Then I click on button "TaxPayerDetailsNext"
    Then I enter the details as
      | Fields                                         | Value   |
      | SalariesAndWages                               | 1000000 |
      | BonusesAndCommissions                          |       1 |
      | LodgePayrollAnswer_Commissions                 |       1 |
      | LodgePayrollAnswer_Allowances                  |       1 |
      | LodgePayrollAnswer_DirectorsFees               |       1 |
      | LodgePayrollAnswer_EligibleTerminationPayments |       1 |
      | LodgePayrollAnswer_ValueOfBenefits             |       1 |
      | LodgePayrollAnswer_ShareValue                  |       1 |
      | LodgePayrollAnswer_ServiceContracts            |       1 |
      | LodgePayrollAnswer_Superannuation              |       1 |
      | LodgePayrollAnswer_OtherTaxablePayment         |       1 |
      | LodgePayrollAnswer_ExemptWages                 |       1 |
    Then I click on button "wtSubmitBT"
    Then I wait for "5000" millisecond
    Then I check I am on "Payroll Tax Lodgement Summary" page
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[1]//td[2]" contains "<FirstName>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[2]//td[2]" contains "<LastName>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[3]//td[2]" contains "<Organisation>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[4]//td[2]" contains "<Position>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[5]//td[2]" contains "<ContactPhone>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[6]//td[2]" contains "<EmailAddress>"
    Then I click on "Tax Registration Update"
    Then I click on "Update Business Address"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value          |
      | s2id_autogen1_search | <Organisation> |
    Then I click on button "select2-results-1"
    Then I wait for "5000" millisecond
    Then I click on button with value "Next"
    Then I wait for "5000" millisecond
    #BUG FOUND: Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[1]//td[2]" contains "<FirstName>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[2]//td[2]" contains "<LastName>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[3]//td[2]" contains "<Organisation>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[4]//td[2]" contains "<Position>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[5]//td[2]" contains "<ContactPhone>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[6]//td[2]" contains "<EmailAddress>"
    Then I click on "Update Contact Details"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value          |
      | s2id_autogen1_search | <Organisation> |
    Then I click on button "select2-results-1"
    Then I wait for "5000" millisecond
    Then I click on button "NextBT"

    #BUG FOUND: Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[1]//td[2]" contains "<FirstName>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[2]//td[2]" contains "<LastName>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[3]//td[2]" contains "<Organisation>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[4]//td[2]" contains "<Position>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[5]//td[2]" contains "<ContactPhone>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[6]//td[2]" contains "<EmailAddress>"
    Then I click on "Update Refund Details"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value          |
      | s2id_autogen1_search | <Organisation> |
    Then I click on button "select2-results-1"
    Then I wait for "5000" millisecond
    Then I click on button with value "Next"
    #BUG FOUND: Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[1]//td[2]" contains "<FirstName>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[2]//td[2]" contains "<LastName>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[3]//td[2]" contains "<Organisation>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[4]//td[2]" contains "<Position>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[5]//td[2]" contains "<ContactPhone>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[6]//td[2]" contains "<EmailAddress>"
    Then I click on "Update Business Trading Name"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value          |
      | s2id_autogen1_search | <Organisation> |
    Then I click on button "select2-results-1"
    Then I wait for "5000" millisecond
    Then I click on button with value "Next"
    Then I wait for "5000" millisecond
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[1]//td[2]" contains "<FirstName>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[2]//td[2]" contains "<LastName>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[3]//td[2]" contains "<Organisation>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[4]//td[2]" contains "<Position>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[5]//td[2]" contains "<ContactPhone>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[6]//td[2]" contains "<EmailAddress>"
    Then I click on "Service Requests"
    Then I click on "Objection Request"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value          |
      | s2id_autogen1_search | <Organisation> |
    Then I click on button "select2-results-1"
    Then I click on button "CheckInterest"
    Then I enter the details as
      | Fields             | Value |
      | Objection_Comments | TEST  |
    Then I click on button with value "Next"
    Then I wait for "5000" millisecond
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[1]//td[2]" contains "<FirstName>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[2]//td[2]" contains "<LastName>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[3]//td[2]" contains "<Organisation>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[4]//td[2]" contains "<Position>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[5]//td[2]" contains "<ContactPhone>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[6]//td[2]" contains "<EmailAddress>"
    Then I click on "Tax Registration Cancellation"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value               |
      | s2id_autogen1_search | AQUA |
    Then I click on button "select2-results-1"
    Then I enter the details as
      | Fields            | Value |
      | ReasonDescription | TEST  |
     	| CancellationStartDate | 27517 |
    Then I click on button "ReasonDescription"
    Then I click on button with value "Next"
    Then I wait for "5000" millisecond
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[1]//td[2]" contains "<FirstName>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[2]//td[2]" contains "<LastName>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[3]//td[2]" contains "AQUA PTY LTD"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[4]//td[2]" contains "<Position>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[5]//td[2]" contains "<ContactPhone>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[6]//td[2]" contains "<EmailAddress>"
    Then I click on "Annual Lodgement Request"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value          |
      | s2id_autogen1_search | <Organisation> |
    Then I click on button "select2-results-1"
    Then I select "2018" from "YearCombo"
    Then I click on button "MonthCombo"
    Then I click on "Jan"
    Then I enter the details as
      | Fields                              | Value |
      | AnnualLodgementRequestJustification | TEST  |
    Then I click on button with value "Next"
    Then I wait for "5000" millisecond
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[1]//td[2]" contains "<FirstName>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[2]//td[2]" contains "<LastName>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[3]//td[2]" contains "<Organisation>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[4]//td[2]" contains "<Position>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[5]//td[2]" contains "<ContactPhone>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[6]//td[2]" contains "<EmailAddress>"
    Then I click on "Group Management"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value          |
      | s2id_autogen1_search | DESIGNATE PTY. LTD. |
    Then I click on button "select2-results-1"
    Then I wait for "5000" millisecond
    Then I click on button with value "Update Group"
    Then I select "2018" from "YearCombo"
    Then I click on button "MonthCombo"
    Then I click on "Jan"
    Then I click on button "CheckboxJRL"
    Then I click on button with value "Next"
    Then I wait for "5000" millisecond
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[1]//td[2]" contains "<FirstName>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[2]//td[2]" contains "<LastName>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[3]//td[2]" contains "<DESIGNATE PTY. LTD."
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[4]//td[2]" contains "<Position>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[5]//td[2]" contains "<ContactPhone>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[6]//td[2]" contains "<EmailAddress>"
    #Scenario 3: View User Profile
    Then I click on "User Profile"
    Then I see text "Position" displayed
    #Scenario 4: Edit User Profile
    Then I click on button "EditBT"
    Then I see text "Position" displayed
    Then I check "Input_LastName2" exists

    Examples: 
      | PortalName | UserName | Password   | FirstName | LastName | Position   | Organisation         | ContactPhone | EmailAddress         |
      | TSSAdmin        | jbradley | Dbresults1 | J         | Bradley  | Consultant | QUICK SINGLE PTY LTD | 04 5678 9767 | jbradley@hotmail.com |