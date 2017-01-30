 @tss_review_done
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
    And I click on "Payroll Tax"
    Then I click on button "GeneralCancelBt"
    And I check I am on "Payroll Lodgement Form" page
    Then I click on "Annual Reconciliation"
    Then I click on button "NextSection"
    Then I see text "<CRN>" displayed
    Then I see text "<ABN>" displayed
    Then I select "2014" from "YearOfReturn"
    Then I click on "Independent employer (non-group) lodging for itself"
    Then I click on "TaxPayerDetailsNext"
    And I wait for "2000" millisecond
    Then I click on "ACTWagesPaidNext"
    And I wait for "2000" millisecond
    Then I click on "MonthlyReturnNext"
    And I wait for "2000" millisecond
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
    And I click on "Payroll Tax"
    Then I click on button "GeneralCancelBt"
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
      | PayrollAnswer_AustralianWide |     1 |
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

  #NOTE: Ensure that mbrown has a current employee type selected in the data extensions page
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
    Then I click on "DeclarationConfirm"
    Then I see text "This is an invalid phone number." displayed
    Then I see text "Invalid email address format. Please try again." displayed
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

  @tss_review_done
  Scenario Outline: DTSP-380 -> As a user I want the ability to enter my Payroll Tax Information on the Tax Registration form so that I can register for Payroll Tax
    Given I want to login to portal "<PortalName>"
    And I check I am on "Tax Registration Form" page
    Then I wait for "2000" millisecond
    #Then "<Item>" is displayed as "<ItemName>"
      #| Item  | ItemName                                                  |
      #| item2 | Select Business Type                                      |
      #| item3 | Employer Name                                             |
      #| item4 | Business Trading Name                                     |
      #| item5 | Australian Business Number (ABN)                          |
      #| item6 | Australian Company Name (ACN)                             |
      #| item7 | Business Address                                          |
      #| item7 | Postal Address                                            |
      #| item7 | Address where Business Records are located (Jurisdiction) |
      #| item7 | Contact Person                                            |
      #| item7 | Preferred Communication Method                            |
      #| item7 | Postal Address                                            |
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
    # Scenario 1
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
    Then I wait for "2000" millisecond
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
    Then I click on "RemoveLine"
    Then I see "Are you sure you want to remove this year's taxable wages" displayed on popup and I click "Cancel"
    #scenario 5
    Then I click on "RemoveLine"
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
