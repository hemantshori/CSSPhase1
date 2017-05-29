@all
Feature: Wip in stuff.

  #TODO: Fix Lodgement Summary and Update Refund Summary wrong page errors
  @erase
  Scenario Outline: Erase Previous Data
    Given I erase previous data

    Examples: 
      | PortalName | PortalName2 | UserNameField | PasswordField | UserName | Password   |
      | TSS        | AC CHECKER  | UserNameInput | PasswordInput | jbradley | Dbresults1 |

  @test
  Scenario Outline: WCAG Analysis Login and Registration
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
    Then I write "Login" information to file
    #
    #REGISTRATION BUSINESS PART 1
    Given I want to login to portal "<PortalName>"
    Then I click on "Create Account"
    Then I check I am on "Registration" page
    And I capture "html"
    And I want to login to portal "<PortalName2>"
    And I click on "Paste HTML Markup"
    And I click on button "checkpaste"
    And I paste "html"
    And I click on button "validate_paste"
    And I capture "AC_num_of_errors"
    Then I write "Registration as Business Part 1" information to file
    #REGISTRATION BUSINESS PART 2
    Given I want to login to portal "<PortalName>"
    Then I click on "Create Account"
    Then I check I am on "Registration" page
    Then I click on "Register as a Business"
    Then I enter the details as
      | Fields                  | Value         |
      | InputABNNumber_Business | <BusinessABN> |
      | InputCRNNumber_Business | <BusinessCRN> |
    Then I click on button "TermsandConditionsCheckBox2"
    Then I click on button "RegistrationSubmit"
    Then I check I am on "Complete Registration" page
    And I capture "html"
    And I want to login to portal "<PortalName2>"
    And I click on "Paste HTML Markup"
    And I click on button "checkpaste"
    And I paste "html"
    And I click on button "validate_paste"
    And I capture "AC_num_of_errors"
    Then I write "Registration as Business Part 2" information to file
    
    #REGISTRATION TAX PART 1
    Given I want to login to portal "<PortalName>"
    Then I click on "Create Account"
    Then I check I am on "Registration" page
    Then I click on "Register as a Tax Agent"
    And I capture "html"
    And I want to login to portal "<PortalName2>"
    And I click on "Paste HTML Markup"
    And I click on button "checkpaste"
    And I paste "html"
    And I click on button "validate_paste"
    And I capture "AC_num_of_errors"
    Then I write "Registration as Tax Agent Part 1" information to file
    
    #REGISTRATION TAX PART 2
    Given I want to login to portal "<PortalName>"
    Then I click on "Create Account"
    Then I check I am on "Registration" page
    Then I click on "Register as a Tax Agent"
    Then I enter the details as
      | Fields                    | Value             |
      | InputTaxAgentABN          | <TaxABN>          |
      | InputTaxAgentBusinessName | <TaxBusinessName> |
      | BusinessAddress_Address   | TEST              |
      | BusinessAddress_Suburb    | TEST              |
      | BusinessAddress_Postcode  |              3333 |
    Then I click on button "BusinessAddress_StateId"
    Then I click on "Victoria"
    Then I click on button "TermsandConditionsCheckBox2"
    Then I click on button "RegistrationSubmit"
    Then I check I am on "Complete Registration" page
    And I capture "html"
    And I want to login to portal "<PortalName2>"
    And I click on "Paste HTML Markup"
    And I click on button "checkpaste"
    And I paste "html"
    And I click on button "validate_paste"
    And I capture "AC_num_of_errors"
    Then I write "Registration as Tax Agent Part 2" information to file
    
    #REGISTRATION CONFIRMATION
    Given I want to login to portal "<PortalName>"
    Then I click on "Create Account"
    Then I check I am on "Registration" page
    Then I click on "Register as a Tax Agent"
    Then I enter the details as
      | Fields                    | Value             |
      | InputTaxAgentABN          | <TaxABN>          |
      | InputTaxAgentBusinessName | <TaxBusinessName> |
      | BusinessAddress_Address   | TEST              |
      | BusinessAddress_Suburb    | TEST              |
      | BusinessAddress_Postcode  |              3333 |
    Then I click on button "BusinessAddress_StateId"
    Then I click on "Victoria"
    Then I click on button "TermsandConditionsCheckBox2"
    Then I click on button "RegistrationSubmit"
    Then I check I am on "Complete Registration" page
    Then I enter the details as
      | Fields                       | Value                           |
      | Registration_FirstName       | TEST                            |
      | Registration_LastName        | TEST                            |
      | Registration_Position        | TEST                            |
      | Registration_PhoneNumber     |                      1234567890 |
      | Registration_Email           | <NewEmail>                      |
      | Registration_Username        | <NewUserName>                   |
      | Registration_NewPassword     | <Password>                      |
      | Registration_ConfirmPassword | <Password>                      |
      | Registration_Hint            | Done as a result of WCAG automation! |
    Then I click on button "SubmitAjaxRfrsh"
    Then I wait for "5000" millisecond
    Then I see text "Registration Confirmation" displayed
    And I want to login to portal "<PortalName2>"
    And I click on "Paste HTML Markup"
    And I click on button "checkpaste"
    And I paste "html"
    And I click on button "validate_paste"
    And I capture "AC_num_of_errors"
    Then I write "REGISTRATION CONFIRMATION" information to file
    Then I want to login to portal "RegistrationLinkTable"
    Then I click on object with xpath "//*[contains(text(), '<NewUserName>')]/../following-sibling::td/a"
    And I enter the details as
      | Fields        | Value         |
      | UserNameInput | <NewUserName> |
      | PasswordInput | <Password>    |
      
    And I hit Enter
    And I capture "html"
    And I want to login to portal "<PortalName2>"
    And I click on "Paste HTML Markup"
    And I click on button "checkpaste"
    And I paste "html"
    And I click on button "validate_paste"
    And I capture "AC_num_of_errors"
    Then I write "REGISTRATION CONFIRMATION" information to file
    
    #FORGOT YOUR PASSWORD
    Given I want to login to portal "<PortalName>"
    Then I click on "Forgot Password?"
    Then I check I am on "Forgot Your Password?" page
    And I capture "html"
    And I want to login to portal "<PortalName2>"
    And I click on "Paste HTML Markup"
    And I click on button "checkpaste"
    And I paste "html"
    And I click on button "validate_paste"
    And I capture "AC_num_of_errors"
    Then I write "Forgot Your Password" information to file
    Then I write to the summary file

    Examples: 
      | PortalName | PortalName2 | BusinessABN | BusinessCRN | TaxABN      | TaxBusinessName      | UserName | Password   | NewUserName          | NewEmail                 |
      | TSS        | AC CHECKER  | 91098629095 |      400004 | 21006819692 | TOYOTA SUPER PTY LTD | jbradley | Dbresults1 | wcag_automation | wcag@automation.com |

  @done
  Scenario Outline: WCAG Forms: Tax Registration, Payroll, User Settings
    # HOMEPAGE
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    And I check I am on "Home" page
    And I capture "html"
    And I want to login to portal "<PortalName2>"
    And I click on "Paste HTML Markup"
    And I click on button "checkpaste"
    And I paste "html"
    And I click on button "validate_paste"
    And I capture "AC_num_of_errors"
    Then I write "Home" information to file
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
    Then I write "Payroll Lodgement Form" information to file
    #TAX REGISTRATION FORM
    Given I want to login to portal "<PortalName>"
    Then I click on "Payroll Tax Registration"
    And I check I am on "Tax Registration Form" page
    And I capture "html"
    And I want to login to portal "<PortalName2>"
    And I click on "Paste HTML Markup"
    And I click on button "checkpaste"
    And I paste "html"
    And I click on button "validate_paste"
    And I capture "AC_num_of_errors"
    Then I write "Tax Registration Form" information to file
    # VIEW USER PROFILE
    Given I want to login to portal "<PortalName>"
    Then I click on "User Profile"
    Then I check I am on "View User Profile" page
    And I capture "html"
    And I want to login to portal "<PortalName2>"
    And I click on "Paste HTML Markup"
    And I click on button "checkpaste"
    And I paste "html"
    And I click on button "validate_paste"
    And I capture "AC_num_of_errors"
    Then I write "View User Profile" information to file
    #EDIT USER PROFILE
    Given I want to login to portal "<PortalName>"
    Then I click on "User Profile"
    Then I click on button "EditBT"
    And I check I am on "Edit User Profile" page
    And I capture "html"
    And I want to login to portal "<PortalName2>"
    And I click on "Paste HTML Markup"
    And I click on button "checkpaste"
    And I paste "html"
    And I click on button "validate_paste"
    And I capture "AC_num_of_errors"
    Then I write "Edit User Profile" information to file
    # LODGEMENT SUMMARY PAGE
    Given I want to login to portal "<PortalName>"
    Then I click on "Payroll Tax Lodgement"
    And I check I am on "Payroll Lodgement Form" page
    Then I click on button "Discard"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value         |
      | s2id_autogen1_search | Green Pty Ltd |
    Then I click on button "select2-results-1"
    Then I click on "Monthly Return"
    Then I select "Aug 2016" from "MonthlyObligationSelect"
    Then I click on button "NextSection"
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
    Then I click on button "SalariesAndWages"
    Then I click on button "wtSubmitBT"
    Then I check I am on "Lodgement Summary" page
    And I capture "html"
    And I want to login to portal "<PortalName2>"
    And I click on "Paste HTML Markup"
    And I click on button "checkpaste"
    And I paste "html"
    And I click on button "validate_paste"
    And I capture "AC_num_of_errors"
    Then I write "Lodgement Summary" information to file
    #Return History
    Given I want to login to portal "<PortalName>"
    And I check I am on "Home" page
    Then I click on "Return History"
    And I capture "html"
    And I want to login to portal "<PortalName2>"
    And I click on "Paste HTML Markup"
    And I click on button "checkpaste"
    And I paste "html"
    And I click on button "validate_paste"
    And I capture "AC_num_of_errors"
    Then I write "Return History" information to file
    Then I write to the summary file

    Examples: 
      | PortalName | PortalName2 | UserNameField | PasswordField | UserName | Password   |
      | TSS        | AC CHECKER  | UserNameInput | PasswordInput | jbradley | Dbresults1 |

  @review
  Scenario Outline: Manage Account Details and Payroll Tax Registration Updates
    #Manage Account Details
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    And I check I am on "Home" page
    Then I click on "Manage Account Details"
    And I capture "html"
    And I want to login to portal "<PortalName2>"
    And I click on "Paste HTML Markup"
    And I click on button "checkpaste"
    And I paste "html"
    And I click on button "validate_paste"
    And I capture "AC_num_of_errors"
    Then I write "Manage Account Details" information to file
    #UPDATE BUSINESS ADDRESS PART 1
    Given I want to login to portal "<PortalName>"
    And I check I am on "Home" page
    Then I click on "Tax Registration Update"
    Then I click on "Update Business Address"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value         |
      | s2id_autogen1_search | ACTIVE BOTTLE |
    Then I click on button "select2-results-1"
    And I capture "html"
    And I want to login to portal "<PortalName2>"
    And I click on "Paste HTML Markup"
    And I click on button "checkpaste"
    And I paste "html"
    And I click on button "validate_paste"
    And I capture "AC_num_of_errors"
    Then I write "Update Business Address Main" information to file
    #UPDATE BUSINESS ADDRESS PART 2
    Given I want to login to portal "<PortalName>"
    And I check I am on "Home" page
    Then I click on "Tax Registration Update"
    Then I click on "Update Business Address"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value         |
      | s2id_autogen1_search | ACTIVE BOTTLE |
    Then I click on button "select2-results-1"
    Then I wait for "1000" millisecond
    Then I click on button with value "Next"
    And I capture "html"
    And I want to login to portal "<PortalName2>"
    And I click on "Paste HTML Markup"
    And I click on button "checkpaste"
    And I paste "html"
    And I click on button "validate_paste"
    And I capture "AC_num_of_errors"
    Then I write "Update Business Address Summary" information to file
    #UPDATE BUSINESS ADDRESS PART 3
    Given I want to login to portal "<PortalName>"
    And I check I am on "Home" page
    Then I click on "Tax Registration Update"
    Then I click on "Update Business Address"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value         |
      | s2id_autogen1_search | ACTIVE BOTTLE |
    Then I click on button "select2-results-1"
    Then I wait for "1000" millisecond
    Then I click on button with value "Next"
    Then I wait for "10000" millisecond
    Then I click on button "CorrectInfoDeclared"
    Then I click on button "SummarySubmitBT"
    And I capture "html"
    And I want to login to portal "<PortalName2>"
    And I click on "Paste HTML Markup"
    And I click on button "checkpaste"
    And I paste "html"
    And I click on button "validate_paste"
    And I capture "AC_num_of_errors"
    Then I write "Update Business Address Confirmation" information to file

    Examples: 
      | PortalName | PortalName2 | UserNameField | PasswordField | UserName | Password   |
      | TSS        | AC CHECKER  | UserNameInput | PasswordInput | jbradley | Dbresults1 |

  @review
  Scenario Outline: Payroll Contact Details
    #Update Payroll Contact Details PART 1
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    And I check I am on "Home" page
    Then I click on "Tax Registration Update"
    Then I click on "Update Payroll Contact Details"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value         |
      | s2id_autogen1_search | ACTIVE BOTTLE |
    Then I click on button "select2-results-1"
    And I capture "html"
    And I want to login to portal "<PortalName2>"
    And I click on "Paste HTML Markup"
    And I click on button "checkpaste"
    And I paste "html"
    And I click on button "validate_paste"
    And I capture "AC_num_of_errors"
    Then I write "Update Payroll Contact Details Main" information to file
    #Update Payroll Contact Details PART 2
    Given I want to login to portal "<PortalName>"
    And I check I am on "Home" page
    Then I click on "Tax Registration Update"
    Then I click on "Update Payroll Contact Details"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value         |
      | s2id_autogen1_search | ACTIVE BOTTLE |
    Then I click on button "select2-results-1"
    Then I click on button with value "Next"
    And I capture "html"
    And I want to login to portal "<PortalName2>"
    And I click on "Paste HTML Markup"
    And I click on button "checkpaste"
    And I paste "html"
    And I click on button "validate_paste"
    And I capture "AC_num_of_errors"
    Then I write "Update Payroll Contact Details Summary" information to file
    #Update Payroll Contact Details PART 3
    Given I want to login to portal "<PortalName>"
    And I check I am on "Home" page
    Then I click on "Tax Registration Update"
    Then I click on "Update Payroll Contact Details"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value         |
      | s2id_autogen1_search | ACTIVE BOTTLE |
    Then I click on button "select2-results-1"
    Then I click on button with value "Next"
    Then I wait for "10000" millisecond
    Then I click on button "CorrectInfoDeclared"
    Then I click on button "SummarySubmitBT"
    And I capture "html"
    And I want to login to portal "<PortalName2>"
    And I click on "Paste HTML Markup"
    And I click on button "checkpaste"
    And I paste "html"
    And I click on button "validate_paste"
    And I capture "AC_num_of_errors"
    Then I write "Update Payroll Contact Details Confirmation" information to file

    Examples: 
      | PortalName | PortalName2 | UserNameField | PasswordField | UserName | Password   |
      | TSS        | AC CHECKER  | UserNameInput | PasswordInput | jbradley | Dbresults1 |

  @review
  Scenario Outline: Payroll Refund Details
    #Update Payroll Refund Details PART 1
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    And I check I am on "Home" page
    Then I click on "Tax Registration Update"
    Then I click on "Update Payroll Refund Details"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value         |
      | s2id_autogen1_search | ACTIVE BOTTLE |
    Then I click on button "select2-results-1"
    And I capture "html"
    And I want to login to portal "<PortalName2>"
    And I click on "Paste HTML Markup"
    And I click on button "checkpaste"
    And I paste "html"
    And I click on button "validate_paste"
    And I capture "AC_num_of_errors"
    Then I write "Update Payroll Refund Details Main" information to file
    #Update Payroll Refund Details PART 2
    Given I want to login to portal "<PortalName>"
    And I check I am on "Home" page
    Then I click on "Tax Registration Update"
    Then I click on "Update Payroll Refund Details"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value         |
      | s2id_autogen1_search | ACTIVE BOTTLE |
    Then I click on button "select2-results-1"
    Then I click on button with value "Next"
    And I capture "html"
    And I want to login to portal "<PortalName2>"
    And I click on "Paste HTML Markup"
    And I click on button "checkpaste"
    And I paste "html"
    And I click on button "validate_paste"
    And I capture "AC_num_of_errors"
    Then I write "Update Payroll Refund Details Summary" information to file
    #Update Payroll Refund Details PART 3
    Given I want to login to portal "<PortalName>"
    And I check I am on "Home" page
    Then I click on "Tax Registration Update"
    Then I click on "Update Payroll Refund Details"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value         |
      | s2id_autogen1_search | ACTIVE BOTTLE |
    Then I click on button "select2-results-1"
    Then I click on button with value "Next"
    Then I wait for "12000" millisecond
    Then I click on button "CorrectInfoDeclared"
    Then I click on button "SummarySubmitBT"
    And I capture "html"
    And I want to login to portal "<PortalName2>"
    And I click on "Paste HTML Markup"
    And I click on button "checkpaste"
    And I paste "html"
    And I click on button "validate_paste"
    And I capture "AC_num_of_errors"
    Then I write "Update Payroll Refund Details Confirmation" information to file

    Examples: 
      | PortalName | PortalName2 | UserNameField | PasswordField | UserName | Password   |
      | TSS        | AC CHECKER  | UserNameInput | PasswordInput | jbradley | Dbresults1 |

  @review
  Scenario Outline: Update Business Trading Name
    #UPDATE BUSINESS TRADING NAME DETAILS FORM
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    And I check I am on "Home" page
    Then I click on "Tax Registration Update"
    Then I click on "Update Business Trading Name"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value         |
      | s2id_autogen1_search | ACTIVE BOTTLE |
    Then I click on button "select2-results-1"
    And I capture "html"
    And I want to login to portal "<PortalName2>"
    And I click on "Paste HTML Markup"
    And I click on button "checkpaste"
    And I paste "html"
    And I click on button "validate_paste"
    And I capture "AC_num_of_errors"
    Then I write "Update Business Trading Name Form" information to file
    #UPDATE BUSINESS TRADING NAME SUMMARY
    Given I want to login to portal "<PortalName>"
    And I check I am on "Home" page
    Then I click on "Tax Registration Update"
    Then I click on "Update Business Trading Name"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value         |
      | s2id_autogen1_search | ACTIVE BOTTLE |
    Then I click on button "select2-results-1"
    Then I click on button with value "Next"
    And I capture "html"
    And I want to login to portal "<PortalName2>"
    And I click on "Paste HTML Markup"
    And I click on button "checkpaste"
    And I paste "html"
    And I click on button "validate_paste"
    And I capture "AC_num_of_errors"
    Then I write "Update Business Trading Name Summary" information to file
    #UPDATE BUSINESS TRADING NAME CONFIRMATION
    Given I want to login to portal "<PortalName>"
    And I check I am on "Home" page
    Then I click on "Tax Registration Update"
    Then I click on "Update Business Trading Name"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value         |
      | s2id_autogen1_search | ACTIVE BOTTLE |
    Then I click on button "select2-results-1"
    Then I click on button with value "Next"
    Then I wait for "10000" millisecond
    Then I click on button "CorrectInfoDeclared"
    Then I click on button "SummarySubmitBT"
    And I capture "html"
    And I want to login to portal "<PortalName2>"
    And I click on "Paste HTML Markup"
    And I click on button "checkpaste"
    And I paste "html"
    And I click on button "validate_paste"
    And I capture "AC_num_of_errors"
    Then I write "Update Business Trading Name Confirmation" information to file
    # TOOLTIPS
    Given I want to login to portal "TSS_Tooltips"
    And I check I am on "Tooltips" page
    And I capture "html"
    And I want to login to portal "<PortalName2>"
    And I click on "Paste HTML Markup"
    And I click on button "checkpaste"
    And I paste "html"
    And I click on button "validate_paste"
    And I capture "AC_num_of_errors"
    Then I write "Tooltips" information to file
    Then I write to the summary file

    Examples: 
      | PortalName | PortalName2 | UserNameField | PasswordField | UserName | Password   |
      | TSS        | AC CHECKER  | UserNameInput | PasswordInput | jbradley | Dbresults1 |

  @review
  Scenario Outline: Service Request Pages Part 1
    #EXEMPTION REQUEST FORM
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Service Requests"
    Then I click on "Exemption Request"
    And I capture "html"
    And I want to login to portal "<PortalName2>"
    And I click on "Paste HTML Markup"
    And I click on button "checkpaste"
    And I paste "html"
    And I click on button "validate_paste"
    And I capture "AC_num_of_errors"
    Then I write "Exemption Request" information to file
    #EXEMPTION REQUEST SUMMARY
    Given I want to login to portal "<PortalName>"
    Then I click on "Service Requests"
    Then I click on "Exemption Request"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value         |
      | s2id_autogen1_search | ACTIVE BOTTLE |
    Then I click on button "select2-results-1"
    Then I click on button "ExemptionStartDateInput"
    Then I click on "20170427"
    #Then I click on "Service Requests"
    # Then I click on button "LodgePayrollAnswer_CRN"
    #Then I click on button "ExemptionEndDateInput"
    #Then I click on "20170320"
    #Then I click on "Service Requests"
    Then I enter the details as
      | Fields             | Value |
      | JustificationInput | TEST  |
    Then I click on button "calTriggerOut"
    Then I click on button with value "Next"
    And I capture "html"
    And I want to login to portal "<PortalName2>"
    And I click on "Paste HTML Markup"
    And I click on button "checkpaste"
    And I paste "html"
    And I click on button "validate_paste"
    And I capture "AC_num_of_errors"
    Then I write "Exemption Request Summary" information to file
    #EXEMPTION REQUEST CONFIRMATION
    Given I want to login to portal "<PortalName>"
    Then I click on "Service Requests"
    Then I click on "Exemption Request"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value         |
      | s2id_autogen1_search | ACTIVE BOTTLE |
    Then I click on button "select2-results-1"
    Then I click on button "ExemptionStartDateInput"
    Then I click on "20170427"
    Then I click on "Service Requests"
    #Then I click on button "ExemptionEndDateInput"
    #Then I click on "20170320"
    #Then I click on "Service Requests"
    Then I enter the details as
      | Fields             | Value |
      | JustificationInput | TEST  |
    Then I click on button "calTriggerOut"
    Then I click on button with value "Next"
    Then I click on button "CorrectInfoDeclared"
    Then I click on button "SummarySubmitBT"
    And I capture "html"
    And I want to login to portal "<PortalName2>"
    And I click on "Paste HTML Markup"
    And I click on button "checkpaste"
    And I paste "html"
    And I click on button "validate_paste"
    And I capture "AC_num_of_errors"
    Then I write "Exemption Request Confirmation" information to file

    Examples: 
      | PortalName | PortalName2 | UserNameField | PasswordField | UserName | Password   |
      | TSS        | AC CHECKER  | UserNameInput | PasswordInput | jbradley | Dbresults1 |

  @review
  Scenario Outline: Objection Request Form
    #OBJECTION REQUEST FORM
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Service Requests"
    Then I click on "Objection Request"
    And I capture "html"
    And I want to login to portal "<PortalName2>"
    And I click on "Paste HTML Markup"
    And I click on button "checkpaste"
    And I paste "html"
    And I click on button "validate_paste"
    And I capture "AC_num_of_errors"
    Then I write "Objection Request" information to file
    #OBJECTION REQUEST SUMMARY
    Given I want to login to portal "<PortalName>"
    Then I click on "Service Requests"
    Then I click on "Objection Request"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value         |
      | s2id_autogen1_search | ACTIVE BOTTLE |
    Then I click on button "select2-results-1"
    Then I click on button "CheckInterest"
    Then I enter the details as
      | Fields             | Value |
      | Objection_Comments | TEST  |
    Then I click on button with value "Next"
    And I capture "html"
    And I want to login to portal "<PortalName2>"
    And I click on "Paste HTML Markup"
    And I click on button "checkpaste"
    And I paste "html"
    And I click on button "validate_paste"
    And I capture "AC_num_of_errors"
    Then I write "Objection Request Summary" information to file
    #OBJECTION REQUEST CONFIRMATION
    Given I want to login to portal "<PortalName>"
    Then I click on "Service Requests"
    Then I click on "Objection Request"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value         |
      | s2id_autogen1_search | ACTIVE BOTTLE |
    Then I click on button "select2-results-1"
    Then I click on button "CheckInterest"
    Then I enter the details as
      | Fields             | Value |
      | Objection_Comments | TEST  |
    Then I click on button with value "Next"
    Then I click on button "SummarySubmitBT"
    And I capture "html"
    And I want to login to portal "<PortalName2>"
    And I click on "Paste HTML Markup"
    And I click on button "checkpaste"
    And I paste "html"
    And I click on button "validate_paste"
    And I capture "AC_num_of_errors"
    Then I write "Objection Request Confirmation" information to file

    Examples: 
      | PortalName | PortalName2 | UserNameField | PasswordField | UserName | Password   |
      | TSS        | AC CHECKER  | UserNameInput | PasswordInput | jbradley | Dbresults1 |

  @review
  Scenario Outline: Payroll Tax Cancellation
    #PAYROLL TAX CANCELLATION
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Service Requests"
    Then I click on "Payroll Tax Cancellation"
    And I capture "html"
    And I want to login to portal "<PortalName2>"
    And I click on "Paste HTML Markup"
    And I click on button "checkpaste"
    And I paste "html"
    And I click on button "validate_paste"
    And I capture "AC_num_of_errors"
    Then I write "Payroll Tax Cancellation" information to file
    #PAYROLL TAX CANCELLATION SUMMARY
    Given I want to login to portal "<PortalName>"
    Then I click on "Service Requests"
    Then I click on "Payroll Tax Cancellation"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value        |
      | s2id_autogen1_search | AQUA PTY LTD |
    Then I click on button "select2-results-1"
    Then I click on button "CancellationStartDate"
    Then I click on "20170424"
    Then I click on button "calTriggerOut"
    Then I click on button "CancellationEndDate"
    Then I click on button "20170430"
    Then I enter the details as
      | Fields            | Value |
      | ReasonDescription | TEST  |
    Then I click on button "calTriggerOut"
    Then I click on button "ReasonDescription"
    Then I click on button with value "Next"
    Then I wait for "5000" millisecond
    And I capture "html"
    And I want to login to portal "<PortalName2>"
    # Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "OK"
    And I click on "Paste HTML Markup"
    And I click on button "checkpaste"
    And I paste "html"
    And I click on button "validate_paste"
    And I capture "AC_num_of_errors"
    Then I write "Payroll Tax Cancellation Summary" information to file
    #PAYROLL TAX CANCELLATION CONFIRMATION
    Given I want to login to portal "<PortalName>"
    Then I click on "Service Requests"
    Then I click on "Payroll Tax Cancellation"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value        |
      | s2id_autogen1_search | AQUA PTY LTD |
    Then I click on button "select2-results-1"
    Then I click on button "CancellationStartDate"
    Then I click on "20170424"
    Then I click on button "calTriggerOut"
    Then I click on button "CancellationEndDate"
    Then I click on button "20170430"
    Then I enter the details as
      | Fields            | Value |
      | ReasonDescription | TEST  |
    Then I click on button "calTriggerOut"
    Then I click on button "ReasonDescription"
    Then I click on button with value "Next"
    Then I click on button "CorrectInfoDeclared"
    Then I click on button "SummarySubmitBT"
    And I capture "html"
    And I want to login to portal "<PortalName2>"
    And I click on "Paste HTML Markup"
    And I click on button "checkpaste"
    And I paste "html"
    And I click on button "validate_paste"
    And I capture "AC_num_of_errors"
    Then I write "Payroll Tax Cancellation Confirmation" information to file
    Then I write to the summary file

    #Then I sort the summary file
    Examples: 
      | PortalName | PortalName2 | UserNameField | PasswordField | UserName | Password   |
      | TSS        | AC CHECKER  | UserNameInput | PasswordInput | jbradley | Dbresults1 |

  @review
  Scenario Outline: Service Requests Part 2
    #Annual Lodgement Request Form
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Service Requests"
    Then I click on "Annual Lodgement Request"
    And I capture "html"
    And I want to login to portal "<PortalName2>"
    And I click on "Paste HTML Markup"
    And I click on button "checkpaste"
    And I paste "html"
    And I click on button "validate_paste"
    And I capture "AC_num_of_errors"
    Then I write "Annual Lodgement Request Form" information to file
    #Annual Lodgement Request Summary
    Given I want to login to portal "<PortalName>"
    Then I click on "Service Requests"
    Then I click on "Annual Lodgement Request"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value        |
      | s2id_autogen1_search | AQUA PTY LTD |
    Then I click on button "select2-results-1"
    Then I select "2018" from "YearCombo"
    Then I click on button "MonthCombo"
    Then I click on "Jan"
    Then I enter the details as
      | Fields                              | Value |
      | AnnualLodgementRequestJustification | TEST  |
    Then I click on button with value "Next"
    Then I wait for "5000" millisecond
    And I capture "html"
    And I want to login to portal "<PortalName2>"
    #Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "OK"
    And I click on "Paste HTML Markup"
    And I click on button "checkpaste"
    And I paste "html"
    And I click on button "validate_paste"
    And I capture "AC_num_of_errors"
    Then I write "Annual Lodgement Request Summary" information to file
    #Annual Lodgement Request Confirmation
    Given I want to login to portal "<PortalName>"
    Then I click on "Service Requests"
    Then I click on "Annual Lodgement Request"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value        |
      | s2id_autogen1_search | AQUA PTY LTD |
    Then I click on button "select2-results-1"
    Then I select "2018" from "YearCombo"
    Then I click on button "MonthCombo"
    Then I click on "Jan"
    Then I enter the details as
      | Fields                              | Value |
      | AnnualLodgementRequestJustification | TEST  |
    Then I click on button with value "Next"
    Then I click on button "CorrectInfoDeclared"
    Then I click on button "SummarySubmitBT"
    And I capture "html"
    And I want to login to portal "<PortalName2>"
    And I click on "Paste HTML Markup"
    And I click on button "checkpaste"
    And I paste "html"
    And I click on button "validate_paste"
    And I capture "AC_num_of_errors"
    Then I write "Annual Lodgement Request Confirmation" information to file

    Examples: 
      | PortalName | PortalName2 | UserNameField | PasswordField | UserName | Password   |
      | TSS        | AC CHECKER  | UserNameInput | PasswordInput | jbradley | Dbresults1 |

  @review
  Scenario Outline: Group Management
    #Group Management
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Group Management"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value    |
      | s2id_autogen1_search | LONG LOG |
    Then I click on button "select2-results-1"
    And I capture "html"
    And I want to login to portal "<PortalName2>"
    And I click on "Paste HTML Markup"
    And I click on button "checkpaste"
    And I paste "html"
    And I click on button "validate_paste"
    And I capture "AC_num_of_errors"
    Then I write "Group Management Form" information to file
    #Group Management Summary
    Given I want to login to portal "<PortalName>"
    Then I click on "Group Management"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value    |
      | s2id_autogen1_search | LONG LOG |
    Then I click on button "select2-results-1"
    Then I wait for "2000" millisecond
    Then I click on button with value "Update Group"
    Then I select "2018" from "YearCombo"
    Then I click on button "MonthCombo"
    Then I click on "Jan"
    Then I click on button with value "Next"
    And I capture "html"
    And I want to login to portal "<PortalName2>"
    And I click on "Paste HTML Markup"
    And I click on button "checkpaste"
    And I paste "html"
    And I click on button "validate_paste"
    And I capture "AC_num_of_errors"
    Then I write "Group Management Summary" information to file
    #Group Management Confirmation
    Given I want to login to portal "<PortalName>"
    Then I click on "Group Management"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value    |
      | s2id_autogen1_search | LONG LOG |
    Then I click on button "select2-results-1"
    Then I wait for "2000" millisecond
    Then I click on button with value "Update Group"
    Then I select "2018" from "YearCombo"
    Then I click on button "MonthCombo"
    Then I click on "Jan"
    Then I click on button with value "Next"
    Then I wait for "5000" millisecond
    Then I click on button "CorrectDeclaration"
    Then I click on button with value "Submit"
    And I capture "html"
    And I want to login to portal "<PortalName2>"
    And I click on "Paste HTML Markup"
    And I click on button "checkpaste"
    And I paste "html"
    And I click on button "validate_paste"
    And I capture "AC_num_of_errors"
    Then I write "Group Management Confirmation" information to file

    Examples: 
      | PortalName | PortalName2 | UserNameField | PasswordField | UserName | Password   |
      | TSS        | AC CHECKER  | UserNameInput | PasswordInput | jbradley | Dbresults1 |

  @current
  Scenario Outline: Other Stuff
    # ACTIVITY HISTORY
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Activity History"
    And I capture "html"
    And I want to login to portal "<PortalName2>"
    And I click on "Paste HTML Markup"
    And I click on button "checkpaste"
    And I paste "html"
    And I click on button "validate_paste"
    And I capture "AC_num_of_errors"
    Then I write "Activity History" information to file
    #GENERIC REQUEST FORM
    Given I want to login to portal "<PortalName>"
    Then I click on "Service Requests"
    Then I click on "Generic Request"
    And I capture "html"
    And I want to login to portal "<PortalName2>"
    And I click on "Paste HTML Markup"
    And I click on button "checkpaste"
    And I paste "html"
    And I click on button "validate_paste"
    And I capture "AC_num_of_errors"
    Then I write "Generic Request Form" information to file
    #GENERIC REQUEST SUMMARY
    Given I want to login to portal "<PortalName>"
    Then I click on "Service Requests"
    Then I click on "Generic Request"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value    |
      | s2id_autogen1_search | LONG LOG |
    Then I click on button "select2-results-1"
    #	 Then I click on button "CommuciateWith"
    #	 Then I click on "Requestor"
    #	 Then I click on button "RequestType"
    #	 Then I click on "Objection"
    Then I select "Requestor" from "CommunicateWith"
    Then I select "General Enquiry" from "RequestType"
    And I enter the details as
      | Fields          | Value |
      | RequestComments | TEST  |
    Then I click on button with value "Next"
    Then I wait for "5000" millisecond
    And I capture "html"
    And I want to login to portal "<PortalName2>"
    And I click on "Paste HTML Markup"
    And I click on button "checkpaste"
    And I paste "html"
    And I click on button "validate_paste"
    And I capture "AC_num_of_errors"
    Then I write "Generic Request Summary" information to file
    #GENERIC REQUEST CONFIRMATION
    Given I want to login to portal "<PortalName>"
    Then I click on "Service Requests"
    Then I click on "Generic Request"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value    |
      | s2id_autogen1_search | LONG LOG |
    Then I click on button "select2-results-1"
    #	 Then I click on button "CommuciateWith"
    #	 Then I click on "Requestor"
    #	 Then I click on button "RequestType"
    #	 Then I click on "Objection"
    Then I select "Requestor" from "CommunicateWith"
    Then I select "General Enquiry" from "RequestType"
    And I enter the details as
      | Fields          | Value |
      | RequestComments | TEST  |
    Then I click on button with value "Next"
    Then I click on button with value "Submit"
    And I capture "html"
    And I want to login to portal "<PortalName2>"
    And I click on "Paste HTML Markup"
    And I click on button "checkpaste"
    And I paste "html"
    And I click on button "validate_paste"
    And I capture "AC_num_of_errors"
    Then I write "Generic Request Confirmation" information to file
    #LIQUIDATION ADVICE
    Given I want to login to portal "<PortalName>"
    Then I click on "Service Requests"
    Then I click on "Liquidation Advice"
    And I capture "html"
    And I want to login to portal "<PortalName2>"
    And I click on "Paste HTML Markup"
    And I click on button "checkpaste"
    And I paste "html"
    And I click on button "validate_paste"
    And I capture "AC_num_of_errors"
    Then I write "Liquidation Advice Form" information to file
    #ACCOUNT ALREADY ACTIVATED
    Given I want to login to portal "ExpiredActivation"
    And I capture "html"
    And I want to login to portal "<PortalName2>"
    And I click on "Paste HTML Markup"
    And I click on button "checkpaste"
    And I paste "html"
    And I click on button "validate_paste"
    And I capture "AC_num_of_errors"
    Then I write "Account Already Activated" information to file
    #RESET PASSWORD LINK EXPIRED
    Given I want to login to portal "ExpiredChangePassword"
    And I capture "html"
    And I want to login to portal "<PortalName2>"
    And I click on "Paste HTML Markup"
    And I click on button "checkpaste"
    And I paste "html"
    And I click on button "validate_paste"
    And I capture "AC_num_of_errors"
    Then I write "Reset Password Link Expired" information to file
    Then I write to the summary file

    #
    Examples: 
      | PortalName | PortalName2 | UserNameField | PasswordField | UserName | Password   |
      | TSS        | AC CHECKER  | UserNameInput | PasswordInput | jbradley | Dbresults1 |
