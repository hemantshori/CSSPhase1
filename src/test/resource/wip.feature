@wip
Feature: this is just a wip

  Scenario Outline: Covers tests around billing history check, Scenario 189
    Given I want to login to portal "<PortalName>"
    And I enter then details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    And I click on "<ButtonName>"
    And I check I am on "Billing History" page
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                   |
      | Item2 | Understanding Your Charges |
      | Item3 | Pending Transactions       |
      | Item4 | Completed Transactions     |
      | Item5 | Date                       |
      | Item6 | Type                       |
      | Item7 | Amount                     |
      | Item8 | 5% discount!               |
      | Item9 | Understanding Your Charges |
    And I will see message "Your highest billing month was in"
    And I will see message "Your lowest billing month was in"
    And I will see message "Your average daily cost for the last 12 months is"

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password   | ButtonName      | Graph Message                             |
      | CSS        | UserNameInput | PasswordInput | Michael  | Dbresults1 | Billing History | Residential - Electricity Billing History |
