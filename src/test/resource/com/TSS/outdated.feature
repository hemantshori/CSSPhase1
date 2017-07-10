#Author: This file is exclusively for stories that have been made outdated by changes to the website/program
#List why they have gone outdated down belwo
#Sample Feature Definition Template

Feature: Outdated stuff
	#OUTDATED:  240, 310, 311, 355, 358, 401, 443,


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
      | Fields                    | Value              |
      | InputTaxAgentABN          |        97110187768 |
      | InputTaxAgentBusinessName | DB RESULTS PTY LTD |
      | BusinessAddress_Address1  | TEST               |
      | BusinessAddress_Suburb    | TEST               |
      | BusinessAddress_Postcode  |               3333 |
    Then I click on button "BusinessAddress_StateId"
    Then I click on "Victoria"
    Then I click on button "TermsandConditionsCheckBox2"
    Then I click on button "RegistrationSubmit"
    Then I wait for "5000" millisecond
    Then I see text "Your ABN is not valid. Please enter a valid ABN." displayed

    Examples: 
      | PortalName | UserName | Password   |
      | TSSAdmin        | jscott   | Dbresults1 |

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
    Then I wait for "5000" millisecond
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                               |
      | item2 | Tax Agent's Registration ID            |
      | item5 | Registered Business Name               |
      | item5 | Registered Business Address            |
      | item5 | Country                                |
      | item5 | Address                                |
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
      | Fields                    | Value              |
      | InputTaxAgentABN          |        97110187767 |
      | InputTaxAgentBusinessName | DB RESULTS PTY LTD |
      | BusinessAddress_Address1  | TEST               |
      | BusinessAddress_Suburb    | TEST               |
      | BusinessAddress_Postcode  |               3333 |
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
      | TSSAdmin        | jscott   | Dbresults1 |

 @current
  Scenario Outline: DTSP-530: As a Customer Portal Admin, I want to be able to deactivate end user accounts so that I can remove invalid portal accounts
    Given I want to login to portal "<PortalName>"
    Then I click on "Create Account"
    Then I click on button "RegistrationAsTaxAgent"
    Then I wait for "5000" millisecond
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
      | Registration_Email           | <NewUserName>@automation.com    |
      | Registration_Username        | <NewUserName>                   |
      | Registration_NewPassword     | <Password>                      |
      | Registration_ConfirmPassword | <Password>                      |
      | Registration_Hint            | Done as a result of automation! |
    Then I click on button "SubmitAjaxRfrsh"
    Then I wait for "5000" millisecond
    Then I see text "Registration Confirmation" displayed
    Then I want to login to portal "RegistrationLinkTable"
    Then I click on object with xpath "//*[contains(text(), '<NewUserName>')]/../following-sibling::td/a"
    #Scenario 1: Navigation
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I see text "Manage User Accounts" displayed
    #Scenario 2:Full Name Search
    And I click on "Manage User Accounts"
    Then I enter the details as
      | Fields      | Value    |
      | SearchInput | taxagent |
    Then I click on button with value "Search"
    Then I see text "TaxAgent8@automation.com" displayed
    Then I see text "TaxAgent6@automation.com" displayed
    Then I see text "taxAgent13@automation.com" displayed
    Then I see text "TaxAgent5@automation.com" displayed
    #Scenario 3: Reset
    Then I click on button with value "Reset"
    Then I wait for "5000" millisecond
    Then I check "SearchInput" is empty
    #Scenario 4: Columns
    Then I see text "Select" displayed
    Then I see text "Full Name" displayed
    Then I see text "User Type" displayed
    Then I see text "Email" displayed
    Then I see text "Phone Number" displayed
    Then I see text "Status" displayed
    #Scenario 5: Deactivate
    Then I enter the details as
      | Fields      | Value         |
      | SearchInput | <NewUserName> |
    Then I click on button with value "Search"
    Then I click on button "CheckboxUserSelect"
    Then I click on button with value "Deactivate"
    Then I see "Are you sure you want to deactivate the user?" displayed on popup and I click "Cancel"
    Then I click on button with value "Deactivate"
    Then I see "Are you sure you want to deactivate the user?" displayed on popup and I click "OK"
    Then I see text "Inactive" displayed
    Then I click on "Sign Out"
    And I enter the details as
      | Fields        | Value         |
      | UserNameInput | <NewUserName> |
      | PasswordInput | <Password>    |
    And I hit Enter
    Then I see text "Invalid Username, Email or Password. Please try again." displayed

    Examples: 
      | PortalName | UserName | Password   | CompanyName                                 | ABN         | NewUserName | NewEmail                | Password   |
      | TSSAdmin        | TSSAdmin | Dbresults1 | The trustee for MD & KJ Fragar Family Trust | 70167081615 | dtsp5312    | dtsp5307@automation.com | Dbresults1 |


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
      | Fields                 | Value |
      | RegistrationAnswer_ABN | <ABN> |
    Then I click on button with value "Next"
    Then I wait for "5000" millisecond
    Then I select "Partnership" from "SelectBusinessTypeCode"
    #Then I select "Direct Post" from "CommunicationMethodId"
    Then I enter the details as
      | Fields              | Value                 |
      | EmployerName        | firE CompNY Pty Limid |
      | BusinessTradingName | Fire CompNY Pty Limid |
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
      | Fields              | Value                |
      | EmployerName        | Dynamic Fire Pty Ltd |
      | BusinessTradingName | Dynamic Fire Pty Ltd |
    Then I click on button "TaxPayerDetailsNextBT"
    Then I see text "Address where Business Records are located (Jurisdiction)" displayed

    #Bugged...?
    Examples: 
      | PortalName | CompanyName          | ABN         | UserName | Password   |
      | TSSAdmin        | Dynamic Fire Pty Ltd | 80134834334 | jbradley | Dbresults1 

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
    Then I wait for "5000" millisecond
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
    Then I wait for "5000" millisecond
    Then I see text "The combination of the provided information does not refer to a registered in PSRM Entity" displayed
    #Scenario 5: Registration details verified with stubs
    Then I enter the details as
      | Fields         | Value       |
      | InputABNNumber | 12054547368 |
      | InputCRNNumber |      400043 |
    Then I click on button "RegistrationSubmit"
    Then I check I am on "Complete Registration" page

    Examples: 
      | PortalName | UserName | Password   |
      | TSSAdmin        | jscott   | Dbresults1 |

	   #@done
  #Scenario Outline: DTSP-25: As an organisation I want a user's details verified during registration so that only valid users register with the portal (page 1)
    #
    #scenario 1: Same year check
    #Given I want to login to portal "<PortalName>"
    #And I click on "Create Account"
    #Then I click on button "RegistrationAsBusiness"
    #Then "<Item>" is displayed as "<ItemName>"
      #| Item  | ItemName                         |
      #| item3 | Australian Business Number (ABN) |
      #| item4 | Client Reference Number (CRN)    |
      #| item7 | By creating an account, I agree  |
    #Scenario 4
    #Then I click on "Sign In"
    #Then I check I am on "Login" page
    #Scenario p
    #Then I click on "Create Account"
    #Then I click on "Terms & Conditions"
    #Then a new page "http://dbresults.com.au/terms/" is launched
    #Then I check I am on "Terms of Use | DB Results - Digital Business specialists" page
    #Then I see text "Terms of Use" displayed
    #Given I want to login to portal "<PortalName>"
    #And I click on "Create Account"
    #Scenario 3
    #Then I click on button "RegistrationAsBusiness"
    #Then I enter the details as
      #| Fields         | Value       |
      #| InputABNNumber | 33333333333 |
      #| InputCRNNumber | 33333333333 |
    #Then I click on button "RegistrationSubmit"
    #Then I see text "By creating an account, I agree to the" displayed
    #Then I click on button "TermsandConditionsCheckBox"
    #Then I click on button "RegistrationSubmit"
    #Then I see text "The combination of the provided information does not refer to a registered in PSRM Entity" displayed
    #Then I enter the details as
      #| Fields         | Value       |
      #| InputABNNumber | <ABN> |
      #| InputCRNNumber | <CRN> |
    #Then I click on button "RegistrationSubmit"
    #Then I check I am on "Registration" page
    #DTSP-29: As a user I want to enter my user details so that I can complete the registration process (page 2)
    #Scenario 1
    #Then "<Item>" is displayed as "<ItemName>"
      #| Item  | ItemName                 |
      #| item2 | First Name               |
      #| item3 | Last Name                |
      #| item4 | Email Address            |
      #| item5 | Choose Username          |
      #| item6 | Choose Password          |
      #| item7 | Hint                     |
      #| item7 | Confirm Password         |
      #| item7 | Already have an account? |
    #Scenario 4: User cancels with unsaved changes
    #Then I click on button "Cancel"
    #Then I check I am on "Login" page
    #Given I want to login to portal "<PortalName>"
    #And I click on "Create Account"
    #Then I click on button "RegistrationAsBusiness"
    #Then I enter the details as
      #| Fields         | Value       |
      #| InputABNNumber | <ABN> |
      #| InputCRNNumber | <CRN> |
    #Then I click on button "RegistrationSubmit"
    #Then I click on button "TermsandConditionsCheckBox"
    #Then I check I am on "Registration" page
    #Then I click on button "Submit"
    #Scenario 3: Details entered do not pass validation (Can't fully complete on this due to WIP done on the page)
    #Then I enter the details as
      #| Fields                 | Value       |
      #| Registration_Email     | 12345678961 |
      #| Registration_FirstName | Test        |
      #| Registration_LastName  | Test        |
      #| Registration_Username  | 12345678961 |
      #| NewPassword            | 12345678961 |
      #| ConfirmPassword        |   123456781 |
      #| ConfirmPassword        |   123456781 |
      #| PhoneNumber            |    12345671 |
      #| Registration_Hint      |      123123 |
    #Then I click on button "Submit"
    #Then I wait for "5000" millisecond
    #Then I see text "Incorrect Email Format." shown
    #Then I see text "Invalid password. Please try again." shown
    #Then I see text "Passwords do not match. Please try again." shown
    #Then I see text "Invalid Phone Number. Phone Number should be 10 digits. Please try again." shown
    #Scenario 5: User cancels with unsaved changes
    #Then I click on button "Cancel"
    #Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "Cancel"
    #Then I check I am on "Registration" page
    #Then I click on button "Cancel"
    #Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "OK"
    #Then I check I am on "Login" page
#
    #Examples: 
      #| PortalName | UserNameField | PasswordField | UserName | Password   | ABN         | CRN         |
      #| TSSAdmin   

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
    #Then I click on button with value "Next"
    #Then I check I am on "Exemption Request Summary" page
    #Then "<Item>" is displayed as "<ItemName>"
      #| Item  | ItemName                         |
      #| item2 | Organisation Name                |
      #| item3 | Australian Business Number (ABN) |
      #| item4 | Client Reference Number (CRN)    |
      #| item5 | Requested Exemption Start Date   |
      #| item6 | Requested Exemption End Date     |
      #| item7 | Exemption Request Justification  |
      #| item7 | Declaration                      |
      #| item7 | Organisation                     |
      #| item7 | Contact Phone                    |
      #| item7 | Email Address                    |
      #| item8 | 20 May 2017                      |
      #| item9 | 21 May 2017                      |
    #Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[1]//td[2]" contains "<FirstName>"
    #Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[2]//td[2]" contains "<LastName>"
    #Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[3]//td[2]" contains "<Position>"
    #Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[4]//td[2]" contains "<Organisation>"
    #Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[5]//td[2]" contains "<ContactPhone>"
    #Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[6]//td[2]" contains "<EmailAddress>"

    Examples: 
      | PortalName | UserName | Password   | FirstName | LastName | Position     | Organisation | ContactPhone | EmailAddress         |
      | TSSAdmin        | jbradley | Dbresults1 | J         | Bradley  | AQUA PTY LTD | Consultant   | 04 5678 9767 | jbradley@hotmail.com |
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
      | TSSAdmin        | UserNameInput | PasswordInput | jbradley | Dbresults1 | 12121212121 | 21212121212 |

 @done
  Scenario Outline: Disappearing Position field after Registration bug (Business Registration)
    Given I want to login to portal "<PortalName>"
    Then I click on "Create Account"
    Then I click on button "RegistrationAsTaxAgent"
    Then I wait for "5000" millisecond
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
      | Registration_Email           | <NewUserName>@automation.com    |
      | Registration_Username        | automation_<NewUserName>        |
      | Registration_NewPassword     | <Password>                      |
      | Registration_ConfirmPassword | <Password>                      |
      | Registration_Hint            | Done as a result of automation! |
    Then I click on button "SubmitAjaxRfrsh"
    Then I wait for "7000" millisecond
    Then I see text "Registration Confirmation" displayed
    Then I want to login to portal "RegistrationLinkTable"
    Then I click on object with xpath "//*[contains(text(), '<NewUserName>')]/../following-sibling::td/a"
    And I enter the details as
      | Fields        | Value                    |
      | UserNameInput | automation_<NewUserName> |
      | PasswordInput | <Password>               |
    And I hit Enter
    Then I check I am on "Home" page
    Then I click on "User Profile"
    Then I click on button "EditBT"
    Then I check "Input_LastName2" is not empty

    #automation_business1 needs to be changed with every success!
    Examples: 
      | PortalName | CompanyName                                 | ABN         | NewUserName | Password   |
      | TSSAdmin        | The trustee for MD & KJ Fragar Family Trust | 70167081615 | taxAgent13  | Dbresults1 |



 #@done
  #Scenario Outline: DTSP-617: Annual Payroll Tax Lodgements (Check for outstanding monthly obligations in PSRM)
    #Given I want to login to portal "<PortalName>"
    #And I enter the details as
      #| Fields        | Value      |
      #| UserNameInput | <UserName> |
      #| PasswordInput | <Password> |
    #And I hit Enter
    #Then I click on "Lodgements"
    #Then I click on "Payroll Tax"
    #Then I click on button with value "Discard"
    #Then I click on button "select2-chosen-1"
    #Then I enter the details as
      #| Fields               | Value          |
      #| s2id_autogen1_search | <SearchString> |
    #Then I click on button "select2-results-1"
    #Then I click on "Annual Reconciliation"
    #Then I click on button "AnnualObligationSelect"
    #Then I see text "2012" displayed
    #Then I see text "01 Jul 2012 - 30 Jun 2013" displayed
    #Then I see text "01 Jul 2013 - 30 Jun 2014" displayed
    #Then I see text "01 Jul 2014 - 30 Jun 2015" displayed
    #Then I see text "01 Jul 2015 - 30 Jun 2016" displayed
    #Then I click on button "select2-chosen-1"
    #Then I enter the details as
      #| Fields               | Value           |
      #| s2id_autogen1_search | <SearchString2> |
    #Then I click on button "select2-results-1"
    #Then I click on "Monthly Return"
    #Then I click on button "MonthlyObligationSelect"
    #Then I see text "Aug 2016" displayed
    #Then I see text "Sep 2016" displayed
    #Then I see text "Oct 2016" displayed
    #Then I see text "Nov 2016" displayed
    #Then I see text "Dec 2016" displayed
    #Then I see text "Jan 2017" displayed
#
    #Then I see text "Feb 2017" displayed
    #Examples: 
      #| PortalName | UserName | Password   | SearchString | SearchString2 |
      #| TSS        | jbradley | Dbresults1 | DESIGNATE    | QUICK SINGLE  |

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