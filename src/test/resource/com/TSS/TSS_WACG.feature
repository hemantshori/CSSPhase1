Feature: Wip in stuff.

@wip
  Scenario Outline: WCAG Analysis
  
  	# LOGIN SCREEN
    Given I want to login to portal "<PortalName>"
    And I check I am on "Login" page
    And I capture "html"
    And I want to login to portal "<PortalName2>"
    And I click on "Paste HTML Markup"
    And I click on button "checkpaste"
    And I paste "html"
    And I click on button "validate_paste"
    And I capture "AC_num_of_errors"
    
    # HOMEPAGE
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    And I check I am on "HomePage" page
    And I capture "html"
    And I want to login to portal "<PortalName2>"
    And I click on "Paste HTML Markup"
    And I click on button "checkpaste"
    And I paste "html"
    And I click on button "validate_paste"
    And I capture "AC_num_of_errors"
    
    #PAYROLL FORM
    Given I want to login to portal "<PortalName>"
    Then I click on "Payroll Tax Lodgement"
    And I check I am on "Payroll Lodgement Form" page
    And I capture "html"
    And I want to login to portal "<PortalName2>"
    And I click on "Paste HTML Markup"
    And I click on button "checkpaste"
    And I paste "html"
    And I click on button "validate_paste"
    And I capture "AC_num_of_errors"
    
		#TAX REGISTRATION FORM
		 Given I want to login to portal "<PortalName>"

    Then I click on "Payroll Tax Registration"

    Then I click on "Tax Registration"
    And I check I am on "Tax Registration Form" page
    And I capture "html"
    And I want to login to portal "<PortalName2>"
    And I click on "Paste HTML Markup"
    And I click on button "checkpaste"
    And I paste "html"
    And I click on button "validate_paste"
    And I capture "AC_num_of_errors"
    
    # VIEW SETTINGS
    Given I want to login to portal "AccountManagement"
    And I check I am on "View Settings" page
    And I capture "html"
    And I want to login to portal "<PortalName2>"
    And I click on "Paste HTML Markup"
    And I click on button "checkpaste"
    And I paste "html"
    And I click on button "validate_paste"
    And I capture "AC_num_of_errors"
    
    #EDIT SETTINGS
    Given I want to login to portal "AccountManagement"
    Then I click on button "EditBT"
    And I check I am on "Edit Settings" page
    And I capture "html"
    And I want to login to portal "<PortalName2>"
    And I click on "Paste HTML Markup"
    And I click on button "checkpaste"
    And I paste "html"
    And I click on button "validate_paste"
    And I capture "AC_num_of_errors"
    
    # LODGEMENT SUMMARY PAGE
    Given I want to login to portal "<PortalName>"
    Then I click on "Payroll Tax Lodgement"
    And I check I am on "Payroll Lodgement Form" page
    Then I click on button "Discard"

    Then I click on "Monthly Return"
    Then I select "Jul 2016" from "combo1"
    Then I click on button "NextSection"
  
    Then I click on button "TaxPayerDetailsNext"
    Then I enter the details as
      | Fields           | Value |
      | SalariesAndWages |   	 0 |
      | BonusesAndCommissions| 0 |
      | LodgePayrollAnswer_Commissions | 0 |
      | LodgePayrollAnswer_Allowances | 0 |
      | LodgePayrollAnswer_DirectorsFees | 0 |
      | LodgePayrollAnswer_EligibleTerminationPayments | 0 |
      | LodgePayrollAnswer_ValueOfBenefits | 0 |
      | LodgePayrollAnswer_ShareValue | 0 |
      | LodgePayrollAnswer_ServiceContracts | 0 |
      | LodgePayrollAnswer_Superannuation | 0 |
      | LodgePayrollAnswer_OtherTaxablePayment | 0 |
      | LodgePayrollAnswer_ExemptWages | 0 |
#=
    #Then I click on button "ACTWagesPaidNext"
    #Then I wait for "3000" millisecond
    #Then I click on button "MonthlyReturnNext"
    #And I wait for "3000" millisecond
    #And I enter the details as
      #| Fields              | Value       |
      #| PersonFullName      | test        |
      #| LegalEntityName     | Test2       |
      #| EmployerDeclaration | test        |
      #| PhoneNumber         |  0422184033 |
      #| EmailAddress        | abc@abc.com |
    #Then I click on button "PersonFullName"
    #Then I click on button "DeclarationConfirm"
    #Then I check "Submit" is readonly
    #Then I click on button "ConfirmForSubmission"
    Then I click on "Annual Reconciliation"
    Then I click on button "NextSection"
    Then I select "2012" from "YearOfReturn"
    Then I click on "Independent employer (non-group) lodging for itself"
    Then I click on button "TaxPayerDetailsNext"
    Then I enter the details as
      | Fields           | Value |
      | SalariesAndWages |   100 |
    Then I click on button "ACTWagesPaidNext"
    Then I wait for "3000" millisecond
    Then I click on button "MonthlyReturnNext"
    And I wait for "3000" millisecond
    And I enter the details as
      | Fields              | Value       |
      | PersonFullName      | test        |
      | LegalEntityName     | Test2       |
      | EmployerDeclaration | test        |
      | PhoneNumber         |  0422184033 |
      | EmailAddress        | abc@abc.com |
    Then I click on button "PersonFullName"
    Then I click on button "DeclarationConfirm"
    Then I check "Submit" is readonly
    Then I click on button "ConfirmForSubmission"
    # don't remove the wt prefix, otherwise there will be a conflict with a 'HiddenSubmitBT'
    Then I click on button "wtSubmitBT"
    And I capture "html"
    And I want to login to portal "<PortalName2>"
    And I click on "Paste HTML Markup"
    And I click on button "checkpaste"
    And I paste "html"
    And I click on button "validate_paste"
    And I capture "AC_num_of_errors"
		
    Examples: 
      | PortalName | PortalName2 | UserNameField | PasswordField | UserName | Password   | CRN         | ABN         |
      | TSS        | AC CHECKER  | UserNameInput | PasswordInput | mbrown   | Dbresults1 | 12121212121 | 21212121212 |

  #@wip
  #Scenario Outline: DTSP-354: WCAG Analysis of 
    #Given I want to login to portal "<PortalName>"
    #And I enter the details as
      #| Fields        | Value      |
      #| UserNameInput | <UserName> |
      #| PasswordInput | <Password> |
    #And I hit Enter
    #And I check I am on "HomePage" page
    #And I capture "html"
    #And I want to login to portal "<PortalName2>"
    #And I click on "Paste HTML Markup"
    #And I click on button "checkpaste"
    #And I paste "html"
    #And I click on button "validate_paste"
    #And I capture "AC_num_of_errors"
    #
  #Examples: 
      #| PortalName | PortalName2 | UserNameField | PasswordField | UserName | Password   | CRN         | ABN         |
      #| TSS        | AC CHECKER  | UserNameInput | PasswordInput | mbrown   | Dbresults1 | 12121212121 | 21212121212 |
      #
  #@wip
  #Scenario Outline: DTSP-354: WCAG Analysis of 
    #Given I want to login to portal "<PortalName>"
    #And I enter the details as
      #| Fields        | Value      |
      #| UserNameInput | <UserName> |
      #| PasswordInput | <Password> |
    #And I hit Enter
    #Then I click on "Payroll Tax Lodgement"
    #And I check I am on "HomePage" page
    #And I capture "html"
    #And I want to login to portal "<PortalName2>"
    #And I click on "Paste HTML Markup"
    #And I click on button "checkpaste"
    #And I paste "html"
    #And I click on button "validate_paste"
    #And I capture "AC_num_of_errors"
    #
  #Examples: 
      #| PortalName | PortalName2 | UserNameField | PasswordField | UserName | Password   | CRN         | ABN         |
      #| TSS        | AC CHECKER  | UserNameInput | PasswordInput | mbrown   | Dbresults1 | 12121212121 | 21212121212 |
      #


  Scenario Outline: DTSP-354: As an end user, I want to be able to submit my Payroll Tax Registration form
    Given I want to login to portal "TSS"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Given I want to login to portal "Tax_Registration_Delete"
    Then I click on "DBResultsSG_Theme_wt6_block_wtActions_wt8"
    Then I see "Are you sure you want to delete all registration data?" displayed on popup and I click "OK"
    Then I wait for "2000" millisecond
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
    Then I select "Other" from "SelectBusinessTypeCode"
    Then I click on "TaxPayerDetailsNext"
    Then I wait for "2000" millisecond
    Then I click on "ACTWagesPaidNext"
    Then I wait for "2000" millisecond
    # Scenario 2
    Then I click on "MonthlyReturnBack"
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
    Then I enter the details as
      | Fields | Value |
    Then I click on "GroupMember_UNSURE"
    Then I wait for "2000" millisecond
    Then I click on "PayrollNext"
    #scenario 3
    #Then "<Item>" is displayed as "<ItemName>"
    #| Item  | ItemName                        |
    #| item2 | Set Up Bank Account for Refunds |
    #| item3 | BSB                             |
    #| item4 | Bank Account Number             |
    Then I enter the details as
      | Fields                               | Value    |
      | RegistrationAnswer_BSB               | 333-333  |
      | RegistrationAnswer_BankAccountNumber | 22222222 |
      | RegistrationAnswer_BankAccountName   | TEST     |
    Then I click on "Refunds_NO"
    Then I click on "RefundDetailsNext"
    Then I wait for "2000" millisecond
    And I enter the details as
      | Fields                                              | Value       |
      | Declarer                                            | test        |
      | Organisation                                        | Test2       |
      | wt138_block_wtContent_wtRegistrationAnswer_Employer | test        |
      | ContactPhone                                        |    33333333 |
      | EmailAddress                                        | abc@abc.com |
    Then I click on "CorrectInfoDeclared"
    Then I click on "DeclarationNext"
    Then I wait for "2000" millisecond
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                          |
      | item2 | Business Details                  |
      | item3 | Jurisdiction Address              |
      | item4 | Business Trading Name             |
      | item5 | Business Activity Details         |
      | item6 | Control and Financial Interest    |
      | item7 | Payroll Tax Information           |
      | item7 | Business Activity in the ACT      |
      | item7 | Grouping for Payroll Tax Purposes |
      | item7 | Refund Details                    |
      | item7 | Declaration                       |
    Then I check I am on "Tax Registration Summary" page
    Then I click on "BackBt"
    Then I wait for "2000" millisecond
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName      |
      | item2 | Declarer      |
      | item3 | Organisation  |
      | item4 | Employer      |
      | item5 | Contact Phone |
      | item6 | Email Address |
    Then I click on "DeclarationNext"
    Then I wait for "2000" millisecond

    #"ABN already registered."
    #Then I click on "ConfirmBack"
    #Then I enter the details as
    #| Fields                   | Value     |
    #| TotalWagesYear           | 1111-1111 |
    #| TaxableACTWages          |       100 |
    #| AusWideTaxableWages      |       100 |
    #| GroupAusWideTaxableWages |       100 |
    #Then I click on "AddTotalWages"
    #Then I see text "Remove" displayed
    #Then I click on "RemoveLine"
    #Then I see "Are you sure you want to remove this year's taxable wages" displayed on popup and I click "Cancel"
    #Then I click on "RemoveLine"
    #Then I see "Are you sure you want to remove this year's taxable wages" displayed on popup and I click "OK"
    Examples: 
      | PortalName       | UserNameField | PasswordField | UserName | Password   | CRN         | ABN         |
      | Tax_Registration | UserNameInput | PasswordInput | bob      | Dbresults1 | 12345678901 | 12345678901 |

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
      | item7 | Prefered Communication Method                             |
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
    #Then I select "AL" from "Address_State"
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
      | Tax_Registration | UserNameInput | PasswordInput | bob      | Dbresults1 | 12345678901 | 12345678901 |

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
    Then I see text "Organisation Name does not match ABN number." displayed
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
      | Tax_Registration | UserNameInput | PasswordInput | bob      | Dbresults1 | 12345678901 | 12345678901 |

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
    Then I select "Other" from "SelectBusinessTypeCode"
    #Scenario 6: Mandatory fields all filled in
    Then I click on "TaxPayerDetailsNext"
    Then I wait for "2000" millisecond
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                                 |
      | item2 | Business Activity Elsewhere in Australia |
      | item3 | Business Activity Category               |
      | item4 | Control and Financial Interest           |

    Examples: 
      | PortalName       | UserNameField | PasswordField | UserName | Password   | CRN         | ABN         |
      | Tax_Registration | UserNameInput | PasswordInput | bob      | Dbresults1 | 12345678901 | 12345678901 |

  #@onhold
  #Scenario Outline: DTSP-354
  #
  @done
  Scenario Outline: DTSP-69: As an end user, I want to be able to enter details for my Annual Reconciliation Payroll Tax Return Form, so that my Payroll Tax Return is lodged
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    And I check I am on "HomePage" page
    And I click on "Payroll Tax"
    Then I click on "Cancel"
    Then I click on "Payroll Tax"
    And I check I am on "Payroll Lodgement Form" page
    Then I click on "Answer_TypeAnnual"
    And I click on "Payroll Tax"
    #scenario 2: End user cancels with unsaved changes
    Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "Cancel"
    And I check I am on "Payroll Lodgement Form" page
    And I click on "Payroll Tax"
    Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "OK"
    And I check I am on "Payroll Lodgement Form" page
    And I check "TaxPayerDetails" is readonly
    #scenario 3: End user saves and exits
    And I click on "Payroll Tax"
    Then I click on "Answer_TypeAnnual"
    Then I click on "SaveAndExit"
    And I check I am on "HomePage" page
    #scenario 1: End user cancels with no unsaved changes
    And I click on "Payroll Tax"
    Then I click on "Cancel"
    And I check I am on "HomePage" page
    #scenario 4: End user saves
    And I click on "Payroll Tax"
    Then I click on "Answer_TypeAnnual"
    Then I click on "TaxPayerDetailsSave"
    Then I wait for "1000" millisecond
    Then I see text "Your changes have been successfully saved" displayed
    #scenario 5: End user goes to previous page with unsaved changes
    Then I select "2015" from "YearOfReturn"
    Then I click on "TaxPayerDetailsNext"
    Then I click on "ACTWagesPaidBack"
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                         |
      | item2 | Client Reference Number (CRN)    |
      | item3 | Australian Business Number (ABN) |
      | item4 | Payroll Tax Group Number         |
    #scenario 6: End user navigates away from form with no unsaved changes
    Then I click on "TaxPayerDetailsSave"
    Then I click on "Settings"
    Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "OK"
    Given I want to login to portal "<PortalName>"
    #scenario 7: End user navigates away from form with unsaved changes
    Then I click on "Payroll Tax"
    Then I select "2014" from "YearOfReturn"
    Then I click on "Payroll Tax"
    Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "Cancel"
    And I check I am on "Payroll Lodgement Form" page
    Then I click on "Payroll Tax"
    Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "OK"
    #scenario 8: As an end user, I want to be able to enter details for my Annual Reconciliation Payroll Tax Return Form, so that my Payroll Tax Return is lodged
    Then I click on "Payroll Tax"
    Then I select "2014" from "YearOfReturn"
    Then I click on "TaxPayerDetailsNext"
    Then I click on "ACTWagesPaidNext"
    Then I click on "MonthlyReturnNext"
    And I wait for "3000" millisecond
    And I enter the details as
      | Fields                                        | Value       |
      | PersonFullName                                | test        |
      | LegalEntityName                               | Test2       |
      | wt128_wtContent_wtLodgePayrollAnswer_Employer | test        |
      | PhoneNumber                                   |  0422184033 |
      | EmailAddress                                  | abc@abc.com |
    Then I click on "DeclarationConfirm"
    Then I click on "ConfirmBack"
    Then I click on "DeclarationBack"
    Then I click on "MonthlyReturnNext"
    Then I click on "DeclarationConfirm"
    Then I check "Submit" is readonly

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password   |
      | TSS        | UserNameInput | PasswordInput | bob      | Dbresults1 |
