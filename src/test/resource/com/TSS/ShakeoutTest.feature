@shakeout
Feature: Shakeout Test to be done before every deployment

  #	Scenario Outline: Shakeout Test
  #	  Given I want to login to portal "<PortalName>"
  #And I enter the details as
  #| Fields        | Value      |
  #| UserNameInput | <UserName> |
  #| PasswordInput | <Password> |
  #And I hit Enter
  #Then I check I am on "Home" page
  #Then "<Item>" is displayed as "<ItemName>"
  #| Item  | ItemName            |
  #| item2 | Account Balance     |
  #| item3 | Monthly Return History |
  #| item3 | Annual Return History |
  #| item3 | RETURN PERIOD |
  #| item3 | Payroll Tax Details |
  #| item3 | Next Lodgement Due |
  #Examples:
  #| PortalName |  UserName | Password   |
  #| TSS        |  jonathan.lui | Support123 |
  
  Scenario Outline: DTSP-358: As an end user, I want to be able to submit my Annual Payroll Tax Return Form
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    #And I check I am on "Home" page
    #Then "<Item>" is displayed as "<ItemName>"
    #| Item  | ItemName   |
    #| item9 | Lodgements |
    And I click on "Lodgements"
    And I click on "Payroll Tax"
    And I check I am on "Payroll Lodgement Form" page
    Then I click on button with value "Cancel"
    Then I check I am on "Home" page
    And I click on "Lodgements"
    And I click on "Payroll Tax"
    And I check I am on "Payroll Lodgement Form" page
    Then I click on button with value "Discard"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value          |
      | s2id_autogen1_search | <Organisation> |
    Then I click on button "select2-results-1"
    Then I click on button "LodgePayrollAnswer_TypeMonthly"
    Then I select "2017" from "MonthlyObligationSelect"
    Then I click on button "NextSection"
    Then I wait for "3000" millisecond
    Then I enter the details as
      | Fields                                         | Value  |
      | SalariesAndWages                               | 100000 |
      | BonusesAndCommissions                          | 100000 |
      | LodgePayrollAnswer_Commissions                 | 100000 |
      | LodgePayrollAnswer_Allowances                  | 100000 |
      | LodgePayrollAnswer_DirectorsFees               | 100000 |
      | LodgePayrollAnswer_EligibleTerminationPayments | 100000 |
      | LodgePayrollAnswer_ValueOfBenefits             | 100000 |
      | LodgePayrollAnswer_ShareValue                  | 100000 |
      | LodgePayrollAnswer_ServiceContracts            | 100000 |
      | LodgePayrollAnswer_Superannuation              | 100000 |
      | LodgePayrollAnswer_OtherTaxablePayment         | 100000 |
      | LodgePayrollAnswer_ExemptWages                 | 100000 |
    Then I click on button "Submit"
    Then I wait for "2000" millisecond
    Then I check I am on "Payroll Tax Lodgement Summary" page
    #Check for Taxpayer Details
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                         |
      | item9 | Organisation Name                |
      | item9 | Australian Business Number (ABN) |
      | item9 | Client Reference Number (CRN)    |
    #Check for Return Type
    Then "<Item>" is displayed as "<ItemName>"
      | Item | ItemName                   |
      | item | Return Type                |
      | item | Monthly Payroll Tax Return |
      | item | Return Period              |
    #Check for Declaration
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[1]//td[2]" contains "<FirstName>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[2]//td[2]" contains "<LastName>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[3]//td[2]" contains "<Organisation>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[4]//td[2]" contains "<Position>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[5]//td[2]" contains "<ContactPhone>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[6]//td[2]" contains "<EmailAddress>"
    Then I click on button "CorrectInfoDeclared"
    Then I check "SummarySubmit" is not readonly
    Then I click on button with value "Back"
    Then I check I am on "Payroll Lodgement Form" page

    Examples: 
      | PortalName | UserName     | Password   | FirstName | LastName | Position        | Organisation        | ContactPhone | EmailAddress             |
      | TSSDev     | jonathan.lui | Support123 | Jonathan  | Lui      | Cobra Commander | DESIGNATE PTY. LTD. | 21 2312 3122 | jonathan.lui@dbresults.com.au |

  Scenario Outline: DTSP-25: As an organisation I want a user's details verified during registration so that only valid users register with the portal (page 1)
    #
    #scenario 1: Same year check
    Given I want to login to portal "<PortalName>"
    And I click on "Create Account"
   
    #Scenario 3
    Then I click on button "RegistrationAsBusiness"
    Then I enter the details as
      | Fields         | Value       |
      | InputABNNumber | 33333333333 |
      | InputCRNNumber | 33333333333 |
    Then I click on button "RegistrationSubmit"
    Then I see text "By creating an account, I agree to the" displayed
    Then I click on button "TermsandConditionsCheckBox"
    Then I click on button "RegistrationSubmit"
    Then I see text "The combination of the provided information does not refer to a registered in PSRM Entity" displayed
    Then I enter the details as
      | Fields         | Value |
      | InputABNNumber | <ABN> |
      | InputCRNNumber | <CRN> |
    Then I click on button "RegistrationSubmit"
    Then I check I am on "Registration" page
    #DTSP-29: As a user I want to enter my user details so that I can complete the registration process (page 2)
    #Scenario 1
    #Then "<Item>" is displayed as "<ItemName>"
    #| Item  | ItemName                 |
    #| item2 | First Name               |
    #| item3 | Last Name                |
    #| item4 | Email Address            |
    #| item5 | Choose Username          |
    #| item6 | Choose Password          |
    #| item7 | Hint                     |
    #| item7 | Confirm Password         |
    #| item7 | Already have an account? |
    #Scenario 4: User cancels with unsaved changes
    Then I click on button "Cancel"
    Then I check I am on "Login" page
    Given I want to login to portal "<PortalName>"
    And I click on "Create Account"
    Then I click on button "RegistrationAsBusiness"
    Then I enter the details as
      | Fields         | Value |
      | InputABNNumber | <ABN> |
      | InputCRNNumber | <CRN> |
    Then I click on button "RegistrationSubmit"
    Then I click on button "TermsandConditionsCheckBox"
    Then I check I am on "Registration" page
    Then I click on button "Submit"
    #Scenario 3: Details entered do not pass validation (Can't fully complete on this due to WIP done on the page)
    Then I enter the details as
      | Fields                 | Value       |
      | Registration_Email     | 12345678961 |
      | Registration_FirstName | Test        |
      | Registration_LastName  | Test        |
      | Registration_Username  | 12345678961 |
      | NewPassword            | 12345678961 |
      | ConfirmPassword        |   123456781 |
      | ConfirmPassword        |   123456781 |
      | PhoneNumber            |    12345671 |
      | Registration_Hint      |      123123 |
    Then I click on button "Submit"
    Then I wait for "2000" millisecond
    Then I see text "Invalid email address format. Please try again." shown
    Then I see text "Invalid password. Please try again." shown
    Then I see text "Passwords do not match. Please try again." shown
    Then I see text "Invalid Phone Number. Phone Number should be 10 digits. Please try again." shown
    #Scenario 5: User cancels with unsaved changes
    Then I click on button "Cancel"
    Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "Cancel"
    Then I check I am on "Registration" page
    Then I click on button "Cancel"
    Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "OK"
    Then I check I am on "Login" page

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName     | Password   | ABN         | CRN    |
      | TSSDev     | UserNameInput | PasswordInput | jonathan.lui | Support123 | 85085664197 | 400107 |

  @test
  Scenario Outline: DTSP-743: As an end user I want to be able to update Exemption Request Form to cater for different Tax Types
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Service Requests"
    Then I click on "Exemption Request"
    #Scenario 1: Display "Objection Request" Form
    Then I check "OrganizationalName" is readonly
    Then I check "PayrollAnswer_ABN" is readonly
    Then I check "PayrollAnswer_CRN" is readonly
    Then I check "ExemptionStartDateInput" is readonly
    Then I check "ExemptionEndDateInput" is readonly
    Then I check "JustificationInput" is readonly
    #Scenario 2: "Objection Information" section displayed on the "Objection Request" Form
    #Then I click on button "select2-chosen-1"
    #Then I enter the details as
      #| Fields               | Value          |
      #| s2id_autogen1_search | <Organisation> |
    #Then I click on button "select2-results-1"
    #Then I click on button "TaxTypeSelection"
    #Then I see text "Ambulance Levy" displayed
    #Then I see text "Energy Industry Levy" displayed
    #Then I see text "Income Tax Equivalent" displayed
    #Then I see text "Payroll Tax" displayed
    #Then I see text "Utilities(Network Facilities) Tax" displayed
    #Then I click on button "select2-chosen-1"
    #Then I enter the details as
      #| Fields               | Value  |
      #| s2id_autogen1_search | Abacus |
    #Then I click on button "select2-results-1"
    #Then I check "TaxTypeSelection" is readonly
    #Then I check "TaxTypeSelection" contains "PAYROLL"
    #Then I click on "Exemption Request"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value          |
      | s2id_autogen1_search | <Organisation> |
    Then I click on button "select2-results-1"
    #		Then I click on button "TaxTypeSelection"
    #Then I click on "Income Tax Equivalent Tax"
    #		Then I see text "Ambulance Levy" displayed
    #		Then I see text "Energy Industry Levy" displayed
    #		Then I see text "Income Tax Equivalent" displayed
    #		Then I see text "Payroll Tax" displayed
    #		Then I see text "Utilities(Network Facilities) Tax" displayed
    Then I enter the details as
      | Fields                  | Value  |
      | ExemptionStartDateInput | 020617 |
      | ExemptionEndDateInput   | 030617 |
    #		Then I click on button "ExemptionStartDateInput"
    #Then I click on "20170602"
    #Then I click on button "calTriggerOut"
    #Then I click on button "ExemptionEndDateInput"
    #Then I click on "20170603"
    # Then I click on button "calTriggerOut"
    Then I enter the details as
      | Fields             | Value |
      | JustificationInput | TEST  |
    Then I click on button with value "Next"
    Then I wait for "2000" millisecond
    Then I check object with xpath "//*[contains(text(), 'Requested Exemption Start Date')]/..//following-sibling::td" contains "02 Jun 2017"
    Then I check object with xpath "//*[contains(text(), 'Requested Exemption End Date')]/..//following-sibling::td" contains "03 Jun 2017"
    Then I check object with xpath "//*[contains(text(), 'Tax Type')]//following-sibling::td" contains "Payroll Tax"
    Then I check object with xpath "//*[contains(text(), 'Exemption Request Justification')]/..//following-sibling::td" contains "TEST"
    Then I check I am on "Exemption Request Summary" page
    #check declaration
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[1]//td[2]" contains "<FirstName>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[2]//td[2]" contains "<LastName>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[3]//td[2]" contains "<Organisation>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[4]//td[2]" contains "<Position>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[5]//td[2]" contains "<ContactPhone>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[6]//td[2]" contains "<EmailAddress>"

    Examples: 
      | PortalName | UserName     | Password   | FirstName | LastName | Position        | Organisation        | ContactPhone | EmailAddress                  |
      | TSS        | jonathan.lui | Support123 | Jonathan  | Lui      | Cobra Commander | AQUA PTY LTD | 21 2312 3122 | jonathan.lui@dbresults.com.au |
