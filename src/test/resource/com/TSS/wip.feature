Feature: wip
	
#	@fixed
#	Scenario Outline: DTSP-310
    #Given I want to login to portal "<PortalName>"
    #And I check I am on "Tax Registration Form" page
    #Then I wait for "2000" millisecond
    #Then I select "Company" from "SelectBusinessTypeCode"
    #Then I select "Miss" from "ContactPerson_Title"
    #Then I select "SMS" from "CommunicationMethodId"
    #scenario 1: Restricted fields contain incorrect text type (e.g. ABC into 1234 field and vice versa)
    #Then I enter the details as
      #| Fields                 | Value |
      #| RegistrationAnswer_ABN | TEST  |
    #Then I check "RegistrationAnswer_ABN" is empty
    #scenario 2: Restricted fields contain correct text type (e.g. ABC into 1234 field)
    #Then I enter the details as
      #| Fields                 | Value       |
      #| RegistrationAnswer_ABN | 97110187767 |
    #scenario 5: Mandatory fields not filled in
    #Then I check "TaxPayerDetailsNext" is readonly
    #scenario 3, 4: Fields are entered in incorrect format (e.g. no. of digits, email format), Fields are entered in incorrect format (Refer to description for validations and error messages for each field)
    #Then I enter the details as
      #| Fields                    | Value             |
      #| EmployerName              | DB RESULTS PTY LT |
      #| BusinessTradingName       | DB RESULTS PTY LT |
      #| RegistrationAnswer_ABN    |       97110187767 |
      #| RegistrationAnswer_ACN    |         110187767 |
      #| AddressLine1              | TEST              |
      #| Address_City              | TEST              |
      #| PostCode                  |                33 |
      #| ContactPerson_FirstName   | TEST              |
      #| ContactPerson_LastName    | TEST              |
      #| ContactPerson_PhoneNumber |             33333 |
      #| ContactPerson_Email       | TEST              |
    #Then I select "Other" from "SelectBusinessTypeCode"
    #Then I click on "TaxPayerDetailsNext"
    #Then I see text "Please enter the correct number of digits for this field." displayed
    #Then I see text "number of digits for this field." displayed
    #Then I see text "Incorrect Email Format." displayed
    #Then I see text "Invalid Phone Number. Phone Number should be 8 digits. Please try again." displayed
    #Then I enter the details as
      #| Fields                    | Value              |
      #| EmployerName              | DB RESULTS PTY LTD |
      #| BusinessTradingName       | DB RESULTS PTY LTD |
      #| RegistrationAnswer_ABN    |        97110187767 |
      #| RegistrationAnswer_ACN    |          110187767 |
      #| AddressLine1              | TEST               |
      #| Address_City              | TEST               |
      #| PostCode                  |               3333 |
      #| ContactPerson_FirstName   | TEST               |
      #| ContactPerson_LastName    | TEST               |
      #| ContactPerson_PhoneNumber |           33333333 |
      #| ContactPerson_Email       | TEST@TEST          |
    #Then I select "Other" from "SelectBusinessTypeCode"
    #Scenario 6: Mandatory fields all filled in
    #Then I select "Miss" from "ContactPerson_Title"
    #Then I click on "TaxPayerDetailsNext"
    #Then I wait for "2000" millisecond
    #Then "<Item>" is displayed as "<ItemName>"
      #| Item  | ItemName                                 |
      #| item2 | Business Activity Elsewhere in Australia |
      #| item3 | Business Activity Category               |
      #| item4 | Control and Financial Interest           |
#
    #Examples: 
      #| PortalName       | UserNameField | PasswordField | UserName | Password   | CRN         | ABN         |
      #| Tax_Registration | UserNameInput | PasswordInput | mbrown   | Dbresults1 | 12345678901 | 12345678901 |
#	
#	@fixed
#	Scenario Outline: DTSP-459
    #Given I want to login to portal "<PortalName>"
    #Then I click on "Create Account"
    #Then I check I am on "Registration" page
    #Scenario 1: User accesses the 'Registration Verification' page
    #Then "<Item>" is displayed as "<ItemName>"
      #| Item  | ItemName                               |
      #| item2 | Australian Business Number (ABN)       |
      #| item3 | Client Reference Number (CRN)          |
      #| item5 | By creating an account, I agree to the |
    #Scenario 7: User clicks on the â€˜Sign Inâ€™ link
    #Then I click on "Sign In"
    #Then I check I am on "Login" page
    #Scenario 8: User views Terms and Conditions
    #Then I click on "Create Account"
    #Then I click on "Terms & Conditions"
    #Then a new page "http://dbresults.com.au/terms/" is launched
    #Given I want to login to portal "<PortalName>"
    #Then I click on "Create Account"
    #Scenario 3: User has not entered all the mandatory fields
    #Then I check "RegistrationSubmit" is readonly
    #Scenario 2: User tries to enter incorrect input type into a restricted fields (e.g. entering ABC into a Number field)
    #Then I enter the details as
      #| Fields                  | Value |
      #| InputABNNumber_Business | TEST  |
      #| InputCRNNumber_Business | TEST  |
    #Then I check "InputABNNumber_Business" is empty
    #Then I check "InputCRNNumber_Business" is empty
    #Scenario 4: Registration details do not pass the frontend validation
    #Then I enter the details as
      #| Fields                  | Value |
      #| InputABNNumber_Business |     3 |
      #| InputCRNNumber_Business |     3 |
    #Then I click on button "TermsandConditionsCheckBox"
    #Then I click on button "RegistrationSubmit"
    #Then I see text "Invalid ABN. ABN Should be 11 Digits. Please try again." displayed
    #Then I see text "Invalid CRN. CRN Should be 6 digits. Please try again." displayed
    #Scenario 6: Registration details failed the verification with stubs
    #Then I enter the details as
      #| Fields                  | Value       |
      #| InputABNNumber_Business | 33333333333 |
      #| InputCRNNumber_Business |      333333 |
    #Then I click on button "RegistrationSubmit"
    #Then I wait for "1000" millisecond
    #Then I see text "Invalid CRN, ABN or ACN. Please try again" displayed
    #Scenario 5: Registration details verified with stubs
    #Then I enter the details as
      #| Fields                  | Value       |
      #| InputABNNumber_Business | 12345678949 |
      #| InputCRNNumber_Business | 12345678949 |
    #Then I click on button "RegistrationSubmit"
    #Then I check I am on "Complete Registration" page
#
    #Examples: 
      #| PortalName | UserName | Password   |
      #| TSS        | jscott   | Dbresults1 |
#	
#	@fixed
#	  Scenario Outline: DTSP-460: s an organisation I want user inputs to be restricted & validated during Tax Agent's portal registration so that human error can be minimised
    #Given I want to login to portal "<PortalName>"
    #Then I click on "Create Account"
    #Then I check I am on "Registration" page
    #Then I see checkbox "RegistrationAsBusiness" as selected
    #Then I see checkbox "RegistrationAsTaxAgent" as not selected
    #Then I click on "Register as a Tax Agent"
    #Scenario 1: User tries to enter incorrect input type into a restricted fields (e.g. entering ABC into a number field)
    #Then I enter the details as
      #| Fields                   | Value |
      #| InputTaxAgentRegId       | TEST  |
      #| InputTaxAgentABN         | TEST  |
      #| BusinessAddress_Postcode | TEST  |
    #Then I check "InputTaxAgentRegId" is empty
    #Then I check "InputTaxAgentABN" is empty
    #Then I check "BusinessAddress_Postcode" is empty
    #Scenario 2: Tax Agent Registration details do not pass the frontend validation
    #Then I enter the details as
      #| Fields                    | Value            |
      #| InputTaxAgentABN          |               11 |
      #| InputTaxAgentBusinessName | Automated Tester |
      #| BusinessAddress_Address1  | TEST         |
      #| BusinessAddress_Address2  | TEST         |
      #| BusinessAddress_Suburb    | TEST         |
      #| BusinessAddress_Postcode  |         3333 |
    #And I select "Victoria" from "BusinessAddress_StateId"
    #Then I click on button "TermsandConditionsCheckBox2"
    #Then I click on button "RegistrationSubmit"
    #Then I wait for "1000" millisecond
    #Then I see text "Invalid ABN. ABN Should be 11 Digits. Please try again." displayed
#
    #Examples: 
      #| PortalName | UserName | Password   |
      #| TSS        | jscott   | Dbresults1 |
#
  #NOTE: Ensure that mbrown has a current employee type selected in the data extensions page
  #@fixed
  #Scenario Outline: DTSP-311: Validation Rules and Errors to be used across Annual Reconciliation Form
    #Given I want to login to portal "<PortalName>"
    #And I enter the details as
      #| Fields        | Value      |
      #| UserNameInput | <UserName> |
      #| PasswordInput | <Password> |
    #And I hit Enter
    #And I click on "Payroll Tax Lodgement"
    #Then I click on button "Discard"
    #Then I click on "Annual Reconciliation"
    #Then I click on button "NextSection"
    #Then I select "2012" from "YearOfReturn"
    #Then I click on "Designated group employer for a group and lodging for itself"
    #Then I click on "TaxPayerDetailsNext"
    #Then I wait for "2000" millisecond
    #scenario 1: Restricted fields contain incorrect text type
    #Then I enter the details as
      #| Fields           | Value |
      #| SalariesAndWages | ABC   |
    #Then I check "SalariesAndWages" is empty
    #scenario 2:  Restricted fields contain correct text type
    #Then I enter the details as
      #| Fields                | Value |
      #| SalariesAndWages      |   100 |
      #| BonusesAndCommissions |   100 |
    #long id is present here to avoid conflict with a button caleld 'ACTWAgesPaidBackBt2', should be fixed soon
    #Then I wait for "1000" millisecond
    #Then I click on button "PaidBackBt"
    #Then I click on button "TaxPayerDetailsNext"
    #Then I check "SalariesAndWages" contains "$ 100"
    #Then I check "BonusesAndCommissions" contains "$ 100"
    #Then I click on button "ACTWagesPaidNext"
    #And I wait for "2000" millisecond
    #Then I click on button "MonthlyReturnNext"
    #And I wait for "2000" millisecond
    #scenario 5: Mandatory fields not filled in
    #Then I check "DeclarationConfirm" is readonly
    #scenario 4 (Fields are entered in incorrect format - phone number and/or email field ), then 3 (Fields are entered in correct format)
    #And I enter the details as
      #| Fields              | Value  |
      #| PersonFullName      | test   |
      #| LegalEntityName     | Test2  |
      #| EmployerDeclaration | test   |
      #| PhoneNumber         | 042213 |
      #| EmailAddress        | abc    |
    #And I Tab Out
    #Then I click on "DeclarationConfirm"
    #Then I see text "Invalid Phone Number. Phone Number should be 8 digits. Please try again." displayed
    #Then I see text "Incorrect Email Format." displayed
    #Then I enter the details as
      #| Fields       | Value       |
      #| PhoneNumber  | 61042218431 |
      #| EmailAddress | abc@test.com    |
    #And I Tab Out
    # scenario 6: Mandatory fields all filled in
    #Then I click on button "DeclarationConfirm"
    #Then I check "Submit" is readonly
    # Scenario 7: Number of days is invalid
    #Then I click on "Payroll Tax Lodgement"
    #Then I click on button "NextSection"
    #Then I select "2012" from "YearOfReturn"
    #Then I click on button "TaxPayerDetailsNext"
    #Then I click on button "ClaimingACTProportion_Yes"
    #Then I click on button "ACTWagesPaidNext"
    #Then I wait for "2000" millisecond
    #Then I enter the details as
      #| Fields                      | Value |
      #| Answer_DaysPaidTaxable      |   367 |
      #| DaysPaidGroupAusWide        |   367 |
      #| AustralianWide              |   100 |
      #| PayrollAnswer_GroupActWages |   100 |
    #Then I wait for "1000" millisecond
    #Then I click on button "MonthlyReturnNext"
    #Then I wait for "2000" millisecond
    #Then I see text "Number of days must be equal to or less than 365, or 366 for leap years" displayed
    #Then I see text "Some fields are not valid. Please fix them before moving to the next section." displayed
#
    #Examples: 
      #| PortalName | UserNameField | PasswordField | UserName | Password   | CRN         | ABN         |
      #| TSS        | UserNameInput | PasswordInput | mbrown   | Dbresults1 | 98765123456 | 12345678902 |
	
	@onhold
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
    Then I see text "Invalid Phone Number. Phone Number should be 8 digits. Please try again." displayed
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
    #Then I select "TOYOTA SUPER PTY LTD (21006819692)" from "ChooseTaxAgent"
    Then I click on button "ChooseTaxAgent"
    Then I click on button "select2-results-1"
    #Then I click on ""
    #Then I enter the details as
      #| Fields               | Value                  |
      #| s2id_autogen1_search | TOYOTA SUPER PTY LTD (21006819692) |
 #		Then I click on button "select2-results-1"
     #Then I enter the details as
      #| Fields                   | Value                 |
      #| Input_FirstName          | TEST2                  |
      #| Input_LastName           | TEST2                  |
    Then I click on button "Submit"
    Then I see text "Your changes have been successfully saved." displayed
    Then I check I am on "View Settings" page

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password   | CRN         | ABN         |
      | TSS        | UserNameInput | PasswordInput | jbradley | Dbresults1 | 12121212121 | 21212121212 |
	
	@onhold
	Scenario Outline: DTSP-526: Update the ABN LookUp Rules for Payroll Tax Registration Form
	Given I want to login to portal "<PortalName>"
  And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
  And I hit Enter
  Then I click on "Payroll Tax Registration"
  
  
  #Scenario 1: ABN Lookup for an Active Individual Employer with correct Employer Name and ACN 
  Then I select "Company" from "SelectBusinessTypeCode"
  Then I select "Miss" from "ContactPerson_Title"
  Then I select "SMS" from "CommunicationMethodId"
  Then I enter the details as
      | Fields                    | Value              |
      | EmployerName              | SOO-ENG LIM |
      | BusinessTradingName       | SOO-ENG LIM |
      | RegistrationAnswer_ABN    |        15008435135 |
      | AddressLine1              | TEST               |
      | Address_City              | TEST               |
      | PostCode                  |               3333 |
      | ContactPerson_FirstName   | TEST               |
      | ContactPerson_LastName    | TEST               |
      | ContactPerson_PhoneNumber |           33333333 |
      | ContactPerson_Email       | TEST@TEST.com          |
  Then I select "Other" from "SelectBusinessTypeCode"
  Then I click on "TaxPayerDetailsNext"
  Then I see text "Control and Financial Interest" displayed
 	Then I click on "Payroll Tax Registration"
  Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "OK"
  
  #Scenario 2: ABN Lookup for an Active Individual Employer with wrong Employer Name or wrong ACN 
  Then I select "Company" from "SelectBusinessTypeCode"
  Then I select "Miss" from "ContactPerson_Title"
  Then I select "SMS" from "CommunicationMethodId"
  Then I enter the details as
      | Fields                    | Value              |
      | EmployerName              | SOO-ENG LIN |
      | BusinessTradingName       | SOO-ENG LIN |
      | RegistrationAnswer_ABN    |        15008435135 |
      | AddressLine1              | TEST               |
      | Address_City              | TEST               |
      | PostCode                  |               3333 |
      | ContactPerson_FirstName   | TEST               |
      | ContactPerson_LastName    | TEST               |
      | ContactPerson_PhoneNumber |           33333333 |
      | ContactPerson_Email       | TEST@TEST.com          |
  Then I select "Other" from "SelectBusinessTypeCode"
  Then I click on "TaxPayerDetailsNext"
  Then I see text "Your Employer Name or ACN doesn't match with your ABN. Please try again." displayed
 	Then I click on "Payroll Tax Registration"
  Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "OK"
  
  
  #Scenario 3: ABN Lookup for an Active Non-Individual Employer with correct Employer Name and ACN 
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
      | ContactPerson_Email       | TEST@TEST.com          |
  Then I select "Other" from "SelectBusinessTypeCode"
  Then I click on "TaxPayerDetailsNext"
  Then I see text "Control and Financial Interest" displayed
 	Then I click on "Payroll Tax Registration"
  Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "OK"
  
  #Scenario 4: ABN Lookup for an Active Non-Individual Employer with wrong Employer Name or wrong ACN 
  Then I select "Company" from "SelectBusinessTypeCode"
  Then I select "Miss" from "ContactPerson_Title"
  Then I select "SMS" from "CommunicationMethodId"
  Then I enter the details as
      | Fields                    | Value              |
      | EmployerName              | DB RESULTS PTY LT |
      | BusinessTradingName       | DB RESULTS PTY LT |
      | RegistrationAnswer_ABN    |        97110187767 |
      | RegistrationAnswer_ACN    |          110187765 |
      | AddressLine1              | TEST               |
      | Address_City              | TEST               |
      | PostCode                  |               3333 |
      | ContactPerson_FirstName   | TEST               |
      | ContactPerson_LastName    | TEST               |
      | ContactPerson_PhoneNumber |           33333333 |
      | ContactPerson_Email       | TEST@TEST.com          |
  Then I select "Other" from "SelectBusinessTypeCode"
  Then I click on "TaxPayerDetailsNext"
  Then I see text "Your Employer Name or ACN doesn't match with your ABN. Please try again." displayed
 	Then I click on "Payroll Tax Registration"
  Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "OK"

  #Scenario 5: ABN Lookup for Inactive ABN 
 Then I select "Company" from "SelectBusinessTypeCode"
  Then I select "Miss" from "ContactPerson_Title"
  Then I select "SMS" from "CommunicationMethodId"
  Then I enter the details as
      | Fields                    | Value              |
      | EmployerName              | GRAHAM PETER DEAN |
      | BusinessTradingName       | GRAHAM PETER DEAN |
      | RegistrationAnswer_ABN    |        15207556760 |
      | AddressLine1              | TEST               |
      | Address_City              | TEST               |
      | PostCode                  |               3333 |
      | ContactPerson_FirstName   | TEST               |
      | ContactPerson_LastName    | TEST               |
      | ContactPerson_PhoneNumber |           33333333 |
      | ContactPerson_Email       | TEST@TEST.com          |
  Then I select "Other" from "SelectBusinessTypeCode"
  Then I click on "TaxPayerDetailsNext"
  Then I see text "Your ABN is not valid. Please enter a valid ABN." displayed
 	Then I click on "Payroll Tax Registration"
	Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "OK"
  
  
  #Scenario 6: ABN Lookup for Invalid ABN 
   Then I select "Company" from "SelectBusinessTypeCode"
  Then I select "Miss" from "ContactPerson_Title"
  Then I select "SMS" from "CommunicationMethodId"
  Then I enter the details as
      | Fields                    | Value              |
      | EmployerName              | NO |
      | BusinessTradingName       | NO |
      | RegistrationAnswer_ABN    |        11111111111 |
      | RegistrationAnswer_ACN    |          111111111 |
      | AddressLine1              | TEST               |
      | Address_City              | TEST               |
      | PostCode                  |               3333 |
      | ContactPerson_FirstName   | TEST               |
      | ContactPerson_LastName    | TEST               |
      | ContactPerson_PhoneNumber |           33333333 |
      | ContactPerson_Email       | TEST@TEST.com          |
  Then I select "Other" from "SelectBusinessTypeCode"
  Then I click on "TaxPayerDetailsNext"
  Then I see text "Your ABN is not valid. Please enter a valid ABN" displayed
 	Then I click on "Payroll Tax Registration"
  Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "OK"
  
   Examples:
      | PortalName | UserNameField | PasswordField | UserName | Password   | UserName2 | Password2   |
      | TSS        | UserNameInput | PasswordInput | jbradley | Dbresults1 | taxagent1 | Dbresults1  |
  
  @review
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
  
  @review
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
	
	@review
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
	@review
	Scenario Outline: DTSP-506: Update default answer to a question on the Payroll Tax Registration form
	 Given I want to login to portal "<PortalName>"
   And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Payroll Tax Registration"
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
      
  
  @done
  Scenario Outline: DTSP-461: Update the Capture User Details page
    Given I want to login to portal "<PortalName>"
    Then I click on "Create Account"
    Then I check I am on "Registration" page
    #Scenario 1: User accesses the 'Capture User Details' page
    Then I enter the details as
      | Fields                  | Value       |
      | InputABNNumber_Business | 12345678949 |
      | InputCRNNumber_Business | 12345678949 |
    Then I click on button "TermsandConditionsCheckBox2"
    Then I click on button "RegistrationSubmit"
    Then I check I am on "Complete Registration" page
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
    Then I see text "Invalid email address format. Please try again." displayed
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
    Then I enter the details as
      | Fields                  | Value       |
      | InputABNNumber_Business | 12345678949 |
      | InputCRNNumber_Business | 12345678949 |
    Then I click on button "TermsandConditionsCheckBox2"
    Then I click on button "RegistrationSubmit"
    #Scenario 6: User cancels registration with no unsaved changes
    Then I click on button "Cancel"
    Then I click on "Create Account"
    Then I check I am on "Registration" page
    Then I enter the details as
      | Fields                  | Value       |
      | InputABNNumber_Business | 12345678949 |
      | InputCRNNumber_Business | 12345678949 |
    Then I click on button "TermsandConditionsCheckBox2"
    Then I click on button "RegistrationSubmit"
    Then I enter the details as
      | Fields          | Value                 |
      | FirstName       | TEST                  |
      | LastName        | TEST                  |
      | PhoneNumber     |             333333333 |
      | Email           | TEST@TEST.com             |
      | Username        | TEST                  |
      | NewPassword     | Dbresults1            |
      | ConfirmPassword | Dbresults1            |
      | Hint            | testsetsetwetstsetset |
    Then I check "Submit" is not readonly

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password   | CRN         | ABN         |
      | TSS        | UserNameInput | PasswordInput | jbradley | Dbresults1 | 12121212121 | 21212121212 |

  @onhold
  Scenario Outline: DTSP-305: As a Customer Portal Administrator (CPA), I want to be able to edit the taxpayer tips displayed on specific forms so that I can help the end user better understand the form fields
    # ONHOLD until Hemant can give me advice about the firefinder not detecting xpaths in the popups
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Settings"
    #Scenario 1: CPA accesses the 'Edit Tool Tip' pop up window
    Then I click on button "EditTooltip"
    Then I wait for "1000" millisecond
    #Scenario 2: Number of remaining characters displays
    And I enter the details as
      | Fields              | Value |
      | Tooltip_Description | TEST  |
    Then I see text "Characters left:232" displayed
    #Scenario 3: CPA edits the tool tip Description
    Then I click on button "SaveTooltipChanges"
    #Scenario 5: CPA deactivates a tool tips
    Then I click on button "EditTooltip"
    Then I click on button "Tooltip_IsVisible"
    Then I click on button "SaveTooltipChanges"
    Then I click on button "EditTooltip"
    Then I see checkbox "Tooltip_IsVisible" as not selected
    #Scenario 4: CPA activates a tool tips
    Then I click on button "Tooltip_IsVisible"
    Then I click on button "SaveTooltipChanges"
    Then I click on button "EditTooltip"
    Then I see checkbox "Tooltip_IsVisible" as selected
    #Scenario 6: All mandatory fields has not been filled
    Then I click on button "EditTooltip"
    And I enter the details as
      | Fields              | Value |
      | Tooltip_Description |       |
    Then I check "SaveTooltipChanges" is readonly
    And I enter the details as
      | Fields              | Value             |
      | Tooltip_Description | asdfasdfasdfasdfa |
    #Scenario 7: CPA clicks 'CANCEL' with unsaved changes
    Then I click on button "Cancel"
    Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "Cancel"
    Then I click on button "Cancel"
    Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "OK"
    #Scenario 8: CPA clicks 'CANCEL' with saved changes
    Then I click on button "EditTooltip"
    Then I click on button "Cancel"
    Then I click on button "EditTooltip"

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password   | CRN         | ABN         |
      | TSS        | UserNameInput | PasswordInput | jbradley | Dbresults1 | 12121212121 | 21212121212 |

  @review
  Scenario Outline: DTSP-463: Display all the mandatory fields with an Asterisk (*)
    #On hold until a clear standard for the mandatory field asterisks can be made
    #PART 1: Login Screen
    Given I want to login to portal "<PortalName>"
    Then I check "UserNameEmailLabel" is marked as "Mandatory"
    Then I check "PasswordLabel" is marked as "Mandatory"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    And I click on "Payroll Tax Lodgement"
    Then I click on button "Discard"
    #Part 2: Payroll Tax (Annual)
    Then I click on "Payroll Tax Lodgement"
    Then I click on "Monthly Return"
    Then I click on button "NextSection"
    Then I select "2014" from "YearOfReturn"
    Then I select "January" from "MonthOfReturn"
    Then I check "YearOfReturnLabel" is marked as "Mandatory"
    Then I check "MonthOfReturnLabel" is marked as "Mandatory"
    Then I check "CurrentEmployerStatusLabel" is marked as "Mandatory"
    Then I click on "Designated group employer for a group and lodging for itself"
    Then I click on button "TaxPayerDetailsNext"
    Then I check "ClaimingACTProportion_Label" is marked as "Mandatory"
    Then I click on button "ClaimingACTProportion_Yes"
    Then I click on button "ACTWagesPaidNext"
    Then I check "AusWideWages" is marked as "Mandatory"
    Then I check "GroupActWages" is marked as "Mandatory"
    Then I enter the details as
      | Fields                       | Value |
      | PayrollAnswer_AustralianWide |     1 |
      | PayrollAnswer_GroupActWages  |    98 |
		Then I click on button "MonthlyReturnBack"
		Then I click on button "ACTWagesPaidNext"
    Then I click on button "MonthlyReturnNext"
    Then I check "PersonFullNameLabel" is marked as "Mandatory"
    Then I check "LegalEntityNameLabel" is marked as "Mandatory"
    Then I check "EmployerDeclarationLabel" is marked as "Mandatory"
    Then I check "PhoneNumberLabel" is marked as "Mandatory"
    Then I check "EmailAddressLabel" is marked as "Mandatory"
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
    Then I click on "Sign Out"
    #PART 3: Create Account (TODO Once labels have IDs)
    Given I want to login to portal "<PortalName>"
    Then I click on "Create Account"
    Then I click on button "TermsandConditionsCheckBox2"
    Then I check "InputAccountNumberLabel" is marked as "Mandatory"
    #Then I check "SelectBusinessType" is marked as "Mandatory"
    Then I click on button "RegistrationAsTaxAgent"
    Then I check "InputTaxAgentABNLabel" is marked as "Mandatory"
    Then I check "InputTaxAgentBusinessNameLabel" is marked as "Mandatory"
    Then I click on button "RegistrationAsBusiness"
    Then I enter the details as
      | Fields                  | Value       |
      | InputABNNumber_Business | 12345678949 |
      | InputCRNNumber_Business | 12345678949 |
    Then I click on button "RegistrationSubmit"
    Then I check "Registration_FirstNameLabel" is marked as "Mandatory"
    Then I check "Registration_LastNameLabel" is marked as "Mandatory"
    Then I check "Registration_EmailLabel" is marked as "Mandatory"
    Then I check "Registration_UsernameLabel" is marked as "Mandatory"
    Then I check "Registration_NewPasswordLabel" is marked as "Mandatory"
    Then I check "Registration_ConfirmPasswordLabel" is marked as "Mandatory"
    Then I check "Registration_HintLabel" is marked as "Mandatory"
    #PART 4: Tax Registration Form
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Payroll Tax Registration"
    Then I wait for "2000" millisecond
    Then I check "SelectBusinessType" is marked as "Mandatory"
    Then I check "EmployerName" is marked as "Mandatory"
    Then I check "BusinessTradingName" is marked as "Mandatory"
    Then I check "Label_AustralianBusinessNumber_ABN" is marked as "Mandatory"
    Then I check "Label_BusinessAdress_Country" is marked as "Mandatory"
    Then I check "Label_BusinessAddress_AddressLine1" is marked as "Mandatory"
    Then I check "Label_BusinessAdress_Suburb" is marked as "Mandatory"
    Then I check "Label_BusinessAdress_Territory" is marked as "Mandatory"
    Then I check "Label_BusinessAdress_Postcode" is marked as "Mandatory"
   #Then I check "Text_PostalAddress" is marked as "Mandatory"
    #Then I check "Text_AddresswhereBusinessRecordsarelocated_Jurisdi" is marked as "Mandatory"
    Then I check "Label_ContactPerson_Title" is marked as "Mandatory"
    Then I check "ContactPerson_FirstName" is marked as "Mandatory"
    Then I check "ContactPerson_LastName" is marked as "Mandatory"
    Then I check "Label_ContactPerson_ContactPhoneNumber" is marked as "Mandatory"
    Then I check "Label_ContactPerson_EmailAddress" is marked as "Mandatory"
    Then I check "Label_PreferedCommunicationMethod" is marked as "Mandatory"
    #Then I check "Label_PostalAddress" is marked as "Mandatory"
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
      | ContactPerson_Email       | TEST@TEST.com          |
    #Then I select "AL" from "Address_State"
    Then I select "Other" from "SelectBusinessTypeCode"
    Then I click on "TaxPayerDetailsNext"
    Then I check "Label_BusinessActivityCategory" is marked as "Mandatory"
    Then I wait for "2000" millisecond
    Then I click on "ACTWagesPaidNext"
    Then I wait for "2000" millisecond
    Then I check "Label_DateBusinessCommencedEmployinginACT" is marked as "Mandatory"
    Then I check "Label_DateBusinessBecameLiableintheACT" is marked as "Mandatory"
    Then I check "Label_NumberofEmployeesinyourACTBusiness" is marked as "Mandatory"
    #Then I see text "Are you a member of a group?*" displayed
    Then I check "Label_Asaneligibleemployer_doyouwishtoapplyforannu" is marked as "Mandatory"
    Then I click on button "AnnualLodgementApproval_YES"
    Then I check "Label_AnnualLodgementRequestJustification" is marked as "Mandatory"
    #Then I check "Text_ContactPersonforPayrollTax" is marked as "Mandatory"
    Then I click on "DateBusinessStart"
    Then I click on "20170206"
    Then I click on "DateBusinessLiable"
    Then I click on "20170207"
    Then I enter the details as
      | Fields               | Value |
      | NumberOfEmployees    |    33 |
      | RequestJustification | TEST  |
    Then I click on "GroupMember_UNSURE"
    Then I click on button "AnnualLodgementApproval_NO"
    Then I click on "PayrollNext"
    Then I wait for "2000" millisecond
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                        |
      | item2 | Set Up Bank Account for Refunds |
      | item3 | BSB                             |
      | item4 | Bank Account Number             |
    Then I check "Label_BSB" is marked as "Mandatory"
    Then I check "Label_BankAccountNumber" is marked as "Mandatory"
    Then I check "Label_BankAccountName" is marked as "Mandatory"
    Then I click on button "Refunds_NO"
    
    #CAPTCHA IS HERE, CANNOT PROCEED ANY FURTHER
    #Then I click on button "RefundDetailsNext"
    #Then "<Item>" is displayed as "<ItemName>"
      #| Item  | ItemName                                                                         |
      #| item2 | Declaration                                                                      |
      #| item3 | Declarer                                                                         |
      #| item5 | I declare that this information is true and correct to the best of my knowledge. |
    #Then I check "Label_Declarer" is marked as "Mandatory"
    #Then I check "Label_Organisation" is marked as "Mandatory"
    #Then I check "Label_Employer" is marked as "Mandatory"
    #Then I check "Label_ContactPhone" is marked as "Mandatory"
    #Then I check "Label_EmailAdress" is marked as "Mandatory"

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password   | CRN         | ABN         |
      | TSS        | UserNameInput | PasswordInput | jbradley | Dbresults1 | 12121212121 | 21212121212 |


  @onhold
  Scenario Outline: DTSP-470
    #ON HOLD UNTIL THE DIV OVERLAPPING ISSUE WITH THE SAVE AND EXIT BUTTON CAN BE RESOLVED
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    #Scenario 2: User clicks on Discard when completing a Payroll Tax Form
    Then I click on "Payroll Tax Lodgement"
    Then I click on button "Discard"
    Then I check I am on "Payroll Lodgement Form" page
    Then I see checkbox "Answer_TypeAnnual" as not selected
    Then I click on button "NextSection"
    #Scenario 4: User has not filled out all the Mandatory fields within the section.
    Then I check "TaxPayerDetailsNext" is readonly
    #Scenario 3: User clicks on Save and Exit when completing a Payroll Tax Form (unsaved data pass's validation)
    Then I select "2014" from "YearOfReturn"
    Then I select "March" from "MonthOfReturn"
    Then I click on "Designated group employer for a group and lodging for itself"
    Then I click on "TaxPayerDetailsNext"
    Then I wait for "1000" millisecond
    Then I enter the details as
      | Fields           | Value |
      | SalariesAndWages |   100 |
    Then I click on button "ACTWagesPaidNext"
    Then I click on button "MonthlyReturnBack"
    Then I click on button "ACTWagesPaidBack"
    Then I click on button "TaxPayerDetailsBT"
    #Then I scroll up
    Then I wait for "2000" millisecond
    Then I click on button "SaveAndExitBt"
    Then I check I am on "HomePage" page
    Then I click on "Payroll Tax Lodgement"
    Then I check I am on "Payroll Lodgement Form" page
    Then I click on button "NextSection"
    Then I click on button "TaxPayerDetailsNext"
    Then I check "SalariesAndWages" contains "100"
    Then I click on button "ACTWagesPaidNext"
    Then I click on button "MonthlyReturnNext"
    #Scenario 5: User has not filled out all the Mandatory fields within the section.
    Then I check "SaveAndExitBt" is readonly
    And I enter the details as
      | Fields              | Value     |
      | PersonFullName      | test      |
      | LegalEntityName     | Test2     |
      | EmployerDeclaration | test      |
      | PhoneNumber         | 042213324 |
      | EmailAddress        | abc       |
    Then I click on button "SaveAndExitBt"

    Examples: 
      | PortalName | UserName | Password   |
      | TSS        | jscott   | Dbresults1 |
      
   @done
   Scenario Outline: DTSP-443: As a Tax Agent I want the ability to select the Tax Payer I am lodging a return for so that I can lodge the return on their behalf
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
    	| Fields | Value |
    	| s2id_autogen1_search| Darren PTY LTD |
    	
   	# click on the first option available (standard dropdown step doesn't seem to work here)
   	Then I click on button "select2-results-1"
    Then I click on button "BusinessEntityDropdown"
    Then I enter the details as 
    	| Fields | Value |
    	| s2id_autogen1_search| Zava (ABN:12345678995) |
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
      | PortalName | UserName | Password   |
      | TSS        | taxagent1   | Dbresults1 |
      
  
	@bugtest
	Scenario Outline: DTSP-540 Bug Test
	
	Given I want to login to portal "<PortalName>"
  And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
  And I hit Enter
  Then I click on "Payroll Tax Registration" 
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
  Then I click on "ACTWagesPaidNext"
  Then I wait for "2000" millisecond
  Then I click on "DateBusinessStart"
  Then I click on "20170206"
  Then I click on "DateBusinessLiable"
  Then I click on "20170207"
  Then I click on "GroupMember_UNSURE"
  Then I click on button "AnnualLodgementApproval_YES"
  Then I enter the details as
      | Fields               | Value |
      | RequestJustification | TEST  |
      | NumberOfEmployees    |    33 |
  
  Then I click on "PayrollNext"
  Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password   | CRN         | ABN         |
      | TSS        | UserNameInput | PasswordInput | jbradley | Dbresults1 | 12121212121 | 21212121212 |
  