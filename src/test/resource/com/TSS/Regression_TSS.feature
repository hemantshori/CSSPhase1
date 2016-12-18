Feature: Some feature

  @TSSRegression
  Scenario Outline: DTSP-252 : Create generic Login screen
    DTSP-277 : As an end user, I want to be able to view the left navigation panel so that I can quickly access the functions I need (Phase 1)
    DTSP-227: Receive an email after form is submitted
    DTSP-28 : As an end user, I want to be able to submit a Monthly Payroll Tax Return Form, so that my Payroll Tax Return is lodged

    Given I want to login to portal "<PortalName>"
    And I enter then details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    And I check I am on "HomePage" page
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName   |
      | item9 | Lodgements |
    And I click on "Payroll Tax"
    #And I check "wtTaxPayerDetailsNextBT" is readonly
    And I check I am on "Payroll Lodgement Form" page
    And I click on "Cancel"
    And I click on "Payroll Tax"
    And I click on "Monthly Return"
    And I select "<YORInput>" from "<YearOfReturnField>"
    # And I check "wtTaxPayerDetailsNextBT" is readonly
    And I select "<MORInput>" from "<MonthOfReturnField>"
    And I click on "wtTaxPayerDetailsNextBT"
    And I wait for "3000" millisecond
    And I enter then details as
      | Fields                      | Value |
      | SalariesAndWages            | 20000 |
      | BonusesAndCommissions       |   200 |
      | Allowances                  |    20 |
      | DirectorsFees               |    20 |
      | EligibleTerminationPayments |    20 |
      | ValueOfBenefits             |    20 |
      | ShareValue                  |    20 |
      | ServiceContracts            |    20 |
      | Superannuation              |    20 |
      | OtherTaxablePayments        |    20 |
    # verify ACT TAXABLe wages is summition of all of above
    And I click on "wtACTWagesPaidNextBt"
    And I check "TaxableWages" is readonly
    And I check "TaxPayable" is readonly
    And I click on "wtMonthlyReturnNextBT"
    And I wait for "1000" millisecond
    And I enter then details as
      | Fields       | Value       |
      | PhoneNumber  | 61422184033 |
      | EmailAddress |  |
    And I check "wtDeclarationConfirmBT" is readonly
    And I enter then details as
      | Fields          | Value       |
      | PersonFullName  | test        |
      | LegalEntityName | Test2       |
      | PhoneNumber     |             |
      | EmailAddress    | abc@abc.com |
    And I check "wtDeclarationConfirmBT" is readonly
    And I enter then details as
      | Fields          | Value       |
      | PersonFullName  | test        |
      | LegalEntityName | Test2       |
      | PhoneNumber     | 61422184033 |
      | EmailAddress    | abc@abc.com |
    And I click on "wtDeclarationConfirmBT"
    And I wait for "1000" millisecond
    And I click on "checkbox" checkbox
    And I click on "Submit"

    # the last bit needs to be worked on
    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password  | YearOfReturnField | YORInput | MonthOfReturnField | MORInput |
      | TSS        | UserNameInput | PasswordInput | bob      | dbresults | YearOfReturn      |     2016 | MonthOfReturn      | January  |
