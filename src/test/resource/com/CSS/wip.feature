@wip
Feature: Some feature

 Scenario Outline: Covers tests around Usage history check, Scenario 189
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    And I click on "Usage"
    And I click on "Usage History"
    And I check I am on "Usage History" page
    Then "<Item>" is displayed as "<ItemName>"
      | Item   | ItemName                 |
      | Item2  | Understanding Your Usage |
      | Item3  | Past Usage               |
      | Item4  | Bill Period              |
      | Item6  | Average Temperature      |
      | Item7  | 5% discount!             |
      | Item8  | Set Up Direct Debit      |
      | Item9  | Set Up eBilling          |
      | Item10 | Last Bill                |
      | Item11 | Last Year                |

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password   |
      | CSS        | UserNameInput | PasswordInput | Michael  | Dbresults1 |