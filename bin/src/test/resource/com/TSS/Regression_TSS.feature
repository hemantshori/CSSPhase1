
@TSSRegression
Feature: Regression for TSS.


    
	###########################################################################################################
  #################################### PHASE 1 ITERATION 1 ################################################
  ###########################################################################################################
  

  Scenario Outline: DTSP-54 : As a DB Portal Administrator I want to search for a message so that I can quickly access the message I want to view
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Given I want to login to portal "<PortalName2>"
    And I hit Enter
    Given I want to login to portal "MessageEdit"
    Then I see text "Feedback Message Text" displayed
    Then I see text "Feedback Msg Code" displayed
    Then I see text "Description" displayed
    And I enter the details as
      | Fields      | Value         |
      | SearchInput | <SearchValue> |
    Then I click on button with value "Search"
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName            |
      | item2 | <SearchValue>       |
      | item3 | <SearchDescription> |
    And I enter the details as
      | Fields      | Value          |
      | SearchInput | <SearchValue2> |
    Then I click on button with value "Search"
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName             |
      | item2 | <SearchValue2>       |
      | item3 | <SearchDescription2> |
    And I enter the details as
      | Fields      | Value   |
      | SearchInput | Invalid |
    Then I click on button with value "Search"
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                |
      | item2 | Invalid Business Entity |
      | item3 | Invalid ACN             |
      | item4 | Invalid Email           |
      | item5 | Invalid Group ACT Wages |
      | item6 | Invalid Form            |

    Examples: 
      | PortalName | PortalName2 | SearchValue   | SearchDescription       | SearchValue2 | SearchDescription2                         | UserName | Password   |
      | TSS        | TSSUAP      | Invalid Email | Incorrect Email Format. | Success      | Your changes have been successfully saved. | jbradley | Dbresults1 |
  #alt username: hemant.shori
  #alt password: USBcoffee1
  @tss
    	Scenario Outline: DTSP-55 : As a DB Portal Administrator I want to edit a message's description so that I can customise the description for an organisation
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Given I want to login to portal "MessageEdit"
    Then I click on "Edit"
    #Scenario 1: Administrator accesses the edit function 
    Then "<Item>" is displayed as "<ItemName>"
      | Item   | ItemName          |
      | text1  | Feedback Msg Code |
      | text2  | Description       |
    Then I check "SaveButton" exists
    Then I check "CancelButton" exists
    Then I click on "Cancel"
    #Scenario 2: Administrator cancels edit function with no unsaved changes 
  	Then I check I am on "Feedback Msg Texts" page

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password  | DropDownName    | DropDownOption      |
      | TSS        | UserNameInput | PasswordInput | jbradley      | Dbresults1 | FeedbackMsgText | Username Exists |

  Scenario Outline: DTSP-56 :As a DB Portal Administrator I want to add a new message so that required messages are displayed in the portal
    								#DTSP-57 :As a DB Portal Administrator I want to delete a message so that I can remove messages no longer required

    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Given I want to login to portal "MessageEdit"
    Then I click on button with value "Add New"
    #Scenario 1: Administrator accesses the edit function 
    Then "<Item>" is displayed as "<ItemName>"
      | Item   | ItemName          |
      | text1  | Feedback Msg Code |
      | text2  | Description       |
    Then I check "SaveButton" exists
    Then I check "CancelButton" exists
    Then I click on "Cancel"
    #Scenario 2: Administrator cancels edit function with no unsaved changes 
  	Then I check I am on "Feedback Msg Texts" page

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password  | DropDownName    | DropDownOption      |
      | TSS        | UserNameInput | PasswordInput | jbradley      | Dbresults1 | FeedbackMsgText | Username Exists |

Scenario Outline: DTSP-57 :As a DB Portal Administrator I want to delete a message so that I can remove messages no longer required

    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Given I want to login to portal "MessageEdit"
    #Scenario 1: Administrator deletes an existing message 
    
    Then I click on button "DeleteLink"
    #Scenario 3: Administrator does not confirm cancellation 
    Then I see "Are you sure you want to delete?" displayed on popup and I click "Cancel"
    Then I check I am on "Feedback Msg Texts" page
    
		#Do Scenario 2 when you've figured out how to 'store variables' in Cucumber


    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password  | DropDownName    | DropDownOption      |
      | TSS        | UserNameInput | PasswordInput | jbradley      | Dbresults1 | FeedbackMsgText | Username Exists |
	
  @WORK_ON_LATER
  Scenario Outline: DTSP-233: As a DB Portal Administrator, I want to be able to search/add/edit/remove the tool tips displayed on forms so that I can help the end user better understand the form field/s
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Given I want to login to portal "PageTexts"
    #Then "<Item>" is displayed as "<ItemName>"
      #| Item  | ItemName  |
      #| item2 | Text Code |
      #| item4 | Is Active |
    #Then I see text "Description" displayed
    # check for search
    #And I enter the details as
      #| Fields      | Value    |
      #| SearchInput | Password |
    #Then I click on "Serch"
    #Then "<Item>" is displayed as "<ItemName>"
      #| Item  | ItemName                  |
      #| item2 | PasswordValidation        |
      #| item2 | ResetPasswordExpiredLine2 |
      #| item2 | ResetPasswordInvalidLine1 |
      #| item2 | ForgotPasswordEmailLine3  |
      #| item2 | ResetPasswordLine2        |
      #| item2 | ResetPasswordInvalidLine2 |
      #| item2 | ResetPasswordExpiredLine1 |
      #| item2 | ForgotPasswordEmailLine2  |
      #| item2 | ResetPasswordLine1        |
      #| item2 | ForgotPasswordEmailLine1  |
    #And I enter the details as
      #| Fields      | Value |
      #| SearchInput |       |
    #
    #Then I click on "Serch"
    #Then I click on "Edit"
    # check for editing
    #
    #Then "<Item>" is displayed as "<ItemName>"
      #| Item  | ItemName    |
      #| item2 | Text Code   |
      #| item3 | Description |
      #| item4 | Is Visible  |
    #Then I click on "Cancel"
    #
    #edit a dummy description
    #Then I click on "Edit"
    #Then I click on "PageText_TextCode"
    #Then I click on "RegistrationConfirmationLine1"
    #And I enter the details as
      #| Fields               | Value |
      #| PageText_Description | TEST  |
    #Then I click on "Save"
    #
    #set the description back to normal
    #Then I click on "Edit"
    #Then I click on "PageText_TextCode"
    #Then I click on "RegistrationConfirmationLine1"
    #And I enter the details as
      #| Fields               | Value                         |
      #| PageText_Description | RegistrationConfirmationLine1 |
    #Then I click on "Save"
    #
    # add a new message
    #Then I click on "AddNew"
    #Then "<Item>" is displayed as "<ItemName>"
      #| Item  | ItemName    |
      #| item2 | Text Code   |
      #| item3 | Description |
      #| item4 | Is Visible  |
    #Then I click on "Cancel"
    #Then I click on "AddNew"
    #Then I click on "PageText_TextCode"
    #Then I click on "RegistrationConfirmationLine1"
    #And I enter the details as
      #| Fields               | Value                         |
      #| PageText_Description | RegistrationConfirmationLine1 |
    #Then I click on "Save"
    #
    # now delete it
    #Then I click on "Delete"
    #Given I want to login to portal "PageTexts"

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password  |
      | TSS        | UserNameInput | PasswordInput | jbradley      | Dbresults1|
      

  @BEST_DONE_MANUALLY
  Scenario Outline: DTSP-240 : As an end user, I want to be able to download the Tax Lodgement or Registration forms in PDF format, so that I can keep a record of my lodgements
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    #And I check I am on "HomePage" page
    #And I click on "Payroll Tax"
    #And I click on "Cancel"
    #Then I click on "Payroll Tax"
    #And I select "<DropDownValue1>" from "<DropDownField>"
    #Then I click on "Answer_TypeAnnual"
    #And I select "<DropDownValue2>" from "<DropDownField2>"
    #And I click on "Next"
    #And I click on "ACTWagesPaidNext"
    #And I click on "MonthlyReturnNext"
    #Then I wait for "3500" millisecond
    #And I enter the details as
      #| Fields          | Value          |
      #| PersonFullName  | TEST           |
      #| LegalEntityName | TEST           |
      #| PhoneNumber     | 6143 585 74 90 |
      #| EmailAddress    | TEST@TEST      |
    #And I click on "DeclarationConfirm"
    #And I click on "ConfirmForSubmission"
    #And I click on "Submit"
    #Then I check I am on "Lodgement Summary" page
    #Then I click on "SummarySubmit"
    #Then I check I am on "Submission Confirmation" page
    #And I click on "Download"

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password  | ButtonName1 | DropDownValue1 | DropDownField | DropDownValue2 | DropDownField2 | Message                                    |
      | TSS        | UserNameInput | PasswordInput | jbradley      | Dbresults1| TypeMonthly |           2012 | YearOfReturn  | September      | MonthOfReturn  | Your changes have been successfully saved. |			

  @tss
  Scenario Outline: DTSP-358: As an end user, I want to be able to submit my Annual Payroll Tax Return Form
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    And I check I am on "Home" page
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName   |
      | item9 | Lodgements |
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
      | Fields               | Value  |
      | s2id_autogen1_search | <Organisation> |
    Then I click on button "select2-results-1"
    Then I click on button "LodgePayrollAnswer_TypeMonthly"
    Then I select "2017" from "MonthlyObligationSelect"
    Then I click on "NextSection"
    Then I wait for "2000" millisecond
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
    Then I check I am on "Payroll Tax Lodgement Summary" page
    #Check for Taxpayer Details
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                         |
      | item9 | Organisation Name                |
      | item9 | Australian Business Number (ABN) |
      | item9 | Client Reference Number (CRN)    |
    #Check for Return Type
    Then "<Item>" is displayed as "<ItemName>"
      | Item | ItemName                      |
      | item | Return Type                   |
      | item | Monthly Payroll Tax Return |
      | item | Return Period                          |
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
      | PortalName | UserName | Password   | FirstName | LastName | Position   | Organisation         | ContactPhone | EmailAddress         |
      | TSS        | jbradley | Dbresults1 | J         | Bradley  | Consultant | COFFEE CORP PTY LTD | 04 5678 9767 | jbradley@hotmail.com |
      | TSS        | jbradley | Dbresults1 | J         | Bradley  | Consultant | GOOD FOR SOMETHING PROPRIETARY LIMITED | 04 5678 9767 | jbradley@hotmail.com |
  
    
	###########################################################################################################
  #################################### PHASE 1 ITERATION 2 ################################################
  ###########################################################################################################
  
  # Before running this script, go to https://test-ssc.dbresults.com.au/TSSAccountMgmt/DataExtensions.aspx
  # Find jbradley's account and make sure he has an CRN, an ABN and his employer status is set to 'Designated group employer for a group and lodging for itself'
  # As of 12 pm 9/1/2017 these settings have already been implemented, but double-checking them is advised.
  
  Scenario Outline: DTSP-356 Error handling for Annual Payroll Tax Reconciliation when fields returned from back end system are known error field mapping
  
  #Scenario 1 no longer applies as periods that have already been lodged will disappear from the selection
    #scenario 1: Same year check
   Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    And I check I am on "Home" page
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName   |
      | item9 | Lodgements |
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
      | Fields               | Value  |
      | s2id_autogen1_search | Designate |
    Then I click on button "select2-results-1"
    Then I click on button "LodgePayrollAnswer_TypeAnnual"
    Then I select "01 Jul 2012 - 30 Jun 2013" from "AnnualObligationSelect"
    Then I click on "NextSection"
    Then I click on button "ClaimingACTProportion_Yes"
    #Scenario 2: Aus wide wages is not greater than ACT Taxable wages 
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
      | LodgePayrollAnswer_AustralianWide							 | 99 			|
      | LodgePayrollAnswer_DaysPaidTaxable						 | 1    |
      | LodgePayrollAnswer_GroupActWages							 | 100       |
    Then I click on button "Submit"
    
    
    #TODO LATER:
    #Scenario 3: Group ACT wages is not greater than ACT Taxable wages 
    Then I see text "Group ACT wages must be equal to or greater than ACT taxable wages" displayed
    #Scenario 4: Aus wide wages is not greater than Group ACT wages 
    
    Then I see text "Australia-wide Group Wages incl. ACT should be greater than or equal to the Group ACT Wages." shown
    

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password  | CRN         | ABN         |
      | TSS        | UserNameInput | PasswordInput | jbradley      | Dbresults1| 12345678901 | 12345678901 |

  #NOTE: Ensure that jbradley has a current employee type selected in the data extensions page
 @tss_review
  Scenario Outline: DTSP-311: Validation Rules and Errors to be used across Annual Reconciliation Form
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    And I check I am on "Home" page
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName   |
      | item9 | Lodgements |
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
      | Fields               | Value |
      | s2id_autogen1_search | DESIGNATE |
    Then I click on button "select2-results-1"
    Then I click on button "LodgePayrollAnswer_TypeAnnual"
    Then I select "2015" from "AnnualObligationSelect"
    Then I click on "NextSection"
    Then I click on button "ClaimingACTProportion_Yes"
    #scenario 1: Restricted fields contain incorrect text type
    Then I enter the details as
      | Fields                                         | Value |
      | SalariesAndWages                               | ABC   |
      | BonusesAndCommissions                          | ABC   |
      | LodgePayrollAnswer_Commissions                 | ABC   |
      | LodgePayrollAnswer_Allowances                  | ABC   |
      | LodgePayrollAnswer_DirectorsFees               | ABC   |
      | LodgePayrollAnswer_EligibleTerminationPayments | ABC   |
      | LodgePayrollAnswer_ValueOfBenefits             | ABC   |
      | LodgePayrollAnswer_ShareValue                  | ABC   |
      | LodgePayrollAnswer_ServiceContracts            | ABC   |
      | LodgePayrollAnswer_Superannuation              | ABC   |
      | LodgePayrollAnswer_OtherTaxablePayment         | ABC   |
      | LodgePayrollAnswer_ExemptWages                 | ABC   |
      | LodgePayrollAnswer_AustralianWide              | ABC   |
      | LodgePayrollAnswer_DaysPaidTaxable             | ABC   |
     # | LodgePayrollAnswer_GroupActWages| ABC   |
    Then I check "SalariesAndWages" is empty
    Then I check "BonusesAndCommissions" is empty
    Then I check "LodgePayrollAnswer_Commissions" is empty
    Then I check "LodgePayrollAnswer_Allowances" is empty
    Then I check "LodgePayrollAnswer_DirectorsFees" is empty
    Then I check "LodgePayrollAnswer_EligibleTerminationPayments" is empty
    Then I check "LodgePayrollAnswer_ValueOfBenefits" is empty
    Then I check "LodgePayrollAnswer_ShareValue" is empty
    Then I check "LodgePayrollAnswer_ServiceContracts" is empty
    Then I check "LodgePayrollAnswer_Superannuation" is empty
    Then I check "LodgePayrollAnswer_OtherTaxablePayment" is empty
    Then I check "LodgePayrollAnswer_ExemptWages" is empty
    Then I check "LodgePayrollAnswer_AustralianWide" is empty
    Then I check "LodgePayrollAnswer_DaysPaidTaxable" is empty
    #Then I check "LodgePayrollAnswer_GroupActWages" is empty
    #scenario 5: Mandatory fields not filled in
    Then I check "Submit" is readonly
    #scenario 2:  Restricted fields contain correct text type
    Then I enter the details as
      | Fields                                         | Value   |
      | SalariesAndWages                               |  100000 |
      | BonusesAndCommissions                          |  100000 |
      | LodgePayrollAnswer_Commissions                 |  100000 |
      | LodgePayrollAnswer_Allowances                  |  100000 |
      | LodgePayrollAnswer_DirectorsFees               |  100000 |
      | LodgePayrollAnswer_EligibleTerminationPayments |  100000 |
      | LodgePayrollAnswer_ValueOfBenefits             |  100000 |
      | LodgePayrollAnswer_ShareValue                  |  100000 |
      | LodgePayrollAnswer_ServiceContracts            |  100000 |
      | LodgePayrollAnswer_Superannuation              |  100000 |
      | LodgePayrollAnswer_OtherTaxablePayment         |  100000 |
      | LodgePayrollAnswer_ExemptWages                 |  100000 |
      | LodgePayrollAnswer_AustralianWide              | 1500000 |
      | LodgePayrollAnswer_DaysPaidTaxable             |     999 |
      #| LodgePayrollAnswer_GroupActWages| 1500000 |
    Then I check "SalariesAndWages" contains "$ 100,000"
    Then I check "BonusesAndCommissions" contains "$ 100,000"
    Then I check "LodgePayrollAnswer_Commissions" contains "$ 100,000"
    Then I check "LodgePayrollAnswer_Allowances" contains "$ 100,000"
    Then I check "LodgePayrollAnswer_DirectorsFees" contains "$ 100,000"
    Then I check "LodgePayrollAnswer_EligibleTerminationPayments" contains "$ 100,000"
    Then I check "LodgePayrollAnswer_ValueOfBenefits" contains "$ 100,000"
    Then I check "LodgePayrollAnswer_ShareValue" contains "$ 100,000"
    Then I check "LodgePayrollAnswer_ServiceContracts" contains "$ 100,000"
    Then I check "LodgePayrollAnswer_Superannuation" contains "$ 100,000"
    Then I check "LodgePayrollAnswer_OtherTaxablePayment" contains "$ 100,000"
    Then I check "LodgePayrollAnswer_ExemptWages" contains "$ 100,000"
    Then I check "LodgePayrollAnswer_AustralianWide" contains "$ 1,500,000"
    Then I check "LodgePayrollAnswer_DaysPaidTaxable" contains "999"
    #Then I check "LodgePayrollAnswer_GroupActWages" contains "$ 1,500,000"
    #Scenario 7: Number of days is invalid
    Then I click on button "SubmitBT"
    Then I see text "Days where 1 group member paid or was liable to pay taxable or interstate should be less than or equal to the number of days in that particular filing period." displayed
    #Scenario 6: Mandatory fields all filled in
    Then I enter the details as
      | Fields                             | Value |
      | LodgePayrollAnswer_DaysPaidTaxable |     1 |
    Then I click on button "Submit"
    Then I wait for "2000" millisecond
    Then I check I am on "Payroll Tax Lodgement Summary" page

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password   | CRN         | ABN         |
      | TSS        | UserNameInput | PasswordInput | jbradley | Dbresults1 | 98765123456 | 12345678902 |


      Scenario Outline: DTSP-401: As an end user, I should not be able to view/select the 'Return Type' section on the Payroll Tax Lodgement forms when I am on subsequent sections after clicking 'Next'
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
   And I click on "Lodgements"
    And I click on "Payroll Tax"
    And I check I am on "Payroll Lodgement Form" page
    Then I click on button with value "Discard"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value |
      | s2id_autogen1_search | <BusinessName> |
    Then I click on button "select2-results-1"
    Then I click on button "LodgePayrollAnswer_TypeAnnual"
    Then I select "2015" from "AnnualObligationSelect"
    Then I click on "NextSection"
    Then I click on button with value "Back"
    Then I check "AnnualObligationSelect" is readonly

    Examples: 
      | PortalName | UserName | Password   | BusinessName |
      | TSS        | jbradley   | Dbresults1 | For Bearly Nothing |

  
	###########################################################################################################
  #################################### PHASE 1 ITERATION 3 ################################################
  ###########################################################################################################

@done
  Scenario Outline: DTSP-25: As an organisation I want a user's details verified during registration so that only valid users register with the portal (page 1)
    #
    #scenario 1: Same year check
    Given I want to login to portal "<PortalName>"
    And I click on "Create Account"
    Then I click on button "RegistrationAsBusiness"
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                        |
      | item3 | Australian Business Number (ABN)                             |
      | item4 | Client Reference Number (CRN)                             |
      | item7 | By creating an account, I agree |
    #Scenario 4
    Then I click on "Sign In"
    Then I check I am on "Login" page
    #Scenario p
    Then I click on "Create Account"
    Then I click on "Terms & Conditions"
    Then a new page "http://dbresults.com.au/terms/" is launched
    Then I check I am on "Terms of Use | DB Results - Digital Business specialists" page
    Then I see text "Terms of Use" displayed
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
      | Fields         | Value       |
      | InputABNNumber | 12054547368 |
      | InputCRNNumber | 400043 |
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
    Then I click on button "RegistrationAsBusiness"
    Then I enter the details as
      | Fields         | Value       |
      | InputABNNumber | 12054547368 |
      | InputCRNNumber | 400043 |
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
    Then I see text "Incorrect Email Format." shown
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
      | PortalName | UserNameField | PasswordField | UserName | Password   | CRN         | ABN         |
      | TSS        | UserNameInput | PasswordInput | jbradley   | Dbresults1 | 12345678901 | 12345678901 |

 @done
  Scenario Outline: DTSP-318: As a Customer Portal Administrator (CPA), I want to be able to search for taxpayer tips on Manage Tips page so that I can find the tips I need
    Given I want to login to portal "TSS_Tooltips"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Given I want to login to portal "TSS_Tooltips"
    # Scenario 1: CPA access the 'Manage Tips' page
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName             |
      | item2 | Page                 |
      | item3 | Section              |
      | item5 | Tooltips Description |
      | item5 | Identifier           |
      | item5 | Status               |
    And I enter the details as
      | Fields      | Value      |
      | SearchInput | PayrollTax |
    Then I click on button "SearchBT"
    #Scenario 2: CPA searches for the taxpayer tips on the 'Manage Tips' page
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                               |
      | item2 | PayrollTax_DeclarationConfirm          |
      | item3 | PayrollTax_ClaimingACT                 |
      | item5 | PayrollTax_CRN                         |
      | item5 | PayrollTax_EligibleTerminationPayments |
      | item5 | PayrollTax_ClientNumber                |
    Then I click on button "ResetBT"
    #Scenario 3: CPA filters tips on the 'Manage Tips' page
    Then I click on button "FilterByDescription"
    And I enter the details as
      | Fields                                  | Value |
      | SearchInput | Wages |
    Then I hit Enter
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                                           |
      | item2 | PayrollTax_TaxableWages_DaysPaidTaxableOrInterstat |
      | item3 | PayrollTax_ExemptWages                             |
      | item5 | PayrollTax_TaxableWages                            |
      | item5 | PayrollTax_TaxableWages_ACTWagesPaidorPayable      |
      | item5 | ACT Wages Paid or Payable                          |
    #Scenario 4: More than 10 search results
    Given I want to login to portal "TSS_Tooltips"
    And I enter the details as
      | Fields      | Value      |
      | SearchInput | PayrollTax |
    Then I click on button "SearchBT"
    Then I see "Counter" displayed
    And I enter the details as
      | Fields      | Value   |
      | SearchInput | Account |
    Then I see "Counter" displayed

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password   | CRN         | ABN         |
      | TSS        | UserNameInput | PasswordInput | jbradley | Dbresults1 | 12121212121 | 21212121212 |

    @testagain
  Scenario Outline: DTSP-145
    Given I want to login to portal "<PortalName>"
    Then I check "UserNameEmailLabel" has CSS property "content" with value ""*""
    Then I check "PasswordLabel" has CSS property "content" with value ""*""
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Given I want to login to portal "AccountManagement"
    Then I check I am on "View User Profile" page
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName      |
      | item2 | Username      |
      | item3 | First Name    |
      | item5 | Last Name     |
      | item5 | Email Address |
      | item5 | Phone Number  |
      | item5 | Position     |
      | item5 | Password      |
      | item5 | Hint          |
		Then I check "Title_wtView_Profile" exists
		Then I check "Title_wtView_Contact" exists
		Then I check "Title_wtView_Security" exists
    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password   | CRN         | ABN         |
      | TSS        | UserNameInput | PasswordInput | jbradley | Dbresults1 | 12121212121 | 21212121212 |


  @done
  Scenario Outline: DTSP-147
    Given I want to login to portal "<PortalName>"
    Then I check "UserNameEmailLabel" has CSS property "content" with value ""*""
    Then I check "PasswordLabel" has CSS property "content" with value ""*""
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Given I want to login to portal "AccountManagement"
    Then I click on button "EditBT"
    #Scenario 1: User accesses the edit function
     Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName      |
      | item2 | Username      |
      | item3 | First Name    |
      | item5 | Last Name     |
      | item5 | Email Address |
      | item5 | Phone Number  |
      | item5 | Position     |
      | item5 | Password      |
      | item5 | Hint          |
      #| item5 | Profile          |
      #| item5 | Contact Details          |
      #| item5 | Security          |
#		Then I check "Title_wtView_Profile" exists
#		Then I check "Title_wtView_Contact" exists
#		Then I check "Title_wtView_Security" exists
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
    Then I see text "Incorrect Email Format." displayed
    Then I see text "Invalid Phone Number. Phone Number should be 10 digits. Please try again." displayed
    Then I see text "New Password and Confirm Password do not match. Please try again." displayed
    Then I see text "New Password is invalid. Please try again." displayed
    #Scenario 8: User cancels edit function with unsaved changes
    Then I click on button "Cancel"
    Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "Cancel"
    Then I click on button "Cancel"
    Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "OK"
    Then I check I am on "View User Profile" page
    Given I want to login to portal "AccountManagement"
    #Then I click on button "Cancel"
    Then I check I am on "View User Profile" page
    #Scenario 5: Profile settings details pass all validations
    Then I click on button "EditBT"
    Then I enter the details as
      | Fields                   | Value             |
      | Input_FirstName          | J              |
      | Input_LastName           | Bradley              |
      | Input_PhoneNumber        | 0456789767 |
      | Input_Email              | jbradley@hotmail.com |
      | Input_NewPassword        | Dbresults1        |
      | Input_NewpasswordConfirm | Dbresults1        |
      | Input_Hint               | DB RESULTS ONE    |
    #Scenario 9: User update's Tax Agent Details (Tax Agent registered and activated on the Portal)
    Then I click on button "Input_FirstName"
    Then I click on button "Submit"
    Then I see text "Your changes have been successfully saved." displayed
    Then I check I am on "View User Profile" page

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password   | CRN         | ABN         |
      | TSS        | UserNameInput | PasswordInput | jbradley | Dbresults1 | 12121212121 | 21212121212 |

@done
  Scenario Outline: DTSP-460: s an organisation I want user inputs to be restricted & validated during Tax Agent's portal registration so that human error can be minimised
    Given I want to login to portal "<PortalName>"
    Then I click on "Create Account"
    Then I check I am on "Registration" page
    Then I see checkbox "RegistrationAsBusiness" as not selected
    Then I see checkbox "RegistrationAsTaxAgent" as not selected
    Then I click on "Register as a Tax Agent"
    #Scenario 1: User tries to enter incorrect input type into a restricted fields (e.g. entering ABC into a number field)
    Then I enter the details as
      | Fields                   | Value |
      | InputTaxAgentRegId       | TEST  |
      | InputTaxAgentABN         | TEST  |
      | BusinessAddress_Postcode | TEST  |
    Then I check "InputTaxAgentRegId" is empty
    Then I check "InputTaxAgentABN" is empty
    Then I check "BusinessAddress_Postcode" is empty
    #Scenario 2: Tax Agent Registration details do not pass the frontend validation
    Then I enter the details as
      | Fields                    | Value            |
      | InputTaxAgentABN          | 97110187768 |
      | InputTaxAgentBusinessName | DB RESULTS PTY LTD |
      | BusinessAddress_Address1  | TEST             |
      | BusinessAddress_Suburb    | TEST             |
      | BusinessAddress_Postcode  |             3333 |
    Then I click on button "BusinessAddress_StateId"
    Then I click on "Victoria"
    Then I click on button "TermsandConditionsCheckBox2"
    Then I click on button "RegistrationSubmit"
    Then I wait for "1000" millisecond
    Then I see text "Your ABN is not valid. Please enter a valid ABN." displayed

    Examples: 
      | PortalName | UserName | Password   |
      | TSS        | jscott   | Dbresults1 |


  @done
  Scenario Outline: DTSP-440 and DTSP-441: As an organisation I want to know the type of user who is registering so that the relevant verification information can be presented.
    #ONHOLD until the tax agent registration bug can be fixed
    Given I want to login to portal "<PortalName>"
    Then I click on "Create Account"
    Then I check I am on "Registration" page
    #DTSP-440: Scenario 1 and 2
    Then I see checkbox "RegistrationAsBusiness" as not selected
    Then I see checkbox "RegistrationAsTaxAgent" as not selected
    #DTSP-441, Scenario 1:
    Then I click on "Register as a Tax Agent"
    Then I wait for "1000" millisecond
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                               |
      | item2 | Tax Agent's Registration ID                      |
      | item5 | Registered Business Name                  |
      | item5 |Registered Business Address                       |
      | item5 | Country                                |
      | item5 | Address                      |
      | item5 | Suburb / City                          |
      | item5 | Territory / State                      |
      | item5 | Postcode                               |
      | item5 | By creating an account, I agree to the |
    #DTSP-441, Scenario 3:
    Then I check "RegistrationSubmit" is readonly
    #DTSP-441, Scenario 4: User clicks on the ‘Sign In’ link
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
| InputTaxAgentABN          | 97110187767 |
      | InputTaxAgentBusinessName | DB RESULTS PTY LTD |
      | BusinessAddress_Address1  | TEST             |
      | BusinessAddress_Suburb    | TEST             |
      | BusinessAddress_Postcode  |             3333 |
    Then I click on button "BusinessAddress_StateId"
    Then I click on "Victoria"
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


 @done
  Scenario Outline: DTSP-459
    Given I want to login to portal "<PortalName>"
    Then I click on "Create Account"
    Then I check I am on "Registration" page
     Then I click on "Register as a Business"
    #Scenario 1: User accesses the 'Registration Verification' page
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                               |
      | item2 | Australian Business Number (ABN)       |
      | item3 | Client Reference Number (CRN)          |
      | item5 | By creating an account, I agree to the |
    #Scenario 7: User clicks on the ‘Sign In’ link
    Then I click on "Sign In"
    Then I check I am on "Login" page
    #Scenario 8: User views Terms and Conditions
    Then I click on "Create Account"
    Then I click on "Terms & Conditions"
    Then a new page "http://dbresults.com.au/terms/" is launched
    Given I want to login to portal "<PortalName>"
    Then I click on "Create Account"
    #Scenario 3: User has not entered all the mandatory fields
    Then I check "RegistrationSubmit" is readonly
    Then I click on "Register as a Business"
    Then I wait for "1000" millisecond
    #Scenario 2: User tries to enter incorrect input type into a restricted fields (e.g. entering ABC into a Number field)
    Then I enter the details as
      | Fields                  | Value |
      | InputABNNumber_Business | TEST  |
      | InputCRNNumber_Business | TEST  |
    Then I check "InputABNNumber_Business" is empty
    Then I check "InputCRNNumber_Business" is empty
    #Scenario 4: Registration details do not pass the frontend validation
    Then I enter the details as
      | Fields                  | Value |
      | InputABNNumber_Business |     3 |
      | InputCRNNumber_Business |     3 |
    Then I click on button "TermsandConditionsCheckBox"
    Then I click on button "RegistrationSubmit"
    Then I see text "Invalid ABN. ABN Should be 11 Digits. Please try again." displayed
    Then I see text "Invalid CRN. CRN Should be 6 digits. Please try again." displayed
    #Scenario 6: Registration details failed the verification with stubs
    Then I enter the details as
      | Fields                  | Value       |
      | InputABNNumber_Business | 33333333333 |
      | InputCRNNumber_Business |      333333 |
    Then I click on button "RegistrationSubmit"
    Then I wait for "1000" millisecond
    Then I see text "The combination of the provided information does not refer to a registered in PSRM Entity" displayed
    #Scenario 5: Registration details verified with stubs
    Then I enter the details as
      | Fields         | Value       |
      | InputABNNumber | 12054547368 |
      | InputCRNNumber | 400043 |
    Then I click on button "RegistrationSubmit"
    Then I check I am on "Complete Registration" page

    Examples: 
      | PortalName | UserName | Password   |
      | TSS        | jscott   | Dbresults1 |

  

  #NOTE: Ensure that jbradley has a current employee type selected in the data extensions page
@done
  Scenario Outline: DTSP-461: Update the Capture User Details page
    Given I want to login to portal "<PortalName>"
    Then I click on "Create Account"
    Then I check I am on "Registration" page
    #Scenario 1: User accesses the 'Capture User Details' page
     Then I click on "Register as a Business"
    Then I enter the details as
      | Fields         | Value       |
      | InputABNNumber | <ABN> |
      | InputCRNNumber | <CRN> |
    Then I click on button "TermsandConditionsCheckBox2"
    Then I click on button "RegistrationSubmit"
    Then I check I am on "Complete Registration" page
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName           |
      | item2 | Choose Username           |
      | item3 | First Name         |
      | item5 | Last Name          |
      | item5 | Email Address      |
      | item5 | Phone Number       |
      | item5 | Choose Password     |
      | item5 | Confirm Password   |
      | item5 | Hint               |
    #Scenario 2: User tries to enter incorrect input type into a restricted fields (e.g. entering ABC into a Number field)
    Then I enter the details as
      | Fields      | Value |
      | PhoneNumber | TEST  |
    Then I check "Registration_PhoneNumber" is empty
    #Scenario 5: Details entered do not pass validation
    Then I check "Submit" is readonly
    Then I enter the details as
      | Fields          | Value                 |
      | FirstName       | TEST                  |
      | LastName        | TEST                  |
      | PhoneNumber     |                 33333 |
      | Email           | TEST                  |
      | Username        | TEST                  |
      | NewPassword     | adsfasdfaf            |
      | ConfirmPassword | asfsadfsadf           |
      | Hint            | testsetsetwetstsetset |
    Then I wait for "1000" millisecond
    Then I click on button "irstName"
    Then I click on button "Submit"
    Then I see text "Incorrect Email Format." displayed
    #Then I see text "This is an invalid phone number" displayed
    Then I see text "Invalid password. Please try again" displayed
    Then I see text "Passwords do not match. Please try again." displayed
    #Scenario 7: User cancels with unsaved changes
    Then I click on button "Cancel"
    Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "Cancel"
    Then I click on button "Cancel"
    Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "OK"
    Then I click on "Create Account"
    Then I check I am on "Registration" page
    #Scenario 1: User accesses the 'Capture User Details' page
     Then I click on "Register as a Business"
    Then I enter the details as
      | Fields         | Value       |
      | InputABNNumber | <ABN> |
      | InputCRNNumber | <CRN> |
    Then I click on button "TermsandConditionsCheckBox2"
    Then I click on button "RegistrationSubmit"
    #Scenario 6: User cancels registration with no unsaved changes
    Then I click on button "Cancel"
    Then I click on "Create Account"
    Then I check I am on "Registration" page
     Then I click on "Register as a Business"
   Then I enter the details as
      | Fields         | Value       |
      | InputABNNumber | <ABN> |
      | InputCRNNumber | <CRN> |
    Then I click on button "TermsandConditionsCheckBox2"
    Then I click on button "RegistrationSubmit"
    Then I enter the details as
      | Fields          | Value                 |
      | FirstName       | TEST                  |
      | LastName        | TEST                  |
      | PhoneNumber     |             333333333 |
      | Email           | TEST@TEST             |
      | Username        | TEST                  |
      | NewPassword     | Dbresults1            |
      | ConfirmPassword | Dbresults1            |
      | Hint            | testsetsetwetstsetset |
    Then I check "Submit" is not readonly

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password   | ABN | CRN |
      | TSS        | UserNameInput | PasswordInput | jbradley | Dbresults1 | 12054547368 | 400043 |

  @done
  Scenario Outline: DTSP-463: Display all the mandatory fields with an Asterisk (*)
    #On hold until a clear standard for the mandatory field asterisks can be made
    #PART 1: Login Screen
    Given I want to login to portal "<PortalName>"
    Then I check "UserNameEmailLabel" has CSS property "content" with value ""*""
    Then I check "PasswordLabel" has CSS property "content" with value ""*""
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    And I click on "Lodgements"
    And I click on "Payroll Tax"
    Then I click on button "Discard"
    #Part 2: Payroll Tax (Annual)
     Then I click on button "select2-chosen-1"
  	 Then I enter the details as
      | Fields               | Value                |
      | s2id_autogen1_search | DESIGNATE |
   Then I click on button "select2-results-1"
    Then I click on "Annual Reconciliation"
    
    Then I select "2014" from "AnnualObligationSelect"
		Then I click on button "NextSection"
		Then I click on button "LodgePayrollAnswer_ClaimingACTProportion_Yes"
#		Then I check "" has CSS property "content" with value ""*""
#		Then I check "" has CSS property "content" with value ""*""
#		Then I check "" has CSS property "content" with value ""*""
#		Then I check "" has CSS property "content" with value ""*""
#		Then I check "" has CSS property "content" with value ""*""
#		Then I check "" has CSS property "content" with value ""*""
#		Then I check "" has CSS property "content" with value ""*""
#		Then I check "" has CSS property "content" with value ""*""
#		Then I check "" has CSS property "content" with value ""*""
#		Then I check "" has CSS property "content" with value ""*""
#		Then I check "" has CSS property "content" with value ""*""
#		
#		
    #Then I check "YearOfReturnLabel" has CSS property "content" with value ""*""
    #Then I check "MonthOfReturnLabel" has CSS property "content" with value ""*""
    #Then I check "CurrentEmployerStatusLabel" has CSS property "content" with value ""*""
    #Then I click on "Designated group employer for a group and lodging for itself"
    #Then I click on button "TaxPayerDetailsNext"
    Then I check "ClaimingACTProportion_Label" has CSS property "content" with value ""*""
    Then I click on button "ClaimingACTProportion_Yes"
    Then I check "AusWideWages" has CSS property "content" with value ""*""
    Then I check "GroupActWages" has CSS property "content" with value ""*""
    Then I click on "Sign Out"
        Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "OK"
    
    
    #PART 3: Create Account (TODO Once labels have IDs)
    Given I want to login to portal "<PortalName>"
    Then I click on "Create Account"
    Then I click on button "RegistrationAsBusiness"
    Then I click on button "TermsandConditionsCheckBox2"
    Then I check "AccountNumberLabel" has CSS property "content" with value ""*""
    #Then I check "SelectBusinessType" has CSS property "content" with value ""*""
    Then I click on button "RegistrationAsTaxAgent"
    Then I check "TaxAgentABNLabel" has CSS property "content" with value ""*""
    Then I check "TaxAgentBusinessNameLabel" has CSS property "content" with value ""*""
    Then I click on button "RegistrationAsBusiness"
    Then I enter the details as
      | Fields                  | Value       |
      | InputABNNumber_Business | 91098629095 |
      | InputCRNNumber_Business | 400004 |
    Then I click on button "RegistrationSubmit"
    Then I check "Registration_FirstNameLabel" has CSS property "content" with value ""*""
    Then I check "Registration_LastNameLabel" has CSS property "content" with value ""*""
    Then I check "Registration_EmailLabel" has CSS property "content" with value ""*""
    Then I check "Registration_UsernameLabel" has CSS property "content" with value ""*""
    Then I check "Registration_NewPasswordLabel" has CSS property "content" with value ""*""
    Then I check "Registration_ConfirmPasswordLabel" has CSS property "content" with value ""*""
    Then I check "Registration_HintLabel" has CSS property "content" with value ""*""
    
    #PART 4: Tax Registration Form
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter

    Then I click on "Payroll Tax Registration"
    Then I wait for "1000" millisecond
     Then I check "Label_AustralianBusinessNumber_ABN" has CSS property "content" with value ""*""
    And I enter the details as
      | Fields                 | Value       |
      | RegistrationAnswer_ABN | 83117378917 |
    Then I click on button with value "Next"
    Then I wait for "1500" millisecond
    Then I select "Company" from "SelectBusinessTypeCode"
    Then I wait for "2000" millisecond
    Then I check "Label_SelectBusinessType" has CSS property "content" with value ""*""
    Then I check "Label_EmployerName" has CSS property "content" with value ""*""
    Then I check "Label_BusinessTradingName" has CSS property "content" with value ""*""
    Then I check "Label_AustralianCompanyName_ACN" has CSS property "content" with value ""*""
    Then I select "Government" from "SelectBusinessTypeCode"
    Then I enter the details as
      | Fields              | Value              |
      | EmployerName        | <CompanyName> |
      | BusinessTradingName | <CompanyName>  |
   
		Then I click on button "TaxPayerDetailsNextBT"
    Then I wait for "2000" millisecond
    
   
    Then I check "Label_BusinessAdress_Country" has CSS property "content" with value ""*""
    Then I check "Label_BusinessAddress_AddressLine1" has CSS property "content" with value ""*""
    Then I check "Label_BusinessAdress_Suburb" has CSS property "content" with value ""*""
    Then I check "Label_BusinessAdress_Territory" has CSS property "content" with value ""*""
    Then I check "Label_BusinessAdress_Postcode" has CSS property "content" with value ""*""
    #Then I check "Text_PostalAddress" has CSS property "content" with value ""*""
    #Then I check "Text_AddresswhereBusinessRecordsarelocated_Jurisdi" has CSS property "content" with value ""*""
    Then I check "ContactPerson_FirstName" has CSS property "content" with value ""*""
    Then I check "ContactPerson_LastName" has CSS property "content" with value ""*""
    Then I check "Label_ContactPerson_ContactPhoneNumber" has CSS property "content" with value ""*""
    Then I check "Label_ContactPerson_EmailAddress" has CSS property "content" with value ""*""
    Then I check "Label_PreferedCommunicationMethod" has CSS property "content" with value ""*""
    #Then I check "Label_PostalAddress" has CSS property "content" with value ""*""
    #Then I select "Company" from "SelectBusinessTypeCode"
    #Then I select "Miss" from "ContactPerson_Title"
    #Then I select "SMS" from "CommunicationMethodId"
    Then I select "Direct Post" from "CommunicationMethodId"
     Then I enter the details as
      | Fields                    | Value              |
      | AddressLine1              | TEST               |
      | Address_City              | TEST               |
      | ContactPerson_FirstName   | TEST               |
      | ContactPerson_LastName    | TEST               |
      | ContactPerson_Email       | TEST@TEST.com      |
      | PostCode                  |        3333 |
      | ContactPerson_PhoneNumber |    1234567890 |
    #Then I select "AL" from "Address_State"
    # Then I see text "Title" not displayed
    Then I click on button "OrgDetailsNextBt"
    
    Then I check "Label_BusinessActivityCategory" has CSS property "content" with value ""*""
    Then I wait for "2000" millisecond
     Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value        |
      | s2id_autogen1_search | Turf Growing |
    Then I click on button "select2-results-1"
    Then I click on "ACTWagesPaidNext"
    Then I wait for "2000" millisecond
    Then I check "Label_DateBusinessCommencedEmployinginACT" has CSS property "content" with value ""*""
    Then I check "Label_DateBusinessBecameLiableintheACT" has CSS property "content" with value ""*""
    Then I check "Label_NumberofEmployeesinyourACTBusiness" has CSS property "content" with value ""*""
    #Then I see text "Are you a member of a group?*" displayed
    Then I check "Label_Asaneligibleemployer_doyouwishtoapplyforannu" has CSS property "content" with value ""*""
    #Then I check "Label_AnnualLodgementRequestJustification" has CSS property "content" with value ""*""
    #Then I check "Text_ContactPersonforPayrollTax" has CSS property "content" with value ""*""
    Then I click on "DateBusinessStart"
    Then I click on "20170506"
    Then I click on "DateBusinessLiable"
    Then I click on "20170507"
    Then I enter the details as
      | Fields               | Value |
      | NumberOfEmployees    |    33 |
    Then I click on button "AnnualLodgementApproval_NO"
    Then I click on "PayrollNext"
    Then I wait for "2000" millisecond
  
    Then I check "Label_BSB" has CSS property "content" with value ""*""
    Then I check "Label_BankAccountNumber" has CSS property "content" with value ""*""
    Then I check "Label_BankAccountName" has CSS property "content" with value ""*""
    Then I click on button "Refunds_NO"
    Then I click on button "RefundDetailsBT"

    Then I check "Label_Declarer_FirstName" has CSS property "content" with value ""*""
    Then I check "Label_Declarer_LastName" has CSS property "content" with value ""*""
    Then I check "Label_Declarer_Organisation" has CSS property "content" with value ""*""
    Then I check "Label_Declarer_Position" has CSS property "content" with value ""*""
    Then I check "Label_Declarer_ContactPhone" has CSS property "content" with value ""*""
    Then I check "Label_Declarer_EmailAdress" has CSS property "content" with value ""*""

   Examples: 
      | PortalName | CompanyName                  | ABN         | UserName | Password   |
      | TSS        | The Fire Company Pty Limited | 83117378917 | jbradley | Dbresults1 |
      
  @done
   Scenario Outline: DTSP-508: As an end user, I want to see a reminder message on the top of the Payroll Tax Registration form so I know I cannot save an incomplete form
  Given I want to login to portal "<PortalName>"
  And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
  And I hit Enter
  Then I click on "Payroll Tax Registration"
  Then I see text "Because you are not logged in, you cannot save an incomplete form for later. Please complete your form and submit it before closing your session" displayed
  Examples:
      | PortalName | UserName | Password   |
      | TSS        | jbradley | Dbresults1 |
  #@review
  #Scenario Outline: DTSP-8
    # REMEMBER TO WAIT FOR FIVE MINUTES BETWEEN EACH RUN OF THIS SCENARIO
    #Given I want to login to portal "<PortalName>"
    #And I enter the details as
      #| Fields        | Value      |
      #| UserNameInput | <UserName> |
      #| PasswordInput | WRONG      |
    #Then I hit Enter
    #And I enter the details as
      #| Fields        | Value      |
      #| UserNameInput | <UserName> |
      #| PasswordInput | WRONG      |
    #Then I hit Enter
    #Then I see text "Password Hint" displayed
    #Then I see text "<Password>" displayed
#
    #Examples: 
      #| PortalName | UserNameField | PasswordField | UserName | Password   |
      #| TSS        | UserNameInput | PasswordInput | jscott   | Dbresults1 |
#
  #@review
  #Scenario Outline: DTSP-13, DTSP-14
    #Scenario 2: Reset Password link has expired
    #Given I want to login to portal "ExpiredPassword"
    #Then I see text "Reset Password Link Invalid" displayed
    #Then I see text "Sorry, the link is not valid." displayed
    #Then I see text "Please click the Reset Password button again in the email or click the button below." displayed
    #Then I click on button "ResetPasswordInvalidButton"
    #Then I check I am on "Forgot Your Password?" page
    #Then I see text "Forgot Your Password?" displayed
    #Scenario 3
    #Given I want to login to portal "InvalidPasswordLink"
    #Then I see text "The page cannot be found. Please make sure you typed the URL correctly." displayed
#
    #Examples: 
      #| PortalName | UserNameField | PasswordField | UserName | Password   | CRN         | ABN         |
      #| TSS        | UserNameInput | PasswordInput | jscott   | Dbresults1 | 12345678901 | 12345678901 |
  
  
	###########################################################################################################
  #################################### PHASE 1 ITERATION 4 ################################################
  ###########################################################################################################

@done
  Scenario Outline: DTSP-523
    # Part of this story is automatically tested by others...
  
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | jbradley   |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Lodgements"
    Then I click on "Payroll Tax"
    
    #PAYROLL TAX FORM TESTING WITH ANNUAL RECONCILIATION IS BLOCKED BY BUG DTSP-603
    Then I click on button "Discard"
    Then I check "NextSection" is readonly
     Then I click on button "select2-chosen-1"
  	 Then I enter the details as
      | Fields               | Value                |
      | s2id_autogen1_search | DESIGNATE |
   Then I click on button "select2-results-1"
   Then I wait for "1000" millisecond
    Then I click on "Monthly Return"
    Then I select "Jan 2017" from "MonthlyObligationSelect"
    Then I click on "Jan 2017"
    Then I wait for "1000" millisecond
    Then I click on button with value "Save and Next"
    Then I check "SubmitBT" is readonly
    Then I click on button "ClaimingACTProportion_Yes"
    Then I enter the details as
      | Fields                                         | Value |
      | SalariesAndWages                               | NO    |
      | BonusesAndCommissions                          | NO    |
      | LodgePayrollAnswer_Commissions                 | NO    |
      | LodgePayrollAnswer_Allowances                  | NO    |
      | LodgePayrollAnswer_DirectorsFees               | NO    |
      | LodgePayrollAnswer_EligibleTerminationPayments | NO    |
      | LodgePayrollAnswer_ValueOfBenefits             | NO    |
      | LodgePayrollAnswer_ShareValue                  | NO    |
      | LodgePayrollAnswer_ServiceContracts            | NO    |
      | LodgePayrollAnswer_Superannuation              | NO    |
      | LodgePayrollAnswer_OtherTaxablePayment         | NO    |
      | LodgePayrollAnswer_ExemptWages                 | NO    |
      | PayrollAnswer_AustralianWide                   | NO    |
      | GroupActWages                                | NO    |
    Then I check "SalariesAndWages" is readonly
    Then I check "BonusesAndCommissions" is readonly
    Then I check "LodgePayrollAnswer_Commissions" is readonly
    Then I check "LodgePayrollAnswer_Allowances" is readonly
    Then I check "LodgePayrollAnswer_DirectorsFees" is readonly
    Then I check "LodgePayrollAnswer_EligibleTerminationPayments" is readonly
    Then I check "LodgePayrollAnswer_ValueOfBenefits" is readonly
    Then I check "LodgePayrollAnswer_ShareValue" is readonly
    Then I check "LodgePayrollAnswer_ServiceContracts" is readonly
    Then I check "LodgePayrollAnswer_Superannuation" is readonly
    Then I check "LodgePayrollAnswer_OtherTaxablePayment" is readonly
    Then I check "LodgePayrollAnswer_ExemptWages" is readonly
    Then I check "LodgePayrollAnswer_AustralianWide" is readonly
    Then I check "GroupActWages" is readonly
    Then I enter the details as
      | Fields                                         | Value |
      | SalariesAndWages                               |   100 |
      | BonusesAndCommissions                          |   100 |
      | LodgePayrollAnswer_Commissions                 |   100 |
      | LodgePayrollAnswer_Allowances                  |   100 |
      | LodgePayrollAnswer_DirectorsFees               |   100 |
      | LodgePayrollAnswer_EligibleTerminationPayments |   100 |
      | LodgePayrollAnswer_ValueOfBenefits             |   100 |
      | LodgePayrollAnswer_ShareValue                  |   100 |
      | LodgePayrollAnswer_ServiceContracts            |   100 |
      | LodgePayrollAnswer_Superannuation              |   100 |
      | LodgePayrollAnswer_OtherTaxablePayment         |   100 |
      | LodgePayrollAnswer_ExemptWages                 |   100 |
      | GroupActWages	                                 |     0 |
      | PayrollAnswer_AustralianWide              |     0 |
    Then I click on button "SubmitBT"
    #Then I enter the details as
      #| Fields                 | Value |
      #| AnnualLessTotalTaxPaid | NO    |
    #Then I check "AnnualLessTotalTaxPaid" is readonly
    #Then I click on button "Discard"
    #Tax Registration Form
    
     Then I click on "Payroll Tax Registration"
         Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "OK"
     Then I wait for "1000" millisecond
    And I enter the details as
      | Fields                 | Value       |
      | RegistrationAnswer_ABN | 83117378917 |
    Then I click on button with value "Next"
    Then I wait for "1500" millisecond
    Then I enter the details as
      | Fields              | Value              |
      | EmployerName        | <CompanyName> |
      | BusinessTradingName | <CompanyName>  |
      | RegistrationAnswer_ACN    | NO                 |
    Then I select "Government" from "SelectBusinessTypeCode"
    #Then I check "RegistrationAnswer_ACN" is empty
		Then I click on button "TaxPayerDetailsNextBT"
		Then I wait for "1500" millisecond
    Then I select "Direct Post" from "CommunicationMethodId"
    Then I enter the details as
      | Fields                    | Value              |
      | AddressLine1              | TEST               |
      | Address_City              | TEST               |
      | PostCode                  | NO                 |
      | ContactPerson_FirstName   | TEST               |
      | ContactPerson_LastName    | TEST               |
      | ContactPerson_PhoneNumber | NO                 |
      | ContactPerson_Email       | TEST@TEST.com      |
    Then I check "PostCode" is readonly
    Then I check "ContactPerson_PhoneNumber" is readonly
    #Then I select "AL" from "Address_State"
    Then I enter the details as
      | Fields                    | Value       |
      | AddressLine1              | TEST        |
      | Address_City              | TEST        |
      | PostCode                  |        3333 |
      | ContactPerson_FirstName   | TEST        |
      | ContactPerson_LastName    | TEST        |
      | ContactPerson_PhoneNumber |    1234567890 |
    Then I click on button "AddressLine1"
    Then I click on button "OrgDetailsNext"
    Then I wait for "2000" millisecond
    Then I check "ACTWagesPaidNextBt" is readonly
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value        |
      | s2id_autogen1_search | Turf Growing |
    Then I click on button "select2-results-1"
    Then I click on button "ACTWagesPaidNextBt"
    Then I check "PayrollNext" is readonly
    Then I enter the details as
      | Fields                   | Value |
      | TaxableACTWages          | NO    |
      | wtAusWideTaxableWages    | NO    |
      | GroupAusWideTaxableWages | NO    |
      | NumberOfEmployees        | NO    |
    Then I check "TaxableACTWages" is readonly
    Then I check "wtAusWideTaxableWages" is readonly
    Then I check "GroupAusWideTaxableWages" is readonly
    Then I check "NumberOfEmployees" is readonly
    Then I enter the details as
      | Fields                   | Value |
      | NumberOfEmployees          |    33 |
    Then I click on "DateBusinessStart"
    Then I click on "20170528"
    Then I click on "DateBusinessLiable"
    Then I click on "20170528"
    Then I click on "PayrollNext"
    Then I enter the details as
      | Fields                   | Value |
      | RegistrationAnswer_BSB          | NO    |
      | BankAccountNumber    | NO    |
      | BankAccountName | NO    |
    Then I check "RegistrationAnswer_BSB" is readonly
    Then I check "BankAccountNumber" is readonly
    Then I check "BankAccountName" is readonly
    Then I check "RefundDetailsBT" is readonly
    Then I enter the details as
      | Fields                   | Value |
      | RegistrationAnswer_BSB          | 333333    |
      | BankAccountNumber    | 333333333    |
      | BankAccountName | TEST    |
    Then I click on button "RefundDetailsBT"
    Then I enter the details as
      | Fields                   | Value |
      | Declarer_PhoneNumber          | NO    |
    Then I check "Declarer_PhoneNumber" is empty
    

    Examples: 
      | PortalName | CompanyName                  | ABN         | UserName | Password   |
      | TSS        | The Fire Company Pty Limited | 83117378917 | jbradley | Dbresults1 |
 @wip
  Scenario Outline: DTSP-537
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | jbradley   |
      | PasswordInput | <Password> |
    And I hit Enter
    #Scenario 1: Annual Rec [Single Emp Status]
    Then I click on "Lodgements"
    Then I click on "Payroll Tax"
    Then I click on button "GeneralDiscardBt"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value |
      | s2id_autogen1_search | QUICK |
    Then I click on button "select2-results-1"
    Then I click on "Annual Reconciliation"
    Then I select "2014" from "AnnualObligationSelect"
    Then I click on button with value "Save and Next"
    Then I wait for "5000" millisecond
    Then I check object with xpath "//*[contains(@id, 'Titlewages')]//div[3]" contents match regex "\(\d{2} \w+ \d{4} - \d{2} \w+ \d{4} / [\w|\s|\W|\(|\)]+\)"
     Then I click on "Payroll Tax"
    Then I click on button with value "Discard"
    
    #Scenario 2: Annual Rec [Multi Emp Status]
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value |
      | s2id_autogen1_search | QUICK |
    Then I click on button "select2-results-1"
    Then I click on "Annual Reconciliation"
    Then I select "2014" from "AnnualObligationSelect"
    Then I click on button "NextSection"
    Then I wait for "3000" millisecond
    Then I see text "Annual Reconciliation Return" displayed
    
    #Scenario 5: Days paid wage group Australia-wide" field removed from Payroll Tax
    Then I see text "Days paid wage group Australia-wide" not displayed
    Then I wait for "5000" millisecond
    Then I check object with xpath "//*[contains(@id, 'Titlewages')]//div[3]" contents match regex "\(\d{2} \w+ \d{4} - \d{2} \w+ \d{4} / [\w|\s|\W|\(|\)]+\)"
    
    #Scenario 3: Monthly Return
     Then I click on "Payroll Tax"
    Then I click on button with value "Discard"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value     |
      | s2id_autogen1_search | DESIGNATE |
    Then I click on button "select2-results-1"
    Then I select "Jan 2017" from "MonthlyObligationSelect"
     Then I click on button "NextSection"
     Then I wait for "3000" millisecond
    #Scenario 4: Exempt wages question updated
    Then I see text "ACT wages not included on this return" displayed
    
    #Scenario 6: (Designated group employer for a group and lodging for itself’) Rename the field ‘Days where you paid or were liable to pay taxable or interstate wages’ to ‘Days where 1 group member paid or was liable to pay taxable or interstate wages’
     Then I click on "Payroll Tax"
    Then I click on button with value "Discard"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value     |
      | s2id_autogen1_search | DESIGNATE |
    Then I click on button "select2-results-1"
    Then I click on "Annual Reconciliation"
    Then I select "2014" from "AnnualObligationSelect"
    Then I click on button "NextSection"
     Then I wait for "3000" millisecond
    Then I click on button "ClaimingACTProportion_Yes"
    Then I enter the details as
      | Fields                                         | Value   |
      | SalariesAndWages                               | 1000000 |
      | BonusesAndCommissions                          |     100 |
      | LodgePayrollAnswer_Commissions                 |     100 |
      | LodgePayrollAnswer_Allowances                  |     100 |
      | LodgePayrollAnswer_DirectorsFees               |     100 |
      | LodgePayrollAnswer_EligibleTerminationPayments |     100 |
      | LodgePayrollAnswer_ValueOfBenefits             |     100 |
      | LodgePayrollAnswer_ShareValue                  |     100 |
      | LodgePayrollAnswer_ServiceContracts            |     100 |
      | LodgePayrollAnswer_Superannuation              |     100 |
      | LodgePayrollAnswer_OtherTaxablePayment         |     100 |
      | LodgePayrollAnswer_ExemptWages                 |     100 |
    Then I see text "Days where 1 group member paid or was liable to pay taxable or interstate wages" displayed
    
    #Scenario 7:  (Designated group employer and lodging a joint return for itself and other ACT group members) Rename the field ‘Days where you paid or were liable to pay taxable or interstate wages’ to ‘Days where 1 group member paid or was liable to pay taxable or interstate wages’
    #Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "OK"
      Then I click on "Home"
          Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "OK"
      
      Then I click on "Lodgements"
    Then I click on "Payroll Tax"
    Then I click on button with value "Discard"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value     |
      | s2id_autogen1_search | DESIGNATE |
    Then I click on button "select2-results-1"
    Then I click on "Annual Reconciliation"
    Then I select "2012" from "AnnualObligationSelect"
     Then I click on button "NextSection"
    Then I click on button "ClaimingACTProportion_Yes"
    Then I see text "Days where 1 group member paid or was liable to pay taxable or interstate wages" displayed

    Examples: 
      | PortalName | UserNameField | PasswordField | Password   |
      | TSS        | UserNameInput | PasswordInput | Dbresults1 |

   @done
  Scenario Outline: DTSP-444: As an end user, I want to know my Payroll Tax Obligations (including Month and Year) which have not been lodged so I can lodge my monthly payroll tax accordingly
    #Scenario 5: Gather Obligation List [Monthly and Annual] [Exception Path]
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | jbradley     |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Lodgements"
    Then I click on "Payroll Tax"
    Then I click on button "Discard"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value |
      | s2id_autogen1_search | AQUA |
    Then I click on button "select2-results-1"
    Then I check "LodgePayrollAnswer_TypeMonthly" is readonly
    Then I see text "No Monthly Lodgements Available" displayed
    Then I check "LodgePayrollAnswer_TypeAnnual" is readonly
    Then I see text "No Annual Lodgements Available" displayed
    Then I check "NextSection" is readonly

 
  
    Then I click on button "Discard"
     Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value |
      | s2id_autogen1_search | QUICK |
    Then I click on button "select2-results-1"
    Then I click on "Annual Reconciliation"
    Then I select "2014" from "AnnualObligationSelect"
    Then I click on button "NextSection"
    Then I see text "Annual Reconciliation Return" displayed
    Then I check object with xpath "//*[contains(@id, 'Titlewages')]//div[3]" contents match regex "\(\d{2} \w+ \d{4} - \d{2} \w+ \d{4} / [\w|\s|\W|\(|\)]+\)"
    #Then I see text "(01/07/2015 - 30/06/2016 / Designated group employer for a group and lodging for itself / 5)" displayed
    #Scenario 1: Gather Obligation List [Monthly] [Happy Path]
    Then I click on "Payroll Tax"
    #Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "OK"
    Then I click on button "Discard"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value |
      | s2id_autogen1_search | QUICK |
    Then I click on button "select2-results-1"
    Then I click on "Monthly Return"
    Then I select "Jan 2017" from "MonthlyObligationSelect"
    Then I click on button "NextSection"
    Then I check object with xpath "//*[contains(@id, 'Titlewages')]//div[3]" contents match regex "\(\d{2} \w+ \d{4} - \d{2} \w+ \d{4} / [\w|\s|\W|\(|\)]+\)"

    Examples: 
      | PortalName | UserNameField | PasswordField | Password   |
      | TSS        | UserNameInput | PasswordInput | Dbresults1 |
 @done
  Scenario Outline: DTSP-501: As an end user, I want the Payroll Tax Registration Form to be updated for Ease of Use
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    #Scenario 3: Rename the Tax Registration Form on the left navigation menu
    Then I see text "Payroll Tax Registration" displayed
    Then I click on "Payroll Tax Registration"
    #Scenario 4: Rename the Page Header of the Payroll Tax Registration Form
    Then I check I am on "Payroll Tax Registration" page
    And I enter the details as
      | Fields                 | Value       |
      | RegistrationAnswer_ABN | 83117378917 |
    Then I click on button with value "Next"
    Then I wait for "2000" millisecond
    Then I enter the details as
      | Fields                 | Value         |
      | EmployerName           | <CompanyName> |
      | BusinessTradingName    | <CompanyName> |
      | RegistrationAnswer_ACN | NO            |
    Then I select "Government" from "SelectBusinessTypeCode"
    Then I click on button "TaxPayerDetailsNextBT"
    Then I wait for "2000" millisecond
    Then I select "Direct Post" from "CommunicationMethodId"
    Then I enter the details as
      | Fields                    | Value         |
      | AddressLine1              | TEST          |
      | Address_City              | TEST          |
      | PostCode                  |          3333 |
      | ContactPerson_FirstName   | TEST          |
      | ContactPerson_LastName    | TEST          |
      | ContactPerson_PhoneNumber |      1234567890 |
      | ContactPerson_Email       | TEST@TEST.com |
    #Then I select "AL" from "Address_State"
    Then I click on button "OrgDetailsNextBt"
    Then I wait for "2000" millisecond
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value        |
      | s2id_autogen1_search | Turf Growing |
    Then I click on button "select2-results-1"
    Then I click on button "ACTWagesPaidNextBt"
    Then I wait for "2000" millisecond
    #Scenario 1: Contact Person for Payroll Tax
    Then I see text "Same as Business Contact Person" displayed
    Then I click on "Same as Business Contact Person"
    #Scenario 2: User is a member of a group
    Then I click on button "GroupMember_YES"
    Then I see text "Provide group number" displayed
    And I enter the details as
      | Fields             | Value |
      | ProvideGroupNumber |  1111 |

    Examples: 
      | PortalName | CompanyName                  | ABN         | UserName | Password   |
      | TSS        | The Fire Company Pty Limited | 83117378917 | jbradley | Dbresults1 |

	# OUTDATED
  #@done
  #Scenario Outline: DTSP-566: As an end user, I want the Payroll Tax Information accordion, sub section Total Taxable Wages) on the Payroll Tax Registration Form to accept calendar year input
    #Given I want to login to portal "<PortalName>"
    #And I enter the details as
      #| Fields        | Value      |
      #| UserNameInput | <UserName> |
      #| PasswordInput | <Password> |
    #And I hit Enter
    #And I click on "Payroll Tax Registration"
    #Then I select "Company" from "SelectBusinessTypeCode"
    #Then I select "Mr" from "ContactPerson_Title"
    #Then I select "Direct Post" from "CommunicationMethodId"
    #Then I check "TaxPayerDetailsNext" is readonly
    #Then I enter the details as
      #| Fields                    | Value              |
      #| EmployerName              | DB RESULTS PTY LTD |
      #| BusinessTradingName       | DB RESULTS PTY LTD |
      #| RegistrationAnswer_ABN    |        97110187767 |
      #| AddressLine1              | TEST               |
      #| Address_City              | TEST               |
      #| PostCode                  |               3333 |
      #| ContactPerson_FirstName   | TEST               |
      #| ContactPerson_LastName    | TEST               |
      #| ContactPerson_PhoneNumber |          333333333 |
      #| ContactPerson_Email       | test@test.com      |
    #Then I select "Other" from "SelectBusinessTypeCode"
    #Then I click on "TaxPayerDetailsNext"
    #Then I click on button "select2-chosen-1"
    #Then I enter the details as
      #| Fields               | Value        |
      #| s2id_autogen1_search | Turf Growing |
    #Then I click on button "select2-results-1"
    #Then I click on button "ACTWagesPaidNextBt"
    #Then I click on button "YearComjbradleyox"
    #Then I see text "2012" displayed
    #Then I see text "2013" displayed
    #Then I see text "2014" displayed
    #Then I see text "2015" displayed
    #Then I see text "2016" displayed
#
    #Examples: 
      #| PortalName | UserName | Password   |
      #| TSS        | jbradley | Dbresults1 |
      
	#OUTDATED; TOTAL TAX PAYABLE SECTION NO LONGER REQUIRED IN PAYROLL TAX LODGEMENT FORM
  #@done
  #Scenario Outline: DTSP-553: As a user, I want to see a "Total Amounts" section on my Annual Payroll Tax return form so I can enter my "Less Total Tax Paid" amount
    #Given I want to login to portal "<PortalName>"
    #And I enter the details as
      #| Fields        | Value      |
      #| UserNameInput | <UserName> |
      #| PasswordInput | <Password> |
    #And I hit Enter
    #And I click on "Payroll Tax Lodgement"
    #Then I click on button "Discard"
    #Then I click on "Annual Reconciliation"
    #Then I select "2014" from "AnnualObligationSelect"
    #Then I click on button "NextSection"
    #Then I click on button "TaxPayerDetailsNext"
    #Then I enter the details as
      #| Fields                                         | Value |
      #| SalariesAndWages                               |   100 |
      #| BonusesAndCommissions                          |   100 |
      #| LodgePayrollAnswer_Commissions                 |   100 |
      #| LodgePayrollAnswer_Allowances                  |   100 |
      #| LodgePayrollAnswer_DirectorsFees               |   100 |
      #| LodgePayrollAnswer_EligibleTerminationPayments |   100 |
      #| LodgePayrollAnswer_ValueOfBenefits             |   100 |
      #| LodgePayrollAnswer_ShareValue                  |   100 |
      #| LodgePayrollAnswer_ServiceContracts            |   100 |
      #| LodgePayrollAnswer_Superannuation              |   100 |
      #| LodgePayrollAnswer_OtherTaxablePayment         |   100 |
      #| LodgePayrollAnswer_ExemptWages                 |   100 |
    #Then I click on button "SubmitBT"
    #Then I see text "Total Tax Payable" displayed
    #Then I see text "Less Total Tax Paid" displayed
    #Then I see text "Total Amount Payable" displayed
    #Then I enter the details as
      #| Fields                 | Value |
      #| AnnualLessTotalTaxPaid |    50 |
    #Then I check "AnnualTotalTaxPayable" contains "$ 75.35"
    #Then I check "AnnualTotalAmountPayable" contains "$ 25.35"
#
    #Examples: 
      #| PortalName | UserName | Password   |
      #| TSS        | jbradley | Dbresults1 |

	#OUTDATED
  #@done
  #Scenario Outline: DTSP-536: As a Business Tax Payer, I want my details pre populated on the Payroll Tax form when I select an outstanding obligation
    #Given I want to login to portal "<PortalName>"
    #And I enter the details as
      #| Fields        | Value      |
      #| UserNameInput | <UserName> |
      #| PasswordInput | <Password> |
    #And I hit Enter
    #And I click on "Payroll Tax Lodgement"
    #Scenario 1: User chooses outstanding monthly obligation
    #Then I click on button "Discard"
    #Then I click on "Monthly Return"
    #Then I select "Jan 2017" from "MonthlyObligationSelect"
    #Then I click on button "NextSection"
    #Then I see text "50600468817" displayed
    #Then I see text "400011" displayed
    #Then I click on "Payroll Tax Lodgement"
    #Scenario 2: User chooses outstanding yearly obligation
    #Then I click on button "Discard"
    #Then I click on "Annual Reconciliation"
    #Then I select "2014" from "AnnualObligationSelect"
    #Then I click on button "NextSection"
    #Then I see text "50600468817" displayed
    #Then I see text "400011" displayed
#
    #Scenario 3: User chooses outstanding (Monthly or Yearly) obligation and no Payroll Tax Group Number is returned (user is an independent and is not part of a group)
    #Examples: 
      #| PortalName | UserNameField | PasswordField | UserName | Password   |
      #| TSS        | UserNameInput | PasswordInput | jbradley | Dbresults1 |

 @redo
  Scenario Outline: DTSP-526, 531: Update the ABN LookUp Rules for Payroll Tax Registration Form / Update the first page of the Portal Registration process
    Given I want to login to portal "<PortalName>"
    #This user has the ABN 12345678933, but since it's a tax agent user it isn't shown in the lodgement form
    And I enter the details as
      | Fields        | Value       |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Payroll Tax Registration"
    And I enter the details as
      | Fields                 | Value       |
      | RegistrationAnswer_ABN | 85613104316 |
    Then I click on button with value "Next"
    Then I wait for "2000" millisecond
    Then I select "Government" from "SelectBusinessTypeCode"
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
      | Fields                 | Value                |
      | EmployerName           | CODAVALLI, AARADHANA |
      | BusinessTradingName    | CODAVALLI, AARADHANA |

    Then I click on button "TaxPayerDetailsNextBT"
    Then I wait for "1000" millisecond
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
    Then I wait for "2000" millisecond
    Then I select "Government" from "SelectBusinessTypeCode"
    Then I enter the details as
      | Fields                 | Value       |
      | EmployerName           | TEST        |
      | BusinessTradingName    | TEST        |
    Then I click on button "TaxPayerDetailsNextBT"
    Then I wait for "1000" millisecond
    Then I see text "Your ABN is not valid. Please enter a valid ABN." displayed
     Then I click on "Payroll Tax Registration"
    Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "OK"
    #Scenario 6: ABN Lookup for Tax Agent with an active ABN, incorrect Registered Business Name, and Entity Type is not 'Individual'
      And I enter the details as
      | Fields                 | Value       |
      | RegistrationAnswer_ABN | <ABN> |
    Then I click on button with value "Next"
    Then I wait for "2000" millisecond
    Then I select "Government" from "SelectBusinessTypeCode"
    Then I enter the details as
      | Fields                 | Value             |
      | EmployerName           | The Fire Company Pty Limite |
      | BusinessTradingName    | The Fire Company Pty Limite |
    Then I click on button "TaxPayerDetailsNextBT"
    Then I wait for "1000" millisecond
    Then I see text "Your Organisation Name doesn't match with your ABN. Please try again." displayed
    
     Then I click on "Payroll Tax Registration"
    Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "OK"
    #Scenario 4: ABN Lookup for Tax Agent with an active ABN, incorrect Registered Business Name, and Entity Type = Individual
      And I enter the details as
      | Fields                 | Value       |
      | RegistrationAnswer_ABN | 71583328324 |
    Then I click on button with value "Next"
    Then I wait for "2000" millisecond
    
    Then I enter the details as
      | Fields                 | Value          |
      | EmployerName           | PSALTIS, COSMA |
      | BusinessTradingName    | PSALTIS, COSMA |
    Then I select "Government" from "SelectBusinessTypeCode"
     Then I click on button "TaxPayerDetailsNextBT"
     Then I wait for "1000" millisecond
    Then I see text "Your Organisation Name doesn't match with your ABN. Please try again." displayed
    
     Then I click on "Payroll Tax Registration"
     Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "OK"
    #Scenario 3: ABN Lookup for Tax Agent with an active ABN, correct Registered Business Name, and Entity Type = Individual
       And I enter the details as
      | Fields                 | Value       |
      | RegistrationAnswer_ABN | 71583328324 |
    Then I click on button with value "Next"
    Then I wait for "2000" millisecond
    
    Then I enter the details as
      | Fields                 | Value           |
      | EmployerName           | PSALTIS, COSMAS |
      | BusinessTradingName    | PSALTIS, COSMAS |
    Then I select "Government" from "SelectBusinessTypeCode"
    Then I click on button "TaxPayerDetailsNextBT"
    Then I enter the details as
      | Fields                    | Value       |
      | AddressLine1              | TEST        |
      | Address_City              | TEST        |
      | PostCode                  |        3333 |
      | ContactPerson_FirstName   | TEST        |
      | ContactPerson_LastName    | TEST        |
      | ContactPerson_PhoneNumber |    1234567890 |
       Then I click on "Payroll Tax Registration"
     Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "OK"
    #Scenario 5: ABN Lookup for Tax Agent with an active ABN, correct Registered Business Name, and Entity Type is not 'Individual'
      And I enter the details as
      | Fields                 | Value       |
      | RegistrationAnswer_ABN | <ABN> |
    Then I click on button with value "Next"
    Then I wait for "2000" millisecond
    Then I enter the details as
      | Fields                 | Value              |
      | EmployerName           | <CompanyName> |
      | BusinessTradingName    | <CompanyName> |
    Then I select "Government" from "SelectBusinessTypeCode"
    Then I click on button "TaxPayerDetailsNextBT"
    Then I enter the details as
      | Fields                    | Value       |
      | AddressLine1              | TEST        |
      | Address_City              | TEST        |
      | PostCode                  |        3333 |
      | ContactPerson_FirstName   | TEST        |
      | ContactPerson_LastName    | TEST        |
      | ContactPerson_PhoneNumber |    1234567890 |
      Examples: 
      | PortalName | CompanyName                  | ABN         | UserName | Password   |
      | TSS        | The Fire Company Pty Limited | 83117378917 | jbradley | Dbresults1 |

     @done
  Scenario Outline: DTSP-527: Update the relationship between Business Taxpayer, Tax Agent Organisation and Users
    Given I want to login to portal "<PortalName>"
    Then I click on "Create Account"
    Then I check I am on "Registration" page
    Then I click on "Register as a Business"
    #Scenario 1: User accesses the 'Capture User Details' page
    Then I enter the details as
      | Fields                  | Value       |
      | InputABNNumber_Business | 91098629095 |
      | InputCRNNumber_Business |      400004 |
    Then I click on button "TermsandConditionsCheckBox2"
    Then I click on button "RegistrationSubmit"
    Then I check I am on "Complete Registration" page
    #Scenario 2: A Tax Agent organisation can have multiple users
    Given I want to login to portal "<PortalName>"

    Then I click on "Create Account"
    Then I check I am on "Registration" page
    Then I click on "Register as a Tax Agent"
    Then I enter the details as
      | Fields                    | Value                |
      | InputTaxAgentABN          |          21006819692 |
      | InputTaxAgentBusinessName | TOYOTA SUPER PTY LTD |
      | BusinessAddress_Address1  | TEST                 |
      | BusinessAddress_Suburb    | TEST                 |
      | BusinessAddress_Postcode  |                 3333 |
    Then I click on button "BusinessAddress_Suburb"
    Then I click on "Victoria"
    Then I click on button "TermsandConditionsCheckBox2"
    Then I click on button "RegistrationSubmit"
    Then I check I am on "Complete Registration" page

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password   | UserName2 | Password2  |
      | TSS        | UserNameInput | PasswordInput | jbradley | Dbresults1 | toyota    | Dbresults1 |
 @done
  Scenario Outline: DTSP-392:
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Lodgements"
    And I click on "Payroll Tax"
    Then I click on button "Discard"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value     |
      | s2id_autogen1_search | DESIGNATE |
    Then I click on button "select2-results-1"
    Then I click on "Annual Reconciliation"
    Then I select "2014" from "AnnualObligationSelect"
    Then I click on button "NextSection"
    Then I enter the details as
      | Fields                                         | Value    |
      | SalariesAndWages                               | 10000000 |
      | BonusesAndCommissions                          |        0 |
      | LodgePayrollAnswer_Commissions                 |        0 |
      | LodgePayrollAnswer_Allowances                  |        0 |
      | LodgePayrollAnswer_DirectorsFees               |        0 |
      | LodgePayrollAnswer_EligibleTerminationPayments |        0 |
      | LodgePayrollAnswer_ValueOfBenefits             |        0 |
      | LodgePayrollAnswer_ShareValue                  |        0 |
      | LodgePayrollAnswer_ServiceContracts            |        0 |
      | LodgePayrollAnswer_Superannuation              |        0 |
      | LodgePayrollAnswer_OtherTaxablePayment         |        0 |
      | LodgePayrollAnswer_ExemptWages                 |        0 |
    Then I click on button "Submit"
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName      |
      | item2 | First Name    |
      | item3 | Last Name     |
      | item3 | Position      |
      | item4 | Organisation  |
      | item5 | Contact Phone |
      | item6 | Email Address |
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[1]//td[2]" contains "<FirstName>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[2]//td[2]" contains "<LastName>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[3]//td[2]" contains "<Position>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[4]//td[2]" contains "<Organisation>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[5]//td[2]" contains "<ContactPhone>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[6]//td[2]" contains "<EmailAddress>"

    Examples: 
      | PortalName | UserName | Password   | FirstName | LastName | Position            | Organisation | ContactPhone | EmailAddress                      |
      | TSS        | jbradley | Dbresults1 | J         | Bradley  | DESIGNATE PTY. LTD. | Consultant   | 04 5678 9767 | jbradley@hotmail.com |
      @done
  Scenario Outline: DTSP-506: Update default answer to a question on the Payroll Tax Registration form
     
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | jbradley   |
      | PasswordInput | <Password> |
    And I hit Enter
     Then I click on "Payroll Tax Registration"
     Then I wait for "1000" millisecond
    And I enter the details as
      | Fields                 | Value       |
      | RegistrationAnswer_ABN | 83117378917 |
    Then I click on button with value "Next"
    Then I wait for "1500" millisecond
    Then I enter the details as
      | Fields              | Value              |
      | EmployerName        | <CompanyName> |
      | BusinessTradingName | <CompanyName>  |
    Then I select "Government" from "SelectBusinessTypeCode"
		Then I click on button "TaxPayerDetailsNextBT"
		Then I wait for "1500" millisecond
    Then I select "Direct Post" from "CommunicationMethodId"
       #Then I select "AL" from "Address_State"
    Then I enter the details as
      | Fields                    | Value       |
      | AddressLine1              | TEST        |
      | Address_City              | TEST        |
      | PostCode                  |        3333 |
      | ContactPerson_FirstName   | TEST        |
      | ContactPerson_LastName    | TEST        |
      | ContactPerson_PhoneNumber |    1234567890 |
      | ContactPerson_Email       | TEST@TEST.com      |
    Then I click on button "AddressLine1"
    Then I click on button "OrgDetailsNext"
    Then I wait for "2000" millisecond
    Then I check "ACTWagesPaidNextBt" is readonly
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value        |
      | s2id_autogen1_search | Turf Growing |
    Then I click on button "select2-results-1"
    Then I click on button "ACTWagesPaidNextBt"
    Then I see checkbox "AnnualLodgementApproval_NO" as selected

    
    Examples: 
      | PortalName | CompanyName                  | ABN         | UserName | Password   |
      | TSS        | The Fire Company Pty Limited | 83117378917 | jbradley | Dbresults1 |

  @done
  Scenario Outline: DTSP-508: As an end user, I want to see a reminder message on the top of the Payroll Tax Registration form so I know I cannot save an incomplete form
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    And I click on "Payroll Tax Registration"
    Then I see text "Because you are not logged in, you cannot save an incomplete form for later. Please complete your form and submit it before closing your session." displayed

    Examples: 
      | PortalName | UserName | Password   |
      | TSS        | jbradley | Dbresults1 |

  @done
  Scenario Outline: DTSP-524: As an organisation, I want to force the user to key in every 'dollar' field on the Payroll Tax Lodgement Form so that the user won't miss out any of these fields
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    And I hit Enter
    Then I click on "Lodgements"
    And I click on "Payroll Tax"
    Then I click on button "Discard"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value     |
      | s2id_autogen1_search | DESIGNATE |
    Then I click on button "select2-results-1"
    Then I click on "Annual Reconciliation"
    Then I select "2014" from "AnnualObligationSelect"
    Then I click on button "NextSection"
    Then I check "SalariesAndWages" contains "$"
    Then I check "BonusesAndCommissions" contains "$"
    Then I check "LodgePayrollAnswer_Commissions" contains "$"
    Then I check "LodgePayrollAnswer_Allowances" contains "$"
    Then I check "LodgePayrollAnswer_DirectorsFees" contains "$"
    Then I check "LodgePayrollAnswer_EligibleTerminationPayments" contains "$"
    Then I check "LodgePayrollAnswer_ValueOfBenefits" contains "$"
    Then I check "LodgePayrollAnswer_ShareValue" contains "$"
    Then I check "LodgePayrollAnswer_ServiceContracts" contains "$"
    Then I check "LodgePayrollAnswer_Superannuation" contains "$"
    Then I check "LodgePayrollAnswer_OtherTaxablePayment" contains "$"
    Then I check "LodgePayrollAnswer_ExemptWages" contains "$"
    Then I enter the details as
      | Fields                                         | Value |
      | SalariesAndWages                               |     0 |
      | BonusesAndCommissions                          |     0 |
      | LodgePayrollAnswer_Commissions                 |     0 |
      | LodgePayrollAnswer_Allowances                  |     0 |
      | LodgePayrollAnswer_DirectorsFees               |     0 |
      | LodgePayrollAnswer_EligibleTerminationPayments |     0 |
      | LodgePayrollAnswer_ValueOfBenefits             |     0 |
      | LodgePayrollAnswer_ShareValue                  |     0 |
      | LodgePayrollAnswer_ServiceContracts            |     0 |
      | LodgePayrollAnswer_Superannuation              |     0 |
      | LodgePayrollAnswer_OtherTaxablePayment         |     0 |
      | LodgePayrollAnswer_ExemptWages                 |     0 |
    Then I click on button "ClaimingACTProportion_Yes"
    Then I check "PayrollAnswer_AustralianWide" contains "$"

    Examples: 
      | PortalName | UserName | Password   |
      | TSS        | jbradley | Dbresults1 |
  
  
	###########################################################################################################
  #################################### PHASE 1.1 ITERATION 1 ################################################
  ###########################################################################################################
  
  	#STORIES DONE:  78, 136, 141, 176, 185, 522, 578, 583, 584, 592, 608, 617, 622
	#CURRENT ITERATION: 1.1
  # Before running this script, go to https://test-ssc.dbresults.com.au/TSSAccountMgmt/DataExtensions.aspx
  # Find jbradley's account and make sure he has an CRN, an ABN and his employer status is set to 'Designated group employer for a group and lodging for itself'
  # As of 12 pm 9/1/2017 these settings have already been implemented, but double-checking them is advised.
  
  

  #NOTE: Ensure that jbradley has a current employee type selected in the data extensions page
  
@review
  Scenario Outline: DTSP-78: As an end user, I want to be able to select an ABN and view next payment information and lodge from the Right Navigation Panel on my Basic Dashboard
    #Business Taxpayer with many: jbradley
    #Business Taxpayer with only one: camido
    #Business Taxpayer with none: ccover
    #Tax Agent with many: test_taxagent1
    #Tax Agent with only one: test_taxagent2
    #Tax Agent with none: test_taxagent3
    #Scenario 1: Business Taxpayer associated with multiple ABNs
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value         |
      | s2id_autogen1_search | DESIGNATE |
    Then I click on button "select2-results-1"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value    |
      | s2id_autogen1_search | DUSTER |
    Then I click on button "select2-results-1"
    Then I click on "Sign Out"
    #Scenario 2: Business Taxpayer associated with only 1 ABN
    #Given I want to login to portal "<PortalName>"
    #And I enter the details as
      #| Fields        | Value      |
      #| UserNameInput | Test1     |
      #| PasswordInput | <Password> |
    #And I hit Enter
    #Then I check "select2-chosen-1" is readonly
    #Then I click on "Sign Out"
    #Scenario 3: Tax Agent associated with multiple ABNs (i.e. clients)
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value          |
      | UserNameInput | Taxagent4 |
      | PasswordInput | <Password>     |
    And I hit Enter
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value |
      | s2id_autogen1_search | Chocolate |
    Then I click on button "select2-results-1"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value  |
      | s2id_autogen1_search | Member Check |
    Then I click on button "select2-results-1"
    Then I click on "Sign Out"
    #Scenario 4: Tax Agent associated with only 1 ABN (i.e. client)
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value          |
      | UserNameInput | taxagent3 |
      | PasswordInput | <Password>     |
    And I hit Enter
    Then I check "select2-chosen-1" is readonly
    Then I click on "Sign Out"
    #Scenario 5: Display “Next Payment” box
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter

    Then I see text "Next Lodgement Due" displayed
    #Scenario 7: User clicks on “View History” button
    # Then I click on "View History"
    Then I click on button with value "View History"
    Then I check I am on "Return History" page
    Then I click on "Home"
    #Scenario 8: User clicks on “Lodge Return” button
    #Then I click on "Lodge Return"
    #Then I click on button with value "Lodge Return"
    #Then I check I am on "Payroll Lodgement Form" page
    #Then I click on "Home"
    Then I click on "Sign Out"
    #Scenario 10: User has no outstanding payment
    #Given I want to login to portal "<PortalName>"
    #And I enter the details as
      #| Fields        | Value      |
      #| UserNameInput | Test2   |
      #| PasswordInput | <Password> |
    #And I hit Enter
    #Then I see text "You do not have any outstanding payments" displayed
    #Scenario 11: User has no transaction history
    #Then I check "BillComparation" is readonly
    #Then I click on "Sign Out"
    #Scenario 9: User has no outstanding lodgement
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value     |
      | s2id_autogen1_search | SUBMIT |
    Then I click on button "select2-results-1"
    Then I see text "You do not have any outstanding lodgements" displayed

    #Scenario 11: TODO when 'View History' and 'Lodge Return' buttons have actual ids.
    Examples: 
      | PortalName | UserName | Password   |
      | TSS        | jbradley | Dbresults1 |
	#OUTDATED
  #@review
  #Scenario Outline: DTSP-136: As an end user, I want to be able to view the left navigation panel so that I can quickly access the functions that I need
    #Given I want to login to portal "<PortalName>"
    #And I enter the details as
      #| Fields        | Value      |
      #| UserNameInput | <UserName> |
      #| PasswordInput | <Password> |
    #And I hit Enter
    #Then "<Item>" is displayed as "<ItemName>"
      #| Item  | ItemName                         |
      #| text1 | Dashboard                        |
      #| text1 | Transaction History              |
      #| text2 | Payroll Tax Lodgement            |
      #| text2 | Payroll Tax Registration         |
      #| text2 | Payroll Tax Registration Updates |
      #| text2 | Manage Tax Details               |
      #| text2 | User Profile                     |
      #| text2 | Sign Out                         |
    #Then I click on "Payroll Tax Lodgement"
    #Then I check I am on "Payroll Lodgement Form" page
    #Then I click on "Manage Account Details"
    #Then I check I am on "Manage Account Details" page
#
    #Then I click on "Payroll Tax Registration"
    #Then I check I am on "Payroll Tax Registration" page
    #Then I click on "User Profile"
    #Then I check I am on "View User Profile" page
    #Then I click on "Dashboard"
    #Then I check I am on "HomePage" page
    #Then I click on "Sign Out"
    #Then I check I am on "Login" page
#
    #Examples: 
      #| PortalName | UserName | Password   |
      #| TSS        | jbradley | Dbresults1 |

   @review
  Scenario Outline: DTSP-141: As an end user, I want to be able to view my Recent Transactions on my Basic Dashboard, so that it shows me a quick summary of my recent/closed Lodgements and Payments.
    #Scenarios 1 and 2 are better off manually.
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    #Scenario 3
    Then I click on button with value "View History"
    Then I check I am on "Return History" page
    Then I click on "Home"
    Then I click on "Sign Out"
    #Scenario 4
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName>   |
      | PasswordInput | <Password> |
    And I hit Enter
    #Then I click on "Transaction History"
      Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value    |
      | s2id_autogen1_search | SUBMIT |
    Then I click on button "select2-results-1"
    Then I see text "You do not have any annual transaction history available" displayed
     Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value    |
      | s2id_autogen1_search | GOOD FOR SOMETHING |
    Then I click on button "select2-results-1"
    Then I see text "You do not have any monthly transaction history available" displayed
    Then I check "BillComparation" is readonly
    Then I click on "Sign Out"
    #Scenario 7
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | Test2     |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I see text "Please note, as there are currently no taxpayer accounts associated with your login, there is no information to display." displayed
    Then I click on "Add an ABN to my Account"
    Then I check I am on "Manage Account Details" page
    Then I click on "Sign Out"
    #Scenario 8
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value          |
      | UserNameInput | Taxagent1 |
      | PasswordInput | <Password>     |
    And I hit Enter
    Then I see text "Please note, as there are currently no taxpayer accounts associated with your login, there is no information to display." displayed
    Then I click on "Sign Out"

    Examples: 
      | PortalName | UserName | Password   |
      | TSS        | jbradley | Dbresults1 |
  
  #OUTDATED
  #@review
  #Scenario Outline: DTSP-176: As an end user, I want to be able to view my Transaction History for Payroll Tax
    #Scenarios 1-4 are already tested in DTSP-78.
    #Scenarios 13-14 are already tested in DTSP-141
    #Scenarios 5, 6, 8 and 10 are best tested manually
    #Given I want to login to portal "<PortalName>"
    #And I enter the details as
      #| Fields        | Value      |
      #| UserNameInput | <UserName> |
      #| PasswordInput | <Password> |
    #And I hit Enter
    #Then I click on button "select2-chosen-1"
    #Then I enter the details as
      #| Fields               | Value            |
      #| s2id_autogen1_search | SIT SPOT PTY LTD |
    #Then I click on button "select2-results-1"
    #Then I click on button "select2-chosen-1"
    #Then I click on "Payroll Tax Registration"
    #Then I click on "Transaction History"
    #Scenario 7: “Next” button
    #Then I click on button "ListNavigation_Next"
    #Scenario 8: "Previous" button
    #Then I click on button "ListNavigation_Previous"
    #Scenario 12: BPAY and EFT Info
    #Then I see text "Payment Options" displayed
    #Then I see text "Biller Code" displayed
    #Then I see text "EFTBSB" displayed
    #Then I click on "Sign Out"
    #Given I want to login to portal "<PortalName>"
    #And I enter the details as
      #| Fields        | Value      |
      #| UserNameInput | mbisping   |
      #| PasswordInput | <Password> |
    #And I hit Enter
    #Scenario 9 and 11
    #Then I click on "Transaction History"
    #Then I see text "You do not have any monthly transaction history available" displayed
    #Then I see text "You do not have any annual transaction history available" displayed
    #Then I click on "Sign Out"
#
    #Examples: 
      #| PortalName | UserName | Password   |
      #| TSS        | jbradley | Dbresults1 |

  @BLOCKED
  Scenario Outline: DTSP-185: As an end user, I want to be able to edit my Business Address details on my Tax Registration form
    #Scenario 10 should be tested manually as it regards an email
    #ONHOLD DUE TO DTSP-713
    
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    #	Scenario 1: User views update left hand Navigation menu items
    # Scenario 2: User views "Tax Registration Updates" sub menu items
    Then I click on "Payroll Tax Registration Updates"
    Then I see text "Update Business Address" displayed
    Then I see text "Update Contact Details" displayed
    Then I see text "Update Refund Details" displayed
    # Scenario 3: User elects to view "Update Business Address" details form
    Then I click on "Update Business Address"
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                                                  |
      | item2 | Tax Payer Details                                         |
      #| item3 | Update Business Address                                   |
      #| item5 | Business Address                                          |
      | item5 | Postal Address                                            |
      | item5 | Address where Business Records are located (Jurisdiction) |
    #		Scenario 4: User elects to edit "Update Business Address" details form
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value         |
      | s2id_autogen1_search | Active Bottle |
    Then I click on button "select2-results-1"
    #Then I check "Address_CountryId" is not readonly
    Then I check "Address_AddressLine1" is not readonly
    Then I check "Address_City" is not readonly
    Then I check "Address_State" is not readonly
    Then I check "Address_PostCode" is not readonly
    Then I click on button "NextBT"
    #		Scenario 5: User views 'Tax Registration Update ' Summary page
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName      |
      | item2 | Declarer      |
      | item3 | Declaration   |
      | item5 | Organisation  |
      | item5 | Contact Phone |
      | item5 | Email Address |
    #		Scenario 6: Submit 'Tax Registration Update ' data to PSRM without errors
    Then I click on button "CorrectInfoDeclared"
    Then I click on button "SubmitBT"
    Then I see text "Your Tax Registration updates for Payroll Tax has been successful. An email has been sent to you for your records." displayed
    Then I see text "To download the details you submitted, please click the button below. Transaction Reference Number:" displayed
    #		Scenario 7: Submit 'Tax Registration Updates 'data to PSRM with errors
    Given I want to login to portal "<PortalName>"
    Then I click on "Payroll Tax Registration Updates"
    Then I click on "Update Business Address"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value         |
      | s2id_autogen1_search | Active Bottle |
    Then I click on button "select2-results-1"
    Then I enter the details as
      | Fields           | Value |
      | Address_PostCode |    33 |
    Then I click on button "NextBT"
    Then I wait for "5000" millisecond
    #Then I see text "Invalid Post Code, should have length 4 and should contain only digits." displayed
    Then I see text "Please enter the correct number of digits for this field." displayed
    #		Scenario 8: User clicks 'Back' on the 'Tax Registration Updates' Summary page
    Then I enter the details as
      | Fields           | Value |
      | Address_PostCode |  3333 |
    #		Scenario 9: User views Tax Registration Updates Confirmation page
    Then I click on button "NextBT"
    Then I check I am on "Update Business Address Summary" page
    Then I click on button with value "Back"
    Then I check I am on "Update Business Address" page
    #		Scenario 11: User selects "Cancel" and common browser message is displayed and the user is re directed to the Dashboard
    Then I enter the details as
      | Fields           | Value |
      | Address_PostCode |  4444 |
    Then I click on button with value "Cancel"
    Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "Cancel"
    Then I click on button with value "Cancel"
    Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "OK"

    Examples: 
      | PortalName | UserName | Password   |
      | TSS        | jbradley | Dbresults1 |
  
  
 
    @review
  Scenario Outline: DTSP-522: As a end user I want the settings page updated so I can understand what the settings page is used for
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    #Scenario 1: User views updated left hand navigation menu
    Then I see text "User Profile" displayed
    #Scenario 2: User selects 'User Profile' sub-menu item on the left hand navigation menu
    Then I click on "User Profile"
    Then I check I am on "View User Profile" page
    Then I see text "Contact Details" displayed
    Then I see text "Edit User Profile" displayed
    Then I see text "Business Tax Payer" not displayed
    Then I see text "Choose a Tax Agent" not displayed
    #Scenario 3: User selects 'Edit User Profile' on the 'View User Profile' page
    Then I click on button "EditBT"
    Then I check I am on "Edit User Profile" page
    Then I see text "Contact Details" displayed

    Examples: 
      | PortalName | UserName | Password   |
      | TSS        | jbradley | Dbresults1 |
  @wip
  Scenario Outline: DTSP-567: As an end user, I don't want to see any tax calculations while I am filling out the Payroll Tax Lodgement Form until they are retrieved from PSRM and populated on the Lodgement Summary page
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Lodgements"
    And I click on "Payroll Tax"
    Then I click on button "Discard"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value     |
      | s2id_autogen1_search | DESIGNATE |
    Then I click on button "select2-results-1"
    Then I click on "Annual Reconciliation"
    Then I select "2014" from "AnnualObligationSelect"
    Then I click on button "NextSection"
    #Then I click on button "TaxPayerDetailsNext"
    Then I enter the details as
      | Fields                                         | Value |
      | SalariesAndWages                               |     1000000 |
      | BonusesAndCommissions                          |     1 |
      | LodgePayrollAnswer_Commissions                 |     1 |
      | LodgePayrollAnswer_Allowances                  |     1 |
      | LodgePayrollAnswer_DirectorsFees               |     1 |
      | LodgePayrollAnswer_EligibleTerminationPayments |     1 |
      | LodgePayrollAnswer_ValueOfBenefits             |     1 |
      | LodgePayrollAnswer_ShareValue                  |     1 |
      | LodgePayrollAnswer_ServiceContracts            |     1 |
      | LodgePayrollAnswer_Superannuation              |     1 |
      | LodgePayrollAnswer_OtherTaxablePayment         |     1 |
      | LodgePayrollAnswer_ExemptWages                 |     1 |
    #Scenario 1: Remove calculated fields in the "Wages / Reconciliation" section
   # Then I see text "ACT Taxable Wages" not displayed
    Then I see text "Tax-Free Threshold" not displayed
    Then I see text "Taxable wages" not displayed
    Then I see text "Tax Payable" not displayed
    Then I click on button "wtSubmitBT"
    #Scenario 2: Remove calculated fields in the "Total Amounts" section
    Then I see text "Amount Payable / Refund Amount Equals" not displayed

    #Scenario 3 is currently blocked by bug DTSP-684
    Examples: 
      | PortalName | UserName | Password   |
      | TSS        | jbradley | Dbresults1 |
   @review
  Scenario Outline: DTSP-578: Update Portal Registration Form to re-enable front end validation on CRN
    Given I want to login to portal "<PortalName>"
    Then I click on "Create Account"
    #Scenario 3: Business Tax Payer fails to enter a CRN
    Then I click on "Register as a Business"
    Then I check "RegistrationSubmit" is readonly
    #Scenario 4: CRN field only accepts numeric input
    Then I enter the details as
      | Fields         | Value |
      | InputCRNNumber | TEST  |
    Then I check "InputCRNNumber" is empty
    #Scenario 2: Business Tax Payer enters a CRN of less then 6 digits during portal registration
    Then I enter the details as
      | Fields         | Value |
      | InputABNNumber | <ABN> |
      | InputCRNNumber |  4000 |
    Then I click on button "TermsandConditionsCheckBox"
    Then I click on button "RegistrationSubmit"
    Then I see text "CRN Should be 6 digits." displayed
    #Scenario 1: Business Tax Payer enters a valid 6 digits CRN during portal registration
    Then I enter the details as
      | Fields         | Value |
      | InputABNNumber | <ABN> |
      | InputCRNNumber | <CRN> |
    Then I click on button "RegistrationSubmit"
    Then I check I am on "Complete Registration" page

    Examples: 
      | PortalName | UserName | Password   | ABN         | CRN    |
      | TSS        | jbradley | Dbresults1 | 13058370433 | 400014 |
  @BLOCKED
  Scenario Outline: DTSP-583: As an end user, I want to be able to edit my Contact Person details on my Tax Registration form
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    #	Scenario 1: User views update left hand Navigation menu items
    # Scenario 2: User views "Tax Registration Updates" sub menu items
    Then I click on "Payroll Tax Registration Updates"
    Then I see text "Update Business Address" displayed
    Then I see text "Update Contact Details" displayed
    Then I see text "Update Refund Details" displayed
    # Scenario 3: User elects to view "Update Business Address" details form
    Then I click on "Update Contact Details"
    Then I check I am on "Update Contact Details" page
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName          |
      | item2 | Tax Payer Details |
    #| item3 | Update Business Address                                   |
    #| item5 | Business Address                                          |
    #| item5 | Update Contact Details                                           |
    #		Scenario 4: User elects to edit "Update Business Address" details form
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value         |
      | s2id_autogen1_search | Active Bottle |
    Then I click on button "select2-results-1"
    Then I check "ContactPerson_FirstName" is not readonly
    Then I check "ContactPerson_LastName" is not readonly
    Then I check "ContactPerson_PhoneNumber" is not readonly
    Then I check "ContactPerson_Email" is not readonly
    Then I check "Address_AddressLine7" is not readonly
    Then I check "Address_City4" is not readonly
    Then I check "Address_PostCode4" is not readonly
    #Then I check "Address_AddressLine7" is not readonly
    Then I click on button "NextBT"
    #		Scenario 5: User views 'Tax Registration Update ' Summary page
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName      |
      | item2 | Declarer      |
      | item3 | Declaration   |
      | item5 | Organisation  |
      | item5 | Contact Phone |
      | item5 | Email Address |
    #		Scenario 6: Submit 'Tax Registration Update ' data to PSRM without errors
    Then I click on button "CorrectInfoDeclared"
    Then I click on button "SubmitBT"
    Then I see text "Your Tax Registration updates for Payroll Tax has been successful. An email has been sent to you for your records." displayed
    Then I see text "To download the details you submitted, please click the button below. Transaction Reference Number:" displayed
    #		Scenario 7: Submit 'Tax Registration Updates 'data to PSRM with errors
    Given I want to login to portal "<PortalName>"
    Then I click on "Payroll Tax Registration Updates"
    Then I click on "Update Contact Details"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value         |
      | s2id_autogen1_search | Active Bottle |
    Then I click on button "select2-results-1"
    Then I enter the details as
      | Fields            | Value |
      | Address_PostCode4 |    33 |
    Then I click on button "NextBT"
    Then I wait for "5000" millisecond
    Then I see text "Please enter the correct number of digits for this field." displayed
    #		Scenario 8: User clicks 'Back' on the 'Tax Registration Updates' Summary page
    Then I enter the details as
      | Fields            | Value |
      | Address_PostCode4 |  3333 |
    #		Scenario 9: User views Tax Registration Updates Confirmation page
    Then I click on button "NextBT"
    Then I check I am on "Update Contact Details Summary" page
    Then I click on button with value "Back"
    Then I check I am on "Update Contact Details" page
    #		Scenario 11: User selects "Cancel" and common browser message is displayed and the user is re directed to the Dashboard
    Then I enter the details as
      | Fields           | Value |
      | Address_PostCode |  4444 |
    Then I click on button with value "Cancel"
    Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "Cancel"
    Then I click on button with value "Cancel"
    Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "OK"

    Examples: 
      | PortalName | UserName | Password   |
      | TSS        | jbradley | Dbresults1 |

  @BLOCKED
  Scenario Outline: DTSP-592: As an end user, I want to be able to edit my Refund details on my Tax Registration form
    #Scenario 10 should be tested manually as it regards an email
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    #	Scenario 1: User views update left hand Navigation menu items
    # Scenario 2: User views "Tax Registration Updates" sub menu items
    Then I click on "Payroll Tax Registration Updates"
    Then I see text "Update Business Address" displayed
    Then I see text "Update Contact Details" displayed
    Then I see text "Update Refund Details" displayed
    # Scenario 3: User elects to view "Update Business Address" details form
    Then I click on "Update Refund Details"
    Then I check I am on "Update Refund Details" page
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value         |
      | s2id_autogen1_search | Active Bottle |
    Then I click on button "select2-results-1"
    #Then I click on button "Refunds_YES"
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                        |
      | item2 | Tax Payer Details               |
      | item3 | Set Up Bank Account for Refunds |
    #| item5 | BSB                                          |
    #| item5 | Bank Account Number                                            |
    #| item5 | Bank Account Name |
    #		Scenario 4: User elects to edit "Update Business Address" details form
    Then I check "Answer_OrganizationalName" is not empty
    Then I check "Answer_ABN" is not empty
    Then I check "Answer_CRN" is not empty
    #Then I check "Address_State" is not readonly
    #Then I check "Address_PostCode" is not readonly
    Then I click on button "NextBT"
    Then I wait for "1000" millisecond
    #		Scenario 5: User views 'Tax Registration Update ' Summary page
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName      |
      | item2 | Declarer      |
      | item3 | Declaration   |
      | item5 | Organisation  |
      | item5 | Contact Phone |
      | item5 | Email Address |
    #		Scenario 6: Submit 'Tax Registration Update ' data to PSRM without errors
    Then I click on button "CorrectInfoDeclared"
    Then I click on button with value "Submit"
    Then I see text "Your Tax Registration updates for Payroll Tax has been successful. An email has been sent to you for your records." displayed
    Then I see text "To download the details you submitted, please click the button below. Transaction Reference Number:" displayed
    #		Scenario 7: Submit 'Tax Registration Updates 'data to PSRM with errors
    Given I want to login to portal "<PortalName>"
    Then I click on "Payroll Tax Registration Updates"
    Then I click on "Update Refund Details"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value         |
      | s2id_autogen1_search | Active Bottle |
    Then I click on button "select2-results-1"
    Then I click on button "Refunds_YES"
    Then I enter the details as
      | Fields                   | Value      |
      | Answer_BSB               |         33 |
      | Answer_BankAccountNumber | 2342354234 |
      | Answer_BankAccountName   | TEST       |
    Then I click on button "NextBT"
    Then I wait for "4000" millisecond
    #Then I see text "Invalid BSB. BSB Should be 6 digits. Please try again." displayed
    Then I see text "BSB Should be 6 digits." displayed
    #		Scenario 8: User clicks 'Back' on the 'Tax Registration Updates' Summary page
    Then I enter the details as
      | Fields     | Value  |
      | Answer_BSB | 333333 |
    #		Scenario 9: User views Tax Registration Updates Confirmation page
    Then I click on button "NextBT"
    Then I check I am on "Update Refund Details Summary" page
    Then I click on button with value "Back"
    Then I check I am on "Update Refund Details" page
    #		Scenario 11: User selects "Cancel" and common browser message is displayed and the user is re directed to the Dashboard
    Then I enter the details as
      | Fields     | Value  |
      | Answer_BSB | 444444 |
    Then I click on button with value "Cancel"
    Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "Cancel"
    Then I click on button with value "Cancel"
    Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "OK"

    Examples: 
      | PortalName | UserName | Password   |
      | TSS        | jbradley | Dbresults1 |
	
	@review
  Scenario Outline: DTSP-608: As a user I want to choose a Tax Payer's ABN so that those details are populated on forms
    #Scenario 2: Business Taxpayer associated with multiple ABNs
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Payroll Tax Lodgement"
    Then I click on button with value "Discard"
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                         |
      | text1 | Tax Payer Details                |
      | text1 | Choose a Tax Payer ABN           |
      | text2 | Organisational Name              |
      | text2 | Australian Business Number (ABN) |
      | text2 | Client Reference Number (CRN)    |
      | text2 | Return Type                      |
      | text2 | Monthly Return                   |
      | text2 | Annual Reconciliation            |
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value         |
      | s2id_autogen1_search | Active Bottle |
    Then I click on button "select2-results-1"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value    |
      | s2id_autogen1_search | NAVY PTY |
    Then I click on button "select2-results-1"
    Then I click on "Sign Out"
    #Scenario 3: Business Taxpayer associated with ONLY one ABN
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | camido     |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Payroll Tax Lodgement"
    Then I click on button with value "Discard"
    Then I check "select2-chosen-1" is readonly
    Then "Answer_OrganizationalName" displays "AUTOLINE PTY LTD" by default
    Then I check "Answer_ABN" contains "50600468817"
    Then I check "Answer_CRN" contains "400011"
    Then I click on "Sign Out"
    #Scenario 4: Tax Agent associated with multiple ABN (i.e. clients)
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value          |
      | UserNameInput | test_taxagent1 |
      | PasswordInput | <Password>     |
    And I hit Enter
    Then I click on "Payroll Tax Lodgement"
    Then I click on button with value "Discard"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value |
      | s2id_autogen1_search | Green |
    Then I click on button "select2-results-1"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value  |
      | s2id_autogen1_search | Domain |
    Then I click on button "select2-results-1"
    Then I click on "Sign Out"
    #Scenario 5: Tax Agent associated with ONLY one ABN (i.e. clients)
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | camido     |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Payroll Tax Lodgement"
    Then I click on button with value "Discard"
    Then I check "select2-chosen-1" is readonly
    Then "Answer_OrganizationalName" displays "AUTOLINE PTY LTD" by default
    Then I check "Answer_ABN" contains "50600468817"
    Then I check "Answer_CRN" contains "400011"
    Then I click on "Sign Out"
    #Scenario 6:
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Payroll Tax Lodgement"
    Then I click on button with value "Discard"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value         |
      | s2id_autogen1_search | Active Bottle |
    Then I click on button "select2-results-1"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value    |
      | s2id_autogen1_search | NAVY PTY |
    Then I click on button "select2-results-1"
    Then I click on "Annual Reconciliation"
    Then I select "2015" from "AnnualObligationSelect"
    Then I click on button "NextSection"
    Then I click on button "MonthlyReturnBackBt"
    Then I check "Answer_OrganizationalName" is readonly
    Then I check "Answer_ABN" is readonly
    Then I check "Answer_CRN" is readonly
    Then I click on "Sign Out"
    #Scenario 7: Business Tax Payer views Payroll Tax Lodgement with no associated ABN's
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | ccover     |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Payroll Tax Lodgement"
    Then I see text "Please note, as there are no ABN's associated to your account, we are unable to display any information." displayed
    Then I see text "Add an ABN to my Account" displayed
    Then I click on "Sign Out"
    #Scenario 8: Tax Agent views Payroll Tax Lodgement with no associated ABN's
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value          |
      | UserNameInput | test_taxagent3 |
      | PasswordInput | <Password>     |
    And I hit Enter
    Then I click on "Payroll Tax Lodgement"
    Then I see text "Please note, as there are no ABN's associated to your account, we are unable to display any information." displayed
    #Then I see text "Add an ABN to my Account" displayed
    Then I click on "Sign Out"

    Examples: 
      | PortalName | UserName | Password   |
      | TSS        | jbradley | Dbresults1 |
	
 @done
  Scenario Outline: DTSP-617: Annual Payroll Tax Lodgements (Check for outstanding monthly obligations in PSRM)
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
     Then I click on "Lodgements"
    Then I click on "Payroll Tax"
    Then I click on button with value "Discard"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value          |
      | s2id_autogen1_search | <SearchString> |
    Then I click on button "select2-results-1"
    Then I click on "Annual Reconciliation"
    Then I click on button "AnnualObligationSelect"
    #Then I see text "2012" displayed
    Then I see text "01 Jul 2012 - 30 Jun 2013" displayed
    Then I see text "01 Jul 2013 - 30 Jun 2014" displayed
    Then I see text "01 Jul 2014 - 30 Jun 2015" displayed
    Then I see text "01 Jul 2015 - 30 Jun 2016" displayed
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value          |
      | s2id_autogen1_search | <SearchString2> |
    Then I click on button "select2-results-1"
    Then I click on "Monthly Return"
    Then I click on button "MonthlyObligationSelect"
    
    #Then I see text "Aug 2016" displayed
    Then I see text "Sep 2016" displayed
    Then I see text "Oct 2016" displayed
    Then I see text "Nov 2016" displayed
    Then I see text "Dec 2016" displayed
    Then I see text "Jan 2017" displayed
    #Then I see text "Feb 2017" displayed

    Examples: 
      | PortalName | UserName | Password   | SearchString  | SearchString2 |
      | TSS        | jbradley | Dbresults1 | DESIGNATE | QUICK SINGLE |

  @BLOCKED
  Scenario Outline: DTSP-622: As an end user (Business Tax Payer), I want to be able to manage tax details
    #NOTE: DO SCENARIOs 6 and 8 manually
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Manage Account Details"
    #Scenario 1: Display Manage Tax Details page (Business Tax Payer associated to One ABN)
    #Scenario 2: Display Manage Tax Details page (Business Tax Payer associated to Multiple ABNs)
     Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName          |
      | item2 | ABN               |
      | item3 | CRN               |
      | item4 | ORGANISATION NAME |
      | item5 | TAX AGENT         |
    #Scenario 4: Display the “Edit Tax Agent” pop up window
    Then I click on button "EditABN"
    Then I switch to frame "0"
    Then I see text "ABN" displayed
    Then I see text "CRN" displayed
    Then I see text "Organisation Name" displayed
    Then I see text "Tax Agent" displayed
    #Then "<Item>" is displayed as "<ItemName>"
    #| Item  | ItemName          |
    #| item2 | ABN               |
    #| item3 | CRN               |
    #| item4 | Organisation Name |
    #| item5 | Tax Agent         |
    #Scenario 5: Edit Tax Agent nomination of an ABN
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value          |
      | s2id_autogen1_search | <SearchString> |
    Then I click on button "select2-results-1"
    Then I click on button with value "Save"
    Then I check I am on "Manage Account Details" page
    #Scenario 7: Display the Add Additional ABN page
    Then I click on button "AddABN"
    Then I switch to frame "0"
    Then I see text "ABN" displayed
    Then I see text "CRN" displayed
    #Scenario 10: Mandatory Information on the “Add Additional ABN” page
    Then I check "SaveBtn" is readonly
    #Scenario 9: Add an additional ABN to the Business Tax Payer account [unhappy path]
    And I enter the details as
      | Fields             | Value         |
      | BusinessEntity_ABN | 1111111111111 |
      | BusinessEntity_CRN |        111111 |
    Then I click on button "SaveBtn"
    Then I see text "Invalid ABN or CRN" displayed

    Examples: 
      | PortalName | UserName | Password   | SearchString |
      | TSS        | jbradley | Dbresults1 | DB RESULTS  |



	###########################################################################################################
  #################################### PHASE 1.1 ITERATION 2 ################################################
  ###########################################################################################################
	
#DONE: 101, 105, 116, 124, 595, 596, 647, 682
#MANUAL: 580, 601, 607, 648, 651,




  @review
  Scenario Outline: DTSP-101: As an end user, I want to be able raise an Objection Request so that I can object on the tax amount, penalty, interest and decision on previous objections.
    #Scenarios 4, 5 and 6 must be done manually
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Service Requests"
    Then I click on "Objection Request"
    #Scenario 1: Display "Objection Request" Form
    Then I check "OrganizationalName" is readonly
    Then I check "PayrollAnswer_ABN" is readonly
    Then I check "PayrollAnswer_CRN" is readonly
    Then I check "Objection_Comments" is readonly
    Then I check "ObjectionOutOfTimeYES" is readonly
    Then I check "ObjectionOutOfTimeNO" is readonly
    Then I check "CheckTaxAmount" is readonly
    Then I check "CheckPenalty" is readonly
    Then I check "CheckInterest" is readonly
    Then I check "CheckDecision" is readonly
    #Scenario 2: "Objection Information" section displayed on the "Objection Request" Form
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value     |
      | s2id_autogen1_search | Designate |
    Then I click on button "select2-results-1"
    Then I check "Objection_Comments" is readonly
    Then I check "ObjectionOutOfTimeYES" is not readonly
    Then I check "ObjectionOutOfTimeNO" is not readonly
    Then I check "CheckTaxAmount" is not readonly
    Then I check "CheckPenalty" is not readonly
    Then I check "CheckInterest" is not readonly
    Then I check "CheckDecision" is not readonly
    #Scenario 3: "Objection Request" Summary page
    Then I click on button "ObjectionOutOfTimeYES"
    Then I enter the details as
      | Fields             | Value                  |
      | Objection_Comments | ObjectionComment       |
      | LodgeFailureReason | LodgementFailureReason |
    Then I click on button "CheckPenalty"
    Then I click on button with value "Next"
    Then I check I am on "Objection Request Summary" page
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                                          |
      | item2 | Organisation Name                                 |
      | item3 | Australian Business Number (ABN)                  |
      | item4 | Client Reference Number (CRN)                     |
      | item5 | Subject of Objection                              |
      | item6 | Is the Objection out of time                      |
      | item7 | Reason for failing to lodge the objection on time |
      | item7 | Comments                                          |
    Then I check object with xpath "//*[contains(@id, 'ObjectionInformation')]//..//tr[1]//td[2]" contains "Payroll Tax"
    Then I check object with xpath "//*[contains(@id, 'ObjectionInformation')]//..//tr[2]//td[2]" contains "Penalty"
    Then I check object with xpath "//*[contains(@id, 'ObjectionInformation')]//..//tr[3]//td[2]" contains "Yes"
    Then I check object with xpath "//*[contains(@id, 'ObjectionInformation')]//..//tr[4]//td[2]" contains "LodgementFailureReason"
    Then I check object with xpath "//*[contains(@id, 'ObjectionInformation')]//..//tr[5]//td[2]" contains "ObjectionComment"
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName      |
      | item2 | First Name    |
      | item3 | Last Name     |
      | item3 | Position      |
      | item4 | Organisation  |
      | item5 | Contact Phone |
      | item6 | Email Address |
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[1]//td[2]" contains "<FirstName>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[2]//td[2]" contains "<LastName>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[3]//td[2]" contains "<Position>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[4]//td[2]" contains "<Organisation>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[5]//td[2]" contains "<ContactPhone>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[6]//td[2]" contains "<EmailAddress>"

    Examples: 
      | PortalName | UserName | Password   | FirstName | LastName | Position            | Organisation | ContactPhone | EmailAddress                      |
      | TSS        | jbradley | Dbresults1 | J         | Bradley  | DESIGNATE PTY. LTD. | Consultant   | 04 5678 9767 | jbradley@hotmail.com |
  @fixed
  Scenario Outline: DTSP-105: As an end user, I want to be able to submit an Exemption Request so that I can request for an exemption on my Payroll Tax
    # Bug: Title in Exemption Summary is incorrect, has been raised.
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
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value |
      | s2id_autogen1_search | Aqua  |
    Then I click on button "select2-results-1"
    Then I check "ExemptionStartDateInput" is not readonly
    Then I check "ExemptionEndDateInput" is not readonly
    Then I check "JustificationInput" is not readonly
    #Scenario 4: Error display
    Then I click on button "ExemptionStartDateInput"
    Then I click on "20170520"
    #Then I click on button "calTriggerOut"
    Then I click on button "ExemptionEndDateInput"
    Then I click on "20170519"
    # Then I click on button "calTriggerOut"
    Then I enter the details as
      | Fields             | Value |
      | JustificationInput | TEST  |
    Then I click on button with value "Next"
    #Then I see text "Requested Exemption End Date should be greater than Requested Exemption Start Date" displayed
    Then I see text "Please enter valid dates for your Exemption Request." displayed
    #Scenario 3: "Objection Request" Summary page
    Then I click on button "ExemptionEndDateInput"
    Then I click on "20170521"
    #Then I click on button "calTriggerOut"
    Then I enter the details as
      | Fields             | Value |
      | JustificationInput | TEST  |
    Then I click on button with value "Next"
    Then I check I am on "Exemption Request Summary" page
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                         |
      | item2 | Organisation Name                |
      | item3 | Australian Business Number (ABN) |
      | item4 | Client Reference Number (CRN)    |
      | item5 | Requested Exemption Start Date   |
      | item6 | Requested Exemption End Date     |
      | item7 | Exemption Request Justification  |
      | item7 | Declaration                      |
      | item7 | Organisation                     |
      | item7 | Contact Phone                    |
      | item7 | Email Address                    |
      | item8 | 20 May 2017                      |
      | item9 | 21 May 2017                      |
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[1]//td[2]" contains "<FirstName>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[2]//td[2]" contains "<LastName>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[3]//td[2]" contains "<Position>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[4]//td[2]" contains "<Organisation>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[5]//td[2]" contains "<ContactPhone>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[6]//td[2]" contains "<EmailAddress>"

    Examples: 
      | PortalName | UserName | Password   | FirstName | LastName | Position            | Organisation | ContactPhone | EmailAddress                      |
      | TSS        | jbradley | Dbresults1 | J         | Bradley  | AQUA PTY LTD | Consultant   | 04 5678 9767 | 	jbradley@hotmail.com |

  @has_bug
  Scenario Outline: DTSP-116: As an end user, I want to be able to submit a Payroll Tax Registration Cancellation Request so that I can cancel my current Payroll Tax Registration
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Service Requests"
    Then I click on "Tax Registration Cancellation"
    #Scenario 1: Display "Tax Registration Cancellation" Form
    Then I check "OrganizationalName" is empty
    Then I check "PayrollAnswer_ABN" is empty
    Then I check "PayrollAnswer_CRN" is empty
    Then I check "CancellationStartDate" is readonly
    #Scenario 2: "Payroll Tax Cancellation Information" section becomes
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value  |
      | s2id_autogen1_search | DUSTER |
    Then I click on button "select2-results-1"
    Then I check "CancellationStartDate" is not readonly
    Then I check "ReasonDescription" is not readonly
    ##Scenario 4: Error display
    Then I click on button "CancellationStartDate"
    Then I click on "20170520"
    Then I enter the details as
      | Fields            | Value |
      | ReasonDescription | TEST  |
    Then I click on button with value "Next"
    
    Then I check I am on "Tax Cancellation Request Summary" page
    #Scenario 5: Payroll Tax Cancellation Submission
    
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[1]//td[2]" contains "<FirstName>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[2]//td[2]" contains "<LastName>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[3]//td[2]" contains "<Position>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[4]//td[2]" contains "<Organisation>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[5]//td[2]" contains "<ContactPhone>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[6]//td[2]" contains "<EmailAddress>"
    Then I click on button "CorrectInfoDeclared"
    Then I click on button with value "Submit"
    Then I wait for "4000" millisecond
    #Then I see text "Your Payroll Tax Registration Cancellation Request has been successfully submitted. An email has been sent to you for your reference." displayed
    Then I see text "To download the details you have submitted, please click the button below." displayed
    Then I check I am on "Tax Cancellation Request Confirmation" page

    Examples: 
      | PortalName | UserName | Password   | FirstName | LastName | Position            | Organisation | ContactPhone | EmailAddress                      |
      | TSS        | jbradley | Dbresults1 | J         | Bradley  | 	DUSTER PTY. LIMITED | Consultant   | 04 5678 9767 | 	jbradley@hotmail.com |

    @done
  Scenario Outline: DTSP-124: As an end user, I want to be able to submit an Annual Lodgement Request so that I can submit a request to change my lodgement frequency from monthly to annual
    #Title error in Annual Lodgement Request Summary page, has been flagged
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Service Requests"
    Then I click on "Annual Lodgement Request"
    Then I check "OrganizationalName" is empty
    Then I check "PayrollAnswer_ABN" is empty
    Then I check "PayrollAnswer_CRN" is empty
    Then I check "YearCombo" is readonly
    Then I check "MonthCombo" is readonly
    Then I check "AnnualLodgementRequestJustification" is readonly
    #Scenario 2: "Payroll Tax Cancellation Information" section becomes
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value         |
      | s2id_autogen1_search | DESIGNATE|
    Then I click on button "select2-results-1"
    Then I check "YearCombo" is not readonly
    Then I check "MonthCombo" is readonly
    Then I check "AnnualLodgementRequestJustification" is not readonly
    ##Scenario 4: Error display
    #Scenario 3: "Payroll Tax Cancellation" Summary page
    Then I select "2018" from "YearCombo"
    Then I click on button "MonthCombo"
    Then I click on "Jan"
    And I enter the details as
      | Fields                              | Value |
      | AnnualLodgementRequestJustification | TEST  |
    Then I click on button with value "Next"
    #Scenario 5: Payroll Tax Cancellation Submission
    Then I check I am on "Annual Lodgement Request Summary" page
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                               |
      | item2 | Organisation Name                      |
      | item3 | Australian Business Number (ABN)       |
      | item4 | Client Reference Number (CRN)          |
      | item5 | Requested Effective Date               |
      | item6 | Annual Lodgement Request Justification |
      | item7 | Declaration                               |
      | item7 | Organisation                           |
      | item7 | Contact Phone                          |
      | item7 | Email Address                          |
     Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[1]//td[2]" contains "<FirstName>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[2]//td[2]" contains "<LastName>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[3]//td[2]" contains "<Position>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[4]//td[2]" contains "<Organisation>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[5]//td[2]" contains "<ContactPhone>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[6]//td[2]" contains "<EmailAddress>"
    Then I click on button "CorrectInfoDeclared"
    Then I click on button with value "Submit"
    Then I wait for "4000" millisecond
    #Then I see text "Your Payroll Tax Registration Cancellation Request has been successfully submitted. An email has been sent to you for your reference." displayed
    #Then I see text "To download the details you have submitted, please click the button below." displayed
    Then I check I am on "Annual Lodgement Request Confirmation" page

    Examples: 
      | PortalName | UserName | Password   | FirstName | LastName | Position            | Organisation | ContactPhone | EmailAddress                      |
      | TSS        | jbradley | Dbresults1 | J         | Bradley  | 	DESIGNATE PTY. LTD. | Consultant   | 04 5678 9767 | 	jbradley@hotmail.com |

 @has_bug
  Scenario Outline: DTSP-127: As an end user, I want to be able to submit a Liquidation Advice service request
    #Known error relating to the title of Liquidation Advice Summary and Confirmation page. Has been flagged
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Service Requests"
    Then I click on "Liquidation Advice"
    Then I check "OrganizationalName" is empty
    Then I check "PayrollAnswer_ABN" is empty
    Then I check "PayrollAnswer_CRN" is empty
    Then I check "FirstName" is readonly
    Then I check "LastName" is readonly
    Then I check "PhoneNumber" is readonly
    Then I check "ContactPerson_Email" is readonly
    Then I check "Address_AddressLine" is readonly
    Then I check "Address_City4" is readonly
    Then I check "Address_PostCode" is readonly
    Then I check "CommunicationMethodId" is readonly
    Then I check "CountryId4" is readonly
    Then I check "Address_State4" is readonly
    #Scenario 2: "Payroll Tax Cancellation Information" section becomes
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value     |
      | s2id_autogen1_search | DESIGNATE |
    Then I click on button "select2-results-1"
    Then I check "FirstName" is not readonly
    Then I check "LastName" is not readonly
    Then I check "PhoneNumber" is not readonly
    Then I check "ContactPerson_Email" is not readonly
    Then I check "Address_AddressLine" is not readonly
    Then I check "Address_City4" is not readonly
    Then I check "Address_PostCode" is not readonly
    Then I check "CommunicationMethodId" is not readonly
    Then I check "CountryId4" is not readonly
    Then I check "Address_State4" is not readonly
    ##Scenario 4: Error display
    Then I click on button "LiquidationStartDate"
    Then I click on "20170520"
    Then I click on button "ContactPerson_CommunicationMethodId"
    Then I click on "Email"
    Then I select "Victoria" from "Address_State4"
    Then I enter the details as
      | Fields              | Value |
      | FirstName           | TEST  |
      | LastName            | TEST  |
      | PhoneNumber         | 33 3  |
      | ContactPerson_Email | TES   |
      | Address_AddressLine | TesT  |
      | Address_City4       | TEST  |
      | Address_PostCode    |    33 |
    Then I click on button with value "Next"
    Then I see text "Invalid Phone Number. Phone Number should be 10 digits. Please try again." displayed
    #Then I see text "Invalid Postcode. Postcode should be 4 Digits. Please try again." displayed
    #Then I see text "Incorrect Email Format." displayed
    #Scenario 3: "Payroll Tax Cancellation" Summary page
    Then I enter the details as
      | Fields              | Value           |
      | FirstName           | TEST            |
      | LastName            | TEST            |
      | PhoneNumber         | 33 33333333     |
      | ContactPerson_Email | TES@asdsdaf.com |
      | Address_AddressLine | TesT            |
      | Address_City4       | TEST            |
      | Address_PostCode    |      3333333333 |
    Then I click on button with value "Next"
    Then I check I am on "Liquidation Advice Summary" page
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                         |
      | item2 | Organisation Name                |
      | item3 | Australian Business Number (ABN) |
      | item4 | Client Reference Number (CRN)    |
      | item5 | Liquidation Start Date           |
      | item6 | Liquidator Contact Details       |
      | item2 | First Name                       |
      | item3 | Last Name                        |
      | item3 | Position                         |
      | item4 | Organisation                     |
      | item5 | Contact Phone                    |
      | item6 | Email Address                    |
    #Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[1]//td[2]" contains "<FirstName>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[2]//td[2]" contains "<LastName>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[3]//td[2]" contains "<Position>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[4]//td[2]" contains "<Organisation>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[5]//td[2]" contains "<ContactPhone>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[6]//td[2]" contains "<EmailAddress>"
    #Scenario 5: Payroll Tax Cancellation Submission
    Then I click on button "CorrectInfoDeclared"
    Then I click on button with value "Submit"
    Then I wait for "2000" millisecond
    Then I see text "Liquidation Advice Confirmation" displayed

    Examples: 
      | PortalName | UserName | Password   | FirstName | LastName | Position            | Organisation | ContactPhone | EmailAddress         |
      | TSS        | jbradley | Dbresults1 | J         | Bradley  | DESIGNATE PTY. LTD. | Consultant   | 04 5678 9767 | jbradley@hotmail.com |
	
	@ONHOLD
	Scenario Outline: DTSP-595: As an end user, I want to be able to add/edit/remove ACT group members to my Payroll Tax Group
		Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
   	And I hit Enter
    Then I click on "Group Management"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value         |
      | s2id_autogen1_search | NIGHT PTY LTD |
    Then I click on button "select2-results-1"
    #Scenario 1: Display "Add ACT Group Member" button 
    #Scenario 2: Display "Add ACT Group Member" button 
    
    Then I click on button with value "Create Group"
    Then I wait for "1000" millisecond
    Then I switch to frame "0"
    Then I select "Group Member" from "GroupRoleComboBox"
    Then I select "Common Control" from "GroupReasonComboBox"
    
    Then I click on button with value "SAVE"
    Then I check "AddACTPopUp" exists
    Then I click on button "AddACTPopUp"
    Then I switch to frame "0"
    #Scenario 3: Pop up 
    Then I see text "ABN" displayed
    Then I see text "Group Role" displayed
    Then I see text "Grouping Reason" displayed
    Then I see text "Other Grouping Reason" displayed
    Then I click on button "GroupRoleComboBox"
    Then I click on "Group Member"
    Then I select "Common Control" from "GroupReasonComboBox"
      And I enter the details as
      | Fields        | Value      |
      | GrpMember_ABN | 78602736943 |
    #Scenario 4: Save button activated 
    Then I check "PopUpSaveBT" is not readonly
    #Scenario 5: Successfully validated ABN in PSRM 
    Then I click on button "PopUpSaveBT"
    
    #Scenario 6: Unsuccessfully validated ABN in PSRM 
    Then I click on button "AddACTPopUp"
    Then I switch to frame "0"
    Then I click on button "GroupRoleComboBox"
    Then I click on "Group Member"
    Then I select "Common Control" from "GroupReasonComboBox"
    And I enter the details as
      | Fields        | Value      |
      | GrpMember_ABN | 22222222222 |
    Then I click on button "PopUpSaveBT"
    Then I see text "Please enter an ABN that is registered for Payroll Tax" displayed
    
    #Scenario 14: Adding a Group Member validations 
    Then I click on button "AddACTPopUp"
    Then I switch to frame "0"
    Then I click on button "GroupRoleComboBox"
    Then I click on "Group Member"
    Then I select "Common Control" from "GroupReasonComboBox"
    And I enter the details as
      | Fields        | Value      |
      | GrpMember_ABN | 67607795808 |
    Then I click on button "PopUpSaveBT"
    Then I see text "Please enter an ABN that is not already part of a Payroll Tax Group." displayed
    
    #Scenario 15: Group Member (lodging for itself) 
    #Then I click on button "l03_wtPopupLink"
    #Then I switch to frame "0"
    #Then I click on button "GroupRoleComboBox"
    #Then I click on "Group Member (lodging itself)"
    #Then I select "Common Control" from "GroupReasonComboBox"
    #Then I click on button "PopUpSaveBT"
    #Then I click on button "ctl03_wt83"
    #Then I see text "The nominated DGE cannot have a Group Role of 'Group Member (lodging itself)" displayed
    
    #Scenario 7: Remove ACT Group Member 
    Then I click on button "ctl03_wt127"
    Then I see "Do you really want to remove the organisation from your Payroll Tax Group?" displayed on popup and I click "OK"
    Then I see text "FORMULA CHARGER PTY. LTD." not displayed
    
    Then I click on button "ctl03_wt127"
     Then I see "Do you really want to remove the organisation from your Payroll Tax Group?" displayed on popup and I click "OK"
    
    #Scenario 16: DGE 
    #Then I click on button "l03_wtPopupLink"
    #
       #Then I switch to frame "0"
    #Then I click on button "GroupRoleComboBox"
    #Then I click on "Group Member (lodging itself)"
    #Then I select "Common Control" from "GroupReasonComboBox"
    #Then I click on button "PopUpSaveBT"
    #Then I click on button "ctl03_wt83"
    #Then I see text "The nominated DGE cannot have a Group Role of 'Group Member (lodging itself)" displayed
    #
    #
    #Scenario 12: User attempts to remove themselves 
   	Then I select "2018" from "YearCombo"
    Then I select "Jan" from "MonthCombo"
    Then I click on button with value "Next"
    
    #popup has extraneous spacing
    Then I see "You have elected to remove yourself from this Payroll Tax Group. Do you wish to proceed?" displayed on popup and I click "Cancel"
    
    #Scenarios 5, 6, 9, 10, 11 are best done manually
    
    Examples: 
      | PortalName | UserName | Password   |
      | TSS        | jbradley | Dbresults1 |
      
  @done
	Scenario Outline: DTSP-596: As a Payroll Tax Group member, I want to be able to view the details of my Payroll Tax Group
		Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
   	And I hit Enter
    Then I click on "Group Management"
    
    #Scenario 1: Display "Group Management" Form 
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                     |
      | item2 | Choose a Taxpayer ABN |
      | item3 | Organisational Name             |
      | item4 | Australian Business Number (ABN)           |
      | item5 | Client Reference Number (CRN)                   |
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value         |
      | s2id_autogen1_search | LONG LOG |
    Then I click on button "select2-results-1"
    
    
    #Scenario 4: "Group Management" "Update Group" button 
    Then I click on button with value "Update Group"
		Then I click on button with value "Add Act Group Member"
		Then I switch to frame "0"
		Then I click on button with value "Cancel"
		
		Then I click on button with value "Add Non-Act Group Member"
		Then I switch to frame "0"
		Then I click on button with value "Cancel"
		
		Then I click on "Group Management"
		 Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value         |
      | s2id_autogen1_search | LOG ON |
    Then I click on button "select2-results-1"
    Then I click on button with value "Update Group"
    
    #Scenario 5: View no "ACT Group Members" 
    Then I click on button "ctl03_wt127"
    Then I see "Do you really want to remove the organisation from your Payroll Tax Group?" displayed on popup and I click "OK"
    
    Then I click on button "ctl03_wt127"
    Then I see "Do you really want to remove the organisation from your Payroll Tax Group?" displayed on popup and I click "OK"
    
    Then I click on button "ctl03_wt127"
    Then I see "Do you really want to remove the organisation from your Payroll Tax Group?" displayed on popup and I click "OK"
    
    Then I see text "You currently do not have any group members" displayed
    
    #Scenario 6: View no "Non-ACT Group Members" 
    Then I see text "You currently do not have any non-ACT group members" displayed
    
    #Scenario 7: Selected ABN not part of payroll tax group 
    Then I click on "Group Management"
		Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value         |
      | s2id_autogen1_search | DAY |
    Then I click on button "select2-results-1"
   	Then I see text "You are not currently a part of a Payroll Tax Group" displayed
   	Then I click on button with value "Create Group"
   	Then I switch to frame "0"
   	 Then I click on button "GroupRoleComboBox"
    Then I click on "Group Member (lodging itself)"
    Then I select "Common Control" from "GroupReasonComboBox"
    Then I click on button "PopUpSaveBT"
   	
   	#Scenario 13: Page Title 
   	Then I click on "Group Management"
   	Then I see text "Payroll Tax Group Summary" displayed
   	Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value         |
      | s2id_autogen1_search | DAY |
    Then I click on button "select2-results-1"
   	#Scenario 10: Adding selected ABN to group first 
   	Then I click on button with value "Create Group"
   	Then I switch to frame "0"
   	Then I check "GrpMember_ABN" contains "44105791697"
   	Then I check "RichWidgets_wt18_block_wtMainContent_wt13" contains "DAY & CO PTY LIMITED"
    Then I select "Group Member" from "GroupRoleComboBox"
    Then I select "Common Control" from "GroupReasonComboBox"
    Then I click on button with value "Save"
    Then I see text "Update Payroll Tax Group" displayed
   	
   	Then I see text "DAY & CO PTY LIMITED" displayed
   	Then I see text "44105791697" displayed
   	
    #Scenarios 2, 3, 8, 9, 12 are best done manually
    
    Examples: 
      | PortalName | UserName | Password   |
      | TSS        | jscott | Dbresults1 |
	
	@onhold
	Scenario Outline: DTSP-646: Update phone number field validation rules to reflect Australian numbers and allow future dates selection in PayRoll Tax Registration form
	 Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    
    #Scenario 1: User enters Phone Number on any TSS forms 
      Then I click on "Payroll Tax Registration"
    Then I wait for "1000" millisecond
    And I enter the details as
      | Fields                 | Value       |
      | RegistrationAnswer_ABN | 83117378917 |
    Then I click on button with value "Next"
    Then I wait for "1500" millisecond
    Then I enter the details as
      | Fields              | Value              |
      | EmployerName        | <CompanyName> |
      | BusinessTradingName | <CompanyName>  |
    Then I select "Government" from "SelectBusinessTypeCode"
		Then I click on button "TaxPayerDetailsNextBT"

    And I enter the details as
      | Fields        | Value      |
      | ContactPerson_PhoneNumber | 3333333333 |
    Then I check "ContactPerson_PhoneNumber" contents match regex "\d\d \d\d\d\d \d\d\d\d"
   	
		#Then I click on "Payroll Tax Registration"
    #Then I check "TaxPayerDetailsNext" is readonly
    #Then I select "Mr" from "ContactPerson_Title"
    Then I select "Direct Post" from "CommunicationMethodId"
    Then I enter the details as
      | Fields                    | Value              |
      | AddressLine1              | TEST               |
      | Address_City              | TEST               |
      | ContactPerson_FirstName   | TEST               |
      | ContactPerson_LastName    | TEST               |
      | ContactPerson_Email       | TEST@TEST.com      |
      | PostCode                  |        3333 |
      | ContactPerson_PhoneNumber |    1234567890 |
    #Then I select "AL" from "Address_State"
    Then I click on button "AddressLine1"
    # Then I see text "Title" not displayed
    Then I click on button "OrgDetailsNextBt"
    #Scenario 1:User should see 4 digit codes after industry name (retrieved from PSRM) under the Business Activity Category dropdown
    Then I see text "Business Activity Elsewhere in Australia" displayed
    #Then I click on button "ACTWagesPaidBackBt"
    Then I click on "Payroll Tax Registration"
    Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "OK"
     Then I wait for "1000" millisecond
    And I enter the details as
      | Fields                 | Value       |
      | RegistrationAnswer_ABN | 83117378917 |
    Then I click on button with value "Next"
    Then I wait for "1500" millisecond
    Then I enter the details as
      | Fields              | Value              |
      | EmployerName        | <CompanyName> |
      | BusinessTradingName | <CompanyName>  |
    Then I select "Government" from "SelectBusinessTypeCode"
		Then I click on button "TaxPayerDetailsNextBT"

    And I enter the details as
      | Fields        | Value      |
      | ContactPerson_PhoneNumber | 3333333333 |
    Then I check "ContactPerson_PhoneNumber" contents match regex "\d\d \d\d\d\d \d\d\d\d"
   	
		#Then I click on "Payroll Tax Registration"
    #Then I check "TaxPayerDetailsNext" is readonly
    #Then I select "Mr" from "ContactPerson_Title"
    Then I select "Direct Post" from "CommunicationMethodId"
    Then I enter the details as
      | Fields                    | Value              |
      | AddressLine1              | TEST               |
      | Address_City              | TEST               |
      | ContactPerson_FirstName   | TEST               |
      | ContactPerson_LastName    | TEST               |
      | ContactPerson_Email       | TEST@TEST.com      |
      | PostCode                  |        3333 |
      | ContactPerson_PhoneNumber |    1234567890 |
    
    
    And I enter the details as
      | Fields        | Value      |
      | ContactPerson_PhoneNumber | 33333333 |
    Then I click on button "OrgDetailsNextBt"
    Then I see text "Invalid Phone Number. Phone Number should be 10 digits. Please try again." displayed
    And I enter the details as
      | Fields        | Value      |
      | ContactPerson_PhoneNumber | 3333333333 |
     Then I click on button "OrgDetailsNextBt"
      Then I click on button "select2-chosen"
    Then I enter the details as
      | Fields               | Value |
      | s2id_autogen1_search |  6940 |
    Then I click on button "select2-results"

     #
    #Then I click on "Payroll Tax Registration Updates"
    Then I click on "Tax Registration Update"
    Then I click on "Update Payroll Contact Details"
		Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "OK"
    
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value         |
      | s2id_autogen1_search | AQUA |
    Then I click on button "select2-results-1"
		And I enter the details as
      | Fields        | Value      |
      | ContactPerson_PhoneNumber | 3333333333 |
    Then I check "ContactPerson_PhoneNumber" contents match regex "\d\d \d\d\d\d \d\d\d\d"
    #Then I click on button with value "Next"
    #Then I check I am on "Update Contact Details Summary" page
    #Then I click on button with value "Back"
    And I enter the details as
      | Fields        | Value      |
      | ContactPerson_PhoneNumber | 33333333 |
    Then I click on button with value "Next"
    Then I see text "Invalid Phone Number. Phone Number should be 10 digits. Please try again." displayed
    Then I click on "User Profile"
    Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "OK"
    Then I click on button with value "Edit User Profile"
    And I enter the details as
    	| Fields		| Value |
    	| PhoneNumber | 04567897 |
   	Then I click on button with value "Submit"
   	Then I see text "Invalid Phone Number. Phone Number should be 10 digits. Please try again." displayed
   	And I enter the details as
    	| Fields		| Value |
    	| PhoneNumber | 0456789767 |
   	
   	Then I click on button with value "Submit"
   	Then I check I am on "View User Profile" page
   	
   	#Scenarios 3 and 4 are best done manuallyS
    
		 Examples: 
      | PortalName | CompanyName                  | ABN         | UserName | Password   |
      | TSS        | The Fire Company Pty Limited | 83117378917 | jbradley | Dbresults1 |
	
  @review
  Scenario Outline: DTSP-647: Update Payroll Tax Registration form for ease of use
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    #Scenario 3:The User should not see any Title field on the Payroll Tax Registration Form
     Then I click on "Payroll Tax Registration"
    Then I wait for "1000" millisecond
    And I enter the details as
      | Fields                 | Value       |
      | RegistrationAnswer_ABN | 83117378917 |
    Then I click on button with value "Next"
    Then I wait for "1500" millisecond
    Then I enter the details as
      | Fields              | Value              |
      | EmployerName        | <CompanyName> |
      | BusinessTradingName | <CompanyName>  |
    Then I select "Government" from "SelectBusinessTypeCode"
		Then I click on button "TaxPayerDetailsNextBT"

    And I enter the details as
      | Fields        | Value      |
      | ContactPerson_PhoneNumber | 3333333333 |
    Then I check "ContactPerson_PhoneNumber" contents match regex "\d\d \d\d\d\d \d\d\d\d"
   	
		#Then I click on "Payroll Tax Registration"
    #Then I check "TaxPayerDetailsNext" is readonly
    #Then I select "Mr" from "ContactPerson_Title"
    Then I select "Direct Post" from "CommunicationMethodId"
    Then I enter the details as
      | Fields                    | Value              |
      | AddressLine1              | TEST               |
      | Address_City              | TEST               |
      | ContactPerson_FirstName   | TEST               |
      | ContactPerson_LastName    | TEST               |
      | ContactPerson_Email       | TEST@TEST.com      |
      | PostCode                  |        3333 |
      | ContactPerson_PhoneNumber |    1234567890 |
    #Then I select "AL" from "Address_State"
    Then I click on button "AddressLine1"
    # Then I see text "Title" not displayed
    Then I click on button "OrgDetailsNextBt"
    #Scenario 1:User should see 4 digit codes after industry name (retrieved from PSRM) under the Business Activity Category dropdown
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value |
      | s2id_autogen1_search |  4400 |
    Then I click on button "select2-results-1"
    #Then I see text "Accomodation" displayed
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value |
      | s2id_autogen1_search |  6932 |
    Then I click on button "select2-results-1"
    # Then I see text "Accounting Services" displayed
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value |
      | s2id_autogen1_search |  6940 |
    Then I click on button "select2-results-1"
    # Then I see text "Advertising Services" displayed
    Then I click on button "ACTWagesPaidNext"
    #Scenario 2: User should only see 2 options "Yes" or "No" in the radio buttons for the question “Are you a member of a group?”
    Then I click on button "GroupMember_YES"
    Then I click on button "GroupMember_NO"
    #Scenario 5: "Provide Group Number" field should be options
    Then I click on button "GroupMember_YES"
    Then I see text "Provide group number" displayed
    #Scenario 4: The User should not see any Title field on the Update Contact Person Form
    Then I click on "Tax Registration Update"
    Then I click on "Update Payroll Contact Details"

    Then I see text "Title" not displayed
    		 Examples: 
      | PortalName | CompanyName                  | ABN         | UserName | Password   |
      | TSS        | The Fire Company Pty Limited | 83117378917 | jbradley | Dbresults1 |
      
  @redo
  Scenario Outline: DTSP-649: Add Validation Rules and make other changes to the Payroll Tax Lodgement Form
   Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
   Then I click on "Lodgements"
   Then I click on "Payroll Tax"
   Then I click on button "Discard"
	#Scenario 1: Australia-wide Wages incl. ACT >= ACT Taxable Wages 
	#Scenario 4: Days where you paid or were liable to pay taxable or interstate <= no. of days in that particular filing period 
	
	 Then I click on button "select2-chosen-1"
   Then I enter the details as
      | Fields               | Value         |
      | s2id_autogen1_search | QUICK SINGLE |
   Then I click on button "select2-results-1"
	 Then I click on "Annual Reconciliation"
	 Then I select "2016" from "AnnualObligationSelect"
	 Then I click on button with value "Save and Next"
	 Then I click on button "ClaimingACTProportion_Yes"
	 Then I enter the details as
      | Fields                                         | Value |
      | SalariesAndWages                               |     1000000 |
      | BonusesAndCommissions                          |     1 |
      | LodgePayrollAnswer_Commissions                 |     1 |
      | LodgePayrollAnswer_Allowances                  |     1 |
      | LodgePayrollAnswer_DirectorsFees               |     1 |
      | LodgePayrollAnswer_EligibleTerminationPayments |     1 |
      | LodgePayrollAnswer_ValueOfBenefits             |     1 |
      | LodgePayrollAnswer_ShareValue                  |     1 |
      | LodgePayrollAnswer_ServiceContracts            |     1 |
      | LodgePayrollAnswer_Superannuation              |     1 |
      | LodgePayrollAnswer_OtherTaxablePayment         |     1 |
      | LodgePayrollAnswer_ExemptWages                 |     1 |
      | AustralianWide																 | 999 	 |
      | DaysPaidTaxable 															 | 367  	 |
    Then I click on button "SubmitBT"
    Then I see text "Your Aus wide group wages (including ACT) must be equal to or greater than your ACT wages." displayed
		Then I see text "Days where you paid or were liable to pay taxable or interstate should be less than or equal to the number of days in that particular filing period." shown
#		Then "<Item>" is displayed as "<ItemName>"
      #| Item  | ItemName      |
      #| item2 | Your Aus wide group wages (including ACT) must be equal to or greater than your ACT wages.    |
      #| item3 | Days where you paid or were liable to pay taxable or interstate should be less than or equal to the number of days in that particular filing period.     |
		Then I click on "Payroll Tax"
		Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "OK"
		Then I click on button "Discard"
		#Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "OK"
		
	#Scenario 2: Group ACT Wages >= ACT Taxable Wages 
	#Scenario 3: Australia-wide Group Wages incl. ACT >= Group ACT Wages 
	
	 Then I click on button "select2-chosen-1"
   Then I enter the details as
      | Fields               | Value         |
      | s2id_autogen1_search | DESIGNATE |
   Then I click on button "select2-results-1"
	 Then I click on "Monthly Return"
	 Then I select "Dec 2016" from "MonthlyObligationSelect"
	 Then I click on button with value "Save and Next"
	 Then I click on button "ClaimingACTProportion_Yes"
	 Then I enter the details as
      | Fields                                         | Value |
      | SalariesAndWages                               |     1000000 |
      | BonusesAndCommissions                          |     1 |
      | LodgePayrollAnswer_Commissions                 |     1 |
      | LodgePayrollAnswer_Allowances                  |     1 |
      | LodgePayrollAnswer_DirectorsFees               |     1 |
      | LodgePayrollAnswer_EligibleTerminationPayments |     1 |
      | LodgePayrollAnswer_ValueOfBenefits             |     1 |
      | LodgePayrollAnswer_ShareValue                  |     1 |
      | LodgePayrollAnswer_ServiceContracts            |     1 |
      | LodgePayrollAnswer_Superannuation              |     1 |
      | LodgePayrollAnswer_OtherTaxablePayment         |     1 |
      | LodgePayrollAnswer_ExemptWages                 |     1 |
      | GroupActWages																 | 10 	 |
      | AustralianWide																 | 999 	 |
    Then I click on button "SubmitBT"
  Then I see text "Group ACT wages must be equal to or greater than ACT taxable wages or ACT joint taxable wages and equal to or less than Australia-wide wages." displayed
#		Then I click on "Payroll Tax Lodgement"
#		Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "OK"
#		Then I click on button "Discard"
	
	#Scenario 5: Days where 1 group member paid or was liable to pay taxable or interstate <= no. of days in that particular filing period 
Then I click on "Payroll Tax"
		Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "OK"
		Then I click on button "Discard"
   Then I click on button "select2-chosen-1"
   Then I enter the details as
      | Fields               | Value         |
      | s2id_autogen1_search | DESIGNATE |
   Then I click on button "select2-results-1"
	 Then I click on "Annual Reconciliation"
	 Then I select "2015" from "AnnualObligationSelect"
	 Then I click on button with value "Save and Next"
	 Then I click on button "ClaimingACTProportion_Yes"
	 Then I enter the details as
      | Fields                                         | Value |
      | SalariesAndWages                               |     1000000 |
      | BonusesAndCommissions                          |     1 |
      | LodgePayrollAnswer_Commissions                 |     1 |
      | LodgePayrollAnswer_Allowances                  |     1 |
      | LodgePayrollAnswer_DirectorsFees               |     1 |
      | LodgePayrollAnswer_EligibleTerminationPayments |     1 |
      | LodgePayrollAnswer_ValueOfBenefits             |     1 |
      | LodgePayrollAnswer_ShareValue                  |     1 |
      | LodgePayrollAnswer_ServiceContracts            |     1 |
      | LodgePayrollAnswer_Superannuation              |     1 |
      | LodgePayrollAnswer_OtherTaxablePayment         |     1 |
      | LodgePayrollAnswer_ExemptWages                 |     1 |
      | AustralianWide																 | 999 	 |
      | GroupActWages																 	| 10 	 	|
      | DaysPaidTaxable 															 | 999  	 |
    Then I click on button "SubmitBT"
    Then I see text "Days where 1 group member paid or was liable to pay taxable or interstate should be less than or equal to the number of days in that particular filing period." shown
   #Scenario 6: Hints to remind users of the max. no. of days in that filing period 
    Then I see text "Max days" displayed
    
    #Scenario 7: Accordion header and layout of the "Wages / Reconciliation" section 
        Then I check object with xpath "//*[contains(@id, 'Titlewages')]//div[3]" contents match regex "\(\d{2} \w+ \d{4} - \d{2} \w+ \d{4} / [\w|\s|\W|\(|\)]+\)"
   
		#Scenario 9: "Monthly Return" and "Annual Reconciliation" section    
    Then I see text "Monthly Return" not displayed
    Then I see text "Annual Reconciliation" not displayed
	
		#Scenario 8: "Total Amount" section 
		Then I enter the details as
      | Fields                                         | Value |
			| AustralianWide																 | 10000000 	 |
      | GroupActWages																 		| 10000000 	 	|
      | DaysPaidTaxable 															 | 150  	 |
		Then I click on button "SubmitBT"
		Then I see text "Less Total Tax Paid" not displayed

	
	

  
  Examples: 
      | PortalName | UserName | Password   | UserName2 |
      | TSS        | jbradley | Dbresults1 | jscott 	 |

	@review
	Scenario Outline: DTSP-676:  As a Payroll Tax Group Member, I want to be able to add/edit/remove 'Non-ACT Group Members' to my group
		Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
     Then I click on "Group Management"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value         |
      | s2id_autogen1_search | QUICK SINGLE |
    Then I click on button "select2-results-1"
    Then I click on button with value "Create Group"
    Then I wait for "2000" millisecond
    Then I switch to frame "0"
    Then I select "Group Member" from "GroupRoleComboBox"
    Then I select "Common Control" from "GroupReasonComboBox"
    Then I click on button with value "SAVE"
    Then I check "AddNonActPopUp" exists
    
    #Scenario 2: Display "Add Non-ACT Group Member" button 
     Then I click on "Group Management"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value         |
      | s2id_autogen1_search | DESIGNATE |
    Then I click on button "select2-results-1"
    Then I click on button with value "Update Group"
    
    Then I check "AddNonActPopUp" exists
    
    #Scenario 3: Pop up 
    Then I click on button "AddNonActPopUp"
    Then I wait for "2000" millisecond
    Then I switch to frame "0"
    Then I check "OverseasRadioButtonYES" exists
    Then I check "OverseasRadioButtonNO" exists
    Then I check "RegisteredName" exists
    Then I check "OverseasRegNumber" exists
    Then I check "CountryComboBox" exists
    Then I check "GrpMember_ABN" exists
    Then I check "GrpMember_State" exists
    
    #Scenario 4: Save button activated
    Then I click on button "OverseasRadioButtonYES"
    Then I enter the details as
      | Fields               | Value         |
      | RegisteredName |TEST NON ACT  |
      | OverseasRegNumber | 234234234|
    Then I select "Lebanon" from "CountryComboBox"
    Then I check "PopUpSaveBT" is not readonly
    Then I click on button "PopUpSaveBT"

    
    
    #Scenarios 5, 6 and 7 are best tested manually
    
    Examples: 
      | PortalName | UserName | Password   |
      | TSS        | jbradley | Dbresults1 |

      
  @onhold
  Scenario Outline: DTSP-682: Update Country field in Pay Roll Tax Registration form
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Tax Registration Update"
    Then I click on "Update Business Address"
    #Scenario 2: Update Business Address Form
    Then I check "CountryCode" is readonly
    Then I check "CountryCode" contains "AUS"
    Then I click on button "Address_State"
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                     |
      | item2 | Australian Capital Territory |
      | item3 | New South Wales              |
      | item4 | Northern Territory           |
      | item5 | Queensland                   |
      | item6 | South Australia              |
      | item7 | Tasmania                     |
      | item7 | Victoria                     |
      | item7 | Western Australia            |
      
    #Scenario 3: Update Contact Person Form 
		Then I click on "Update Payroll Contact Details"
		Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value         |
      | s2id_autogen1_search | DESIGNATE |
    Then I click on button "select2-results-1"
    Then I check "CountryId4" contains "AUS"
    Then I click on button "Address_State"
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                     |
      | item2 | Australian Capital Territory |
      | item3 | New South Wales              |
      | item4 | Northern Territory           |
      | item5 | Queensland                   |
      | item6 | South Australia              |
      | item7 | Tasmania                     |
      | item7 | Victoria                     |
      | item7 | Western Australia            |
    Then I select "Aruba" from "CountryId"
    Then I see text "Postcode" not displayed
    Then I see text "Territory" not displayed
    Then I see text "Suburb" not displayed
    #Scenario 1: Payroll Tax Registration Form 
    Then I click on "Payroll Tax Registration"
    Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "OK"
      And I enter the details as
      | Fields                 | Value       |
      | RegistrationAnswer_ABN | 83117378917 |
    Then I click on button with value "Next"
    Then I wait for "1500" millisecond
    Then I enter the details as
      | Fields              | Value              |
      | EmployerName        | <CompanyName> |
      | BusinessTradingName | <CompanyName>  |
    Then I select "Government" from "SelectBusinessTypeCode"
		Then I click on button "TaxPayerDetailsNextBT"
    Then I check "CountryCode" is readonly
    Then I check "CountryCode" contains "AUS"
    Then I click on button "CheckBusinessAdress"
    Then I check "CountryCode2" contains "AUS"
    Then I click on button "Address_State2" 
     Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                     |
      | item2 | Australian Capital Territory |
      | item3 | New South Wales              |
      | item4 | Northern Territory           |
      | item5 | Queensland                   |
      | item6 | South Australia              |
      | item7 | Tasmania                     |
      | item7 | Victoria                     |
      | item7 | Western Australia            |
    Then I click on button "Address_CountryCode2"
    Then I click on "Aruba"
   # Then I select "Aruba" from "CountryCode2"
    Then I check "Address_City2" does not exist
    Then I check "Address_PostCode2" does not exist
    Then I check "Address_State2" does not exist
    
    Then I click on button "CheckSameAsJurisdiction"
    Then I check "CountryCode3" contains "AUS"
    Then I click on button "Address_State3" 
     Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                     |
      | item2 | Australian Capital Territory |
      | item3 | New South Wales              |
      | item4 | Northern Territory           |
      | item5 | Queensland                   |
      | item6 | South Australia              |
      | item7 | Tasmania                     |
      | item7 | Victoria                     |
      | item7 | Western Australia            |
    Then I click on button "CountryCode3"
    Then I click on "Aruba"
    Then I check "Address_City3" does not exist
    Then I check "Address_PostCode3" does not exist
    Then I check "Address_State3" does not exist
    Examples: 
      | PortalName | CompanyName                  | ABN         | UserName | Password   |
      | TSS        | The Fire Company Pty Limited | 83117378917 | jbradley | Dbresults1 |
      
 @review
   Scenario Outline: DTSP-758: As an end user, I want to be limited to only a month and year selection when I am creating/editing my Payroll Tax Group
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Group Management"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value         |
      | s2id_autogen1_search | DESIGNATE |
    Then I click on button "select2-results-1"
   	Then I click on button with value "Update Group"
   	
   	#Scenario 1
   	Then I click on button "YearCombo"
   	Then I see text "2012" displayed
   	Then I see text "2013" displayed
   	Then I see text "2014" displayed
   	Then I see text "2015" displayed
   	Then I see text "2016" displayed
   	Then I see text "2017" displayed
   	Then I see text "2018" displayed
   	Then I see text "2019" displayed
   	
   	#Scenario 2
   	Then I click on button "MonthCombo"
   	Then I see text "Jan" displayed
   	Then I see text "Feb" displayed
   	Then I see text "Mar" displayed
   	Then I see text "Apr" displayed
   	Then I see text "May" displayed
   	Then I see text "Jun" displayed
   	Then I see text "Jul" displayed
   	Then I see text "Aug" displayed
   	Then I see text "Sep" displayed
   	Then I see text "Oct" displayed
   	Then I see text "Nov" displayed
   	Then I see text "Dec" displayed
   	
   	#Scenario 3
   	
   Examples: 
      | PortalName | UserName | Password   |
      | TSS        | jbradley | Dbresults1 |
	
  
	###########################################################################################################
  #################################### PHASE 1.1 ITERATION 3 ################################################
  ###########################################################################################################

	 @review
  Scenario Outline: DTSP-89: As an end user, I want to be able to view my Activity History so that I can track my previous activities
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    #Scenario 1: Left navigation menu item
    Then I see text "Activity History" displayed
    Then I click on "Activity History"
    #Scenario 2: Activity History page
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName          |
      | item2 | ACTIVITY DATE     |
      | item3 | ACTIVITY TYPE     |
      | item4 | ABN               |
      | item5 | ORGANISATION NAME |
      | item6 | DESCRIPTION       |
    #Scenario 3: More than 10 activity history
    Then I check "ListNavigation_PageNumber" exists
    Then I click on "Sign Out"
    #Scenario 4: No Activity History
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | testman1   |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Activity History"
    Then I see text "You do not have any activity history available." displayed

    Examples: 
      | PortalName | UserName | Password   |
      | TSS        | jbradley | Dbresults1 |

   @review
  Scenario Outline: DTSP-108: As an end user, I want to raise a Generic Request so that I don't need to contact customer service.
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Service Requests"
    Then I click on "Generic Request"
    #Scenario 1: Display "Generic Request" Form
    Then I check "OrganizationalName" is readonly
    Then I check "PayrollAnswer_ABN" is readonly
    Then I check "PayrollAnswer_CRN" is readonly
    Then I check "GenericRequest_CommunicateWith" is readonly
    Then I check "GenericRequest_RequestType" is readonly
    Then I check "GenericRequest_RequestComments" is readonly
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value |
      | s2id_autogen1_search | DESIGNATE  |
    Then I click on button "select2-results-1"
    #Scenario 2: "Request Details" section displayed on the "Generic Request" Form
    Then I check "OrganizationalName" is readonly
    Then I check "PayrollAnswer_ABN" is readonly
    Then I check "PayrollAnswer_CRN" is readonly
    Then I check "GenericRequest_CommunicateWith" is not readonly
    Then I check "GenericRequest_RequestType" is not readonly
    Then I check "GenericRequest_RequestComments" is not readonly
    #Scenario 4: Does not trigger.
    #Scenario 6: requires manual testing
    #Scenario 3: Request details pass PSRM validation
    Then I select "Requestor" from "GenericRequest_CommunicateWith"
    Then I select "General Enquiry" from "GenericRequest_RequestType"
    Then I enter the details as
      | Fields                         | Value |
      | GenericRequest_RequestComments | TEST  |
    Then I click on button with value "Next"
    Then I check I am on "Generic Request Summary" page
    Then I click on button with value "Submit"
    Then I wait for "2000" millisecond
    Then I check I am on "Generic Request Confirmation" page
    Then I see text "Your Generic Request has been successfully submitted. An email has been sent to you for your reference." displayed
    Then I see text "To download the details you have submitted, please click the button below." displayed

    Examples: 
      | PortalName | UserName | Password   |
      | TSS        | jbradley | Dbresults1 |

 @review
  Scenario Outline: DTSP-574: As an end user I want to be able to see a summary of my payroll tax details on the dashboard so that I know if my information is up-to-date
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I check I am on "Home" page
    Then I see text "Home" displayed
    #Scenario 2: Edit Contact Person
    Then I click on button "ContactPerson_Edit"
    Then I check I am on "Update Contact Details" page
    #Scenario 3: Edit Employer Status
    Then I click on "Home"
    Then I click on button "Home_GroupManagement_Edit"
    Then I check I am on "Group Management" page
    #Scenario 4: Edit Mailing Address
    Then I click on "Home"
    Then I click on button "PostalAddress_Edit"
    Then I check I am on "Update Contact Details" page
    #Scenario 5: Update Net Amount Due section
    Then I click on "Home"
    Then I see text "Account Balance" displayed
    Then I check "NetAmountDueContainer" has CSS property "font-size" with value "14.6667px"
    #Scenario 6: Next Payment Due box
    Then I see text "Next Payment Due" not displayed
    # #Scenario 7: 'Transactions History'
    Then I check "MonthlyTable" exists
    Then I check "YearlyTable" exists
    #Scenario 8: Credit payments
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value |
      | s2id_autogen1_search | NIGHT  |
    Then I click on button "select2-results-1"
    Then I wait for "1000" millisecond
    Then I check object with xpath "//*[contains(@id, 'TableRecords1')]//tbody//tr/td[4]/div" contents match regex "\(\$[\d|,|\.|]+\)"

    Examples: 
      | PortalName | UserName | Password   |
      | TSS        | jbradley | Dbresults1 |

  Scenario Outline: DTSP-685: As an end user, I want all pre populated and non editable fields on the portal to be greyed out
    #Scenario 1: Portal Registration
    Given I want to login to portal "<PortalName>"
    Then I click on "Create Account"
    Then I click on "Register as a Business"
    Then I enter the details as
      | Fields                  | Value       |
      | InputABNNumber_Business | 91098629095 |
      | InputCRNNumber_Business |      400004 |
    Then I click on button "TermsandConditionsCheckBox2"
    Then I click on button "RegistrationSubmit"
    Then I check "Column2_wtABN" is readonly
    Then I check "Column2_wtCRN" is readonly
    Then I check "Column2_wtBusinessName" is readonly
    #Scenario 2: All forms
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Service Requests"
    Then I click on "Annual Lodgement Request"
    Then I check "OrganizationalName" is readonly
    Then I check "PayrollAnswer_ABN" is readonly
    Then I check "PayrollAnswer_CRN" is readonly
    Then I check "YearCombo" is readonly
    Then I check "MonthCombo" is readonly
    Then I click on "Exemption Request"
    Then I check "OrganizationalName" is readonly
    Then I check "PayrollAnswer_ABN" is readonly
    Then I check "PayrollAnswer_CRN" is readonly
    Then I check "ExemptionStartDateInput" is readonly
    Then I check "ExemptionEndDateInput" is readonly
    Then I check "JustificationInput" is readonly
    Then I click on "Liquidation Advice"
    Then I check "OrganizationalName" is readonly
    Then I check "PayrollAnswer_ABN" is readonly
    Then I check "PayrollAnswer_CRN" is readonly
    Then I check "FirstName" is readonly
    Then I check "LastName" is readonly
    Then I check "PhoneNumber" is readonly
    Then I check "ContactPerson_Email" is readonly
    Then I check "Address_AddressLine" is readonly
    Then I check "Address_City4" is readonly
    Then I check "Address_PostCode" is readonly
    Then I check "CommunicationMethodId" is readonly
    Then I check "CountryId4" is readonly
    Then I check "Address_State4" is readonly
    Then I click on "Generic Request"
    Then I check "OrganizationalName" is readonly
    Then I check "PayrollAnswer_ABN" is readonly
    Then I check "PayrollAnswer_CRN" is readonly
    Then I check "GenericRequest_CommunicateWith" is readonly
    Then I check "GenericRequest_RequestType" is readonly
    Then I check "GenericRequest_RequestComments" is readonly
    Then I click on "Objection Request"
    Then I check "OrganizationalName" is readonly
    Then I check "PayrollAnswer_ABN" is readonly
    Then I check "PayrollAnswer_CRN" is readonly
    Then I check "Objection_Comments" is readonly
    Then I check "ObjectionOutOfTimeYES" is readonly
    Then I check "ObjectionOutOfTimeNO" is readonly
    Then I check "CheckTaxAmount" is readonly
    Then I check "CheckPenalty" is readonly
    Then I check "CheckInterest" is readonly
    Then I check "CheckDecision" is readonly
    
    Then I click on "Tax Registration Cancellation"
    Then I check "OrganizationalName" is readonly
    Then I check "PayrollAnswer_ABN" is readonly
    Then I check "PayrollAnswer_CRN" is readonly
    Then I check "CancellationStartDate" is readonly
    Then I check "ReasonDescription" is readonly
    
    Then I click on "Tax Registration Update"
    Then I click on "Update Business Address"
    Then I check "OrganizationalName" is readonly
    Then I check "PayrollAnswer_ABN" is readonly
    Then I check "PayrollAnswer_CRN" is readonly
    Then I check "Address_CountryCode" is readonly
    Then I check "Address_AddressLine" is readonly
    Then I check "Address_City" is readonly
    Then I check "Address_State" is readonly
    Then I check "Address_PostCode" is readonly
    
    Then I click on "Update Business Trading Name"
    Then I check "OrganizationalName" is readonly
    Then I check "PayrollAnswer_ABN" is readonly
    Then I check "PayrollAnswer_CRN" is readonly
    Then I check "BusinessTradingName" is readonly
    
    Then I click on "Update Payroll Contact Details"
    Then I check "OrganizationalName" is readonly
    Then I check "PayrollAnswer_ABN" is readonly
    Then I check "PayrollAnswer_CRN" is readonly
    Then I check "ContactPerson_FirstName" is readonly
    Then I check "ContactPerson_LastName" is readonly
    Then I check "ContactPerson_PhoneNumber" is readonly
    Then I check "ContactPerson_Email" is readonly
    Then I check "Address_AddressLine7" is readonly
    Then I check "Address_City4" is readonly
    Then I check "Address_PostCode4" is readonly
    
    Then I click on "Update Payroll Refund Details"
    Then I check "OrganizationalName" is readonly
    Then I check "PayrollAnswer_ABN" is readonly
    Then I check "PayrollAnswer_CRN" is readonly
    Then I check "Refunds_YES" is readonly
    Then I check "Refunds_NO" is readonly
    
    Then I click on "Lodgements"
    Then I click on "Payroll Tax"
    Then I check "OrganizationalName" is readonly
    Then I check "PayrollAnswer_ABN" is readonly
    Then I check "PayrollAnswer_CRN" is readonly
    Then I check "LodgePayrollAnswer_TypeMonthly" is readonly
    #Then I check "MonthlyObligationSelect" is readonly
    Then I check "LodgePayrollAnswer_TypeAnnual" is readonly

    Examples: 
      | PortalName | UserName | Password   |
      | TSS        | jbradley | Dbresults1 |

   @review
  Scenario Outline: DTSP-689: As a user I want to update the order of menu items on the left navigation panel
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                 |
      #| item2 | Home                               |
      | item3 | Lodgements   |
      | item4 | Return History           |
      | item5 | Service Requests         |
      | item6 | Group Management         |
      | item6 | Payroll Tax Registration |
      | item6 | Tax Registration Update  |
      | item6 | Manage Account Details   |
      | item6 | Activity History         |
      | item6 | User Profile             |
      | item6 | Sign Out                 |
    Then I click on "Service Requests"
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                 |
      | item2 | Annual Lodgement Request |
      | item3 | Exemption Request        |
      | item4 | Generic Request          |
      | item5 | Liquidation Advice       |
      | item6 | Objection Request        |
      | item6 | Tax Registration Cancellation |
      | item6 | Voluntary Disclosure Request |
    Then I click on "Tax Registration Update"
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                       |
      | item2 | Update Business Address        |
      | item3 | Update Business Trading Name   |
      | item4 | Update Payroll Contact Details |
      | item5 | Update Payroll Refund Details  |
		Then I click on "Lodgements"
		Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                       |
      | item2 | Payroll Tax        |
      | item3 | Utilities (Network Facilities) Tax   |
      | item4 | Ambulance Levy |
      | item5 | Energy Industry Levy  |
    Examples: 
      | PortalName | UserName | Password   |
      | TSS        | jbradley | Dbresults1 |


  @review
  Scenario Outline: DTSP-690: As an end user, I want to be able to update my Business Trading Name on my Tax Registration so that I can keep my Tax Registration information up-to-date
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Tax Registration Update"
    Then I click on "Update Business Trading Name"
    #Scenario 1: Display "Update Business Trading Name" Form
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                         |
      | item2 | Choose a Taxpayer                |
      | item3 | Organisation Name                |
      | item4 | Australian Business Number (ABN) |
      | item5 | Client Reference Number (CRN)    |
      | item5 | Business Trading Name            |
      | item5 | Request Details                  |
      | item5 | Taxpayer Details                 |
    Then I check "OrganizationalName" is readonly
    Then I check "PayrollAnswer_ABN" is readonly
    Then I check "PayrollAnswer_CRN" is readonly
    Then I check "BusinessTradingName" is readonly
    #Scenario 2: Business Trading Name section displayed on the "Update Business Trading Name" Form
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value |
      | s2id_autogen1_search | Aqua  |
    Then I click on button "select2-results-1"
    Then I check "OrganizationalName" is readonly
    Then I check "PayrollAnswer_ABN" is readonly
    Then I check "PayrollAnswer_CRN" is readonly
    Then I check "BusinessTradingName" is not readonly
    #Scenario 3: "Update Business Trading Name" Summary page
    Then I click on button with value "Next"
    Then I see text "Update Business Trading Name Summary" displayed
    #Scenario 5: Update Business Trading Name Submission
    Then I click on button "CorrectInfoDeclared"
    Then I click on button with value "Submit"
    Then I wait for "2000" millisecond
    Then I check I am on "Update Complete" page
    Then I see text "Your Update Business Trading Name Request has been successfully submitted. An email has been sent to you for your reference." displayed
    Then I see text "To download the details you have submitted, please click the button below." displayed

    Examples: 
      | PortalName | UserName | Password   |
      | TSS        | jbradley | Dbresults1 |

  @review
  Scenario Outline: DTSP-692: As an end user, I want to see an updated version of the Return History page, so that it is more user-friendly
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    #Scenario 1: Left Navigation Menu
    Then I see text "Return History" displayed
    Then I click on "Return History"
    #Scenario 2: Return History page
    Then I see text "Monthly Return History" displayed
    Then I see text "Annual Return History" displayed
    #Scenario 3: Payment Details
    Then I click on "PAYMENT DETAILS"
    Then I switch to frame "0"
    Then I see text "Payment cannot be made directly through the Self-Serve portal. Please use the details below to make payment through your financial institution." displayed
    Then I see text "Amount" displayed
    Then I see text "Due Date" displayed
    Then I see text "Biller Code" displayed
    Then I see text "Reference Number" displayed

    Examples: 
      | PortalName | UserName | Password   |
      | TSS        | jbradley | Dbresults1 |

  @ignore_until_fixed
  Scenario Outline: DTSP-702: Check if a Taxpayer has already registered for other tax types at Payroll Tax Registration
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
   Then I click on "Payroll Tax Registration"
    And I enter the details as
      | Fields                 | Value       |
      | RegistrationAnswer_ABN | 83117378917 |
    Then I click on button with value "Next"
    Then I wait for "1500" millisecond
    Then I enter the details as
      | Fields              | Value              |
      | EmployerName        | <CompanyName> |
      | BusinessTradingName | <CompanyName>  |
    Then I select "Government" from "SelectBusinessTypeCode"
    #Then I check "RegistrationAnswer_ACN" is empty
		Then I click on button "TaxPayerDetailsNextBT"
    #Scenario 1: Registration form layout changes
    Then I check "EmployerName" is readonly
    Then I check "BusinessTradingName" is readonly
    Then I check "AddressLine1" is readonly
    Then I check "Address_City" is readonly
    Then I check "ContactPerson_FirstName" is readonly
    Then I check "ContactPerson_LastName" is readonly
    Then I check "ContactPerson_Email" is readonly
    Then I check "RegistrationAnswer_ACN" is readonly
    Then I check "PostCode" is readonly
    Then I check "ContactPerson_PhoneNumber" is readonly
    Then I check "SelectBusinessTypeCode" is readonly
    Then I check "Address_CountryCode" is readonly
    Then I check "Address_State" is readonly
    Then I check "CheckBusinessAdress" is readonly
    Then I check "CheckSameAsJurisdiction" is readonly
    Then I check "ContactPerson_PostalAddressId" is readonly
    Then I check "ContactPerson_CommunicationMethodId" is readonly
    Then I click on "Payroll Tax Registration"
        Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "OK"
    
    #Scenario 3: User already registered for Payroll tax
    And I enter the details as
      | Fields                 | Value       |
      | RegistrationAnswer_ABN | 13058370433 |
    Then I click on button with value "Next"
    Then I wait for "1000" millisecond
    Then I see text "This ABN is already registered for Payroll Tax" shown
    #Scenario 4: User has not registered for any tax
    And I enter the details as
      | Fields                 | Value       |
      | RegistrationAnswer_ABN | 32421342134 |
    Then I click on button with value "Next"
      Then I wait for "1500" millisecond
    Then I enter the details as
      | Fields              | Value              |
      | EmployerName        | <CompanyName> |
      | BusinessTradingName | <CompanyName>  |
    Then I select "Government" from "SelectBusinessTypeCode"
    #Then I check "RegistrationAnswer_ACN" is empty
		Then I click on button "TaxPayerDetailsNextBT"
    Then I see text "Your ABN is not valid. Please enter a valid ABN." displayed

    #Bugged...?
     Examples: 
      | PortalName | CompanyName                  | ABN         | UserName | Password   |
      | TSS        | The Fire Company Pty Limited | 83117378917 | jbradley | Dbresults1 |

   @review
  Scenario Outline: DTSP-704: To update the ABN Lookup Rule on the Payroll Tax Registration Form and Tax Agent Portal Registration
    #Scenario 3: Correct Tax Agent Portal Registration
    Given I want to login to portal "<PortalName>"
    Then I click on "Create Account"
    Then I check I am on "Registration" page
    Then I click on "Register as a Tax Agent"
    Then I enter the details as
      | Fields                    | Value               |
      | InputTaxAgentABN          |         21006819692 |
      | InputTaxAgentBusinessName | toyota SUPER pty LT |
      | BusinessAddress_Address   | TEST                |
      | BusinessAddress_Suburb    | TEST                |
      | BusinessAddress_Postcode  |                3333 |
    Then I click on button "BusinessAddress_StateId"
    Then I click on "Victoria"
    Then I click on button "TermsandConditionsCheckBox2"
    Then I click on button "RegistrationSubmit"
    Then I see text "Your Registered Business Name doesn’t match with your ABN. Please try again" displayed
    #Scenario 4: Incorrect Tax Agent Portal Registration
    Then I enter the details as
      | Fields                    | Value                |
      | InputTaxAgentBusinessName | toyota SUPER pty LTd |
    Then I click on button "RegistrationSubmit"
    Then I check I am on "Complete Registration" page
    #Scenario 2: Incorrect Employer Name on the Payroll Tax Registration
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Payroll Tax Registration"
    And I enter the details as
      | Fields                 | Value       |
      | RegistrationAnswer_ABN | <ABN> |
    Then I click on button with value "Next"
    Then I wait for "1000" millisecond
    Then I select "Partnership" from "SelectBusinessTypeCode"
    #Then I select "Direct Post" from "CommunicationMethodId"
    Then I enter the details as
      | Fields                    | Value             |
      | EmployerName              | firE CompNY Pty Limid |
      | BusinessTradingName       | Fire CompNY Pty Limid|
      #| AddressLine               | TEST              |
      #| Address_City              | TEST              |
      #| PostCode                  |              3333 |
      #| ContactPerson_FirstName   | TEST              |
      #| ContactPerson_LastName    | TEST              |
      #| ContactPerson_PhoneNumber |       33333333333 |
      #| ContactPerson_Email       | TEST@TEST.com     |
    Then I click on button "TaxPayerDetailsNextBT"
    Then I see text "Your Organisation Name doesn't match with your ABN. Please try again." displayed
    #Scenario 1: Correct Employer Name on the Payroll Tax Registration
    Then I enter the details as
      | Fields              | Value              |
      | EmployerName        |the firE CompaNY Pty Limited |
      | BusinessTradingName | the firE CompaNY Pty Limited |
    Then I click on button "TaxPayerDetailsNextBT"
    Then I see text "Address where Business Records are located (Jurisdiction)" displayed

        #Bugged...?
     Examples: 
      | PortalName | CompanyName                  | ABN         | UserName | Password   |
      | TSS        | The Fire Company Pty Limited | 83117378917 | jbradley | Dbresults1 |

  @review
  Scenario Outline: DTSP-712: To update all wording on the portal from "Tax Payer" to the single word "Taxpayer"
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Lodgements"
    Then I click on "Payroll Tax"
     Then I see text "Taxpayer" displayed
    Then I see text "Tax Payer" not displayed
    
    Then I click on "Utilities (Network Facilities) Tax"
     Then I see text "Taxpayer" displayed
    Then I see text "Tax Payer" not displayed
    
    Then I click on "Ambulance Levy"
     Then I see text "Taxpayer" displayed
    Then I see text "Tax Payer" not displayed
    
    Then I click on "Energy Industry Levy"
     Then I see text "Taxpayer" displayed
    Then I see text "Tax Payer" not displayed

    Then I click on "Service Requests"
    
    Then I click on "Annual Lodgement Request"
    Then I see text "Taxpayer" displayed
    Then I see text "Tax Payer" not displayed
    
    Then I click on "Exemption Request"
    Then I see text "Taxpayer" displayed
    Then I see text "Tax Payer" not displayed
    
    Then I click on "Generic Request"
    Then I see text "Taxpayer" displayed
    Then I see text "Tax Payer" not displayed
    
    Then I click on "Liquidation Advice"
    Then I see text "Taxpayer" displayed
    Then I see text "Tax Payer" not displayed
    
    Then I click on "Objection Request"
    Then I see text "Taxpayer" displayed
    Then I see text "Tax Payer" not displayed
    
    Then I click on "Tax Registration Cancellation"
    Then I see text "Taxpayer" displayed
    Then I see text "Tax Payer" not displayed
    
    Then I click on "Group Management"
    Then I see text "Taxpayer" displayed
    Then I see text "Tax Payer" not displayed
    
    Then I click on "Payroll Tax Registration"
    Then I see text "Taxpayer" displayed
    Then I see text "Tax Payer" not displayed
    
    Then I click on "Tax Registration Update"
    
    Then I click on "Update Business Address"
    Then I see text "Taxpayer" displayed
    Then I see text "Tax Payer" not displayed
    
    Then I click on "Update Business Trading Name"
    Then I see text "Taxpayer" displayed
    Then I see text "Tax Payer" not displayed
    
    Then I click on "Update Payroll Contact Details"
    Then I see text "Taxpayer" displayed
    Then I see text "Tax Payer" not displayed
    
    Then I click on "Update Payroll Refund Details"
    Then I see text "Taxpayer" displayed
    Then I see text "Tax Payer" not displayed
    
    Then I click on "Sign Out"

    Examples: 
      | PortalName | UserName | Password   |
      | TSS        | jbradley | Dbresults1 |

  @review
  Scenario Outline: DTSP-703: As an user, I want to fill in a declaration section when I fill in an Objection Request, so that I can verify that I have submitted this request
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Service Requests"
    Then I click on "Objection Request"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value         |
      | s2id_autogen1_search | DESIGNATE |
    Then I click on button "select2-results-1"
    #Scenario 3: "Objection Request" Summary page
    Then I click on button "ObjectionOutOfTimeYES"
    Then I enter the details as
      | Fields             | Value |
      | Objection_Comments | DESIGNATE  |
      | LodgeFailureReason | DESIGNATE  |
    Then I click on button "CheckPenalty"
    Then I click on button with value "Next"
    Then I check I am on "Objection Request Summary" page
    #Scenario 1:
    Then I check "DeclarationData" exists
    #Scenario 2: Submit button
    Then I click on button "CorrectInfoDeclared"
    Then I check "SummarySubmitBT" is not readonly
    #Scenario 3: Confirmation page
    Then I click on button "SummarySubmitBT"
    Then I check I am on "Objection Request Confirmation" page

    Examples: 
      | PortalName | UserName | Password   |
      | TSS        | jbradley | Dbresults1 |

  @review
  Scenario Outline: DTSP-733: As a user I should see front end validations for Exemption Request Form
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Service Requests"
    Then I click on "Exemption Request"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value |
      | s2id_autogen1_search | DESIGNATE  |
    Then I click on button "select2-results-1"
    #Scenario 1: Start date doesn't equal present/future date
    #Then I click on button "ExemptionStartDateInput"
    #Then I click on "20170501"
    #Then I click on button "calTriggerOut"
    Then I enter the details as
      | Fields             | Value |
      | JustificationInput | TEST  |
    #Then I click on button with value "Next"
    #Then I see text "Please enter valid dates for your Exemption Request." displayed
    #Scenario 2: End date < start date
    Then I click on button "ExemptionStartDateInput"
    Then I click on "20170530"
    Then I click on button "ExemptionEndDateInput"
    Then I click on "20170528"
    #Then I click on button "calTriggerOut"
    Then I click on button with value "Next"
    Then I see text "Please enter valid dates for your Exemption Request." displayed

    Examples: 
      | PortalName | UserName | Password   |
      | TSS        | jbradley | Dbresults1 |

 @redo
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
      | Fields               | Value |
      | s2id_autogen1_search | <Organisation> |
    Then I click on button "select2-results-1"
    Then I click on "Monthly Return"
    Then I select "Dec 2016" from "MonthlyObligationSelect"
    Then I click on button "NextSection"
    Then I wait for "1000" millisecond
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
    Then I wait for "1000" millisecond
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
      | Fields               | Value                |
      | s2id_autogen1_search | <Organisation> |
    Then I click on button "select2-results-1"
    Then I wait for "1000" millisecond
    Then I click on button with value "Next"
    Then I wait for "1000" millisecond
    #BUG FOUND: Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[1]//td[2]" contains "<FirstName>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[2]//td[2]" contains "<LastName>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[3]//td[2]" contains "<Organisation>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[4]//td[2]" contains "<Position>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[5]//td[2]" contains "<ContactPhone>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[6]//td[2]" contains "<EmailAddress>"
    Then I click on "Update Payroll Contact Details"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value                |
      | s2id_autogen1_search | <Organisation> |
    Then I click on button "select2-results-1"
    Then I wait for "1000" millisecond
    Then I click on button "NextBT"
    Then I click on button "NextBT"
    #BUG FOUND: Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[1]//td[2]" contains "<FirstName>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[2]//td[2]" contains "<LastName>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[3]//td[2]" contains "<Organisation>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[4]//td[2]" contains "<Position>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[5]//td[2]" contains "<ContactPhone>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[6]//td[2]" contains "<EmailAddress>"
    Then I click on "Update Payroll Refund Details"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value         |
      | s2id_autogen1_search | <Organisation> |
    Then I click on button "select2-results-1"
    Then I wait for "1000" millisecond
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
      | Fields               | Value         |
      | s2id_autogen1_search | <Organisation> |
    Then I click on button "select2-results-1"
    Then I wait for "1000" millisecond
    Then I click on button with value "Next"
    Then I wait for "1000" millisecond
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[1]//td[2]" contains "<FirstName>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[2]//td[2]" contains "<LastName>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[3]//td[2]" contains "<Organisation>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[4]//td[2]" contains "<Position>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[5]//td[2]" contains "<ContactPhone>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[6]//td[2]" contains "<EmailAddress>"
    Then I click on "Service Requests"
    Then I click on "Exemption Request"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value         |
      | s2id_autogen1_search | <Organisation> |
    Then I click on button "select2-results-1"
    Then I wait for "1000" millisecond
    Then I click on button "ExemptionStartDateInput"
    Then I click on "20170527"
    Then I enter the details as
      | Fields             | Value |
      | JustificationInput | TEST  |
    Then I click on button with value "Next"
    Then I wait for "1000" millisecond
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[1]//td[2]" contains "<FirstName>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[2]//td[2]" contains "<LastName>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[3]//td[2]" contains "<Organisation>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[4]//td[2]" contains "<Position>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[5]//td[2]" contains "<ContactPhone>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[6]//td[2]" contains "<EmailAddress>"
    Then I click on "Objection Request"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value         |
      | s2id_autogen1_search | <Organisation> |
    Then I click on button "select2-results-1"
    Then I click on button "CheckInterest"
    Then I enter the details as
      | Fields             | Value |
      | Objection_Comments | TEST  |
    Then I click on button with value "Next"
    Then I wait for "1000" millisecond
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[1]//td[2]" contains "<FirstName>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[2]//td[2]" contains "<LastName>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[3]//td[2]" contains "<Organisation>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[4]//td[2]" contains "<Position>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[5]//td[2]" contains "<ContactPhone>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[6]//td[2]" contains "<EmailAddress>"
    Then I click on "Tax Registration Cancellation"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value        |
      | s2id_autogen1_search | DUSTER PTY. LIMITED |
    Then I click on button "select2-results-1"
    Then I click on button "CancellationStartDate"
    Then I click on "20170527"

    Then I enter the details as
      | Fields            | Value |
      | ReasonDescription | TEST  |
    Then I click on button "ReasonDescription"
    Then I click on button with value "Next"
    Then I wait for "1000" millisecond
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[1]//td[2]" contains "<FirstName>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[2]//td[2]" contains "<LastName>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[3]//td[2]" contains "DUSTER PTY. LIMITED"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[4]//td[2]" contains "<Position>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[5]//td[2]" contains "<ContactPhone>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[6]//td[2]" contains "<EmailAddress>"
    Then I click on "Annual Lodgement Request"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value        |
      | s2id_autogen1_search | <Organisation> |
    Then I click on button "select2-results-1"
    Then I select "2018" from "YearCombo"
    Then I click on button "MonthCombo"
    Then I click on "Jan"
    Then I enter the details as
      | Fields                              | Value |
      | AnnualLodgementRequestJustification | TEST  |
    Then I click on button with value "Next"
    Then I wait for "1000" millisecond
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[1]//td[2]" contains "<FirstName>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[2]//td[2]" contains "<LastName>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[3]//td[2]" contains "<Organisation>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[4]//td[2]" contains "<Position>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[5]//td[2]" contains "<ContactPhone>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[6]//td[2]" contains "<EmailAddress>"
    Then I click on "Group Management"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value    |
      | s2id_autogen1_search | <Organisation> |
    Then I click on button "select2-results-1"
    Then I wait for "1000" millisecond
    Then I click on button with value "Update Group"
    Then I select "2018" from "YearCombo"
    Then I click on button "MonthCombo"
    Then I click on "Jan"
    Then I click on button with value "Next"
    Then I wait for "1000" millisecond
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[1]//td[2]" contains "<FirstName>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[2]//td[2]" contains "<LastName>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[3]//td[2]" contains "<Organisation>"
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
      | TSS        | jbradley | Dbresults1 | J         | Bradley  | Consultant | QUICK SINGLE PTY LTD | 04 5678 9767 | jbradley@hotmail.com |

    
    
   @review
   Scenario Outline: DTSP-779: To update the Payroll Tax Registration Form to remove the autopopulated declaration section
   	Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
     Then I click on "Payroll Tax Registration"
    And I enter the details as
      | Fields                 | Value       |
      | RegistrationAnswer_ABN | 83117378917 |
    Then I click on button with value "Next"
    Then I wait for "1500" millisecond
		Then I check label "Label_EmployerName" contains "Organisation Name"
    Then I enter the details as
      | Fields              | Value              |
      | EmployerName        | <CompanyName> |
      | BusinessTradingName | <CompanyName>  |
    Then I select "Government" from "SelectBusinessTypeCode"
		Then I click on button "TaxPayerDetailsNextBT"
		Then I wait for "2000" millisecond
    #Then I select "Mr" from "ContactPerson_Title"
    Then I select "Direct Post" from "CommunicationMethodId"
    Then I enter the details as
      | Fields                    | Value              |
      | AddressLine1              | TEST               |
      | Address_City              | TEST               |
      | ContactPerson_FirstName   | TEST               |
      | ContactPerson_LastName    | TEST               |
      | ContactPerson_Email       | TEST@TEST.com      |
      | PostCode                  |               3333 |
      | ContactPerson_PhoneNumber | 1234567890 |
  	Then I click on button "OrgDetailsNextBt"
    Then I check "ContactPerson_PhoneNumber" contents match regex "\d\d \d\d\d\d \d\d\d\d"
    Then I wait for "2000" millisecond
    Then I check "ACTWagesPaidNextBt" is readonly
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value        |
      | s2id_autogen1_search | Turf Growing |
    Then I click on button "select2-results-1"
    Then I click on button "ACTWagesPaidNextBt"
    Then I check "PayrollNext" is readonly
    Then I enter the details as
      | Fields                   | Value |
      | NumberOfEmployees        | 33    |
    Then I click on "DateBusinessStart"
    Then I click on "20170501"
    Then I click on "DateBusinessLiable"
    Then I click on "20170502"
    Then I click on "PayrollNext"
    Then I click on button "Refunds_NO"
    Then I click on button "RefundDetailsBT"
    #Then "<Item>" is displayed as "<ItemName>"
      #| Item  | ItemName         |
      #| item2 | First Name       |
      #| item3 | Last Name        |
      #| item4 | Organisation Name    |
      #| item5 | Position         |
      #| item5 | Contact Phone Number         |
      #| item5 | Email Address         |
    Then I check "Declarer_FirstName" exists
    Then I check "Declarer_LastName" exists
    Then I check "Declarer_Organisation" exists
    Then I check "Declarer_Position" exists
    Then I check "Declarer_PhoneNumber" exists
    Then I check "Declarer_Email" exists
    
    #Scenarios 2-5 should be done manually
    
        	Examples: 
      | PortalName | CompanyName                  | ABN         | UserName | Password   |
      | TSS        | The Fire Company Pty Limited | 83117378917 | jbradley | Dbresults1 |
   
    @manual
   Scenario Outline: As an end user I want to see the Industry codes before Industry name in the Business Activity Category Drop down on Payroll Tax registration form
   	Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
   Then I click on "Payroll Tax Registration"
    And I enter the details as
      | Fields                 | Value       |
      | RegistrationAnswer_ABN | 83117378917 |
    Then I click on button with value "Next"
    Then I wait for "1500" millisecond
		Then I check label "Label_EmployerName" contains "Organisation Name"
    Then I enter the details as
      | Fields              | Value              |
      | EmployerName        | <CompanyName> |
      | BusinessTradingName | <CompanyName>  |
    Then I select "Government" from "SelectBusinessTypeCode"
		Then I click on button "TaxPayerDetailsNextBT"
		Then I wait for "2000" millisecond
    #Then I select "Mr" from "ContactPerson_Title"
    Then I select "Direct Post" from "CommunicationMethodId"
    Then I enter the details as
      | Fields                    | Value              |
      | AddressLine1              | TEST               |
      | Address_City              | TEST               |
      | ContactPerson_FirstName   | TEST               |
      | ContactPerson_LastName    | TEST               |
      | ContactPerson_Email       | TEST@TEST.com      |
      | PostCode                  |               3333 |
      | ContactPerson_PhoneNumber | 1234567890 |
  	Then I click on button "OrgDetailsNextBt"
    Then I wait for "2000" millisecond
    Then I check "ACTWagesPaidNextBt" is readonly
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value        |
      | s2id_autogen1_search | Turf Growing |
    Then I click on button "select2-results-1"
    Then I check "select2-chosen-1" contents match regex "\d\d\d\d .*"
    
    #maybe this should be done manually...
    
          	Examples: 
      | PortalName | CompanyName                  | ABN         | UserName | Password   |
      | TSS        | The Fire Company Pty Limited | 83117378917 | jbradley | Dbresults1 |
      

		###########################################################################################################
  #################################### MISSING ACTRO BUGS ################################################
  ########################################################################################################### 
  
  @done
  Scenario Outline: Tax Agent Account Activation Error + Disappearing Position field after Registration bug (Tax Agent) + No ABN Information check
    #Onhold due to laggy Registration part 2 page
    Given I want to login to portal "<PortalName>"
    Then I click on "Create Account"
    Then I click on button "RegistrationAsTaxAgent"
    Then I wait for "1000" millisecond
    Then I enter the details as
      | Fields                   | Value         |
      | TaxAgentBusinessName     | <CompanyName> |
      | InputTaxAgentABN         | <ABN>         |
      | BusinessAddress_Postcode |          3333 |
      | BusinessAddress_Address  | TEST          |
      | BusinessAddress_Suburb   | TEST          |
    Then I click on button "TermsandConditionsCheckBox"
    Then I select "Victoria" from "BusinessAddress_StateId"
    Then I click on button "RegistrationSubmit"
    Then I wait for "5000" millisecond
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
      | Registration_Hint            | Done as a result of automation! |
    Then I click on button "SubmitAjaxRfrsh"
    Then I wait for "5000" millisecond
    Then I see text "Registration Confirmation" displayed
    Then I want to login to portal "RegistrationLinkTable"
    Then I click on object with xpath "//*[contains(text(), 'automation_taxagent10')]/../following-sibling::td/a"
    And I enter the details as
      | Fields        | Value         |
      | UserNameInput | <NewUserName> |
      | PasswordInput | <Password>    |
    And I hit Enter
    Then I check I am on "Home" page
    Then I see text "Please note, as there are currently no taxpayer accounts associated with your login, there is no information to display." displayed
    Then I click on "User Profile"
    Then I click on button "EditBT"
    Then I check "Input_LastName2" is not empty

    #NewUserName and NewEmail must be changed with every registration
    Examples: 
      | PortalName | CompanyName                                 | ABN         | NewUserName          | NewEmail                 | Password   |
      | TSS        | The trustee for MD & KJ Fragar Family Trust | 70167081615 | automation_taxagent10 | TaxAgent10@automation.com | Dbresults1 |

  @done
  Scenario Outline: Disappearing Position field after Registration bug (Business Registration)
    Given I want to login to portal "<PortalName>"
    Then I click on "Create Account"
    Then I click on button "RegistrationAsTaxAgent"
    Then I wait for "1000" millisecond
    Then I enter the details as
      | Fields                   | Value         |
      | TaxAgentBusinessName     | <CompanyName> |
      | InputTaxAgentABN         | <ABN>         |
      | BusinessAddress_Postcode |          3333 |
      | BusinessAddress_Address  | TEST          |
      | BusinessAddress_Suburb   | TEST          |
    Then I click on button "TermsandConditionsCheckBox"
    Then I select "Victoria" from "BusinessAddress_StateId"
    Then I click on button "RegistrationSubmit"
    Then I wait for "7000" millisecond
    Then I enter the details as
      | Fields                       | Value                           |
      | Registration_FirstName       | TEST                            |
      | Registration_LastName        | TEST                            |
      | Registration_Position        | TEST                            |
      | Registration_PhoneNumber     |                      1234567890 |
      | Registration_Email           | <NewUserName>@automation.com       |
      | Registration_Username        | automation_<NewUserName>                   |
      | Registration_NewPassword     | <Password>                      |
      | Registration_ConfirmPassword | <Password>                      |
      | Registration_Hint            | Done as a result of automation! |
    Then I click on button "SubmitAjaxRfrsh"
    Then I wait for "7000" millisecond
    Then I see text "Registration Confirmation" displayed
    Then I want to login to portal "RegistrationLinkTable"
    Then I click on object with xpath "//*[contains(text(), '<NewUserName>')]/../following-sibling::td/a"
    And I enter the details as
      | Fields        | Value         |
      | UserNameInput | automation_<NewUserName> |
      | PasswordInput | <Password>    |
    And I hit Enter
    Then I check I am on "Home" page
    Then I click on "User Profile"
    Then I click on button "EditBT"
    Then I check "Input_LastName2" is not empty

    #automation_business1 needs to be changed with every success!
    Examples: 
      | PortalName | CompanyName                                 | ABN         | NewUserName   | Password   |
      | TSS        | The trustee for MD & KJ Fragar Family Trust | 70167081615 |  taxAgent13 | Dbresults1 |


  @done
  Scenario Outline: The Exemption Request Form does not allow the user to enter a start date in the past but PSRM will allow a past date.
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Service Requests"
    Then I click on "Exemption Request"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value |
      | s2id_autogen1_search | ABCAD |
    Then I click on button "select2-results-1"
    Then I click on button "ExemptionStartDateInput"
    Then I click on "20170502"
    #Then I click on button "calTriggerOut"
    Then I click on button "ExemptionEndDateInput"
    Then I click on "20170529"
    Then I enter the details as
      | Fields             | Value |
      | JustificationInput | TEST  |
    Then I click on button with value "Next"
    Then I check I am on "Exemption Request Summary" page

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password   | CRN         | ABN         |
      | TSS        | UserNameInput | PasswordInput | jbradley | Dbresults1 | 12121212121 | 21212121212 |

  @done
  Scenario Outline: Check if Update Refund Details form has the Organization section of the Declaration filled
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Tax Registration Update"
    Then I click on "Update Payroll Refund Details"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value                |
      | s2id_autogen1_search | ABCAD DESIGN PTY LTD |
    Then I click on button "select2-results-1"
    Then I click on button "Refunds_NO"
    Then I click on button with value "Next"
    Then I check object with xpath "//*[contains(@name, 'Label_Organisation')]/parent::td/following-sibling::td" contains "ABCAD DESIGN PTY LTD"

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password   | CRN         | ABN         |
      | TSS        | UserNameInput | PasswordInput | jbradley | Dbresults1 | 12121212121 | 21212121212 |

  @done
  Scenario Outline: ACN field in Payroll Tax Registration Form bug
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Payroll Tax Registration"
    And I enter the details as
      | Fields                 | Value       |
      | RegistrationAnswer_ABN | 83117378917 |
    Then I click on button with value "Next"
    Then I wait for "3000" millisecond
    Then I enter the details as
      | Fields              | Value              |
      | EmployerName        | <CompanyName> |
      | BusinessTradingName | <CompanyName>  |
    Then I select "Government" from "SelectBusinessTypeCode"
    Then I check "Content_wtRegistrationAnswer_ACN" is empty
		Then I click on button "TaxPayerDetailsNextBT"
		Then I wait for "3000" millisecond
		 Then I enter the details as
		  | Fields                    | Value              |
      | AddressLine1              | TEST               |
      | Address_City              | TEST               |
      | ContactPerson_FirstName   | TEST               |
      | ContactPerson_LastName    | TEST               |
      | ContactPerson_Email       | TEST@TEST.com      |
    Then I click on button with value "Cancel"
    Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "OK"
    Given I want to login to portal "<PortalName>"
    Then I click on "Payroll Tax Registration"
     And I enter the details as
      | Fields                 | Value       |
      | RegistrationAnswer_ABN | 83117378917 |
    Then I click on button with value "Next"
    Then I wait for "3000" millisecond
    Then I enter the details as
      | Fields              | Value              |
      | EmployerName        | sadfasdfadsf |
      | BusinessTradingName | asdfadsfadsfasdf  |
      | RegistrationAnswer_ACN | 27349832721342134124302 |
    Then I select "Company" from "SelectBusinessTypeCode"
		Then I click on button "TaxPayerDetailsNextBT"
		Then I wait for "1500" millisecond
		Then I see text "Your Organisation Name doesn't match with your ABN. Please try again." displayed
		Then I see text "Your ACN doesn't match with your ABN. Please try again." shown
		 Then I enter the details as
      | Fields              | Value              |
      | EmployerName        | <CompanyName> |
      | BusinessTradingName | <CompanyName>  |
      | RegistrationAnswer_ACN | 117378917 |
		Then I click on button "TaxPayerDetailsNextBT"
		Then I wait for "3000" millisecond
		Then I enter the details as
		  | Fields                    | Value              |
      | AddressLine1              | TEST               |
      | Address_City              | TEST               |
      | ContactPerson_FirstName   | TEST               |
      | ContactPerson_LastName    | TEST               |
      | ContactPerson_Email       | TEST@TEST.com      |

    Examples: 
      | PortalName | CompanyName                  | ABN         | UserName | Password   |
      | TSS        | The Fire Company Pty Limited | 83117378917 | jbradley | Dbresults1 |

@done
  Scenario Outline: Total Taxable Wages in Payroll Tax Registration dropdown bug
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Payroll Tax Registration"
    And I enter the details as
      | Fields                 | Value       |
      | RegistrationAnswer_ABN | 83117378917 |
    Then I click on button with value "Next"
    Then I wait for "1500" millisecond
    Then I enter the details as
      | Fields              | Value              |
      | EmployerName        | <CompanyName> |
      | BusinessTradingName | <CompanyName>  |
    Then I select "Government" from "SelectBusinessTypeCode"
    Then I check "RegistrationAnswer_ACN" is empty
		Then I click on button "TaxPayerDetailsNextBT"
		Then I wait for "1500" millisecond
    #Then I select "Mr" from "ContactPerson_Title"
    Then I select "Direct Post" from "CommunicationMethodId"
    Then I enter the details as
      | Fields                    | Value              |
      | AddressLine1              | TEST               |
      | Address_City              | TEST               |
      | ContactPerson_FirstName   | TEST               |
      | ContactPerson_LastName    | TEST               |
      | ContactPerson_Email       | TEST@TEST.com      |
      | PostCode                  |               3333 |
      | ContactPerson_PhoneNumber | 1234567890 |
  	Then I click on button "OrgDetailsNextBt"
  	Then I wait for "1500" millisecond
  	Then I click on button "select2-chosen"
    Then I enter the details as
      | Fields               | Value |
      | s2id_autogen1_search |  6940 |
    Then I click on button "select2-results"
    Then I click on button "ACTWagesPaidNextBt"
    Then I select "FY 2011/12" from "YearComboBox"
		Then I select "FY 2012/13" from "YearComboBox"
		Then I select "FY 2013/14" from "YearComboBox"
		Then I select "FY 2014/15" from "YearComboBox"
		Then I select "FY 2015/16" from "YearComboBox"
		
		
    Examples: 
      | PortalName | CompanyName                  | ABN         | UserName | Password   |
      | TSS        | The Fire Company Pty Limited | 83117378917 | jbradley | Dbresults1 |

   @done
   Scenario Outline: Current Employer Status on Dashboard bug
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
   	Then I check I am on "Home" page
   #Independent Employer 
   Then I click on button "select2-chosen-1"
   Then I enter the details as
      | Fields               | Value                |
      | s2id_autogen1_search | Late Cut Pty Ltd |
   Then I click on button "select2-results-1"
   Then I wait for "4000" millisecond
   #change these to regex matches and find them by id once Jonathan makes the fix
   Then I check object with xpath "//*[contains(@id, 'EmployerStatus')]//div//div[2]" contains "Independent Employer"
   #Group Member
   Then I click on button "select2-chosen-1"
   Then I enter the details as
      | Fields               | Value                |
      | s2id_autogen1_search | MEMBER CHECK PTY LIMITED |
   Then I click on button "select2-results-1"
   Then I wait for "4000" millisecond
   Then I check object with xpath "//*[contains(@id, 'EmployerStatus')]//div//div[2]" contains "Group Member in Group Number: 19"
   #DGE
   Then I click on button "select2-chosen-1"
   Then I enter the details as
      | Fields               | Value                |
      | s2id_autogen1_search | DESIGNATE |
   Then I click on button "select2-results-1"
   Then I wait for "4000" millisecond
   Then I check object with xpath "//*[contains(@id, 'EmployerStatus')]//div//div[2]" contains "DGE in Group Number: 19"
   #DGE and JRL
    Then I click on button "select2-chosen-1"
   Then I enter the details as
      | Fields               | Value                |
      | s2id_autogen1_search | JOINT ACTION |
   Then I click on button "select2-results-1"
   Then I wait for "4000" millisecond
   Then I check object with xpath "//*[contains(@id, 'EmployerStatus')]//div//div[2]" contains "DGE and JRL in Group Number: 20"
   
   	Examples: 
      | PortalName | CompanyName                  | ABN         | UserName | Password   |
      | TSS        | The Fire Company Pty Limited | 83117378917 | jbradley | Dbresults1 |
      
      
    @done
   Scenario Outline: Organisation Name on Payroll Tax Registration instead of Employer Name
   	Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Payroll Tax Registration"
    And I enter the details as
      | Fields                 | Value       |
      | RegistrationAnswer_ABN | 83117378917 |
    Then I click on button with value "Next"
    Then I wait for "1500" millisecond
		Then I check label "Label_EmployerName" contains "Organisation Name"
    Then I enter the details as
      | Fields              | Value              |
      | EmployerName        | <CompanyName> |
      | BusinessTradingName | <CompanyName>  |
    Then I select "Government" from "SelectBusinessTypeCode"
		Then I click on button "TaxPayerDetailsNextBT"
		Then I wait for "2000" millisecond
    #Then I select "Mr" from "ContactPerson_Title"
    Then I select "Direct Post" from "CommunicationMethodId"
    Then I enter the details as
      | Fields                    | Value              |
      | AddressLine1              | TEST               |
      | Address_City              | TEST               |
      | ContactPerson_FirstName   | TEST               |
      | ContactPerson_LastName    | TEST               |
      | ContactPerson_Email       | TEST@TEST.com      |
      | PostCode                  |               3333 |
      | ContactPerson_PhoneNumber | 1234567890 |
  	Then I click on button "OrgDetailsNextBt"
  	Then I click on button "select2-chosen"
    Then I enter the details as
      | Fields               | Value |
      | s2id_autogen1_search |  6940 |
    Then I click on button "select2-results"
    Then I click on button "ACTWagesPaidNextBt"
		 Then I click on "DateBusinessStart"
    Then I click on "20170501"
    Then I click on "DateBusinessLiable"
    Then I click on "20170502"
     Then I enter the details as
      | Fields                   | Value |
      | NumberOfEmployees        | 33    |
     Then I click on "PayrollNext"
    Then I click on button "Refunds_NO"
    Then I wait for "2000" millisecond
    Then I click on button "RefundDetailsBT"
    Then I check label "Label_Declarer_Organisation" contains "Organisation Name"
   	Examples: 
      | PortalName | CompanyName                  | ABN         | UserName | Password   |
      | TSS        | The Fire Company Pty Limited | 83117378917 | jbradley | Dbresults1 |

      
   
   @done
   Scenario Outline: <return period> / <employer status> / Group Number <group number> under wages section
   
   	Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Lodgements"
    Then I click on "Payroll Tax"
    
    #Designated group employer for a group and lodging for itself 
    Then I click on button with value "Discard"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value  |
      | s2id_autogen1_search | DESIGNATE |
    Then I click on button "select2-results-1"
    Then I click on button "LodgePayrollAnswer_TypeMonthly"
    Then I select "May 2017" from "MonthlyObligationSelect"
    Then I click on "NextSection"
    Then I wait for "3000" millisecond
   	Then I check object with xpath "//*[contains(@id, 'Titlewages')]//div[3]" contents match regex "\(\d{2} \w+ \d{4} - \d{2} \w+ \d{4} / ([\w|\s|\W]+ / [\w|\s]+:\s\d+)\)"
   
   	Then I click on button with value "Discard"
   	Given I want to login to portal "<PortalName>"
   	Then I click on "Lodgements"
    Then I click on "Payroll Tax"
    Then I click on button with value "Discard"
    Then I click on button "select2-chosen-1"
     
    #Member of a group lodging for itself 
    Then I enter the details as
      | Fields               | Value  |
      | s2id_autogen1_search | MEMBER |
    Then I click on button "select2-results-1"
    Then I click on button "LodgePayrollAnswer_TypeMonthly"
    Then I select "May 2017" from "MonthlyObligationSelect"
    Then I click on "NextSection"
    Then I wait for "3000" millisecond
   	Then I check object with xpath "//*[contains(@id, 'Titlewages')]//div[3]" contents match regex "\(\d{2} \w+ \d{4} - \d{2} \w+ \d{4} / ([\w|\s|\W]+ / [\w|\s]+:\s\d+)\)"
   
   	Then I click on button with value "Discard"
   	Given I want to login to portal "<PortalName>"
   	Then I click on "Lodgements"
    Then I click on "Payroll Tax"
    Then I click on button with value "Discard"
    Then I click on button "select2-chosen-1"
   
   	#Independent employer (non-group) lodging for itself
   	Then I enter the details as
      | Fields               | Value  |
      | s2id_autogen1_search | DUSTER |
    Then I click on button "select2-results-1"
    Then I click on button "LodgePayrollAnswer_TypeMonthly"
    Then I select "May 2017" from "MonthlyObligationSelect"
    Then I click on "NextSection"
    Then I wait for "3000" millisecond
   	Then I check object with xpath "//*[contains(@id, 'Titlewages')]//div[3]" contents match regex "\(\d{2} \w+ \d{4} - \d{2} \w+ \d{4} / ([\w|\s|\W]+ / [\w|\s]+:\s\d+)|([\w|\s|\W]+)\)"
   
 		Then I click on button with value "Discard"
 		Given I want to login to portal "<PortalName>"
   	Then I click on "Lodgements"
    Then I click on "Payroll Tax"
    Then I click on button with value "Discard"
    Then I click on button "select2-chosen-1"
    
    #Independent employer (non-group) lodging for itself
   
   	Then I enter the details as
      | Fields               | Value  |
      | s2id_autogen1_search | JOINT	 |
    Then I click on button "select2-results-1"
    Then I click on button "LodgePayrollAnswer_TypeAnnual"
    Then I select "01 Jul 2016 - 30 Jun 2017" from "AnnualObligationSelect"
    Then I click on "NextSection"
    Then I wait for "3000" millisecond
   	Then I check object with xpath "//*[contains(@id, 'Titlewages')]//div[3]" contents match regex "\(\d{2} \w+ \d{4} - \d{2} \w+ \d{4} / ([\w|\s|\W]+ / [\w|\s]+:\s\d+)\)"
   
 		
   Examples: 
      | PortalName | CompanyName                  | ABN         | UserName | Password   |
      | TSS        | The Fire Company Pty Limited | 83117378917 | jbradley | Dbresults1 |
   
   @wip
   Scenario Outline: Group Management Create group with DGE bug
   	Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    
    Then I click on "Group Management"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value  |
      | s2id_autogen1_search | DESIGNATE	 |
    Then I click on button "select2-results-1"
    Then I click on button with value "Update Group"
    Then I wait for "2000" millisecond
    Then I select "2018" from "YearCombo"
    Then I select "Jan" from "MonthCombo"
    Then I click on button with value "Next"
    Then I check I am on "Payroll Tax Group Update Summary" page
   		
   	 Examples: 
      | PortalName | CompanyName                  | ABN         | UserName | Password   |
      | TSS        | The Fire Company Pty Limited | 83117378917 | jbradley | Dbresults1 |
   
   
	