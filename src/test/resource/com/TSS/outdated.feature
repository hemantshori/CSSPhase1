#Author: This file is exclusively for stories that have been made outdated by changes to the website/program
#List why they have gone outdated down belwo
#Sample Feature Definition Template

Feature: Outdated stuff
	#OUTDATED:  240, 310, 311, 355, 358, 401, 443,

	 #@tss
  # BETTER OFF DONE MANUALLY
  #Scenario Outline: DTSP-240 : As an end user, I want to be able to download the Tax Lodgement or Registration forms in PDF format, so that I can keep a record of my lodgements
    #Given I want to login to portal "<PortalName>"
    #And I enter the details as
      #| Fields        | Value      |
      #| UserNameInput | <UserName> |
      #| PasswordInput | <Password> |
    #And I hit Enter
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
#
    #Examples: 
      #| PortalName | UserNameField | PasswordField | UserName | Password  | ButtonName1 | DropDownValue1 | DropDownField | DropDownValue2 | DropDownField2 | Message                                    |
      #| TSS        | UserNameInput | PasswordInput | bob      | dbresults | TypeMonthly |           2012 | YearOfReturn  | September      | MonthOfReturn  | Your changes have been successfully saved. |			
	

	Scenario Outline: DTSP-310
  	#ALREADY DONE BY DTSP-523
    Given I want to login to portal "<PortalName>"
    And I check I am on "Tax Registration Form" page
    Then I wait for "2000" millisecond
    Then I select "Company" from "SelectBusinessTypeCode"
    Then I select "Mr" from "ContactPerson_Title"
    Then I select "Direct Post" from "CommunicationMethodId"
    #scenario 2: ABN/ACN combination verified against ABR, and the Organisation name entered does not match Organisation name returned from ABR (3rd party verification)
    Then I select "Mr" from "ContactPerson_Title"
    Then I select "Direct Post" from "CommunicationMethodId"
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
      | PostCode                  |              3333 |
      | ContactPerson_FirstName   | TEST              |
      | ContactPerson_LastName    | TEST              |
      | ContactPerson_PhoneNumber |          33333333 |
      | ContactPerson_Email       | TEST@TEST.com         |
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
    Then I select "Mr" from "ContactPerson_Title"
    Then I click on "TaxPayerDetailsNext"
    Then I wait for "2000" millisecond
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                                 |
      | item2 | Business Activity Elsewhere in Australia |
      | item3 | Business Activity Category               |
      | item4 | Control and Financial Interest           |
      
	
	@wip
  Scenario Outline: DTSP-311: Validation Rules and Errors to be used across Annual Reconciliation Form
  
  	#MADE OUTDATED BY CHANGES TO THE PAYROLL LODGEMENT FORM, NOW REPLACED BY DTSP-523
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
    Then I select "2013" from "AnnualObligationSelect"
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
      | PayrollAnswer_AustralianWide              		 |     0 |
    Then I click on button "ACTWagesPaidNext"
    And I wait for "2000" millisecond
    Then I click on button "MonthlyReturnNext"
    And I wait for "2000" millisecond
    #scenario 5: Mandatory fields not filled in
    Then I check "DeclarationConfirm" is readonly
    #scenario 4: OUTDATED (Fields are entered in incorrect format - phone number and/or email field ), then 3 (Fields are entered in correct format)
   
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
      | TSS        | UserNameInput | PasswordInput | latz   | Dbresults1 | 98765123456 | 12345678902 |
      
  	@wip
  Scenario Outline: DTSP-355
    	#MADE OUTDATED BY CHANGES TO THE TAX REGISTRATION ERROR MESSAGES. REPLACED BY DTSP-526, 531
  
     Given I want to login to portal "<PortalName>"
    And I check I am on "Tax Registration Form" page
    Then I wait for "2000" millisecond
    Then I select "Company" from "SelectBusinessTypeCode"
    Then I select "Mr" from "ContactPerson_Title"
    Then I select "Direct Post" from "CommunicationMethodId"
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
      | ContactPerson_Email       | TEST@TEST.com         |
    Then I select "Other" from "SelectBusinessTypeCode"
    Then I click on "TaxPayerDetailsNext"
    Then I wait for "1000" millisecond
    Then I see text "Your Employer Name or ACN doesn't match with your ABN. Please try again." displayed
    #scenario 3: ABN/ACN combination not verified against ABR (3rd party verification)
    Then I enter the details as
      | Fields                 | Value              |
      | EmployerName           | DB RESULTS PTY LTD |
      | BusinessTradingName    | DB RESULTS PTY LTD |
      | RegistrationAnswer_ABN |        97110187768 |
      | RegistrationAnswer_ACN |          110187768 |
    Then I click on "TaxPayerDetailsNext"
    Then I wait for "1000" millisecond
    Then I see text "Your ABN is not valid. Please enter a valid ABN." displayed
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
  
		 @tss
  Scenario Outline: DTSP-358: As an end user, I want to be able to submit my Annual Payroll Tax Return Form
    #CONFIRMATION LODGEMENT DETAILS NO LONGER EXISTS IN FORM
    
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    And I check I am on "HomePage" page
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName   |
      | item9 | Lodgements |
    And I click on button "Payroll Tax"
    And I check I am on "Payroll Lodgement Form" page
    Then I click on button "Cancel"
    Then I click on button "Payroll Tax"
    And I check I am on "Payroll Lodgement Form" page
    Then I click on button "Answer_TypeAnnual"
    Then I click on button "YearOfReturn"
    Then I click on button "2012"
    Then I click on button "TaxPayerDetailsNext"
    Then I click on button "ACTWagesPaidNext"
    Then I click on button "MonthlyReturnNext"
   	And I wait for "3000" millisecond
    And I enter the details as
      | Fields          | Value        |
      | PersonFullName  | test         |
      | LegalEntityName | Test2        |
      | PhoneNumber     | 610422184033 |
      | EmailAddress    | abc@abc.com  |
    Then I click on button "DeclarationConfirm"
    Then I click on button "ConfirmBack"
    Then I click on button "DeclarationBack"
    Then I click on button "MonthlyReturnNext"
    Then I click on button "DeclarationConfirm"
    Then I check "Submit" is readonly
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                                            |
      | item9 | Client Number                                       |
      | item9 | Reporting Period                                    |
      | item9 | Claiming Tax-free Threshold                         |
      | item9 | I have checked the form and confirmed these details |
    Then I click on button "ConfirmForSubmission"
    Then I click on button "Submit"
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                                                              |
      | item2 | Tax Payer Details                                                     |
      | item2 | Client Reference Number                                               |
      | item2 | ABN                                                                   |
      | item2 | Payroll Tax Group Number                                              |
      | item2 | ACT Wages Paid or Taxable                                             |
      | item9 | Full Name                                                             |
      | item9 | Legal Entity Name                                                     |
    Then I check I am on "Lodgement Summary" page
    Then I click on button "SummarySubmit"
    Then I check I am on "Submission Confirmation" page
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                |
      | item9 | wtMainContent 					|
      
       Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password  |
      | TSS        | UserNameInput | PasswordInput | bob      | dbresults |
  
    Scenario Outline: DTSP-401: As an end user, I should not be able to view/select the 'Return Type' section on the Payroll Tax Lodgement forms when I am on subsequent sections after clicking 'Next'
    #RETURN TYPES ARE NOT PRESENT ON THE FORM ANYMORE
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
      
    @wip
  Scenario Outline: DTSP-443: As a Tax Agent I want the ability to select the Tax Payer I am lodging a return for so that I can lodge the return on their behalf
   	#TAX PAYER DETAILS NO LONGER EXISTS IN FORM; CHOOSING THE CLIENT AND TAX AGENT STUFF IS ALREADY DONE BY DTSP-527
   
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Payroll Tax Lodgement"
    #Scenario 1: New section on the Payroll Tax page for Tax Agent
    Then I click on button "Discard"
    Then I see text "Choose a Client" displayed
    #Scenario 2: New Field in the 'Client' section for Tax Agent to select Tax Payer
    Then I click on button "BusinessEntityDropdown"
    Then I enter the details as
      | Fields               | Value          |
      | s2id_autogen1_search | Darren PTY LTD |
    # click on the first option available (standard dropdown step doesn't seem to work here)
    Then I click on button "select2-results-1"
    Then I click on button "BusinessEntityDropdown"
    Then I enter the details as
      | Fields               | Value                  |
      | s2id_autogen1_search | Zava (ABN:12345678995) |
    Then I click on button "select2-results-1"
    Then I click on button "ClientBT"
    Then I click on button "NextSection"
    #Scenario 3: Tax Agent to select Tax Payer they are lodging a return for and populate Tax Payer details.
    Then "PayrollAnswer_CRN" displays "12345678995" by default
    Then "PayrollAnswer_ABN" displays "12345678995" by default
    Then I see text "961488" displayed
    Then "OrganizationalName" displays "Zava" by default
    Then I see checkbox "EmployerStatus_Independent" as selected
    #BECAUSE OF THE WAY THE TAX FORM WORKS, THE YEAROFRETURN AND/OR MONTHOFRETURN MUST BE CHANGED EACH TIME THIS TEST IS RUN
    Then I select "2015" from "YearOfReturn"
    Then I select "September" from "MonthOfReturn"
    Then I click on button "TaxPayerDetailsNext"
    Then I click on button "ACTWagesPaidNext"
    Then I click on button "MonthlyReturnNext"
    And I enter the details as
      | Fields              | Value       |
      | PersonFullName      | test        |
      | LegalEntityName     | Test2       |
      | EmployerDeclaration | test        |
      | PhoneNumber         |  0422184033 |
      | EmailAddress        | abc@abc.com |
    Then I click on button "DeclarationBack"
    Then I click on button "MonthlyReturnNext"
    Then I click on button "DeclarationConfirm"
    Then I click on button "ConfirmForSubmission"
    Then I click on button "wtSubmitBT"
    Then I click on button "SummarySubmit"
    #Scenario 4: Add link to "Submission Confirmation" page to allow Tax agent to lodge another return
    Then I click on button "LodgeAnotherReturnBT"
    #Scenario 5: New link on Submission confirmation page to direct use to "Lodge Payroll Tax Return Page
    Then I check I am on "Payroll Lodgement Form" page

    Examples: 
      | PortalName | UserName  | Password   |
      | TSS        | taxagent1 | Dbresults1 |