@TSSRegression
Feature: Some feature

  # Before running this script, go to https://test-ssc.dbresults.com.au/TSSAccountMgmt/DataExtensions.aspx
  # Find mbrown's account and make sure he has an CRN, an ABN and his employer status is set to 'Designated group employer for a group and lodging for itself'
  # As of 12 pm 9/1/2017 these settings have already been implemented, but double-checking them is advised.

  Scenario Outline: DTSP-356 Error handling for Annual Payroll Tax Reconciliation when fields returned from back end system are known (error field mapping)
    #scenario 1: Same year check
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    And I check I am on "HomePage" page
    And I click on "Payroll Tax Lodgement"
    Then I click on button "Discard"
    And I check I am on "Payroll Lodgement Form" page
    Then I click on "Annual Reconciliation"
    Then I click on button "NextSection"
    Then I see text "<CRN>" displayed
    Then I see text "<ABN>" displayed
    Then I select "2014" from "YearOfReturn"
    Then I click on "Independent employer (non-group) lodging for itself"
    Then I click on button "TaxPayerDetailsNext"
    And I wait for "2000" millisecond
    Then I click on button "ACTWagesPaidNext"
    And I wait for "2000" millisecond
    Then I click on button "MonthlyReturnNext"
    And I wait for "2000" millisecond
    And I enter the details as
      | Fields              | Value       |
      | PersonFullName      | test        |
      | LegalEntityName     | Test2       |
      | EmployerDeclaration | test        |
      | PhoneNumber         |  0422184033 |
      | EmailAddress        | abc@abc.com |
    And I Tab Out
    Then I click on button "DeclarationConfirm"
    Then I check "SubmitBT" is readonly
    Then I click on "ConfirmForSubmission"
    Then I click on button "wtSubmitBT"
    Then I see text "The period entered has already been lodged. Please select a different period." displayed

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password   | CRN         | ABN         |
      | TSS        | UserNameInput | PasswordInput | mbrown   | Dbresults1 | 12121212121 | 21212121212 |

  Scenario Outline: DTSP-356 Scenario 2, 3 and 4
    #scenario 2: Aus wide wages is not greater than ACT Taxable wages
    #scenario 3: Group ACT wages is not greater than ACT Taxable wages
    #scenario 4: Aus wide wages is not greater than Group ACT wages
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    And I click on "Payroll Tax Lodgement"
    Then I click on button "Discard"
    Then I click on "Annual Reconciliation"
    Then I click on button "NextSection"
    Then I see text "<CRN>" displayed
    Then I see text "<ABN>" displayed
    Then I select "2011" from "YearOfReturn"
    Then I click on "Designated group employer for a group and lodging for itself"
    Then I click on button "TaxPayerDetailsNext"
    Then I wait for "2000" millisecond
    Then I enter the details as
      | Fields           | Value |
      | SalariesAndWages |   100 |
    Then I click on "ClaimingACTProportion_Yes"
    Then I click on "ACTWagesPaidNext"
    Then I wait for "2000" millisecond
    Then I enter the details as
      | Fields                       | Value |
      | PayrollAnswer_AustralianWide |    97 |
      | PayrollAnswer_GroupActWages  |    98 |
    Then I click on "MonthlyReturnNext"
    And I wait for "2000" millisecond
    And I enter the details as
      | Fields              | Value       |
      | PersonFullName      | test        |
      | LegalEntityName     | Test2       |
      | EmployerDeclaration | test        |
      | PhoneNumber         |  0422184033 |
      | EmailAddress        | abc@abc.com |
    And I Tab Out
    Then I click on "DeclarationConfirm"
    Then I check "Submit" is readonly
    Then I click on "ConfirmForSubmission"
    # don't remove the wt prefix, otherwise there will be a conflict with a 'HiddenSubmitBT'
    Then I click on button "wtSubmitBT"
    And I wait for "2000" millisecond
    Then I see text "Aus wide wages must be greater than or equal to ACT Taxable wages" displayed
    Then I see text "Group ACT wages must be greater than or equal to ACT Taxable wages" displayed
    Then I see text "Australia-wide wages must be greater than or equal to Group ACT wages" displayed

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password   | CRN         | ABN         |
      | TSS        | UserNameInput | PasswordInput | mbrown   | Dbresults1 | 12121212121 | 21212121212 |

  Scenario Outline: DTSP-356Part2 Scenario 2, 3 and 4
    #scenario 2: Aus wide wages is not greater than ACT Taxable wages
    #scenario 3: Group ACT wages is not greater than ACT Taxable wages
    #scenario 4: Aus wide wages is not greater than Group ACT wages
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    And I click on "Payroll Tax Lodgement"
    Then I click on button "Discard"
    Then I click on "Annual Reconciliation"
    Then I click on button "NextSection"
    Then I see text "<CRN>" displayed
    Then I see text "<ABN>" displayed
    Then I select "2011" from "YearOfReturn"
    Then I click on "Designated group employer for a group and lodging for itself"
    Then I click on button "TaxPayerDetailsNext"
    Then I wait for "2000" millisecond
    Then I enter the details as
      | Fields           | Value |
      | SalariesAndWages |   100 |
    Then I click on "ClaimingACTProportion_Yes"
    Then I click on "ACTWagesPaidNext"
    Then I wait for "2000" millisecond
    Then I enter the details as
      | Fields                       | Value |
      | PayrollAnswer_AustralianWide |   100 |
      | PayrollAnswer_GroupActWages  |    98 |
    Then I click on "MonthlyReturnNext"
    And I wait for "2000" millisecond
    And I enter the details as
      | Fields              | Value       |
      | PersonFullName      | test        |
      | LegalEntityName     | Test2       |
      | EmployerDeclaration | test        |
      | PhoneNumber         |  0422184033 |
      | EmailAddress        | abc@abc.com |
    And I Tab Out
    Then I click on "DeclarationConfirm"
    Then I check "Submit" is readonly
    Then I click on "ConfirmForSubmission"
    # don't remove the wt prefix, otherwise there will be a conflict with a 'HiddenSubmitBT'
    Then I click on button "wtSubmitBT"
    And I wait for "2000" millisecond
    Then I see text "Group ACT wages must be greater than or equal to ACT Taxable wages" displayed

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password   | CRN         | ABN         |
      | TSS        | UserNameInput | PasswordInput | mbrown   | Dbresults1 | 12121212121 | 21212121212 |

  #NOTE: Ensure that mbrown has a current employee type selected in the data extensions page
  Scenario Outline: DTSP-311: Validation Rules and Errors to be used across Annual Reconciliation Form
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    And I click on "Payroll Tax Lodgement"
    Then I click on button "Discard"
    Then I click on "Annual Reconciliation"
    Then I click on button "NextSection"
    Then I select "2012" from "YearOfReturn"
    Then I click on "Designated group employer for a group and lodging for itself"
    Then I click on "TaxPayerDetailsNext"
    Then I wait for "2000" millisecond
    #scenario 1: Restricted fields contain incorrect text type
    Then I enter the details as
      | Fields           | Value |
      | SalariesAndWages | ABC   |
    Then I check "SalariesAndWages" is empty
    #scenario 2:  Restricted fields contain correct text type
    Then I enter the details as
      | Fields                | Value |
      | SalariesAndWages      |   100 |
      | BonusesAndCommissions |   100 |
    #long id is present here to avoid conflict with a button caleld 'ACTWAgesPaidBackBt2', should be fixed soon
    Then I wait for "1000" millisecond
    Then I click on button "PaidBackBt"
    Then I click on button "TaxPayerDetailsNext"
    Then I check "SalariesAndWages" contains "$ 100"
    Then I check "BonusesAndCommissions" contains "$ 100"
    Then I click on button "ACTWagesPaidNext"
    And I wait for "2000" millisecond
    Then I click on button "MonthlyReturnNext"
    And I wait for "2000" millisecond
    #scenario 5: Mandatory fields not filled in
    Then I check "DeclarationConfirm" is readonly
    #scenario 4 (Fields are entered in incorrect format - phone number and/or email field ), then 3 (Fields are entered in correct format)
    And I enter the details as
      | Fields              | Value  |
      | PersonFullName      | test   |
      | LegalEntityName     | Test2  |
      | EmployerDeclaration | test   |
      | PhoneNumber         | 042213 |
      | EmailAddress        | abc    |
    And I Tab Out
    Then I click on "DeclarationConfirm"
    Then I see text "This is an invalid phone number." displayed
    Then I see text "Invalid email address format. Please try again." displayed
    Then I enter the details as
      | Fields       | Value       |
      | PhoneNumber  | 61042218431 |
      | EmailAddress | abc@test    |
    And I Tab Out
    # scenario 6: Mandatory fields all filled in
    Then I click on button "DeclarationConfirm"
    Then I check "Submit" is readonly
    # Scenario 7: Number of days is invalid
    Then I click on "Payroll Tax Lodgement"
    Then I click on button "NextSection"
    Then I select "2012" from "YearOfReturn"
    Then I click on button "TaxPayerDetailsNext"
    Then I click on button "ClaimingACTProportion_Yes"
    Then I click on button "ACTWagesPaidNext"
    Then I wait for "2000" millisecond
    Then I enter the details as
      | Fields                      | Value |
      | Answer_DaysPaidTaxable      |   367 |
      | DaysPaidGroupAusWide        |   367 |
      | AustralianWide              |   100 |
      | PayrollAnswer_GroupActWages |   100 |
    Then I wait for "1000" millisecond
    Then I click on button "MonthlyReturnNext"
    Then I wait for "2000" millisecond
    Then I see text "Number of days must be equal to or less than 365, or 366 for leap years" displayed
    Then I see text "Some fields are not valid. Please fix them before moving to the next section." displayed

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password   | CRN         | ABN         |
      | TSS        | UserNameInput | PasswordInput | mbrown   | Dbresults1 | 98765123456 | 12345678902 |

   Scenario Outline: DTSP-380 -> As a user I want the ability to enter my Payroll Tax Information on the Tax Registration form so that I can register for Payroll Tax
      Given I want to login to portal "<PortalName>"
    And I check I am on "Tax Registration Form" page
    Then I wait for "2000" millisecond
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                                                  |
      | item2 | Select Business Type                                      |
      | item3 | Employer Name                                             |
      | item4 | Business Trading Name                                     |
      | item5 | Australian Business Number (ABN)                          |
      | item6 | Australian Company Number (ACN)                           |
      | item7 | Business Address                                          |
      | item7 | Postal Address                                            |
      | item7 | Address where Business Records are located (Jurisdiction) |
      | item7 | Contact Person                                            |
      | item7 | Preferred Communication Method                            |
      | item7 | Postal Address                                            |
    Then I select "Company" from "SelectBusinessTypeCode"
    Then I select "Miss" from "ContactPerson_Title"
    Then I select "SMS" from "CommunicationMethodId"
    Then I enter the details as
      | Fields                    | Value              |
      | EmployerName              | DB RESULTS PTY LTD |
      | BusinessTradingName       | DB RESULTS PTY LTD |
      | RegistrationAnswer_ABN    |        97110187767 |
      | RegistrationAnswer_ACN    |          110187767 |
      | AddressLine1              | TEST               |
      | Address_City              | TEST               |
      | PostCode                  |               3333 |
      | ContactPerson_FirstName   | TEST               |
      | ContactPerson_LastName    | TEST               |
      | ContactPerson_PhoneNumber |           33333333 |
      | ContactPerson_Email       | TEST@TEST          |
    Then I select "Other" from "SelectBusinessTypeCode"
    Then I click on "TaxPayerDetailsNext"
    Then I wait for "2000" millisecond
    Then I click on "ACTWagesPaidNext"
    Then I wait for "2000" millisecond
    # Scenario 1...................updated with changes from 506
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                                                                     |
      | item2 | Date Business Commenced Employing in ACT (or Recommenced)                    |
      | item3 | Date Business Became Liable in the ACT (or Reactivated its Liability)        |
      | item4 | Number of Employees in your ACT Business                                     |
      | item5 | Business Activity in the ACT                                                 |
      | item6 | Are you a member of a group?                                                 |
      | item7 | Grouping for Payroll Tax Purposes                                            |
      | item7 | Total Taxable Wages for the five previous financial years                    |
      | item7 | As an eligible employer, do you wish to apply for annual lodgement approval? |
      Then I wait for "2000" millisecond
    And from section "AnnualLodgementApproval" I select radio button option "wtLabel_AnnualLodgementApproval_YES"
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                               |
      | item7 | Annual Lodgement Request Justification |
      | item7 | Contact Person for Payroll Tax         |
    # Scenario 2
    Then I click on "MonthlyReturnBack"
    Then I wait for "2000" millisecond
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                                         |
      | item2 | Business Activity Elsewhere in Australia         |
      | item3 | Control and Financial Interest                   |
      | item4 | (shares, beneficiaries if greater than 20% each) |
    Then I click on "ACTWagesPaidNext"
    # Then I click on "DateBusinessStart"
    Then I enter the details as
      | Fields            | Value      |
      | DateBusinessStart | 02-01-2017 |
    #   Then I click on "DateBusinessLiable"
    Then I enter the details as
      | Fields             | Value      |
      | DateBusinessLiable | 03-01-2017 |
    Then I enter the details as
      | Fields               | Value |
      | NumberOfEmployees    |    33 |
      | RequestJustification | TEST  |
    Then I enter the details as
      | Fields | Value |
    Then I click on "GroupMember_UNSURE"
    Then I click on "PayrollNext"
    Then I wait for "1000" millisecond
    #scenario 3
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                        |
      | item2 | Set Up Bank Account for Refunds |
      | item3 | BSB                             |
      | item4 | Bank Account Number             |
    Then I click on "ConfirmBack"
    Then I wait for "2000" millisecond
    #scenario 4
    Then I enter the details as
      | Fields                   | Value     |
      | TotalWagesYear           | 1111-1111 |
      | TaxableACTWages          |       100 |
      | AusWideTaxableWages      |       100 |
      | GroupAusWideTaxableWages |       100 |
    Then I click on "AddTotalWages"
    Then I see text "Remove" displayed
    Then I wait for "1000" millisecond
    #Then I click on "RemoveLine"
    Then I click on button "RemoveLine"
    Then I see "Are you sure you want to remove this year's taxable wages" displayed on popup and I click "Cancel"
    #scenario 5
    Then I click on button "RemoveLine"
    Then I see "Are you sure you want to remove this year's taxable wages" displayed on popup and I click "OK"

    Examples: 
      | PortalName       | UserNameField | PasswordField | UserName | Password   | CRN         | ABN         |
      | Tax_Registration | UserNameInput | PasswordInput | mbrown   | Dbresults1 | 12345678901 | 12345678901 |
  
  Scenario Outline: DTSP-355
    Given I want to login to portal "<PortalName>"
    And I check I am on "Tax Registration Form" page
    Then I wait for "2000" millisecond
    Then I select "Company" from "SelectBusinessTypeCode"
    Then I select "Miss" from "ContactPerson_Title"
    Then I select "SMS" from "CommunicationMethodId"
    #scenario 2: ABN/ACN combination verified against ABR, and the Organisation name entered does not match Organisation name returned from ABR (3rd party verification)
    Then I enter the details as
      | Fields                    | Value             |
      | EmployerName              | DB RESULTS PTY LT |
      | BusinessTradingName       | DB RESULTS PTY LT |
      | RegistrationAnswer_ABN    |       97110187767 |
      | RegistrationAnswer_ACN    |         110187767 |
      | AddressLine1              | TEST              |
      | Address_City              | TEST              |
      | PostCode                  |              3333 |
      | ContactPerson_FirstName   | TEST              |
      | ContactPerson_LastName    | TEST              |
      | ContactPerson_PhoneNumber |          33333333 |
      | ContactPerson_Email       | TEST@TEST         |
    Then I select "Other" from "SelectBusinessTypeCode"
    Then I click on "TaxPayerDetailsNext"
    Then I wait for "1000" millisecond
    Then I see text "Business Trading Name does not match ABN number. Please try again." displayed
    #scenario 3: ABN/ACN combination not verified against ABR (3rd party verification)
    Then I enter the details as
      | Fields                 | Value              |
      | EmployerName           | DB RESULTS PTY LTD |
      | BusinessTradingName    | DB RESULTS PTY LTD |
      | RegistrationAnswer_ABN |        97110187768 |
      | RegistrationAnswer_ACN |          110187768 |
    Then I click on "TaxPayerDetailsNext"
    Then I wait for "1000" millisecond
    Then I see text "The ABN or ACN you have entered is invalid." displayed
    #scenario 1: ABN/ACN combination verified against ABR, and the Organisation name entered matches Organisation name returned from ABR (3rd party verificati
    Then I enter the details as
      | Fields                 | Value              |
      | EmployerName           | DB RESULTS PTY LTD |
      | BusinessTradingName    | DB RESULTS PTY LTD |
      | RegistrationAnswer_ABN |        97110187767 |
      | RegistrationAnswer_ACN |          110187767 |
    Then I click on "TaxPayerDetailsNext"
    Then I wait for "2000" millisecond
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                                 |
      | item2 | Business Activity Elsewhere in Australia |
      | item3 | Business Activity Category               |
      | item4 | Control and Financial Interest           |

    Examples: 
      | PortalName       | UserNameField | PasswordField | UserName | Password   | CRN         | ABN         |
      | Tax_Registration | UserNameInput | PasswordInput | mbrown   | Dbresults1 | 12345678901 | 12345678901 |

  Scenario Outline: DTSP-310
    Given I want to login to portal "<PortalName>"
    And I check I am on "Tax Registration Form" page
    Then I wait for "2000" millisecond
    Then I select "Company" from "SelectBusinessTypeCode"
    Then I select "Miss" from "ContactPerson_Title"
    Then I select "SMS" from "CommunicationMethodId"
    #scenario 1: Restricted fields contain incorrect text type (e.g. ABC into 1234 field and vice versa)
    Then I enter the details as
      | Fields                 | Value |
      | RegistrationAnswer_ABN | TEST  |
    Then I check "RegistrationAnswer_ABN" is empty
    #scenario 2: Restricted fields contain correct text type (e.g. ABC into 1234 field)
    Then I enter the details as
      | Fields                 | Value       |
      | RegistrationAnswer_ABN | 97110187767 |
    #scenario 5: Mandatory fields not filled in
    Then I check "TaxPayerDetailsNext" is readonly
    #scenario 3, 4: Fields are entered in incorrect format (e.g. no. of digits, email format), Fields are entered in incorrect format (Refer to description for validations and error messages for each field)
    Then I enter the details as
      | Fields                    | Value             |
      | EmployerName              | DB RESULTS PTY LT |
      | BusinessTradingName       | DB RESULTS PTY LT |
      | RegistrationAnswer_ABN    |       97110187767 |
      | RegistrationAnswer_ACN    |         110187767 |
      | AddressLine1              | TEST              |
      | Address_City              | TEST              |
      | PostCode                  |                33 |
      | ContactPerson_FirstName   | TEST              |
      | ContactPerson_LastName    | TEST              |
      | ContactPerson_PhoneNumber |             33333 |
      | ContactPerson_Email       | TEST              |
    Then I select "Other" from "SelectBusinessTypeCode"
    Then I click on "TaxPayerDetailsNext"
    Then I see text "Please enter the correct number of digits for this field." displayed
    Then I see text "number of digits for this field." displayed
    Then I see text "Invalid email address format. Please try again" displayed
    Then I see text "This is an invalid phone number." displayed
    Then I enter the details as
      | Fields                    | Value              |
      | EmployerName              | DB RESULTS PTY LTD |
      | BusinessTradingName       | DB RESULTS PTY LTD |
      | RegistrationAnswer_ABN    |        97110187767 |
      | RegistrationAnswer_ACN    |          110187767 |
      | AddressLine1              | TEST               |
      | Address_City              | TEST               |
      | PostCode                  |               3333 |
      | ContactPerson_FirstName   | TEST               |
      | ContactPerson_LastName    | TEST               |
      | ContactPerson_PhoneNumber |           33333333 |
      | ContactPerson_Email       | TEST@TEST          |
    #Then I select "Other" from "SelectBusinessTypeCode"
    #Scenario 6: Mandatory fields all filled in
    Then I select "Miss" from "ContactPerson_Title"
    Then I click on "TaxPayerDetailsNext"
    Then I wait for "2000" millisecond
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                                 |
      | item2 | Business Activity Elsewhere in Australia |
      | item3 | Business Activity Category               |
      | item4 | Control and Financial Interest           |

    Examples: 
      | PortalName       | UserNameField | PasswordField | UserName | Password   | CRN         | ABN         |
      | Tax_Registration | UserNameInput | PasswordInput | mbrown   | Dbresults1 | 12345678901 | 12345678901 |

  ####################################
  ####### Iteration 3 test cases######
  ####################################
  Scenario Outline: DTSP-318: As a Customer Portal Administrator (CPA), I want to be able to search for taxpayer tips on Manage Tips page so that I can find the tips I need
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    #  Given I want to login to portal "<PortalName2>"
    # Remove the following step with the one above throughout test case when defect on UAP is fixed.
    Given I want to login to portal "<PortalName>"
    # Scenario 1: CPA access the 'Manage Tips' page
    And I wait for "2000" millisecond
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName             |
      #| item2 | Page                 |
      | item3 | Section              |
      | item5 | Tooltips Description |
      | item5 | Identifier           |
      | item5 | Status               |
    And I enter the details as
      | Fields      | Value      |
      | SearchInput | PayrollTax |
    Then I click on button "SearchBT"
    And I click on "Page"
    #Scenario 2: CPA searches for the taxpayer tips on the 'Manage Tips' page
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                         |
      | item2 | PayrollTax_AustralianWide        |
      | item3 | PayrollTax_BonusesAndCommissions |
      | item5 | PayrollTax_SuperAnnuation        |
      | item5 | PayrollTax_PayrollTaxGroupNumber |
      | item5 | PayrollTax_MonthOfReturn         |
    Then I click on button "ResetBT"
    #Scenario 3: CPA filters tips on the 'Manage Tips' page
    Then I click on button "FilterByDescription"
    And I enter the details as
      | Fields                                  | Value   |
      | FilterByDescription_block_wtinputFilter | Account |
    Then I hit Enter
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                      |
      | item2 | AccountAlreadyActivatedLine1  |
      | item3 | AccountAlreadyActivatedLine2  |
      | item5 | AccountAlreadyRegisteredLine1 |
      | item5 | AccountAlreadyRegisteredLine2 |
      | item5 | AddNewAccountIntro            |
    # | item5 | LockedAccountLine1            |.............disabling because taken out...
    #Scenario 4: More than 10 search results
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields      | Value      |
      | SearchInput | PayrollTax |
    Then I click on button "SearchBT"
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName |
      | item2 | Counter  |
    And I enter the details as
      | Fields      | Value   |
      | SearchInput | Account |
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName |
      | item2 | Counter  |

    Examples: 
      | PortalName   | PortalName2 | UserNameField | PasswordField | UserName | Password   | CRN         | ABN         |
      | TSS_Tooltips | TSSUAP      | UserNameInput | PasswordInput | jbradley | Dbresults1 | 12121212121 | 21212121212 |

  @underTest
  Scenario Outline: DTSP-25: As an organisation I want a user's details verified during registration so that only valid users register with the portal (page 1)
    #scenario 1: Same year check
    Given I want to login to portal "<PortalName>"
    And I click on "Create Account"
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                        |
      | item2 | Client Reference Number (CRN)   |
      | item3 | ABN                             |
      | item7 | By creating an account, I agree |
    #Scenario 4
    Then I click on "Sign In"
    Then I check I am on "Login" page
    #Scenario 5
    Then I click on "Create Account"
    Then I click on "Terms & Conditions"
    Then a new page "http://dbresults.com.au/terms/" is launched
    Then I check I am on "Terms of Use | DB Results - Digital Business specialists" page
    Then I see text "Terms of Use" displayed
    Given I want to login to portal "<PortalName>"
    And I click on "Create Account"
    #Scenario 3
    Then I enter the details as
      | Fields         | Value       |
      | InputABNNumber | 33333333333 |
      | InputCRNNumber | 33333333333 |
    Then I click on button "RegistrationSubmit"
    Then I see text "By creating an account, I agree to the" displayed
    Then I click on button "TermsandConditionsCheckBox"
    Then I click on button "RegistrationSubmit"
    Then I see text "Invalid CRN, ABN or ACN. Please try again." displayed
    Then I enter the details as
      | Fields         | Value       |
      | InputABNNumber | 12345678961 |
      | InputCRNNumber | 12345678961 |
    Then I click on button "RegistrationSubmit"
    Then I check I am on "Registration" page
    #DTSP-29: As a user I want to enter my user details so that I can complete the registration process (page 2)
    #Scenario 1
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                 |
      | item2 | First Name               |
      | item3 | Last Name                |
      | item4 | Email Address            |
      | item5 | Choose Username          |
      | item6 | Choose Password          |
      | item7 | Hint                     |
      | item7 | Confirm Password         |
      | item7 | Already have an account? |
    #Scenario 4: User cancels with unsaved changes
    Then I click on button "Cancel"
    Then I check I am on "Login" page
    Given I want to login to portal "<PortalName>"
    And I click on "Create Account"
    Then I enter the details as
      | Fields         | Value       |
      | InputABNNumber | 12345678961 |
      | InputCRNNumber | 12345678961 |
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
    Then I see text "Invalid email address format. Please try again." displayed
    Then I see text "Invalid password. Please try again." displayed
    Then I see text "Passwords do not match. Please try again." displayed
    #Scenario 5: User cancels with unsaved changes
    Then I click on button "Cancel"
    Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "Cancel"
    Then I check I am on "Registration" page
    Then I click on button "Cancel"
    Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "OK"
    Then I check I am on "Login" page

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password   | CRN         | ABN         |
      | TSS        | UserNameInput | PasswordInput | mbrown   | Dbresults1 | 12345678901 | 12345678901 |

  Scenario Outline: DTSP-145 , As an end user I want to be able to view my user profile settings so that I know if my profile information is up to date
    #Scenario 1: User views their profile settings
    Given I want to login to portal "<PortalName>"
    And I check "UserNameEmailLabel" is marked as "Mandatory"
    Then I check "PasswordLabel" is marked as "Mandatory"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Given I want to login to portal "AccountManagement"
    Then I check I am on "View Settings" page
    # Scenario 2: User access edit profile settings function
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName      |
      | item2 | Profile       |
      | item2 | Username      |
      | item3 | First Name    |
      | item5 | Last Name     |
      | item2 | Contact       |
      | item5 | Email Address |
      | item5 | Phone Number  |
      | item5 | Tax Agent     |
      | item5 | Security      |
      | item5 | Password      |
      | item5 | Hint          |
    And I click on "Edit"
    And I check I am on "Edit Settings" page
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName |
      | Item2 | Submit   |
      | Item3 | Cancel   |

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password   | CRN         | ABN         |
      | TSS        | UserNameInput | PasswordInput | jbradley | Dbresults1 | 12121212121 | 21212121212 |

  Scenario Outline: DTSP-147
    Given I want to login to portal "<PortalName>"
    Then I check "UserNameEmailLabel" is marked as "Mandatory"
    Then I check "PasswordLabel" is marked as "Mandatory"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Given I want to login to portal "AccountManagement"
    Then I click on button "EditBT"
    #Scenario 1: User accesses the edit function
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName           |
      | item2 | Username           |
      | item3 | First Name         |
      | item5 | Last Name          |
      | item5 | Email Address      |
      | item5 | Phone Number       |
      | item5 | Choose a Tax Agent |
      | item5 | Password           |
      | item5 | New Password       |
      | item5 | Confirm Password   |
      | item5 | Hint               |
    #Scenario 2: User enters incorrect input type into a restricted fields (e.g. entering 123 into an alphabet field)
    Then I enter the details as
      | Fields            | Value |
      | Input_PhoneNumber | TEST  |
    Then I check "Input_PhoneNumber" is empty
    #Scenario 3: User has not entered all the mandatory fields
    Then I check "CancelBT" is readonly
    #Scenario 4, 6: Scenario 6: Profile settings details does not pass all validations
    Then I enter the details as
      | Fields                   | Value                 |
      | Input_FirstName          | TEST                  |
      | Input_LastName           | TEST                  |
      | Input_PhoneNumber        |                 33333 |
      | Input_Email              | TEST                  |
      | Input_NewPassword        | adsfasdfaf            |
      | Input_NewpasswordConfirm | asfsadfsadf           |
      | Input_Hint               | testsetsetwetstsetset |
    Then I wait for "1000" millisecond
    Then I click on button "Input_FirstName"
    Then I click on button "Submit"
    #Then I see text "Please enter a valid email address" displayed
    Then I see text "Email expected!" displayed
    Then I see text "This is an invalid phone number" displayed
    Then I see text "New Password is invalid. Please try again." displayed
    Then I see text "New Password and Confirm Password do not match. Please try again." displayed
    #Scenario 8: User cancels edit function with unsaved changes
    Then I click on button "Cancel"
    Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "Cancel"
    Then I click on button "Cancel"
    Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "OK"
    Then I check I am on "View Settings" page
    Given I want to login to portal "AccountManagement"
    #Then I click on button "Cancel"
    Then I check I am on "View Settings" page
    #Scenario 5: Profile settings details pass all validations
    Then I click on button "EditBT"
    Then I enter the details as
      | Fields                   | Value                 |
      | Input_FirstName          | TEST                  |
      | Input_LastName           | TEST                  |
      | Input_PhoneNumber        |              33333333 |
      | Input_Email              | TEST@TESTTESTTSET.com |
      | Input_NewPassword        | Dbresults1            |
      | Input_NewpasswordConfirm | Dbresults1            |
      | Input_Hint               | DB RESULTS ONE        |
    #Scenario 9: User update's Tax Agent Details (Tax Agent registered and activated on the Portal)
    Then I select "OrganizationWithA_Z TaxAgents (98765432102)" from "ChooseTaxAgent"
    Then I click on button "Input_FirstName"
    Then I click on button "Submit"
    Then I see text "Your changes have been successfully saved." displayed
    Then I check I am on "View Settings" page

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password   | CRN         | ABN         |
      | TSS        | UserNameInput | PasswordInput | jbradley | Dbresults1 | 12121212121 | 21212121212 |

      
        Scenario Outline: DTSP-401: As an end user, I should not be able to view/select the 'Return Type' section on the Payroll Tax Lodgement forms when I am on subsequent sections after clicking 'Next'
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    And I click on "Payroll Tax Lodgement"
    Then I click on button "Discard"
    Then I click on "Annual Reconciliation"
    Then I click on button "NextSection"
    Then I click on button "TaxPayerDetailsBT"
    Then I check "PayrollAnswer_TypeMonthly" is readonly
    Then I check "PayrollAnswer_TypeAnnual" is readonly

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password   | CRN         | ABN         |
      | TSS        | UserNameInput | PasswordInput | jbradley | Dbresults1 | 12121212121 | 21212121212 |
      
      Scenario Outline: DTSP-440 and DTSP-441: As an organisation I want to know the type of user who is registering so that the relevant verification information can be presented.
    #ONHOLD until the tax agent registration bug can be fixed
    Given I want to login to portal "<PortalName>"
    Then I click on "Create Account"
    Then I check I am on "Registration" page
    #DTSP-440: Scenario 1 and 2
    Then I see checkbox "RegistrationAsBusiness" as selected
    Then I see checkbox "RegistrationAsTaxAgent" as not selected
    #DTSP-441, Scenario 1:
    Then I click on "Register as a Tax Agent"
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                               |
      | item2 | Registration ID                        |
      | item5 | Registered Business Name                 |
      | item5 | Registered Business Address                       |
      | item5 | Country                                |
      | item5 | Address Line 1                         |
      | item5 | Address Line 2                         |
      | item5 | Suburb / City                          |
      | item5 | Territory / State                      |
      | item5 | Postcode                               |
      | item5 | By creating an account, I agree to the |
    #DTSP-441, Scenario 3:
    Then I check "RegistrationSubmit" is readonly
    #DTSP-441, Scenario 4: User clicks on the â€˜Sign Inâ€™ link
    Then I click on "Sign In"
    Then I check I am on "Login" page
    #DTSP-441, Scenario 5: User views Terms and Conditions
    Then I click on "Create Account"
    Then I click on "Terms & Conditions"
    Then a new page "http://dbresults.com.au/terms/" is launched
    Given I want to login to portal "<PortalName>"
    Then I click on "Create Account"
    Then I click on "Register as a Tax Agent"
    Then I enter the details as
      | Fields                    | Value            |
      | InputTaxAgentABN          |      92622632200 |
      | InputTaxAgentBusinessName | GANG LE TANG     |
      | BusinessAddress_Address1  | TEST             |
      | BusinessAddress_Address2  | TEST             |
      | BusinessAddress_Suburb    | TEST             |
      | BusinessAddress_Postcode  |             3333 |
      And I select "Victoria" from "StateIdLabel"
    #Then I select "Australia" from "BusinessAddress_CountryId"
    Then I click on button "TermsandConditionsCheckBox2"
    Then I click on button "RegistrationSubmit"
    Then I check I am on "Complete Registration" page
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName         |
      | item2 | First Name       |
      | item3 | Last Name        |
      | item5 | Phone Number     |
      | item5 | Email Address    |
      | item5 | Choose Username  |
      | item5 | Choose Password  |
      | item5 | Confirm Password |
      | item5 | Hint             |
    Then I enter the details as
      | Fields                       | Value             |
      | Registration_FirstName       | TEST              |
      | Registration_LastName        | TEST              |
      | Registration_PhoneNumber     |          33333333 |
      | Registration_Email           | TEST@asdfasdfafsd |
      | Registration_Username        | TeSTMANMAN        |
      | Registration_NewPassword     | Dbresults1        |
      | Registration_ConfirmPassword | Dbresults1        |
      | Registration_Hint            |              3333 |
    Then I check "Submit" is not readonly

    Examples: 
      | PortalName | UserName | Password   |
      | TSS        | jscott   | Dbresults1 |

      