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

@current
  Scenario Outline: DTSP-526, 531: Update the ABN LookUp Rules for Payroll Tax Registration Form / Update the first page of the Portal Registration process
    Given I want to login to portal "<PortalName>"
    #This user has the ABN 12345678933, but since it's a tax agent user it isn't shown in the lodgement form
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Payroll Tax Registration"
    And I enter the details as
      | Fields                 | Value       |
      | RegistrationAnswer_ABN | 85613104316 |
    Then I click on button with value "Next"
    Then I wait for "5000" millisecond
    Then I select "Other" from "SelectBusinessTypeCode"
    #Then I select "Mr" from "ContactPerson_Title"
    #Then I select "Direct Post" from "CommunicationMethodId"
    #Then I select "Other" from "SelectBusinessTypeCode"
    #Then I enter the details as
    #| Fields                    | Value         |
    #| Address_AddressLine1      | TEST          |
    #| Address_City              | TEST          |
    #| PostCode                  |          3333 |
    #| ContactPerson_FirstName   | TEST          |
    #| ContactPerson_LastName    | TEST          |
    #| ContactPerson_PhoneNumber |     333333333 |
    #| ContactPerson_Email       | test@test.com |
    #Scenario 7: ABN Lookup for Inactive ABN
    Then I enter the details as
      | Fields              | Value                |
      | EmployerName        | CODAVALLI, AARADHANA |
      | BusinessTradingName | CODAVALLI, AARADHANA |
    Then I click on button "TaxPayerDetailsNextBT"
    Then I wait for "5000" millisecond
    Then I see text "Your ABN is not valid. Please enter a valid ABN." displayed
    Then I click on "Payroll Tax Registration"
    Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "OK"
    #Then I click on button "EmployerName"
    #Then I click on button "TaxPayerDetailsNext"
    #Scenario 8:ABN Lookup for Invalid ABN
    And I enter the details as
      | Fields                 | Value       |
      | RegistrationAnswer_ABN | 99999999999 |
    Then I click on button with value "Next"
    Then I wait for "5000" millisecond
    Then I select "Other" from "SelectBusinessTypeCode"
    Then I enter the details as
      | Fields              | Value |
      | EmployerName        | TEST  |
      | BusinessTradingName | TEST  |
    Then I click on button "TaxPayerDetailsNextBT"
    Then I wait for "5000" millisecond
    Then I see text "Your ABN is not valid. Please enter a valid ABN." displayed
    Then I click on "Payroll Tax Registration"
    Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "OK"
    #Scenario 6: ABN Lookup for Tax Agent with an active ABN, incorrect Registered Business Name, and Entity Type is not 'Individual'
    And I enter the details as
      | Fields                 | Value |
      | RegistrationAnswer_ABN | <ABN> |
    Then I click on button with value "Next"
    Then I wait for "5000" millisecond
    Then I select "Other" from "SelectBusinessTypeCode"
    Then I enter the details as
      | Fields              | Value                       |
      | EmployerName        | The Fire Company Pty Limite |
      | BusinessTradingName | The Fire Company Pty Limite |
    Then I click on button "RegistrationAnswer_ACN"
    Then I wait for "5000" millisecond
    Then I click on button "TaxPayerDetailsNextBT"
    Then I wait for "5000" millisecond
    Then I see text "Your Organisation Name doesn't match with your ABN. Please try again." displayed
    Then I click on "Payroll Tax Registration"
    Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "OK"
    #Scenario 4: ABN Lookup for Tax Agent with an active ABN, incorrect Registered Business Name, and Entity Type = Individual
    And I enter the details as
      | Fields                 | Value       |
      | RegistrationAnswer_ABN | 71583328324 |
    Then I click on button with value "Next"
    Then I wait for "5000" millisecond
    Then I enter the details as
      | Fields              | Value          |
      | EmployerName        | PSALTIS, COSMA |
      | BusinessTradingName | PSALTIS, COSMA |
    Then I select "Other" from "SelectBusinessTypeCode"
    Then I click on button "TaxPayerDetailsNextBT"
    Then I wait for "5000" millisecond
    Then I see text "Your Organisation Name doesn't match with your ABN. Please try again." displayed
    Then I click on "Payroll Tax Registration"
    Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "OK"
    #Scenario 3: ABN Lookup for Tax Agent with an active ABN, correct Registered Business Name, and Entity Type = Individual
    And I enter the details as
      | Fields                 | Value       |
      | RegistrationAnswer_ABN | 71583328324 |
    Then I click on button with value "Next"
    Then I wait for "5000" millisecond
    Then I enter the details as
      | Fields              | Value           |
      | EmployerName        | PSALTIS, COSMAS |
      | BusinessTradingName | PSALTIS, COSMAS |
    Then I select "Other" from "SelectBusinessTypeCode"
    Then I click on button "TaxPayerDetailsNextBT"
    Then I enter the details as
      | Fields                    | Value      |
      | AddressLine1              | TEST       |
      | Address_City              | TEST       |
      | PostCode                  |       3333 |
      | ContactPerson_FirstName   | TEST       |
      | ContactPerson_LastName    | TEST       |
      | ContactPerson_PhoneNumber | 1234567890 |
    Then I click on "Payroll Tax Registration"
    Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "OK"
    #Scenario 5: ABN Lookup for Tax Agent with an active ABN, correct Registered Business Name, and Entity Type is not 'Individual'
    And I enter the details as
      | Fields                 | Value |
      | RegistrationAnswer_ABN | <ABN> |
    Then I click on button with value "Next"
    Then I wait for "5000" millisecond
    Then I enter the details as
      | Fields              | Value         |
      | EmployerName        | <CompanyName> |
      | BusinessTradingName | <CompanyName> |
    Then I select "Other" from "SelectBusinessTypeCode"
    Then I click on button "TaxPayerDetailsNextBT"
    Then I enter the details as
      | Fields                    | Value      |
      | AddressLine1              | TEST       |
      | Address_City              | TEST       |
      | PostCode                  |       3333 |
      | ContactPerson_FirstName   | TEST       |
      | ContactPerson_LastName    | TEST       |
      | ContactPerson_PhoneNumber | 1234567890 |

    Examples: 
      | PortalName | CompanyName          | ABN         | UserName | Password   |
      | TSSDev        | Dynamic Fire Pty Ltd | 80134834334 |  jonathan.lui  | Support123 |

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
