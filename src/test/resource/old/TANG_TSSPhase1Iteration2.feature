Feature: Stuff for TSS Phase 2

  # Before running this script, go to https://test-ssc.dbresults.com.au/TSSAccountMgmt/DataExtensions.aspx
  # Find bob's account and make sure he has an CRN, an ABN and his employer status is set to 'Designated group employer for a group and lodging for itself'
  # As of 12 pm 9/1/2017 these settings have already been implemented, but double-checking them is advised.
  
  @tss_review
  Scenario Outline: DTSP-356 Error handling for Annual Payroll Tax Reconciliation when fields returned from back end system are known (error field mapping)
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
    And I wait for "3000" millisecond
    Then I click on "ACTWagesPaidNext"
    And I wait for "3000" millisecond
    Then I click on "MonthlyReturnNext"
    And I wait for "3000" millisecond
    Then I enter the details as
      | Fields                                        | Value        |
      | PersonFullName                                | test         |
      | LegalEntityName                               | Test2        |
      | wt128_wtContent_wtLodgePayrollAnswer_Employer | test         |
      | PhoneNumber                                   | 610422184033 |
      | EmailAddress                                  | abc@abc.com  |
    Then I click on "DeclarationConfirm"
    Then I check "Submit" is readonly
    Then I click on "ConfirmForSubmission"
    Then I click on "Submit"
    Then I see text "ERR:Val5 - You have already submitted this form" displayed

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password  | CRN         | ABN         |
      | TSS        | UserNameInput | PasswordInput | bob      | dbresults | 12345678901 | 12345678901 |

  @tss_review
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
    Then I wait for "3000" millisecond
    Then I enter the details as
      | Fields           | Value |
      | SalariesAndWages |   100 |
    Then I click on "ClaimingACTProportion_Yes"
    Then I click on "ACTWagesPaidNext"
    Then I wait for "3000" millisecond
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
      | wt128_wtContent_wtLodgePayrollAnswer_Employer | test         |
      | PhoneNumber                                   | 610422184033 |
      | EmailAddress                                  | abc@abc.com  |
    Then I click on "DeclarationConfirm"
    Then I check "Submit" is readonly
    Then I click on "ConfirmForSubmission"
    Then I click on "Submit"
    And I wait for "3000" millisecond
    Then I see text "Aus wide wages must be greater than or equal to ACT Taxable wages" displayed
    Then I see text "Group ACT wages must be greater than or equal to ACT Taxable wages" displayed
    Then I see text "Australia-wide wages must be greater than or equal to Group ACT wages" displayed

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password  | CRN         | ABN         |
      | TSS        | UserNameInput | PasswordInput | bob      | dbresults | 12345678901 | 12345678901 |

  #NOTE: Ensure that Bob has a current employee type selected in the data extensions page
  @tss_review
  Scenario Outline: DTSP-311: Validation Rules and Errors to be used across Annual Reconciliation Form
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    And I click on "Payroll Tax"
    Then I click on "Cancel"
    Then I click on "Payroll Tax"
    Then I click on "Answer_TypeMonthly"
    Then I select "2015" from "YearOfReturn"
    Then I select "January" from "MonthOfReturn"
    Then I click on "TaxPayerDetailsNext"
    Then I wait for "3000" millisecond
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
    Then I click on "ACTWagesPaidBack"
    Then I click on "TaxPayerDetailsNext"
    Then I check "SalariesAndWages" contains "$ 100"
    Then I check "BonusesAndCommissions" contains "$ 100"
    Then I click on "ACTWagesPaidNext"
    And I wait for "3000" millisecond
    Then I click on "MonthlyReturnNext"
    And I wait for "3000" millisecond
    
    #scenario 5: Mandatory fields not filled in
    Then I check "DeclarationConfirm" is readonly
    
    #scenario 4 (Fields are entered in incorrect format - phone number and/or email field ), then 3 (Fields are entered in correct format)
    Then I enter the details as
      | Fields                                        | Value  |
      | PersonFullName                                | test   |
      | LegalEntityName                               | Test2  |
      | wt128_wtContent_wtLodgePayrollAnswer_Employer | test   |
      | PhoneNumber                                   | 610422 |
      | EmailAddress                                  | abc    |
      
    
    Then I click on "DeclarationConfirm"
    Then I see text "This is an invalid phone number." displayed
    Then I see text "Email address is not in the correct format." displayed
    Then I enter the details as
      | Fields       | Value       |
      | PhoneNumber  | 61042218431 |
      | EmailAddress | abc@test    |
    
    # scenario 6: Mandatory fields all filled in
    Then I click on "DeclarationConfirm"
    Then I check "Submit" is readonly
   
    # Scenario 7: Number of days is invalid
    Then I click on "Payroll Tax"
    Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "OK"
    Then I click on "Payroll Tax"
    Then I click on "Answer_TypeAnnual"
    Then I click on "TaxPayerDetailsNext"
    Then I click on "ClaimingACTProportion_Yes"
    Then I click on "ACTWagesPaidNext"
    Then I wait for "3000" millisecond
    Then I enter the details as
      | Fields                      | Value |
      | Answer_DaysPaidTaxable      |   367 |
      | DaysPaidGroupAusWide        |   367 |
      | AustralianWide              |   100 |
      | PayrollAnswer_GroupActWages |   100 |
    Then I click on "MonthlyReturnNext"
    Then I wait for "3000" millisecond
    Then I see text "Number of days must be equal to or less than 365, or 366 for leap years" displayed
    Then I see text "Some fields are not valid. Please fix them before moving to the next section." displayed

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password  | CRN         | ABN         |
      | TSS        | UserNameInput | PasswordInput | bob      | dbresults | 98765123456 | 12345678902 |

  Scenario Outline: DTSP-401: As an end user, I should not be able to view/select the 'Return Type' section on the Payroll Tax Lodgement forms when I am on subsequent sections after clicking 'Next'
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    And I click on "Payroll Tax"
    Then I click on "Cancel"
    Then I click on "Payroll Tax"
    Then I click on "Answer_TypeAnnual"
    Then I click on button "NextSection"
    Then I click on button "ACTWagesPaidBackBt2"
    Then I check "PayrollAnswer_TypeAnnual" is readonly

    Examples: 
      | PortalName | UserName | Password   |
      | TSS        | jscott   | Dbresults1 |