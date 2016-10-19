
Feature: Some feature
@wip

  Scenario Outline: DCSSP-758: This is for defect 758, email address should not be duplicated with edit settings option. This should not accept the duplicate email address.
    Given I want to login to portal "<PortalName>"
    And I enter then details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    And I check I am on "Dashboard" page
    And I click on "Settings"
    And I click on "EditSettings"
    And I check I am on "EditSettings" page
    And I enter then details as
      | Fields | Value   |
      | Email  | <email> |
    And I hit Enter
    Then I see "Email address already exists. Please try again." displayed

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password   | email                         |
      | CSS        | UserNameInput | PasswordInput | Michael     | Dbresults1 | hemant.shori@dbresults.com.au |

  Scenario Outline: DCSSP-67: Account Financial History (all)
    Given I want to login to portal "<PortalName>"
    And I enter then details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    When I click on "Accounts"
    And I click on "Account Financial History"
    And I check I am on "Account Financial History" page
    Then I see "Account Financial History" displayed
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName |
      | Item3 | Date     |
      | Item4 | Type     |
      | Item5 | Amount   |
      | Item6 | Balance  |
    And table is sorted based on "descending" "Date"
    And if there are "more than" "12 transactions" I click on "ALL TRANSACTIONS"

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password   | DropDownValue1     | DropDownField    |
      | CSS        | UserNameInput | PasswordInput | mary     | Dbresults1 | Account 2411617223 | AccountsComboBox |
