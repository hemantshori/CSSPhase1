Feature: Stuff for TSS Phase 2

  # Before running this script, go to https://test-ssc.dbresults.com.au/TSSAccountMgmt/DataExtensions.aspx
  # Find mbrown's account and make sure he has an CRN, an ABN and his employer status is set to 'Designated group employer for a group and lodging for itself'
  # As of 12 pm 9/1/2017 these settings have already been implemented, but double-checking them is advised.
  @done
  Scenario Outline: DTSP-356 Error handling for Annual Payroll Tax Reconciliation when fields returned from back end system are known (error field mapping)
    #scenario 1: Same year check
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    And I check I am on "HomePage" page
    And I click on "Payroll Tax"
    Then I click on button "GeneralCancelBt"
    And I check I am on "Payroll Lodgement Form" page
    Then I click on "Annual Reconciliation"
    Then I click on button "NextSection"
    Then I see text "<CRN>" displayed
    Then I see text "<ABN>" displayed
    Then I select "2014" from "YearOfReturn"
    Then I click on "TaxPayerDetailsNext"
    And I wait for "3000" millisecond
    Then I click on "ACTWagesPaidNext"
    And I wait for "3000" millisecond
    Then I click on "MonthlyReturnNext"
    And I wait for "3000" millisecond
    And I enter the details as
      | Fields              | Value       |
      | PersonFullName      | test        |
      | LegalEntityName     | Test2       |
      | EmployerDeclaration | test        |
      | PhoneNumber         |  0422184033 |
      | EmailAddress        | abc@abc.com |
    Then I click on "DeclarationConfirm"
    Then I check "SubmitBT" is readonly
    Then I click on "ConfirmForSubmission"
    Then I click on button "wtSubmitBT"
    Then I see text "The period entered has already been lodged. Please select a different period." displayed

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password  | CRN         | ABN         |
      | TSS        | UserNameInput | PasswordInput | mbrown   | dbresults | 12121212121 | 21212121212 |

  @done
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
    And I click on "Payroll Tax"
    Then I click on button "GeneralCancelBt"
    Then I click on "Annual Reconciliation"
    Then I click on button "NextSection"
    Then I see text "<CRN>" displayed
    Then I see text "<ABN>" displayed
    Then I select "2011" from "YearOfReturn"
    Then I click on button "TaxPayerDetailsNext"
    Then I wait for "3000" millisecond
    Then I enter the details as
      | Fields           | Value |
      | SalariesAndWages |   100 |
    Then I click on "ClaimingACTProportion_Yes"
    Then I click on "ACTWagesPaidNext"
    Then I wait for "3000" millisecond
    Then I enter the details as
      | Fields                       | Value |
      | PayrollAnswer_AustralianWide |     1 |
      | PayrollAnswer_GroupActWages  |    98 |
    Then I click on "MonthlyReturnNext"
    And I wait for "3000" millisecond
    And I enter the details as
      | Fields              | Value       |
      | PersonFullName      | test        |
      | LegalEntityName     | Test2       |
      | EmployerDeclaration | test        |
      | PhoneNumber         |  0422184033 |
      | EmailAddress        | abc@abc.com |
    Then I click on "DeclarationConfirm"
    Then I check "Submit" is readonly
    Then I click on "ConfirmForSubmission"
    # don't remove the wt prefix, otherwise there will be a conflict with a 'HiddenSubmitBT'
    Then I click on button "wtSubmitBT"
    And I wait for "3000" millisecond
    Then I see text "Aus wide wages must be greater than or equal to ACT Taxable wages" displayed
    Then I see text "Group ACT wages must be greater than or equal to ACT Taxable wages" displayed
    Then I see text "Australia-wide wages must be greater than or equal to Group ACT wages" displayed

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password  | CRN         | ABN         |
      | TSS        | UserNameInput | PasswordInput | mbrown   | dbresults | 12121212121 | 21212121212 |

  #NOTE: Ensure that mbrown has a current employee type selected in the data extensions page
  @done
  Scenario Outline: DTSP-311: Validation Rules and Errors to be used across Annual Reconciliation Form
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    And I click on "Payroll Tax"
    Then I click on button "GeneralCancelBt"
    Then I click on "Annual Reconciliation"
    Then I click on button "NextSection"
    Then I select "2012" from "YearOfReturn"
    Then I click on "TaxPayerDetailsNext"
    Then I wait for "3000" millisecond
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
    Then I click on button "wt475_block_wtContent_wtACTWagesPaidBackBt"
    Then I click on button "TaxPayerDetailsNext"
    Then I check "SalariesAndWages" contains "$ 100"
    Then I check "BonusesAndCommissions" contains "$ 100"
    Then I click on button "ACTWagesPaidNext"
    And I wait for "3000" millisecond
    Then I click on button "MonthlyReturnNext"
    And I wait for "3000" millisecond
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
    Then I click on "DeclarationConfirm"
    Then I see text "This is an invalid phone number." displayed
    Then I see text "Email address is not in the correct format." displayed
    Then I enter the details as
      | Fields       | Value       |
      | PhoneNumber  | 61042218431 |
      | EmailAddress | abc@test    |
    # scenario 6: Mandatory fields all filled in
    Then I click on button "DeclarationConfirm"
    Then I check "Submit" is readonly
    # Scenario 7: Number of days is invalid
    Then I click on "Payroll Tax"
    Then I click on button "NextSection"
    Then I select "2012" from "YearOfReturn"
    Then I click on button "TaxPayerDetailsNext"
    Then I click on button "ClaimingACTProportion_Yes"
    Then I click on button "ACTWagesPaidNext"
    Then I wait for "3000" millisecond
    Then I enter the details as
      | Fields                      | Value |
      | Answer_DaysPaidTaxable      |   367 |
      | DaysPaidGroupAusWide        |   367 |
      | AustralianWide              |   100 |
      | PayrollAnswer_GroupActWages |   100 |
    Then I click on button "MonthlyReturnNext"
    Then I wait for "3000" millisecond
    Then I see text "Number of days must be equal to or less than 365, or 366 for leap years" displayed
    Then I see text "Some fields are not valid. Please fix them before moving to the next section." displayed

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password  | CRN         | ABN         |
      | TSS        | UserNameInput | PasswordInput | mbrown   | dbresults | 98765123456 | 12345678902 |

  @done
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
      | item6 | Australian Company Name (ACN)                             |
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
    # Scenario 1: User views Payroll Tax Information details
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
      | item7 | Annual Lodgement Request Justification                                       |
      | item7 | Contact Person for Payroll Tax                                               |
    # Scenario 2: User navigates to the previous section
    Then I click on "MonthlyReturnBack"
    Then I wait for "2000" millisecond
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                                         |
      | item2 | Business Activity Elsewhere in Australia         |
      | item3 | Control and Financial Interest                   |
      | item4 | (shares, beneficiaries if greater than 20% each) |
    Then I click on "ACTWagesPaidNext"
    Then I click on "DateBusinessStart"
    Then I click on "20170102"
    Then I click on "DateBusinessLiable"
    Then I click on "20170103"
    Then I enter the details as
      | Fields               | Value |
      | NumberOfEmployees    |    33 |
      | RequestJustification | TEST  |
    Then I enter the details as
      | Fields | Value |
    Then I click on "GroupMember_UNSURE"
    Then I click on "PayrollNext"
    Then I wait for "2000" millisecond
    #Scenario 3: User navigates to the next section
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                        |
      | item2 | Set Up Bank Account for Refunds |
      | item3 | BSB                             |
      | item4 | Bank Account Number             |
    Then I click on "ConfirmBack"
    Then I wait for "2000" millisecond
    #Scenario 4: User adds another year's wages
    Then I enter the details as
      | Fields                   | Value     |
      | TotalWagesYear           | 1111-1111 |
      | TaxableACTWages          |       100 |
      | AusWideTaxableWages      |       100 |
      | GroupAusWideTaxableWages |       100 |
    Then I click on "AddTotalWages"
    Then I see text "Remove" displayed
    Then I click on "RemoveLine"
    Then I see "Are you sure you want to remove this year's taxable wages" displayed on popup and I click "Cancel"
    #Scenario 5: User removes a year's taxable wages
    Then I click on "RemoveLine"
    Then I see "Are you sure you want to remove this year's taxable wages" displayed on popup and I click "OK"

    Examples: 
      | PortalName       | UserNameField | PasswordField | UserName | Password  | CRN         | ABN         |
      | Tax_Registration | UserNameInput | PasswordInput | mbrown   | dbresults | 12345678901 | 12345678901 |

  @done
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
      | PortalName       | UserNameField | PasswordField | UserName | Password  | CRN         | ABN         |
      | Tax_Registration | UserNameInput | PasswordInput | mbrown   | dbresults | 12345678901 | 12345678901 |

  @done
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
    Then I select "Partnership" from "SelectBusinessTypeCode"
    Then I click on "TaxPayerDetailsNext"
    Then I see text "Please enter the correct number of digits for this field." displayed
    Then I see text "number of digits for this field." displayed
    Then I see text "Email address is not in the correct format." displayed
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
    # Then I click on button "wt11_block_wt33"
    #Then I select "Partnership" from "SelectBusinessTypeCode"
    Then I select "Email" from "CommunicationMethodId"
    #Scenario 6: Mandatory fields all filled in
    Then I click on button "TaxPayerDetailsNextBT"
    Then I wait for "2000" millisecond
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                                 |
      | item2 | Business Activity Elsewhere in Australia |
      | item3 | Business Activity Category               |
      | item4 | Control and Financial Interest           |

    Examples: 
      | PortalName       | UserNameField | PasswordField | UserName | Password  | CRN         | ABN         |
      | Tax_Registration | UserNameInput | PasswordInput | mbrown   | dbresults | 12345678901 | 12345678901 |

  @done
  Scenario Outline: DTSP-69: As an end user, I want to be able to enter details for my Annual Reconciliation Payroll Tax Return Form, so that my Payroll Tax Return is lodged
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    And I check I am on "HomePage" page
    #Scenario 1: End user cancels with no unsaved changes
    And I click on "Payroll Tax"
    Then I click on button "GeneralCancelBt"
    Then I click on button "wtActions_wt364"
    And I check I am on "HomePage" page
    #scenario 2: End user cancels with unsaved changes
    And I click on "Payroll Tax"
    Then I click on button "GeneralCancelBt"
    Then I click on "Annual Reconciliation"
    Then I click on "NextSection"
    Then I select "2011" from "YearOfReturn"
    Then I click on button "wtActions_wt364"
    Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "Cancel"
    And I check I am on "Payroll Lodgement Form" page
    Then I click on button "wtActions_wt364"
    Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "OK"
    And I check I am on "HomePage" page
    #And I check "TaxPayerDetails" is readonly
    #scenario 3: End user saves and exits
    And I click on "Payroll Tax"
    Then I click on "Annual Reconciliation"
    #Then I click on button "NextSection"
    Then I click on button "SaveAndExit"
    And I check I am on "HomePage" page
    #scenario 4: End user saves
    And I click on "Payroll Tax"
    Then I click on "Annual Reconciliation"
    Then I click on "NextSection"
    Then I select "2012" from "YearOfReturn"
    Then I click on "TaxPayerDetailsSave"
    Then I wait for "1000" millisecond
    Then I see text "Your changes have been successfully saved" displayed
    #scenario 5: End user goes to previous page with unsaved changes
    Then I select "2015" from "YearOfReturn"
    Then I click on button "TaxPayerDetailsNext"
    Then I click on button "wt475_block_wtContent_wtACTWagesPaidBackBt"
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                         |
      | item2 | Client Reference Number (CRN)    |
      | item3 | Australian Business Number (ABN) |
      | item4 | Payroll Tax Group Number         |
    #scenario 6: End user navigates away from form with no unsaved changes
    Then I click on button "TaxPayerDetailsSave"
    Then I click on "Settings"
    Given I want to login to portal "<PortalName>"
    #scenario 7: End user navigates away from form with unsaved changes
    Then I click on "Payroll Tax"
    Then I click on "NextSection"
    Then I select "2014" from "YearOfReturn"
    Then I click on "Payroll Tax"
    Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "Cancel"
    And I check I am on "Payroll Lodgement Form" page
    Then I click on "Payroll Tax"
    Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "OK"
    #scenario 8: As an end user, I want to be able to enter details for my Annual Reconciliation Payroll Tax Return Form, so that my Payroll Tax Return is lodged
    Then I click on "Payroll Tax"
    Then I click on "NextSection"
    Then I select "2014" from "YearOfReturn"
    Then I click on "TaxPayerDetailsNext"
    Then I click on "ACTWagesPaidNext"
    Then I click on "MonthlyReturnNext"
    And I wait for "3000" millisecond
    And I enter the details as
      | Fields              | Value       |
      | PersonFullName      | test        |
      | LegalEntityName     | Test2       |
      | EmployerDeclaration | test        |
      | PhoneNumber         |  0422184033 |
      | EmailAddress        | abc@abc.com |
    Then I click on "DeclarationConfirm"
    Then I click on "ConfirmBack"
    Then I click on "DeclarationBack"
    Then I click on "MonthlyReturnNext"
    Then I click on "DeclarationConfirm"
    Then I check "Submit" is readonly

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password  |
      | TSS        | UserNameInput | PasswordInput | mbrown   | dbresults |

  @done
  Scenario Outline: DTSP-302: Business Rules for Annual Payroll Tax Reconciliation Calculation
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    And I click on "Payroll Tax"
    And I click on "Answer_TypeAnnual"
    And I click on "NextSection"
    Then I wait for "2000" millisecond
    Then I select "2017" from "YearOfReturn"
    #Designated group employer for a group and lodging for itself
    Then I click on "LodgePayrollAnswer_EmployerStatus_Opt2"
    Then I click on "TaxPayerDetailsNext"
    Then I wait for "2000" millisecond
    #SCENARIO 1: Member of a group, and choosing to claim Tax Free Threshold, given they are a DGE or JRL (i.e.eligible for Tax Free Threshold) and the Tax Amount Payable is negative (Refund)
    #Initial Annual Threshold Adjustment = 365 / 365 = 1
    #Tax Free Threshold = 1 * (1000/1000) * 2000000 = 2000000
    #Taxable Wages = 10000 - 2000000 = -1990000 -> 0
    #Tax Payable = -1990000 * 0.0685 = -136315 -> 0
    #Amount Payable = -136315 - 10000 = -136815.00
    Then I enter the details as
      | Fields           | Value |
      | SalariesAndWages | 10000 |
    Then I click on "ClaimingACTProportion_Yes"
    Then I click on "ACTWagesPaidNext"
    Then I wait for "3000" millisecond
    Then I enter the details as
      | Fields          | Value |
      | DaysPaidTaxable |   365 |
      | AustralianWide  |  1000 |
      | GroupActWages   |  1000 |
      | TotalTaxPaid    |   500 |
    Then I wait for "2000" millisecond
    Then I check "TaxThreshold" contains "$ 2,000,000"
    Then I check "TaxableWages" contains "$ 0"
    Then I check "TaxPayable" contains "$ 0"
    Then I enter the details as
      | Fields       | Value |
      | TotalTaxPaid |   501 |
    Then I check "AmountPayableOrRefund" contains "$ -136,816"
    #SCENARIO 2: Member of a group, and choosing to claim Tax Free Threshold, given they are a DGE or JRL (i.e.eligible for Tax Free Threshold) and the Tax Amount Payable is positive (amount payable)
    #Initial Annual Threshold Adjustment = 1 / 365 = 1 / 365
    #Tax Free Threshold = 1 / 365 * (100/1000) * 2000000 = 547.94
    #Taxable Wages = 100 - 2000000 = -1999900 -> 0
    #Tax Payable = -1999900 * 0.0685 = -136993.15 -> 0
    #Amount Payable = -136993.15 - 100 = -137093.15
    Then I enter the details as
      | Fields          | Value |
      | DaysPaidTaxable |     1 |
      | AustralianWide  |  1000 |
      | GroupActWages   |  1000 |
      | TotalTaxPaid    |   500 |
    Then I wait for "2000" millisecond
    Then I check "TaxThreshold" contains "$ 5,479.45"
    Then I check "TaxableWages" contains "$ 4,520.54"
    Then I check "TaxPayable" contains "$ 309.65"
    Then I enter the details as
      | Fields       | Value |
      | TotalTaxPaid |   201 |
    Then I wait for "2000" millisecond
    Then I check "AmountPayableOrRefund" contains "$ 108.65"
    #SCENARIO 3: Member of a group, and choosing NOT to claim Tax Free Threshold, given they are a DGE or JRL (i.e.eligible for Tax Free Threshold) and the Tax Amount Payable is negative (Refund)
    #Taxable Wages = ACT Taxable wages = $10,000
    #Tax Payable = 10000 * 0.0685 = 685
    #Amount Payable = 685 - (Less Total Tax Paid) = 685 - 500 = 185
    Then I click on "MonthlyReturnBack"
    Then I wait for "1000" millisecond
    Then I click on "ClaimingACTProportion_No"
    Then I click on "ACTWagesPaidNext"
    Then I wait for "2000" millisecond
    Then I enter the details as
      | Fields       | Value |
      | TotalTaxPaid |   700 |
    Then I wait for "2000" millisecond
    Then I check "TaxableWages" contains "$ 10,000"
    Then I check "TaxPayable" contains "$ 685"
    #Then I check "AmountPayableOrRefund" contains "$ 185.00"
    Then I check "AmountPayableOrRefund" contains "$ 0"
    #SCENARIO 4: Member of a group, and choosing NOT to claim Tax Free Threshold, given they are a DGE or JRL (i.e.eligible for Tax Free Threshold) and the Tax Amount Payable is positive (amount payable)
    Then I enter the details as
      | Fields       | Value |
      | TotalTaxPaid |   500 |
    #Then I check "AmountPayableOrRefund" contains "$ 0"
    Then I check "AmountPayableOrRefund" contains "$ 185"
    #SCENARIO 5: Member of a group, and cannot claim Tax Free Threshold, given they are a Member of a group lodging for itself (i.e. NOT eligible for Tax Free Threshold) and the Tax Amount Payable is negative (Refund)
    Then I click on "MonthlyReturnBack"
    Then I wait for "2000" millisecond
    Then I click on "Payroll Tax"
    And I click on "Answer_TypeAnnual"
    And I click on "NextSection"
    Then I wait for "2000" millisecond
    Then I select "2017" from "YearOfReturn"
    Then I click on "LodgePayrollAnswer_EmployerStatus_Opt4"
    Then I click on "TaxPayerDetailsNext"
    Then I wait for "2000" millisecond
    Then I enter the details as
      | Fields           | Value |
      | SalariesAndWages | 10000 |
    Then I click on "ACTWagesPaidNext"
    Then I wait for "2000" millisecond
    Then I enter the details as
      | Fields       | Value |
      | TotalTaxPaid |   700 |
    Then I check "TaxableWages" contains "$ 10,000"
    Then I check "TaxPayable" contains "$ 685"
    Then I check "AmountPayableOrRefund" contains "$ -15"
    #SCENARIO 6: Member of a group, and cannot claim Tax Free Threshold, given they are a Member of a group lodging for itself (i.e. NOT eligible for Tax Free Threshold) and the Tax Amount Payable is positive (amount payable)
    Then I enter the details as
      | Fields       | Value |
      | TotalTaxPaid |   500 |
    Then I check "AmountPayableOrRefund" contains "$ 185"
    #SCENARIO 7: Not member of a group, and choosing to claim Tax Free Threshold, given they are an Independent Employer non-group (i.e. eligible for Tax Free Threshold) and the Tax Amount Payable is negative (Refund)
    #Initial Annual Threshold Adjustment = 365 / 365 = 1
    #Tax Free Threshold = 1 * (10000/1000) * 2000000 = 20000000
    #Taxable Wages = 1000 - 20000000 = -19990000 -> 0
    #Tax Payable = -19990000 * 0.0685 = -1369315 -> 0
    #Amount Payable = -1369315 - 10000 = -1369815
    And I click on "Payroll Tax"
    Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "OK"
    And I click on "Answer_TypeAnnual"
    And I click on "NextSection"
    Then I wait for "2000" millisecond
    Then I select "2017" from "YearOfReturn"
    Then I click on "LodgePayrollAnswer_EmployerStatus_Independent"
    Then I click on "TaxPayerDetailsNext"
    Then I enter the details as
      | Fields           | Value |
      | SalariesAndWages | 10000 |
    Then I click on "ClaimingACTProportion_Yes"
    Then I click on "ACTWagesPaidNext"
    Then I wait for "2000" millisecond
    Then I enter the details as
      | Fields          | Value |
      | DaysPaidTaxable |   365 |
      | AustralianWide  |  1000 |
      | TotalTaxPaid    |   500 |
    Then I check "TaxThreshold" contains "$ 20,000,000"
    Then I check "TaxableWages" contains "$ 0"
    Then I check "TaxPayable" contains "$ 0"
    Then I enter the details as
      | Fields       | Value |
      | TotalTaxPaid |   501 |
    Then I check "AmountPayableOrRefund" contains "$ -1,369,816"
    #SCENARIO 8: Not member of a group, and choosing to claim Tax Free Threshold, given they are an Independent Employer non-group (i.e. eligible for Tax Free Threshold) and the Tax Amount Payable is positive (amount payable)
    #Initial Annual Threshold Adjustment = 1 / 365 = 1
    #Tax Free Threshold = 1 / 365 * (10000/100000) * 2000000 =  547.94
    #Taxable Wages = 10000 -  547.94 = 9452.05
    #Tax Payable = 9452.05 * 0.0685 = 647.46
    #Amount Payable = 647.46 - 500 = 147.46
    Then I enter the details as
      | Fields          | Value  |
      | DaysPaidTaxable |      1 |
      | AustralianWide  | 100000 |
      | TotalTaxPaid    |    500 |
    Then I check "TaxThreshold" contains "$ 547.94"
    Then I check "TaxableWages" contains "$ 9,452.05"
    Then I check "TaxPayable" contains "$ 647.46"
    Then I check "AmountPayableOrRefund" contains "$ 147.46"
    Then I enter the details as
      | Fields       | Value |
      | TotalTaxPaid |   501 |
    Then I wait for "1000" millisecond
    Then I check "AmountPayableOrRefund" contains "$ 146.46"
    #SCENARIO 9: Not member of a group, and choosing NOT to claim Tax Free Threshold, given they are an Independent Employer non-group (i.e. eligible for Tax Free Threshold) and the Tax Amount Payable is negative (Refund)
    Then I click on "MonthlyReturnBack"
    Then I click on "ClaimingACTProportion_No"
    Then I click on "ACTWagesPaidNext"
    Then I wait for "2000" millisecond
    Then I enter the details as
      | Fields       | Value |
      | TotalTaxPaid |   700 |
    Then I check "TaxableWages" contains "$ 10,000"
    Then I check "TaxPayable" contains "$ 685"
    Then I check "AmountPayableOrRefund" contains "$ -15"
    #SCENARIO 10: Not member of a group, and choosing NOT to claim Tax Free Threshold, given they are an Independent Employer non-group (i.e. eligible for Tax Free Threshold) and the Tax Amount Payable is positive (amount payable)
    Then I enter the details as
      | Fields       | Value |
      | TotalTaxPaid |   500 |
    Then I wait for "2000" millisecond
    Then I check "AmountPayableOrRefund" contains "$ 185"

    Examples: 
      | PortalName | UserName | Password  | CRN         | ABN         |
      | TSS        | mbrown   | dbresults | 12345678901 | 12345678901 |

  @done
  Scenario Outline: DTSP-302 Scenario 11-13
    #SCENARIO 11: Individual Employer non-group claiming tax free threshold - Aus wide wages must be greater than or equal to ACT wages
    #Then I click on "Payroll Tax"
    #Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "OK"
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    And I click on "Payroll Tax"
    Then I click on "Cancel"
    Then I click on "Payroll Tax"
    And I click on "Answer_TypeAnnual"
    And I click on "NextSection"
    Then I select "2012" from "YearOfReturn"
    Then I click on "TaxPayerDetailsNext"
    Then I click on "ClaimingACTProportion_Yes"
    Then I click on "ACTWagesPaidNext"
    Then I wait for "2000" millisecond
    Then I enter the details as
      | Fields          | Value |
      | DaysPaidTaxable |     1 |
      | AustralianWide  |    50 |
      | GroupActWages   |   100 |
    Then I click on "MonthlyReturnNext"
    And I wait for "2000" millisecond
    Then I enter the details as
      | Fields              | Value        |
      | PersonFullName      | test         |
      | LegalEntityName     | Test2        |
      | EmployerDeclaration | test         |
      | PhoneNumber         | 610422184033 |
      | EmailAddress        | abc@abc.com  |
    Then I click on "DeclarationConfirm"
    Then I click on "ConfirmForSubmission"
    Then I click on "wtSubmitBT"
    And I wait for "2000" millisecond
    Then I see text "Australia-wide wages must be greater than or equal to Group ACT wages." displayed
    #SCENARIO 12: DGE or JRL claiming tax free threshold - Aus wide group wages must be greater than or equal to ACT wages
    Then I click on "Payroll Tax"
    Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "OK"
    And I click on "Answer_TypeAnnual"
    And I click on "NextSection"
    Then I select "2011" from "YearOfReturn"
    Then I click on "LodgePayrollAnswer_EmployerStatus_Opt2"
    Then I click on "TaxPayerDetailsNext"
    Then I enter the details as
      | Fields           | Value |
      | SalariesAndWages |   100 |
    Then I click on "ClaimingACTProportion_Yes"
    Then I click on "ACTWagesPaidNext"
    Then I wait for "2000" millisecond
    Then I enter the details as
      | Fields          | Value |
      | DaysPaidTaxable |     1 |
      | AustralianWide  |     1 |
      | GroupActWages   |    98 |
    Then I click on "MonthlyReturnNext"
    And I wait for "2000" millisecond
    Then I enter the details as
      | Fields              | Value        |
      | PersonFullName      | test         |
      | LegalEntityName     | Test2        |
      | EmployerDeclaration | test         |
      | PhoneNumber         | 610422184033 |
      | EmailAddress        | abc@abc.com  |
    Then I click on "DeclarationConfirm"
    Then I click on "wtSubmitBT"
    And I wait for "2000" millisecond
    Then I see text "Aus wide wages must be greater than or equal to ACT Taxable wages." displayed
    Then I see text "Australia-wide wages must be greater than or equal to Group ACT wages." displayed
    Then I see text "Group ACT wages must be greater than or equal to ACT Taxable wages." displayed

    Examples: 
      | PortalName | UserName | Password  | CRN         | ABN         |
      | TSS        | mbrown   | dbresults | 12345678901 | 12345678901 |

  @done
  Scenario Outline: DTSP-7: As an end user, I want to be able to log into the portal using my portal credentials, so that I can access self service related functions
    #scenario 1: Same year check
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
    And I hit Enter
    #scenario 1: Scenario 1: Mandatory fields not filled in
    Then I see text "Required field!" displayed
    #scenario 3:
    And I enter the details as
      | Fields        | Value     |
      | UserNameInput | WRONG     |
      | PasswordInput | ALSOWRONG |
    And I hit Enter
    Then I see text "Invalid Username, Email or Password. Please try again." displayed
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    And I check I am on "HomePage" page

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password   | CRN         | ABN         |
      | TSS        | UserNameInput | PasswordInput | jscott   | Dbresults1 | 12345678901 | 12345678901 |

  @done
  Scenario Outline: DTSP-378: As a user I want the ability to enter my business details on the Tax Registration form so that I can register for Payroll Tax
    Given I want to login to portal "<PortalName>"
    And I check I am on "Tax Registration Form" page
    Then I wait for "2000" millisecond
    Then "<Item>" is displayed as "<ItemName>"
      #Scenario 1 (Part 1): User views the registration form
      | Item   | ItemName                                                  |
      | item2  | Select Business Type                                      |
      | item3  | Employer Name                                             |
      | item4  | Business Trading Name                                     |
      | item5  | Australian Business Number (ABN)                          |
      | item6  | Australian Company Name (ACN)                             |
      | item7  | Business Address                                          |
      | item7  | Country                                                   |
      | item7  | Address Line 1                                            |
      | item7  | Address Line 2                                            |
      | item7  | Suburb / City                                             |
      | item7  | Territory / State                                         |
      | item7  | Postcode                                                  |
      | item7  | Postal Address                                            |
      | item7  | Address where Business Records are located (Jurisdiction) |
      | item7  | Contact Person                                            |
      | item7  | Title                                                     |
      | item7  | First Name                                                |
      | item7  | Last Name                                                 |
      | item7  | Contact Phone Number                                      |
      | item7  | Email                                                     |
      | item7  | Preferred Communication Method                             |
      | item7  | Postal Address                                            |
      | item 7 | Next                                                      |
    #Scenario 2: User has a different postal address than business address (element 16)
    Then I see checkbox "CheckBusinessAdress" as selected
    Then I click on button "CheckBusinessAdress"
    Then I check "Address_AddressLine3" is empty
    Then I check "Address_AddressLine4" is empty
    Then I check "Address_City2" is empty
    Then I check "Address_PostCode2" is empty
    #Scenario 3: User has a different business records address than business address (element 17)
    Then I see checkbox "CheckSameAsJurisdiction" as selected
    Then I click on button "CheckSameAsJurisdiction"
    Then I check "Address_AddressLine5" is empty
    Then I check "Address_AddressLine6" is empty
    Then I check "Address_City3" is empty
    Then I check "Address_PostCode3" is empty
    #Scenario 4: User has a different contact person address than business address (element 25)
    Then I see checkbox "ContactPerson_PostalAddressId" as selected
    Then I click on button "ContactPerson_PostalAddressId"
    Then I check "Address_AddressLine7" is empty
    Then I check "Address_AddressLine8" is empty
    Then I check "Address_City4" is empty
    Then I check "Address_PostCode4" is empty
    #Scenario 1 (PART 2);
    Then I click on button "CheckBusinessAdress"
    Then I click on button "CheckSameAsJurisdiction"
    Then I click on button "ContactPerson_PostalAddressId"
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
    Then I click on button "TaxPayerDetailsNext"
    Then I wait for "2000" millisecond
    Then "<Item>" is displayed as "<ItemName>"
      #Scenario 1 (Part 2): User views the registration form
      | Item  | ItemName                                         |
      | item2 | Business Activity Details                        |
      | item3 | Business Activity Elsewhere in Australia         |
      | item4 | Business Activity Category                       |
      | item5 | Control and Financial Interest                   |
      | item6 | (shares, beneficiaries if greater than 20% each) |
      | item7 | Relationship Type                                |

    Examples: 
      | PortalName       | UserNameField | PasswordField | UserName | Password  | CRN         | ABN         |
      | Tax_Registration | UserNameInput | PasswordInput | mbrown   | dbresults | 12345678901 | 12345678901 |

  @done
  Scenario Outline: DTSP-379: As a user I want the ability to enter my Business Activity Details on the Tax Registration form so that I can register for Payroll Tax
    Given I want to login to portal "<PortalName>"
    And I check I am on "Tax Registration Form" page
    Then I wait for "2000" millisecond
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
    Then I click on button "TaxPayerDetailsNext"
    Then I wait for "2000" millisecond
    #Scenario 1: User views Business Activity Details details
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                                         |
      | item2 | Business Activity Details                        |
      | item3 | Business Activity Elsewhere in Australia         |
      | item4 | Business Activity Category                       |
      | item5 | Control and Financial Interest                   |
      | item6 | (shares, beneficiaries if greater than 20% each) |
      | item7 | Relationship Type                                |
    #Scenario 2: User navigates to the previous section
    Then I click on button "ACTWagesPaidBackBt"
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                                                  |
      | item2 | Select Business Type                                      |
      | item3 | Employer Name                                             |
      | item4 | Business Trading Name                                     |
      | item5 | Australian Business Number (ABN)                          |
      | item6 | Australian Company Name (ACN)                             |
      | item7 | Address where Business Records are located (Jurisdiction) |
      | item7 | Preferred Communication Method                             |
      | item7 | Postal Address                                            |
      | item7 | Next                                                      |
    Then I click on button "TaxPayerDetailsNext"
    # Scenario 4: User adds another control and financial interest contact
    Then I wait for "2000" millisecond
    #Then I select "Mrs." from "wtControlAndFinancialInterestTitle"
    Then I enter the details as
      | Fields                                | Value |
      | ControlAndFinancialInterest_FirstName | TEST  |
      | ControlAndFinancialInterest_LastName  | TEST  |
    Then I select "Account Manager" from "ControlAndFinancialInterestRelationshipType"
    Then I select "Miss" from "ControlAndFinancialInterestTitle"
    Then I click on button "AddControlFinancialInterestButton"
    Then I wait for "2000" millisecond
    #doesn't seem to be a way to differentiate between already added records and the record input fields
    Then "ControlAndFinancialInterestListRecord$ctl00$wt7$wtControlAndFinancialInterestTitle" displays "Miss" by default
    Then I check "ControlAndFinancialInterestListRecord_ctl00_wt7_wtControlAndFinancialInterest_FirstName" contains "TEST"
    Then I check "ControlAndFinancialInterestListRecord_ctl00_wt7_wtControlAndFinancialInterest_LastName" contains "TEST"
    Then "ControlAndFinancialInterestListRecord$ctl00$wt7$wtControlAndFinancialInterestRelationshipType" displays "Account Manager" by default
    Then I see text "Remove" displayed
    #Scenario 5: User removes a control and financial interest contact
    Then I click on "Remove"
    Then I see "Are you sure you want to remove this contact?" displayed on popup and I click "Cancel"
    Then I click on "Remove"
    Then I see "Are you sure you want to remove this contact?" displayed on popup and I click "OK"
    #Scenario 3: User navigates to the next section
    Then I click on button "ACTWagesPaidNext"
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                                                                     |
      | item2 | Business Activity in the ACT                                                 |
      | item3 | Date Business Commenced Employing in ACT                                     |
      | item4 | Date Business Became Liable in the ACT (or                                   |
      | item5 | Number of Employees in your ACT Business                                     |
      | item6 | Grouping for Payroll Tax Purposes                                            |
      | item7 | Are you a member of a group?                                                 |
      | item7 | As an eligible employer, do you wish to apply for annual lodgement approval? |
      | item7 | Annual Lodgement Request Justification                                       |
      | item7 | Contact Person for Payroll Tax                                               |

    Examples: 
      | PortalName       | UserNameField | PasswordField | UserName | Password  | CRN         | ABN         |
      | Tax_Registration | UserNameInput | PasswordInput | mbrown   | dbresults | 12345678901 | 12345678901 |

  @done
    Scenario Outline: DTSP-381: As a user I want the ability to enter my refund details on the Tax Registration form so that I can register for Payroll Tax, DTSP-382: As a user I want the ability to complete the declaration on the Tax Registration form so that I can register for Payroll Tax
    Given I want to login to portal "<PortalName>"
    And I check I am on "Tax Registration Form" page
    Then I wait for "2000" millisecond
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
    #Then I select "AL" from "Address_State"
    Then I select "Other" from "SelectBusinessTypeCode"
    Then I click on "TaxPayerDetailsNext"
    Then I wait for "2000" millisecond
    Then I click on "ACTWagesPaidNext"
    Then I wait for "2000" millisecond
    Then I click on "DateBusinessStart"
    Then I click on "20170102"
    Then I click on "DateBusinessLiable"
    Then I click on "20170103"
    Then I enter the details as
      | Fields               | Value |
      | NumberOfEmployees    |    33 |
      | RequestJustification | TEST  |
    Then I click on "GroupMember_UNSURE"
    Then I click on "PayrollNext"
    Then I wait for "2000" millisecond
    #381 Scenario 1: User views Refund details
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                        |
      | item2 | Set Up Bank Account for Refunds |
      | item3 | BSB                             |
      | item4 | Bank Account Number             |
    Then I click on button "ConfirmBack"
    Then I wait for "2000" millisecond
    #381 Scenario 2: User navigates to the previous section
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                                                                     |
      | item2 | Business Activity in the ACT                                                 |
      | item3 | Date Business Commenced Employing in ACT                                     |
      | item4 | Date Business Became Liable in the ACT (or                                   |
      | item5 | Number of Employees in your ACT Business                                     |
      | item6 | Grouping for Payroll Tax Purposes                                            |
      | item7 | Are you a member of a group?                                                 |
      | item7 | As an eligible employer, do you wish to apply for annual lodgement approval? |
      | item7 | Annual Lodgement Request Justification                                       |
      | item7 | Contact Person for Payroll Tax                                               |
    Then I click on "PayrollNext"
    #381 Scenario 3: User navigates to the next section
    Then I click on button "Refunds_NO"
    Then I click on button "RefundDetailsNext"
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                                                                         |
      | item2 | Declaration                                                                      |
      | item3 | Declarer                                                                         |
      | item5 | I declare that this information is true and correct to the best of my knowledge. |
    #382 Scenario 1: User does not check Declaration
    Then I see checkbox "CorrectInfoDeclared" as not selected
    Then I check "DeclarationNext" is readonly
    
    Examples: 
      | PortalName       | UserNameField | PasswordField | UserName | Password  | CRN         | ABN         |
      | Tax_Registration | UserNameInput | PasswordInput | mbrown   | dbresults | 12345678901 | 12345678901 |
      
      
      @done
  Scenario Outline: DTSP-8
  # REMEMBER TO WAIT FOR FIVE MINUTES BETWEEN EACH RUN OF THIS SCENARIO
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | WRONG      |
    Then I hit Enter
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | WRONG      |
    Then I hit Enter
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | WRONG      |
    Then I hit Enter
    Then I see text "Password Hint" displayed
    Then I see text "<Password>" displayed
    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password   | 
      | TSS        | UserNameInput | PasswordInput | jscott   | Dbresults1 |

  @done
  Scenario Outline: DTSP-13, DTSP-14
    #Scenario 2: Reset Password link has expired
    Given I want to login to portal "ExpiredPassword"
    Then I see text "Reset Password Link Invalid" displayed
    Then I see text "Sorry, the link is not valid." displayed
    Then I see text "Please click the Reset Password button again in the email or click the button below." displayed
    Then I click on button "ResetPasswordInvalidButton"
    Then I check I am on "Forgot Your Password?" page
    Then I see text "Forgot Your Password?" displayed
    #Scenario 3
    Given I want to login to portal "InvalidPasswordLink"
    Then I see text "The page cannot be found. Please make sure you typed the URL correctly." displayed

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password   | CRN         | ABN         |
      | TSS        | UserNameInput | PasswordInput | jscott   | Dbresults1 | 12345678901 | 12345678901 |

  @done
  Scenario Outline: DTSP-25: As an organisation I want a user's details verified during registration so that only valid users register with the portal (page 1)
    #scenario 1: Same year check
    Given I want to login to portal "<PortalName>"
    And I click on "Create Account"
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                        |
      | item2 | Client Reference Number (CRN)   |
      | item3 | ABN                             |
      | item4 | ACN                             |
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
      | Fields                     | Value     |
      | InputAccountNumber         | 33333333333333333333333333333333333333333333333333      |
      | InputBillName              | 33333333333      |
      | InputIdentificationNumber  | 333333333 |
    Then I click on button "RegistrationSubmit"
    Then I see text "You must accept the Terms and Conditions to proceed" displayed
    Then I click on button "TermsandConditionsCheckBox"
    Then I click on button "RegistrationSubmit"
    Then I see text "Account details cannot be found. Please try again." displayed
    Then I enter the details as
      | Fields                     | Value       |
      | InputAccountNumber         | 12345678961 |
      | InputBillName              | 12345678961 |
      | InputIdentificationNumber  | 12345678961 |
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
      | item7 | Language Preference      |
      | item7 | Already have an account? |
    #Scenario 4: User cancels with unsaved changes
    Then I click on button "Cancel"
    Then I check I am on "Login" page
    Given I want to login to portal "<PortalName>"
    And I click on "Create Account"
    Then I enter the details as
      | Fields                     | Value       |
      | InputAccountNumber         | 12345678961 |
      | InputBillName              | 12345678961 |
      | InputIdentificationNumber  | 12345678961 |
    Then I click on button "RegistrationSubmit"
    Then I click on button "TermsandConditionsCheckBox"
    Then I check I am on "Registration" page
    Then I click on button "Submit"
    Then I see text "Required field" displayed
    #Scenario 3: Details entered do not pass validation (Can't fully complete on this due to WIP done on the page)
    Then I enter the details as
      | Fields                | Value       |
      | Registration_Email    | 12345678961 |
      | Registration_Username | 12345678961 |
      | NewPassword           | 12345678961 |
      | Registration_Hint     | 12345678961 |
    Then I click on button "Submit"
    Then I see text "Invalid email address. Please try again." displayed
    #Scenario 5: User cancels with unsaved changes
    Then I click on button "Cancel"
    Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "Cancel"
    Then I check I am on "Registration" page
    Then I click on button "Cancel"
    Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "OK"
    Then I check I am on "Login" page

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password   | CRN         | ABN         |
      | TSS        | UserNameInput | PasswordInput | jscott   | Dbresults1 | 12345678901 | 12345678901 |

  @done
  Scenario Outline: DTSP-32: As an end user, I want to activate my portal account so that I can log into the portal to access the self service features
    #Scenario 3: User account is already activated
    Given I want to login to portal "ExpiredActivation"
    Then I check I am on "Account Already Activated" page
    Then I see text "Account Already Activated" displayed
    Then I see text "Your account has already been activated. Please click the button below." displayed
    Then I click on button "SubmitButton3"
    Then I see text "The page cannot be found. Please make sure you typed the URL correctly." displayed
    
    #TODO: Ask Christian to add an id to the SIGN IN button
    #Scenario 3
    Given I want to login to portal "InvalidActivation"
    Then I see text "The page cannot be found. Please make sure you typed the URL correctly." displayed

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password   | CRN         | ABN         |
      | TSS        | UserNameInput | PasswordInput | jscott   | Dbresults1 | 12345678901 | 12345678901 |