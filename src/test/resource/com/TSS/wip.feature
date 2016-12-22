Feature: Some feature

	# DO NOT CHANGE THE CRN OR ABN NUMBERS, IN THIS FILE OR IN THE TWO DATA EXTENSION PAGES
	# IF YOU DO SO, THE FOLLOWING SCRITPS WILL NOT WORK

  @tss_current
  Scenario Outline: DTSP-356: Error handling for Annual Payroll Tax Reconciliation when fields returned from back end system are known (error field mapping)
    #scenario 1: Same year check
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    And I check I am on "HomePage" page
    And I click on "Payroll Tax"
    Then I click on "Cancel"
    Then I click on "Payroll Tax"
    And I check I am on "Payroll Lodgement Form" page
    Then I see text "<CRN>" displayed
    Then I see text "<ABN>" displayed
    Then I click on "Answer_TypeAnnual"
    Then I click on "YearOfReturn"
    Then I click on "2014"
    Then I click on "TaxPayerDetailsNext"
    Then I click on "ACTWagesPaidNext"
    Then I click on "MonthlyReturnNext"
    And I wait for "3000" millisecond
    Then I enter the details as
      | Fields                                        | Value        |
      | PersonFullName                                | test         |
      | LegalEntityName                               | Test2        |
      | wt126_wtContent_wtLodgePayrollAnswer_Employer | test         |
      | PhoneNumber                                   | 610422184033 |
      | EmailAddress                                  | abc@abc.com  |
    Then I click on "DeclarationConfirm"
    Then I check "Submit" is readonly
    Then I click on "ConfirmForSubmission"
    Then I click on "Submit"
    Then I see text "ERR:Val5 - You have already submitted this form - To resubmit please submit a service request." displayed

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password  | CRN         | ABN         |
      | TSS        | UserNameInput | PasswordInput | bob      | dbresults | 98765123456 | 12345678902 |

  @tss_current
  Scenario Outline: DTSP-356 Scenario 2, 3 and 4
    #scenario 2: Aus wide wages is not greater than ACT Taxable wages
    #scenario 3: Group ACT wages is not greater than ACT Taxable wages
    #scenario 4: Aus wide wages is not greater than Group ACT wages
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    And I click on "Payroll Tax"
    Then I click on "Cancel"
    Then I click on "Payroll Tax"
    Then I see text "<CRN>" displayed
    Then I see text "<ABN>" displayed
    Then I click on "Answer_TypeAnnual"
    Then I click on "YearOfReturn"
    Then I click on "2015"
    Then I click on "TaxPayerDetailsNext"
    Then I wait for "2000" millisecond
    Then I enter the details as
      | Fields           | Value |
      | SalariesAndWages |   100 |
    Then I click on "ClaimingACTProportion_Yes"
    Then I click on "ACTWagesPaidNext"
    Then I wait for "2000" millisecond
    Then I enter the details as
      | Fields                       | Value |
      | PayrollAnswer_AustralianWide |     1 |
      | PayrollAnswer_GroupActWages  |    98 |
    Then I click on "MonthlyReturnNext"
    And I wait for "3000" millisecond
    Then I enter the details as
      | Fields                                        | Value        |
      | PersonFullName                                | test         |
      | LegalEntityName                               | Test2        |
      | wt126_wtContent_wtLodgePayrollAnswer_Employer | test         |
      | PhoneNumber                                   | 610422184033 |
      | EmailAddress                                  | abc@abc.com  |
    Then I click on "DeclarationConfirm"
    Then I check "Submit" is readonly
    Then I click on "ConfirmForSubmission"
    Then I click on "Submit"
    And I wait for "2000" millisecond
    Then I see text "Aus wide wages must be greater than or equal to ACT Taxable wages" displayed
    Then I see text "Group ACT wages must be greater than or equal to ACT Joint Taxable wages" displayed
    Then I see text "Australia-wide wages must be greater than or equal to Group ACT wages" displayed

  Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password  | CRN         | ABN         |
      | TSS        | UserNameInput | PasswordInput | bob      | dbresults | 98765123456 | 12345678902 |

