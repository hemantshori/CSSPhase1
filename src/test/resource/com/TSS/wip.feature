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
      | s2id_autogen1_search | COFFEE |
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