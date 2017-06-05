#Sample Feature Definition Template
@wip
Feature: WORK IN PROGRESS

  #@review
  #Scenario Outline: DTSP-101: As an end user, I want to be able raise an Objection Request so that I can object on the tax amount, penalty, interest and decision on previous objections.
  #
  #Then I check object with xpath "//*[contains(@id, 'ObjectionInformation')]//..//tr[1]//td[2]" contains "Payroll Tax"
  #Then I check object with xpath "//*[contains(@id, 'ObjectionInformation')]//..//tr[2]//td[2]" contains "Penalty"
  #Then I check object with xpath "//*[contains(@id, 'ObjectionInformation')]//..//tr[3]//td[2]" contains "Yes"
  #Then I check object with xpath "//*[contains(@id, 'ObjectionInformation')]//..//tr[4]//td[2]" contains "LodgementFailureReason"
  #Then I check object with xpath "//*[contains(@id, 'ObjectionInformation')]//..//tr[5]//td[2]" contains "ObjectionComment"
  #Then "<Item>" is displayed as "<ItemName>"
  #| Item  | ItemName      |
  #| item2 | First Name    |
  #| item3 | Last Name     |
  #| item3 | Position      |
  #| item4 | Organisation  |
  #| item5 | Contact Phone |
  #| item6 | Email Address |
  #Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[1]//td[2]" contains "<FirstName>"
  #Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[2]//td[2]" contains "<LastName>"
  #Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[3]//td[2]" contains "<Position>"
  #Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[4]//td[2]" contains "<Organisation>"
  #Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[5]//td[2]" contains "<ContactPhone>"
  #Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[6]//td[2]" contains "<EmailAddress>"
  #
  #Examples:
  #| PortalName | UserName | Password   | FirstName | LastName | Position            | Organisation | ContactPhone | EmailAddress                      |
  #| TSS        | jbradley | Dbresults1 | J         | Bradley  | DESIGNATE PTY. LTD. | Consultant   | 04 5678 9767 | 	jbradley@hotmail.com |
  #@has_bug
  #Scenario Outline: DTSP-116: As an end user, I want to be able to submit a Payroll Tax Registration Cancellation Request so that I can cancel my current Payroll Tax Registration
  #Given I want to login to portal "<PortalName>"
  #And I enter the details as
  #| Fields        | Value      |
  #| UserNameInput | <UserName> |
  #| PasswordInput | <Password> |
  #And I hit Enter
  #Then I click on "Service Requests"
  #Then I click on "Tax Registration Cancellation"
  #Scenario 1: Display "Tax Registration Cancellation" Form
  #Then I check "OrganizationalName" is empty
  #Then I check "PayrollAnswer_ABN" is empty
  #Then I check "PayrollAnswer_CRN" is empty
  #Then I check "CancellationStartDate" is readonly
  #Scenario 2: "Payroll Tax Cancellation Information" section becomes
  #Then I click on button "select2-chosen-1"
  #Then I enter the details as
  #| Fields               | Value  |
  #| s2id_autogen1_search | DUSTER |
  #Then I click on button "select2-results-1"
  #Then I check "CancellationStartDate" is not readonly
  #Then I check "ReasonDescription" is not readonly
  ##Scenario 4: Error display
  #Then I click on button "CancellationStartDate"
  #Then I click on "20170520"
  #Then I enter the details as
  #| Fields            | Value |
  #| ReasonDescription | TEST  |
  #Then I click on button with value "Next"
  #
  #Then I check I am on "Tax Cancellation Request Summary" page
  #Scenario 5: Payroll Tax Cancellation Submission
  #
  #Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[1]//td[2]" contains "<FirstName>"
  #Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[2]//td[2]" contains "<LastName>"
  #Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[3]//td[2]" contains "<Position>"
  #Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[4]//td[2]" contains "<Organisation>"
  #Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[5]//td[2]" contains "<ContactPhone>"
  #Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[6]//td[2]" contains "<EmailAddress>"
  #Then I click on button "CorrectInfoDeclared"
  #Then I click on button with value "Submit"
  #Then I wait for "4000" millisecond
  #Then I see text "Your Payroll Tax Registration Cancellation Request has been successfully submitted. An email has been sent to you for your reference." displayed
  #Then I see text "To download the details you have submitted, please click the button below." displayed
  #Then I check I am on "Tax Cancellation Request Confirmation" page
  #
  #Examples:
  #| PortalName | UserName | Password   | FirstName | LastName | Position            | Organisation | ContactPhone | EmailAddress                      |
  #| TSS        | jbradley | Dbresults1 | J         | Bradley  | 	DUSTER PTY. LIMITED | Consultant   | 04 5678 9767 | 	jbradley@hotmail.com |
  

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
      | s2id_autogen1_search | <TaxpayerName> |
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
    #Then I check "GroupActWages" has CSS property "content" with value ""*""
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
      | PortalName | CompanyName                  | ABN         | UserName | Password   | TaxpayerName |
      | TSS        | The Fire Company Pty Limited | 83117378917 | jbradley | Dbresults1 | For Bearly Nothing |
