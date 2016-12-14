@wip
Feature: Some feature

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
