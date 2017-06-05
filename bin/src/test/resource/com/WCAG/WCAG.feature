@all
Feature: Wip in stuff.

  #TODO: Fix Lodgement Summary and Update Refund Summary wrong page errors
  @erase
  Scenario Outline: Erase Previous Data
    Given I erase previous data

    Examples: 
      | PortalName | PortalName2 | UserNameField | PasswordField | UserName | Password   |
      | TSS        | AC CHECKER  | UserNameInput | PasswordInput | jbradley | Dbresults1 |

	##################################################################################################################################################
	############################################################# OTHER PAGES #############################################################
	##################################################################################################################################################
	

  @done
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
     And I capture "html"
    And I want to login to portal "<PortalName2>"
    And I click on "Paste HTML Markup"
    And I click on button "checkpaste"
    And I paste "html"
    And I click on button "validate_paste"
    And I capture "AC_num_of_errors"
    Then I write "REGISTRATION CONFIRMATION" information to file
    
    #Then I want to login to portal "RegistrationLinkTable"
    #Then I click on object with xpath "//*[contains(text(), '<NewUserName>')]/../following-sibling::td/a"
    #And I enter the details as
      #| Fields        | Value         |
      #| UserNameInput | <NewUserName> |
      #| PasswordInput | <Password>    |
      #
    #And I hit Enter
   
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
      | TSS        | AC CHECKER  | 12054547368 |      400043 | 21006819692 | TOYOTA SUPER PTY LTD | jbradley | Dbresults1 | wcag_automation4 | wcag4@automation.com |

  @current
  Scenario Outline: WCAG Forms: Tax Registration, User Settings
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
    
  
    #Return History
    Given I want to login to portal "<PortalName>"
    And I check I am on "Home" page
    Then I click on "Return History"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value         |
      | s2id_autogen1_search | <PayrollName> |
    Then I click on button "select2-results-1"
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
      | PortalName | PortalName2 | UserNameField | PasswordField | UserName | Password   | PayrollName |
      | TSS        | AC CHECKER  | UserNameInput | PasswordInput | jbradley | Dbresults1 | For Bearly Nothing |
      
  
  @done
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
 	
 		#Manage Account Details
    Given I want to login to portal "<PortalName>"
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
    Given I want to login to portal "ExpiredPassword"
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
	
	##################################################################################################################################################
	################################################################ LODGEMENT FORMS ################################################################
	##################################################################################################################################################
	@done
	Scenario Outline: Payroll Tax Lodgement Form
		 #PAYROLL FORM
    Given I want to login to portal "<PortalName>"
     And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Lodgements"
    Then I click on "Payroll Tax"
    And I check I am on "Payroll Lodgement Form" page
    And I capture "html"
    And I want to login to portal "<PortalName2>"
    And I click on "Paste HTML Markup"
    And I click on button "checkpaste"
    And I paste "html"
    And I click on button "validate_paste"
    And I capture "AC_num_of_errors"
    Then I write "Payroll Lodgement Form" information to file
    
	
	  # LODGEMENT SUMMARY PAGE
    Given I want to login to portal "<PortalName>"
     Then I click on "Lodgements"
    Then I click on "Payroll Tax"
    And I check I am on "Payroll Lodgement Form" page
    Then I click on button "Discard"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value         |
      | s2id_autogen1_search | <PayrollName> |
    Then I click on button "select2-results-1"
    Then I click on "Monthly Return"
    Then I select "Sep 2016" from "MonthlyObligationSelect"
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
    Then I check I am on "Payroll Tax Lodgement Summary" page
    And I capture "html"
    And I want to login to portal "<PortalName2>"
    And I click on "Paste HTML Markup"
    And I click on button "checkpaste"
    And I paste "html"
    And I click on button "validate_paste"
    And I capture "AC_num_of_errors"
    Then I write "Lodgement Summary" information to file
     And I want to login to portal "<PortalName2>"
    And I click on "Paste HTML Markup"
    And I click on button "checkpaste"
    And I paste "html"
    And I click on button "validate_paste"
    And I capture "AC_num_of_errors"
    Then I write "Payroll Lodgement Form Summary" information to file
    
    
	  # LODGEMENT CONFIRMATION PAGE
    Given I want to login to portal "<PortalName>"
     Then I click on "Lodgements"
    Then I click on "Payroll Tax"
    And I check I am on "Payroll Lodgement Form" page
    Then I click on button "Discard"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value         |
      | s2id_autogen1_search | <PayrollName> |
    Then I click on button "select2-results-1"
    Then I click on "Monthly Return"
    Then I select "Sep 2016" from "MonthlyObligationSelect"
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
    Then I check I am on "Payroll Tax Lodgement Summary" page
    Then I click on button "CorrectInfoDeclared"
    Then I click on button "SummarySubmitBT"
    Then I wait for "5000" millisecond
    And I capture "html"
    And I want to login to portal "<PortalName2>"
    And I click on "Paste HTML Markup"
    And I click on button "checkpaste"
    And I paste "html"
    And I click on button "validate_paste"
    And I capture "AC_num_of_errors"
    Then I write "Lodgement Confirmation" information to file
     And I want to login to portal "<PortalName2>"
    And I click on "Paste HTML Markup"
    And I click on button "checkpaste"
    And I paste "html"
    And I click on button "validate_paste"
    And I capture "AC_num_of_errors"
    Then I write "Payroll Tax Lodgement Form Confirmation" information to file
    
      Examples: 
      | PortalName | PortalName2 | UserNameField | PasswordField | UserName | Password   | PayrollName |
      | TSS        | AC CHECKER  | UserNameInput | PasswordInput | jbradley | Dbresults1 | For Bearly Nothing |
	
  @done
  Scenario Outline: Utilities (Network Facilities) Tax
    Given I want to login to portal "<PortalName>"
     And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Lodgements"
    Then I click on "Utilities (Network Facilities) Tax"
    Then I check I am on "Network Utilities Lodgement Form" page
 		And I capture "html"
    And I want to login to portal "<PortalName2>"
    And I click on "Paste HTML Markup"
    And I click on button "checkpaste"
    And I paste "html"
    And I click on button "validate_paste"
    And I capture "AC_num_of_errors"
    Then I write "Utilities (Network Facilities) Lodgement Form" information to file
    
    #Summary
    Given I want to login to portal "<PortalName>"
    Then I click on "Lodgements"
    Then I click on "Utilities (Network Facilities) Tax"
    Then I check I am on "Network Utilities Lodgement Form" page
        Then I click on button "select2-chosen-1"
    
    Then I enter the details as
      | Fields               | Value         |
      | s2id_autogen1_search | <BusinessName> |
    Then I click on button "select2-results-1"
    Then I select "2013" from "ObligationsDropdown"
    Then I click on button "SaveNextBT"
    Then I select "Water Network" from "NetworkDetail_UtilityTypeDropdown" 
    Then I click on button "SaveAndNextToSummaryBT"
    Then I wait for "5000" millisecond
    Then I check I am on "Lodgement Summary" page
    And I capture "html"
    And I want to login to portal "<PortalName2>"
    And I click on "Paste HTML Markup"
    And I click on button "checkpaste"
    And I paste "html"
    And I click on button "validate_paste"
    And I capture "AC_num_of_errors"
    Then I write "Utilities (Network Facilities) Lodgement Summary" information to file
    
    
    #Confirmation
    Given I want to login to portal "<PortalName>"
    Then I click on "Lodgements"
    Then I click on "Utilities (Network Facilities) Tax"
    Then I check I am on "Network Utilities Lodgement Form" page
    Then I click on button with value "Discard"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value         |
      | s2id_autogen1_search | <BusinessName> |
    Then I click on button "select2-results-1"
    Then I select "2013" from "ObligationsDropdown"
    Then I click on button "SaveNextBT"
    Then I select "Water Network" from "NetworkDetail_UtilityTypeDropdown" 
    Then I click on button "SaveAndNextToSummaryBT"
    Then I wait for "5000" millisecond
     Then I click on button "CorrectInfoDeclared"
    Then I click on button "SummarySubmitBT"
    Then I wait for "5000" millisecond
    Then I check I am on "Submission Confirmation" page
   And I capture "html"
    And I want to login to portal "<PortalName2>"
    And I click on "Paste HTML Markup"
    And I click on button "checkpaste"
    And I paste "html"
    And I click on button "validate_paste"
    And I capture "AC_num_of_errors"
    Then I write "Utilities (Network Facilities) Lodgement Confirmation" information to file
   Examples: 
      | PortalName | PortalName2 | UserNameField | PasswordField | UserName | Password   | BusinessName |
      | TSS        | AC CHECKER  | UserNameInput | PasswordInput | jbradley | Dbresults1 | INTO THE NEW |
      
  
  
  @done
  Scenario Outline: Ambulance Levy
    Given I want to login to portal "<PortalName>"
     And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Lodgements"
    Then I click on "Ambulance Levy"
    Then I check I am on "Ambulance Levy Lodgement Form" page
 		And I capture "html"
    And I want to login to portal "<PortalName2>"
    And I click on "Paste HTML Markup"
    And I click on button "checkpaste"
    And I paste "html"
    And I click on button "validate_paste"
    And I capture "AC_num_of_errors"
    Then I write "Ambulance Levy Lodgement Form" information to file
    
    #Summary
    Given I want to login to portal "<PortalName>"
    Then I click on "Lodgements"
    Then I click on "Ambulance Levy"
    Then I check I am on "Ambulance Levy Lodgement Form" page
    Then I click on button "select2-chosen-1"
    
    Then I enter the details as
      | Fields               | Value         |
      | s2id_autogen1_search | <BusinessName> |
    Then I click on button "select2-results-1"
    Then I select "2016" from "ObligationsDropdown"
    Then I click on button "SaveNextBT"
    And I enter the details as
      | Fields        | Value      |
      | LodgeAmbulanceLevyAnswer_NumberSingleMembers | 11 |
      | LodgeAmbulanceLevyAnswer_NumberFamilyMembers | 11 |
    Then I click on button "SaveAndNextToSummaryBT"
     Then I wait for "5000" millisecond
    Then I check I am on "Lodgement Summary" page
     		And I capture "html"
    And I want to login to portal "<PortalName2>"
    And I click on "Paste HTML Markup"
    And I click on button "checkpaste"
    And I paste "html"
    And I click on button "validate_paste"
    And I capture "AC_num_of_errors"
    Then I write "Ambulance Levy Lodgement Summary" information to file
    
      #Confirmation
    Given I want to login to portal "<PortalName>"
    Then I click on "Lodgements"
    Then I click on "Ambulance Levy"
    Then I check I am on "Ambulance Levy Lodgement Form" page
     Then I click on button with value "Discard"
    Then I click on button "select2-chosen-1"
    
    Then I enter the details as
      | Fields               | Value         |
      | s2id_autogen1_search | <BusinessName> |
    Then I click on button "select2-results-1"
    Then I select "2016" from "ObligationsDropdown"
    Then I click on button "SaveNextBT"
    And I enter the details as
      | Fields        | Value      |
      | LodgeAmbulanceLevyAnswer_NumberSingleMembers | 11 |
      | LodgeAmbulanceLevyAnswer_NumberFamilyMembers | 11 |
    Then I click on button "SaveAndNextToSummaryBT"
    Then I wait for "5000" millisecond
    Then I check I am on "Lodgement Summary" page
    Then I click on button "CorrectInfoDeclared"
    Then I click on button "SummarySubmitBT"
    Then I wait for "5000" millisecond
    Then I check I am on "Submission Confirmation" page
    And I capture "html"
    And I want to login to portal "<PortalName2>"
    And I click on "Paste HTML Markup"
    And I click on button "checkpaste"
    And I paste "html"
    And I click on button "validate_paste"
    And I capture "AC_num_of_errors"
    Then I write "Ambulance Levy Lodgement Confirmation" information to file
    
    Examples: 
      | PortalName | PortalName2 | UserNameField | PasswordField | UserName | Password   | BusinessName |
      | TSS        | AC CHECKER  | UserNameInput | PasswordInput | jbradley | Dbresults1 | For Bearly Nothing |
  
  @done
  Scenario Outline: Energy Industry Levy 
   Given I want to login to portal "<PortalName>"
     And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Lodgements"
    Then I click on "Energy Industry Levy"
    Then I check I am on "Energy Industry Levy Lodgement Form" page
 		And I capture "html"
    And I want to login to portal "<PortalName2>"
    And I click on "Paste HTML Markup"
    And I click on button "checkpaste"
    And I paste "html"
    And I click on button "validate_paste"
    And I capture "AC_num_of_errors"
    Then I write "Energy Industry Levy Lodgement Form" information to file
    
    #Summary
    Given I want to login to portal "<PortalName>"
    Then I click on "Lodgements"
    Then I click on "Energy Industry Levy"
    Then I check I am on "Energy Industry Levy Lodgement Form" page
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value         |
      | s2id_autogen1_search | <BusinessName> |
    Then I click on button "select2-results-1"
    Then I select "2014" from "ObligationsDropdown"
    Then I click on button "SaveNextBT"
    Then I select "Gas Supply Sector" from "SupplyDistributionSector_SectorType"
    And I enter the details as
      | Fields        | Value      |
      | EstimateMegawattHours | 11 |
      | ActualMegawattHours | 11 |
      |	MethodCalculateTotalMegaw |			11			 |
    Then I click on button "SaveAndNextToSummaryBT"
    Then I wait for "5000" millisecond
    Then I check I am on "Lodgement Summary" page
    And I capture "html"
    And I want to login to portal "<PortalName2>"
    And I click on "Paste HTML Markup"
    And I click on button "checkpaste"
    And I paste "html"
    And I click on button "validate_paste"
    And I capture "AC_num_of_errors"
    Then I write "Energy Industry Levy Summary" information to file
    
    #Confirmation
    Given I want to login to portal "<PortalName>"
    Then I click on "Lodgements"
    Then I click on "Energy Industry Levy"
    #Then I check I am on "Energy Industry Levy Lodgement Form" page
     Then I see "Do you want to discard the draft and start new lodgement?" displayed on popup and I click "OK"
    Then I click on button with value "Discard"
   
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value         |
      | s2id_autogen1_search | <BusinessName> |
    Then I click on button "select2-results-1"
    Then I select "2014" from "ObligationsDropdown"
    Then I click on button "SaveNextBT"
    Then I select "Gas Supply Sector" from "SupplyDistributionSector_SectorType"
    And I enter the details as
      | Fields        | Value      |
      | EstimateMegawattHours | 11 |
      | ActualMegawattHours | 11 |
      |	MethodCalculateTotalMegaw |			11			 |
    Then I click on button "SaveAndNextToSummaryBT"
    Then I wait for "5000" millisecond
    Then I check I am on "Lodgement Summary" page
      Then I click on button "CorrectInfoDeclared"
    Then I click on button "SummarySubmitBT"
    Then I wait for "5000" millisecond
    Then I check I am on "Submission Confirmation" page
    And I capture "html"
    And I want to login to portal "<PortalName2>"
    And I click on "Paste HTML Markup"
    And I click on button "checkpaste"
    And I paste "html"
    And I click on button "validate_paste"
    And I capture "AC_num_of_errors"
    Then I write "Energy Industry Levy Confirmation" information to file
    
    Examples: 
      | PortalName | PortalName2 | UserNameField | PasswordField | UserName | Password   | BusinessName |
      | TSS        | AC CHECKER  | UserNameInput | PasswordInput | jbradley | Dbresults1 | INTO THE NEW |
  
  
	##################################################################################################################################################
	############################################################# TAX REGISTRATION UPDATES ###########################################################
	##################################################################################################################################################

  @done
  Scenario Outline: Update Business Address
    #UPDATE BUSINESS ADDRESS PART 1
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    And I check I am on "Home" page
    Then I click on "Tax Registration Update"
    Then I click on "Update Business Address"
    Then I check I am on "Update Business Address" page
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value         |
      | s2id_autogen1_search | <BusinessName> |
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
    Then I check I am on "Update Business Address" page
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value         |
      | s2id_autogen1_search | <BusinessName> |
    Then I click on button "select2-results-1"
    Then I wait for "1000" millisecond
    Then I click on button with value "Next"
    Then I check I am on "Update Business Address Summary" page
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
    Then I check I am on "Update Business Address" page
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value         |
      | s2id_autogen1_search | <BusinessName> |
    Then I click on button "select2-results-1"
    Then I wait for "1000" millisecond
    Then I click on button with value "Next"
    Then I wait for "1000" millisecond
    Then I check I am on "Update Business Address Summary" page
    
    Then I click on button "CorrectInfoDeclared"
    Then I click on button "SummarySubmitBT"
    Then I wait for "5000" millisecond
    Then I check I am on "Update Complete" page
    And I capture "html"
    And I want to login to portal "<PortalName2>"
    And I click on "Paste HTML Markup"
    And I click on button "checkpaste"
    And I paste "html"
    And I click on button "validate_paste"
    And I capture "AC_num_of_errors"
    Then I write "Update Business Address Confirmation" information to file

    Examples: 
      | PortalName | PortalName2 |  UserName | Password   | BusinessName |
      | TSS        | AC CHECKER  |  jbradley | Dbresults1 | HEMPSON |

  @done
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
    Then I check I am on "Update Contact Details" page
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value         |
      | s2id_autogen1_search | <BusinessName> |
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
    Then I check I am on "Update Contact Details" page
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value         |
      | s2id_autogen1_search | <BusinessName> |
    Then I click on button "select2-results-1"
    Then I click on button with value "Next"
    Then I check I am on "Update Contact Details Summary" page
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
    Then I check I am on "Update Contact Details" page
    
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value         |
      | s2id_autogen1_search | <BusinessName> |
    Then I click on button "select2-results-1"
    Then I click on button with value "Next"
    Then I wait for "5000" millisecond
    Then I check I am on "Update Contact Details Summary" page
    
    Then I click on button "CorrectInfoDeclared"
    Then I click on button "SummarySubmitBT"
    Then I wait for "5000" millisecond
    Then I check I am on "Update Complete" page
    And I capture "html"
    And I want to login to portal "<PortalName2>"
    And I click on "Paste HTML Markup"
    And I click on button "checkpaste"
    And I paste "html"
    And I click on button "validate_paste"
    And I capture "AC_num_of_errors"
    Then I write "Update Payroll Contact Details Confirmation" information to file

       Examples: 
      | PortalName | PortalName2 |  UserName | Password   | BusinessName |
      | TSS        | AC CHECKER  |  jbradley | Dbresults1 | HEMPSON |


  @done
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
    Then I check I am on "Update Refund Details" page
    Then I enter the details as
      | Fields               | Value         |
      | s2id_autogen1_search | <BusinessName> |
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
    Then I check I am on "Update Refund Details" page
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value         |
      | s2id_autogen1_search | <BusinessName> |
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
      | s2id_autogen1_search | <BusinessName> |
    Then I click on button "select2-results-1"
    Then I click on button with value "Next"
    Then I wait for "5000" millisecond
    Then I check I am on "Update Refund Details Summary" page
    Then I click on button "CorrectInfoDeclared"
    Then I click on button with value "Submit"
    Then I wait for "5000" millisecond
    Then I check I am on "Update Complete" page
    And I capture "html"
    And I want to login to portal "<PortalName2>"
    And I click on "Paste HTML Markup"
    And I click on button "checkpaste"
    And I paste "html"
    And I click on button "validate_paste"
    And I capture "AC_num_of_errors"
    Then I write "Update Payroll Refund Details Confirmation" information to file

    Examples: 
      | PortalName | PortalName2 |  UserName | Password   | BusinessName |
      | TSS        | AC CHECKER  |  jbradley | Dbresults1 | HEMPSON |


  @done
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
    Then I check I am on "UpdateBusinessTradingName" page
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value         |
      | s2id_autogen1_search | <BusinessName> |
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
    Then I check I am on "UpdateBusinessTradingName" page
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value         |
      | s2id_autogen1_search | <BusinessName> |
    Then I click on button "select2-results-1"
    Then I click on button with value "Next"
    Then I check I am on "UpdateBusinessTradingNameSummary" page
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
    Then I check I am on "UpdateBusinessTradingName" page
    Then I enter the details as
      | Fields               | Value         |
      | s2id_autogen1_search | <BusinessName>|
    Then I click on button "select2-results-1"
    Then I click on button with value "Next"
    Then I check I am on "UpdateBusinessTradingNameSummary" page
    Then I wait for "5000" millisecond
    Then I click on button "CorrectInfoDeclared"
    Then I click on button "SummarySubmitBT"
    Then I check I am on "Update Complete" page
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
      | PortalName | PortalName2 |  UserName | Password   | BusinessName |
      | TSS        | AC CHECKER  |  jbradley | Dbresults1 | HEMPSON |

	##################################################################################################################################################
	############################################################# SERVICE REQUEST PAGES #############################################################
	##################################################################################################################################################
	

  @done
  Scenario Outline: Exemption Request
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
      | s2id_autogen1_search | <BusinessName> |
    Then I click on button "select2-results-1"
    Then I click on button "ExemptionStartDateInput"
    Then I click on "20170527"
    #Then I click on "Service Requests"
    # Then I click on button "LodgePayrollAnswer_CRN"
    #Then I click on button "ExemptionEndDateInput"
    #Then I click on "20170320"
    #Then I click on "Service Requests"
    Then I enter the details as
      | Fields             | Value |
      | JustificationInput | TEST  |
    Then I click on button "calTriggerOut"
    Then I click on button "NextBT"
    Then I wait for "5000" millisecond
    Then I check I am on "Exemption Request Summary" page
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
      | s2id_autogen1_search | <BusinessName> |
    Then I click on button "select2-results-1"
    Then I click on button "ExemptionStartDateInput"
    Then I click on "20170601"
    Then I click on "Service Requests"
    #Then I click on button "ExemptionEndDateInput"
    #Then I click on "20170320"
    #Then I click on "Service Requests"
    Then I enter the details as
      | Fields             | Value |
      | JustificationInput | TEST  |
    #Then I click on button "calTriggerOut"
    Then I click on button "NextBT"
    Then I wait for "5000" millisecond
     Then I check I am on "Exemption Request Summary" page
    Then I click on button "CorrectInfoDeclared"
    Then I click on button "SummarySubmitBT"
    Then I wait for "5000" millisecond
    Then I check I am on "Exemption Request Confirmation" page
    And I capture "html"
    And I want to login to portal "<PortalName2>"
    And I click on "Paste HTML Markup"
    And I click on button "checkpaste"
    And I paste "html"
    And I click on button "validate_paste"
    And I capture "AC_num_of_errors"
    Then I write "Exemption Request Confirmation" information to file
    
    Examples: 
      | PortalName | PortalName2 |  UserName | Password   | BusinessName |
      | TSS        | AC CHECKER  |  jbradley | Dbresults1 | For Bearly Nothing |

  @done
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
      | s2id_autogen1_search | <BusinessName> |
    Then I click on button "select2-results-1"
    Then I click on button "CheckInterest"
    Then I enter the details as
      | Fields             | Value |
      | Objection_Comments | TEST  |
    Then I click on button "NextBT"
    Then I wait for "5000" millisecond
    Then I check I am on "Objection Request Summary" page
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
      | s2id_autogen1_search | <BusinessName> |
    Then I click on button "select2-results-1"
    Then I click on button "CheckInterest"
    Then I enter the details as
      | Fields             | Value |
      | Objection_Comments | TEST  |
    Then I click on button "NextBT"
    Then I wait for "5000" millisecond
    Then I click on button "CorrectInfoDeclared"
    Then I click on button "SummarySubmitBT"
    Then I wait for "5000" millisecond
    Then I check I am on "Objection Request Confirmation" page
    And I capture "html"
    And I want to login to portal "<PortalName2>"
    And I click on "Paste HTML Markup"
    And I click on button "checkpaste"
    And I paste "html"
    And I click on button "validate_paste"
    And I capture "AC_num_of_errors"
    Then I write "Objection Request Confirmation" information to file

    Examples: 
      | PortalName | PortalName2 |  UserName | Password   | BusinessName |
      | TSS        | AC CHECKER  |  jbradley | Dbresults1 | For Bearly Nothing |
  @done
  Scenario Outline: Tax Registration Cancellation
    #Tax Registration Cancellation
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Service Requests"
    Then I click on "Tax Registration Cancellation"
    And I capture "html"
    And I want to login to portal "<PortalName2>"
    And I click on "Paste HTML Markup"
    And I click on button "checkpaste"
    And I paste "html"
    And I click on button "validate_paste"
    And I capture "AC_num_of_errors"
    Then I write "Tax Registration Cancellation" information to file
    #Tax Registration Cancellation SUMMARY
    Given I want to login to portal "<PortalName>"
    Then I click on "Service Requests"
    Then I click on "Tax Registration Cancellation"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value        |
      | s2id_autogen1_search | <BusinessName> |
    Then I click on button "select2-results-1"
    Then I click on button "CancellationStartDate"
    Then I click on "20170531"
    #Then I click on button "calTriggerOut"
    #Then I click on button "CancellationEndDate"
    #Then I click on button "20170530"
    Then I enter the details as
      | Fields            | Value |
      | ReasonDescription | TEST  |
    #Then I click on button "calTriggerOut"
    Then I click on button "ReasonDescription"
    Then I click on button "NextBT"
    Then I wait for "5000" millisecond
		Then I check I am on "Tax Cancellation Request Summary" page
    And I capture "html"
    And I want to login to portal "<PortalName2>"
    # Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "OK"
    And I click on "Paste HTML Markup"
    And I click on button "checkpaste"
    And I paste "html"
    And I click on button "validate_paste"
    And I capture "AC_num_of_errors"
    Then I write "Tax Registration Cancellation Summary" information to file
    #Tax Registration Cancellation CONFIRMATION
    Given I want to login to portal "<PortalName>"
    Then I click on "Service Requests"
    Then I click on "Tax Registration Cancellation"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value        |
      | s2id_autogen1_search | <BusinessName> |
    Then I click on button "select2-results-1"
    Then I click on button "CancellationStartDate"
    Then I click on "20170531"
    #Then I click on button "calTriggerOut"
    #Then I click on button "CancellationEndDate"
    #Then I click on button "20170530"
    Then I enter the details as
      | Fields            | Value |
      | ReasonDescription | TEST  |
    #Then I click on button "calTriggerOut"
    Then I click on button "ReasonDescription"
    Then I click on button "NextBT"
    Then I wait for "5000" millisecond
    Then I click on button "CorrectInfoDeclared"
    Then I click on button "SummarySubmitBT"
    Then I wait for "5000" millisecond
    Then I check I am on "Tax Cancellation Request Confirmation" page
    And I capture "html"
    And I want to login to portal "<PortalName2>"
    And I click on "Paste HTML Markup"
    And I click on button "checkpaste"
    And I paste "html"
    And I click on button "validate_paste"
    And I capture "AC_num_of_errors"
    Then I write "Tax Registration Cancellation Confirmation" information to file
    Then I write to the summary file

    #Then I sort the summary file
    Examples: 
      | PortalName | PortalName2 |  UserName | Password   | BusinessName |
      | TSS        | AC CHECKER  |  jbradley | Dbresults1 | COFFEE |
  @done
  Scenario Outline: Annual Lodgement Request
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
      | s2id_autogen1_search | <BusinessName> |
    Then I click on button "select2-results-1"
    Then I select "2018" from "YearCombo"
    Then I click on button "MonthCombo"
    #Then I click on button "DisclosureDateInput"
    #Then I click on "20170601"
    Then I click on "Jan"
    Then I enter the details as
      | Fields                              | Value |
      | AnnualLodgementRequestJustification | TEST  |
    Then I click on button "NextBT"
    Then I wait for "5000" millisecond
    Then I check I am on "Annual Lodgement Request Summary" page
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
      | s2id_autogen1_search | <BusinessName> |
    Then I click on button "select2-results-1"
    Then I select "2018" from "YearCombo"
    Then I click on button "MonthCombo"
    #Then I click on button "DisclosureDateInput"
    #Then I click on "20170601"
    Then I click on "Jan"
    Then I enter the details as
      | Fields                              | Value |
      | AnnualLodgementRequestJustification | TEST  |
    Then I click on button "NextBT"
    Then I wait for "5000" millisecond
    Then I click on button "CorrectInfoDeclared"
    Then I click on button "SummarySubmitBT"
    Then I wait for "5000" millisecond
    Then I check I am on "Annual Lodgement Request Confirmation" page
    And I capture "html"
    And I want to login to portal "<PortalName2>"
    And I click on "Paste HTML Markup"
    And I click on button "checkpaste"
    And I paste "html"
    And I click on button "validate_paste"
    And I capture "AC_num_of_errors"
    Then I write "Annual Lodgement Request Confirmation" information to file

	Examples: 
      | PortalName | PortalName2 |  UserName | Password   | BusinessName |
      | TSS        | AC CHECKER  |  jbradley | Dbresults1 |  For Bearly Nothing |
      
    @manual
  Scenario Outline: Update Liability Commencement Date Request
    #Update Liability Commencement Date Request Form
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Service Requests"
    Then I click on "Update Liability Commencement Date Request"
    And I capture "html"
    And I want to login to portal "<PortalName2>"
    And I click on "Paste HTML Markup"
    And I click on button "checkpaste"
    And I paste "html"
    And I click on button "validate_paste"
    And I capture "AC_num_of_errors"
    Then I write "Update Liability Commencement Date Request Form" information to file
    
    #Update Liability Commencement Date Request Summary
    Given I want to login to portal "<PortalName>"
    Then I click on "Service Requests"
    Then I click on "Update Liability Commencement Date Request"
    Then I click on button "select2-chosen-1"
     Then I enter the details as
      | Fields               | Value        |
      | s2id_autogen1_search | <BusinessName> |
    Then I click on button "select2-results-1"
    Then I click on button "DisclosureDateInput"
    Then I click on "20170530"   
    Then I click on button "NextBT"
    Then I wait for "5000" millisecond
    Then I check I am on "Update Liability Commencement Date Request Summary" page
    And I capture "html"
    And I want to login to portal "<PortalName2>"
    And I click on "Paste HTML Markup"
    And I click on button "checkpaste"
    And I paste "html"
    And I click on button "validate_paste"
    And I capture "AC_num_of_errors"
    Then I write "Update Liability Commencement Date Request Summary" information to file
 
 	 	#Update Liability Commencement Date Confirmation
    Given I want to login to portal "<PortalName>"
    Then I click on "Service Requests"
    Then I click on "Update Liability Commencement Date Request"
    Then I click on button "select2-chosen-1"
     Then I enter the details as
      | Fields               | Value        |
      | s2id_autogen1_search | <BusinessName> |
    Then I click on button "select2-results-1"
    Then I click on button "DisclosureDateInput"
    Then I click on "20170530"   
   Then I click on button "NextBT"
    Then I wait for "5000" millisecond
    Then I click on button "CorrectInfoDeclared"
    Then I click on button "SummarySubmitBT"
    Then I wait for "5000" millisecond
    Then I check I am on "Update Liability Commencement Date Confirmation" page
    And I capture "html"
    And I want to login to portal "<PortalName2>"
    And I click on "Paste HTML Markup"
    And I click on button "checkpaste"
    And I paste "html"
    And I click on button "validate_paste"
    And I capture "AC_num_of_errors"
    Then I write "Update Liability Commencement Date Request Confirmation" information to file

	Examples: 
      | PortalName | PortalName2 |  UserName | Password   | BusinessName |
      | TSS        | AC CHECKER  |  jbradley | Dbresults1 |  For Bearly Nothing |
      
        
  
 
	@done
		 Scenario Outline: Generic Request Form
	   #GENERIC REQUEST FORM
    Given I want to login to portal "<PortalName>"
     And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
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
      | s2id_autogen1_search | <BusinessName> |
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
    Then I click on button "NextBT"
    Then I wait for "5000" millisecond
    Then I check I am on "Generic Request Summary" page
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
      | s2id_autogen1_search | <BusinessName> |
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
    Then I click on button "NextBT"
    
    Then I click on button with value "Submit"
    Then I wait for "5000" millisecond
    Then I check I am on "Generic Request Confirmation" page
    And I capture "html"
    And I want to login to portal "<PortalName2>"
    And I click on "Paste HTML Markup"
    And I click on button "checkpaste"
    And I paste "html"
    And I click on button "validate_paste"
    And I capture "AC_num_of_errors"
    Then I write "Generic Request Confirmation" information to file
	Examples: 
      | PortalName | PortalName2 | UserNameField | BusinessName  | UserName | Password   |
      | TSS        | AC CHECKER  | UserNameInput | For Bearly Nothing | jbradley | Dbresults1 |
  
  @done
  Scenario Outline: Liquidation Advice
   #LIQUIDATION ADVICE
    Given I want to login to portal "<PortalName>"
     And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
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
  
  	#Summary
  	Given I want to login to portal "<PortalName>"
  	Then I click on "Service Requests"
    Then I click on "Liquidation Advice"
     Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value    |
      | s2id_autogen1_search | <BusinessName> |
    Then I click on button "select2-results-1"
  	And I enter the details as
      | Fields        | Value      |
      | ContactPerson_FirstName | TEST |
      | ContactPerson_LastName | TEST |
      | ContactPerson_PhoneNumber | 3333333333 |
      | ContactPerson_Email | TEST@TEST.com |
      | Address_AddressLine7 | TEST |
      | Address_City4 | TEST |
      | Address_PostCode | 3333 |
    Then I select "Email" from "ContactPerson_CommunicationMethodId"
        Then I select "Direct Post" from "ContactPerson_CommunicationMethodId"
    
    Then I click on button "LiquidationStartDate2"
    Then I click on "20170531"
    Then I click on button "NextBT"
    Then I wait for "5000" millisecond
    Then I check I am on "Liquidation Advice Summary" page
       And I capture "html"
       
    And I want to login to portal "<PortalName2>"
    And I click on "Paste HTML Markup"
    And I click on button "checkpaste"
    And I paste "html"
    And I click on button "validate_paste"
    And I capture "AC_num_of_errors"
    Then I write "Liquidation Advice Summary" information to file
    
  	#Confirmation
  Given I want to login to portal "<PortalName>"
  	Then I click on "Service Requests"
    Then I click on "Liquidation Advice"
     Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value    |
      | s2id_autogen1_search | <BusinessName> |
    Then I click on button "select2-results-1"
  	And I enter the details as
      | Fields        | Value      |
      | ContactPerson_FirstName | TEST |
      | ContactPerson_LastName | TEST |
      | ContactPerson_PhoneNumber | 3333333333 |
      | ContactPerson_Email | TEST@TEST.com |
      | Address_AddressLine7 | TEST |
      | Address_City4 | TEST |
      | Address_PostCode | 3333 |
    
    Then I select "Direct Post" from "ContactPerson_CommunicationMethodId"
    Then I click on button "LiquidationStartDate2"
    Then I click on "20170531"
    Then I click on button "NextBT"
    Then I click on button "CorrectInfoDeclared"
    Then I click on button "SummarySubmitBT"
    Then I wait for "5000" millisecond
    Then I check I am on "Liquidation Advice Confirmation" page
        And I want to login to portal "<PortalName2>"
    And I click on "Paste HTML Markup"
    And I click on button "checkpaste"
    And I paste "html"
    And I click on button "validate_paste"
    And I capture "AC_num_of_errors"
    Then I write "Liquidation Advice Confirmation" information to file
	Examples: 
      | PortalName | PortalName2 |  UserName | Password   | BusinessName |
      | TSS        | AC CHECKER  |  jbradley | Dbresults1 |  For Bearly Nothing |
      
  
  
  


	##################################################################################################################################################
	############################################################# OTHER FORMS #######################################################################
	##################################################################################################################################################
	
   
  @current
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
      | s2id_autogen1_search | For Bearly |
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
      | s2id_autogen1_search | For Bearly |
    Then I click on button "select2-results-1"
    Then I wait for "2000" millisecond
    Then I click on button with value "Update Group"
    Then I wait for "2000" millisecond
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
      | s2id_autogen1_search | For Bearly |
    Then I click on button "select2-results-1"
    Then I wait for "2000" millisecond
    Then I click on button with value "Update Group"
    Then I wait for "2000" millisecond
    Then I select "2018" from "YearCombo"
    Then I click on button "MonthCombo"
    Then I click on "Jan"
    Then I click on button with value "Next"
    Then I wait for "5000" millisecond
    Then I click on button "CorrectDeclaration"
    Then I click on button with value "Submit"
    Then I wait for "5000" millisecond
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