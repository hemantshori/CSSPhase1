@TSSRegression
Feature: Some feature

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
    And I check I am on "Payroll Lodgement Form" page
    Then "<Item>" is displayed as "<ItemName>"
      | Item   | ItemName                                                                                    |
      | item2  | Lodge Payroll Tax Return                                                                    |
      | item2  | All Fields are mandatory except where marked                                                |
      | item2  | Return Type                                                                                 |
      | item2  | Monthly Return                                                                              |
      | item2  | Annual Reconciliation                                                                       |
      | item2  | Tax Payer Details                                                                           |
      | item2  | Client Reference Number                                                                     |
      | item2  | Australian Business Number                                                                  |
      | item9  | Payroll Tax Group Number                                                                    |
      | item9  | Year of Return                                                                              |
      | item9  | Month of Return                                                                             |
      | item9  | Organisational Name                                                                         |
      | item9  | Current Employer Status                                                                     |
      | item9  | Independent employer (non-group) lodging for itself                                         |
      | item9  | Designated group employer and lodging a joint return for itself and other ACT group members |
      | item9  | Member of a group lodging for itself                                                        |
      | Button | Cancel                                                                                      |
      | Button | SaveAndExit                                                                                 |
      | Button | Save                                                                                        |
      | Button | Next                                                                                        |
    And I click on "wtTaxPayerDetailsNextBT"
    Then "<Item>" is displayed as "<ItemName>"
      | Item   | ItemName                                              |
      | item2  | Salaries and Wages                                    |
      | item2  | Bonuses and Commissions                               |
      | item2  | Allowances                                            |
      | item2  | Directors                                             |
      | item2  | Eligible termination payments                         |
      | item2  | Value of Benefits                                     |
      | item2  | Share/Options Value                                   |
      | item2  | Service Contracts                                     |
      | item9  | Superannuation                                        |
      | item9  | Other Taxable Payments                                |
      | item9  | ACT Taxable Wages                                     |
      | item9  | Are you claiming the ACT proportion of the threshold? |
      | item9  | Monthly Return                                        |
      | item9  | Declaration                                           |
      | item9  | Confirm Lodgement Details                             |
      | Button | SaveAndExit                                           |
      | Button | Save                                                  |
      | Button | wtACTWagesPaidBackBt                                  |
    And I click on "wtACTWagesPaidNextBt"
    #Monthly Return
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                             |
      | item2 | Australia-wide Group Wages incl. ACT |
      | item2 | Tax-free Threshold                   |
      | item2 | Tax Payable                          |
      | item2 | Declaration                          |
      | item2 | Confirm Lodgement Details            |
      | item2 | Return Type                          |
      | item2 | Monthly Return                       |
      | item2 | Annual Reconciliation                |
    And I click on "wtMonthlyReturnNextBT"
    #Declaration Section
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                                                   |
      | item2 | full name of person authorised to act for the legal entity |
      | item2 | name of legal entity                                       |
      | item2 | Contact phone number                                       |
      | item2 | Contact email                                              |
      | item2 | Confirm Lodgement Details                                  |
    #following needs to be changed
    And I click on "wtDeclarationNextBT"
    #confirm Lodgement Details
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                                           |
      | item2 | Client Number                                      |
      | item2 | Reporting Period                                   |
      | item2 | Claiming Tax-free Threshold                        |
      | item2 | I have checked the form and confirm these details. |
    And I click on "Submit"

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password  |
      | TSS        | UserNameInput | PasswordInput | bob      | dbresults |
