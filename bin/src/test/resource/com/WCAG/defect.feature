
Feature: defects
#Sample Feature Definition Template
@defect
  Scenario Outline: DTSP-527: Update the relationship between Business Taxpayer, Tax Agent Organisation and Users	
  Given I want to login to portal "<PortalName>"
  And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
  And I hit Enter
  Then I click on "Payroll Tax Lodgement"
  Then I click on button "Discard"
  Then I click on button "NextSection"
  Then I see text "12345678995" displayed
  Then I click on "Sign Out"
  
  Given I want to login to portal "<PortalName>"
  Then I click on "Create Account"
  Then I check I am on "Registration" page
   #Scenario 1: User accesses the 'Capture User Details' page
   
  #DEFECT HERE: ACCORDING TO THE STUB, ABN AND CRN NEED TO BE SAME, BUT CRN IS LIMITED TO SIX DIGITS. REGISTRATION IS SHIFTING TO PSRM, THIS WILL CHANGE SOON
  Then I enter the details as
    | Fields                  | Value       |
    | InputABNNumber_Business | 12345678995 |
    | InputCRNNumber_Business | 12345678995 |
  Then I click on button "TermsandConditionsCheckBox2"
  Then I click on button "RegistrationSubmit"
  Then I check I am on "Complete Registration" page
  
  #Scenario 2: A Tax Agent organisation can have multiple users 
  Given I want to login to portal "<PortalName>"
  #This user has the ABN 12345678933, but since it's a tax agent user it isn't shown in the lodgement form
  And I enter the details as
      | Fields        | Value       |
      | UserNameInput | <UserName2> |
      | PasswordInput | <Password2> |
  And I hit Enter
  Then I click on "Payroll Tax Lodgement"
  Then I click on button "Discard"
  Then I click on "Sign Out"
  
	Given I want to login to portal "<PortalName>"
  Then I click on "Create Account"
  Then I check I am on "Registration" page
  Then I click on "Register as a Tax Agent"
  Then I enter the details as
    | Fields                  	| Value       		 |
    | InputTaxAgentABN 					| 21006819692 		 |
    | InputTaxAgentBusinessName | 	TOYOTA SUPER PTY LTD |
    | BusinessAddress_Address1  | TEST             |
    | BusinessAddress_Address2  | TEST             |
    | BusinessAddress_Suburb    | TEST             |
    | BusinessAddress_Postcode  |             3333 |
  Then I click on button "BusinessAddress_CountryId"
  Then I click on "Australia"
  Then I click on button "BusinessAddress_StateId"
  Then I click on "Victoria"
  #Then I select "Australia" from "BusinessAddress_CountryId"
  #Then I select "Victoria" from "BusinessAddress_StateId"
  Then I click on button "TermsandConditionsCheckBox2"
  Then I click on button "RegistrationSubmit"
  Then I check I am on "Complete Registration" page	
  
  
  #Scenario 3: A Tax Agent Organisation can serve multiple Business Taxpayer 
  Given I want to login to portal "<PortalName>"
  And I enter the details as
      | Fields        | Value       |
      | UserNameInput | <UserName2> |
      | PasswordInput | <Password2> |
  And I hit Enter
  Then I click on "Payroll Tax Lodgement"
  Then I click on button "Discard"
  Then I see text "Choose a Client" displayed
  Then I click on button "BusinessEntityDropdown"
  Then I enter the details as
      | Fields               | Value          |
      | s2id_autogen1_search | Twitternation  |
    # click on the first option available (standard dropdown step doesn't seem to work here)
  Then I click on button "select2-results-1"
  Then I click on button "BusinessEntityDropdown"
  Then I enter the details as
      | Fields               | Value                  |
      | s2id_autogen1_search | Zava (ABN:12345678995) |
  Then I click on button "select2-results-1"
  Then I click on button "ClientBT"
  Then I click on button "NextSection"
  Then I click on "Sign Out"
  
  #Scenario 4: A business Taxypayer can only nominate one Tax Agent Organisation at any point of time  
  Given I want to login to portal "<PortalName>"
  And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
  And I hit Enter
  Then I click on "Settings"
  Then I click on button "Edit"
  Then I click on button "ChooseTaxAgent"
  Then I see text "71072405595" displayed
  Then I see text "SHORI PTY LTD" displayed
  Then I see text "TOYOTA SUPER PTY LTD" displayed
  Then I see text "21006819692" displayed
  
  
  Examples:
      | PortalName | UserNameField | PasswordField | UserName | Password   | UserName2 | Password2   |
      | TSS        | UserNameInput | PasswordInput | jbradley | Dbresults1 | toyota		 | Dbresults1  |
	
	@defect
	
	Scenario Outline: DTSP-501: As an end user, I want the Payroll Tax Registration Form to be updated for Ease of Use
	# SUBJECT TO THE INDEX OUT OF RANGE BLOCKER
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
   Then I select "Company" from "SelectBusinessTypeCode"
    Then I select "Mr" from "ContactPerson_Title"
    Then I select "Direct Post" from "CommunicationMethodId"
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
      | ContactPerson_Email       | TEST@TEST.com          |
    #Then I select "AL" from "Address_State"
    Then I select "Other" from "SelectBusinessTypeCode"
    Then I click on "TaxPayerDetailsNext"
    Then I wait for "2000" millisecond
    Then I click on "ACTWagesPaidNext"
    Then I wait for "2000" millisecond
    
    #Scenario 1: Contact Person for Payroll Tax 
    Then I see text "Same as Business Contact Person" displayed
    Then I click on "Same as Business Contact Person"
    
    #Scenario 2: User is a member of a group 
    Then I click on button "GroupMember_YES"
    Then I see text "Provide group number" displayed
    And I enter the details as
      | Fields        | Value      |
      | ProvideGroupNumber | 1111 |
    
  	Examples:
      | PortalName | UserNameField | PasswordField | UserName | Password   |
      | TSS        | UserNameInput | PasswordInput | jbradley | Dbresults1 |
	@defect
	Scenario Outline: DTSP-506: Update default answer to a question on the Payroll Tax Registration form
	# SUBJECT TO THE INDEX OUT OF RANGE BLOCKER
	 Given I want to login to portal "<PortalName>"
   And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Payroll Tax Registration"
    Then I wait for "2000" millisecond
    Then I select "Company" from "SelectBusinessTypeCode"
    Then I select "Mr" from "ContactPerson_Title"
    Then I select "Direct Post" from "CommunicationMethodId"
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
      | ContactPerson_Email       | TEST@TEST.com          |
    #Then I select "AL" from "Address_State"
    Then I select "Other" from "SelectBusinessTypeCode"
    Then I click on "TaxPayerDetailsNext"
    Then I wait for "2000" millisecond
    Then I click on "ACTWagesPaidNext"
    Then I wait for "2000" millisecond
    Then I see checkbox "AnnualLodgementApproval_NO" as selected
	
	Examples:
      | PortalName | UserNameField | PasswordField | UserName | Password   |
      | TSS        | UserNameInput | PasswordInput | jbradley | Dbresults1 |
      
  
	
	@defect
	Scenario Outline: DTSP-355
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
      | ContactPerson_PhoneNumber |          3333333333 |
      | ContactPerson_Email       | TEST@TEST.com         |
    Then I select "Other" from "SelectBusinessTypeCode"
    #index out of range 1 blocker present here...
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
	
