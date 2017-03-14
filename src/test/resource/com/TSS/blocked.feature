#This file is exclusively for stories that have been blocked from further testing in some fashion (e.g. bugs)
#Fix them when the blockers have been removed.
#Make sure to write what and where the block comes from.
#Sample Feature Definition Template

Feature: Blocked tests
	#CURRENTLY BLOCKED: 356

 @wip
  Scenario Outline: DTSP-356 Error handling for Annual Payroll Tax Reconciliation when fields returned from back end system are known (error field mapping)
    #BLOCKER: DTSP-612: Submitting Lodgement Forms With the Same Periods
    
    #scenario 1: Same year check
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    And I check I am on "HomePage" page
    And I click on "Payroll Tax Lodgement"
    Then I click on button "Discard"
    And I check I am on "Payroll Lodgement Form" page
    Then I click on "Annual Reconciliation"
    Then I click on button "NextSection"
    Then I see text "<CRN>" displayed
    Then I see text "<ABN>" displayed
    Then I select "2014" from "YearOfReturn"
    Then I click on "Independent employer (non-group) lodging for itself"
    Then I click on button "TaxPayerDetailsNext"
    And I wait for "2000" millisecond
    Then I click on button "ACTWagesPaidNext"
    And I wait for "2000" millisecond
    Then I click on button "MonthlyReturnNext"
    And I wait for "2000" millisecond
    And I enter the details as
      | Fields              | Value       |
      | PersonFullName      | test        |
      | LegalEntityName     | Test2       |
      | EmployerDeclaration | test        |
      | PhoneNumber         |  0422184033 |
      | EmailAddress        | abc@abc.com |
    And I Tab Out
    Then I click on button "DeclarationConfirm"
    Then I check "SubmitBT" is readonly
    Then I click on "ConfirmForSubmission"
    Then I click on button "wtSubmitBT"
    Then I see text "The period entered has already been lodged. Please select a different period." displayed

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password   | CRN         | ABN         |
      | TSS        | UserNameInput | PasswordInput | mbrown   | Dbresults1 | 12121212121 | 21212121212 |

  Scenario Outline: DTSP-356 Scenario 2, 3 and 4
 		#BLOCKER: DTSP-613: Incorrect Wages Validation in Lodgement Form 
 
    #scenario 2: Aus wide wages is not greater than ACT Taxable wages
    #scenario 3: Group ACT wages is not greater than ACT Taxable wages
    #scenario 4: Aus wide wages is not greater than Group ACT wages
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
    Then I see text "<CRN>" displayed
    Then I see text "<ABN>" displayed
    Then I select "2011" from "YearOfReturn"
    Then I click on "Designated group employer for a group and lodging for itself"
    Then I click on button "TaxPayerDetailsNext"
    Then I wait for "2000" millisecond
    Then I enter the details as
      | Fields           | Value |
      | SalariesAndWages |   100 |
    Then I click on "ClaimingACTProportion_Yes"
    Then I click on "ACTWagesPaidNext"
    Then I wait for "2000" millisecond
    Then I enter the details as
      | Fields                       | Value |
      | PayrollAnswer_AustralianWide |    97 |
      | PayrollAnswer_GroupActWages  |    98 |
    Then I click on "MonthlyReturnNext"
    And I wait for "2000" millisecond
    And I enter the details as
      | Fields              | Value       |
      | PersonFullName      | test        |
      | LegalEntityName     | Test2       |
      | EmployerDeclaration | test        |
      | PhoneNumber         |  0422184033 |
      | EmailAddress        | abc@abc.com |
    And I Tab Out
    Then I click on "DeclarationConfirm"
    Then I check "Submit" is readonly
    Then I click on "ConfirmForSubmission"
    # don't remove the wt prefix, otherwise there will be a conflict with a 'HiddenSubmitBT'
    Then I click on button "wtSubmitBT"
    And I wait for "2000" millisecond
    Then I see text "Aus wide wages must be greater than or equal to ACT Taxable wages" displayed
    Then I see text "Group ACT wages must be greater than or equal to ACT Taxable wages" displayed
    Then I see text "Australia-wide wages must be greater than or equal to Group ACT wages" displayed

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password   | CRN         | ABN         |
      | TSS        | UserNameInput | PasswordInput | mbrown   | Dbresults1 | 12121212121 | 21212121212 |
