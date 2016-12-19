
Feature: Some feature


@wip
 Scenario Outline: DTSP-240 : As an end user, I want to be able to download the Tax Lodgement or Registration forms in PDF format, so that I can keep a record of my lodgements
    Given I want to login to portal "<PortalName>"
    And I enter then details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    And I check I am on "HomePage" page
    And I click on "Payroll Tax"
    #  And I click on "<ButtonName1>"
    And I enter then details as
      | Fields | Value       |
      | ABN    | 12345678901 |
    And I select "<DropDownValue1>" from "<DropDownField>"
    And I select "<DropDownValue2>" from "<DropDownField2>"
    And I click on "Next"
    And I enter then details as
      | Fields                      | Value |
      | SalariesAndWages            |  1000 |
      | BonusesAndCommissions       |  1000 |
      | Allowances                  |  1000 |
      | DirectorsFees               |  1000 |
      | EligibleTerminationPayments |  1000 |
      | ValueOfBenefits             |  1000 |
      | ShareValue                  |  1000 |
      | ServiceContracts            |  1000 |
      | Superannuation              |  1000 |
      | OtherTaxablePayments        |  1000 |
      | ACT                         |     0 |
    And I click on "wt90"
    And I see "<Message>" displayed
    And I click on "ACTWagesPaidNext"
    And I enter then details as
      | Fields         | Value |
      | AustralianWide | 15000 |
    And I click on "MontlyReturnNext"
    And I enter then details as
      | Fields          | Value           |
      | PersonFullName  | Vance           |
      | LegalEntityName | DB R            |
      | PhoneNumber     | (6143 585 74 90 |
      | EmailAddress    | vance@db.com    |
    And I click on "DeclarationNext"
  #  And I click on "ConfirmForSubmission" checkbox
    And I click on "Submit"
    Then I check I am on "LodgePayroll_Step2_Confirm" page
    And I click on "wt21"

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password  | ButtonName1 | DropDownValue1 | DropDownField | DropDownValue2 | DropDownField2 | Message                                    |
      | TSS        | UserNameInput | PasswordInput | bob      | dbresults | TypeMonthly |           2016 | YearOfReturn  | February       | MonthOfReturn  | Your changes have been successfully saved. |
      
  Scenario Outline: DTSP-378: As a user I want the ability to enter my business details on the Tax Registration form so that I can register for Payroll Tax
    Given I want to login to portal "<PortalName>"
    And I check I am on "Tax Registration Form" page
    And I select "Other" from "SelectBusinessTypeCode"
    And I enter then details as
      | Fields                | Value             |
      | EmployerName          | Test2             |
      | BusinessTradingName   | Shori Corporation |
      | ABN                   |        9999999999 |
      | CountryId             |                00 |
      | AddressLine1          | 8  marcella crt   |
      | AddressLine2          | oakleigh east     |
      | City                  | oakleigh east     |
      | State                 | vic               |
      | PostCode              |              3166 |
      | Title                 | mr                |
      | FirstName             | test              |
      | LastName              | test              |
      | PhoneNumber           |      614229877892 |
      | Email                 | test              |
      | CommunicationMethodId | test              |
    And I select "SMS" from "CommunicationMethodId"

    Examples: 
      | PortalName       |
      | Tax_Registration |
