Feature: Test Scenarios around UAP

  @wip
  Scenario Outline: User views the menu items, Test 1, DCSSP-245 Description: User views the menu items Epic: Common Components
    Given I want to login to portal "<PortalName>"
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName |
      | item1 | Logo     |
    And I enter then details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                          |
      | item1 | File Upload                       |
      | item1 | Menu Management                   |
      | item2 | Headings Management               |
      | item3 | Unit Of Measure Management        |
      | item4 | Security Questions Management     |
      | item5 | User Account Management           |
      | item6 | System Management                 |
      | item7 | Countries Management              |
      | item8 | Bill Label Match Management       |
      | item6 | Service Type Management           |
      | item7 | Service Agreement Type Management |
      | item8 | Month Configuration               |
      | item6 | Cache Configuration               |
      | item7 | Locale Configuration              |
      | item8 | Locale Heading Configuration      |
      | item6 | LogoConfiguration                 |
      | item7 | Payment Security Configuration    |
      | item8 | Feedback Messages Configuration   |
      | item8 | Page Text Configuration           |
   And I hit Enter
    And I check I am on "Locked Account" page
    And I want to login to portal "<PortalName>"
    And I enter then details as
      | Fields        | Value               |
      | UserNameInput | <UserName or Email> |
      | PasswordInput | <Invalid Password3> |
    And I hit Enter
    And I check I am on "Locked Account" page
    And I click on "ResetPasswordButton"
    And I check I am on "ForgotPassword" page
    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password  | ButtonName | ServiceName              | AccountNumber         | Address                              |
      | UAP        | UserNameInput | PasswordInput | Bob      | dbresults | Accounts   | Residential: Electricity | Account No. 689608083 | 4 Alexander Street Red Hill ACT 2603 |
