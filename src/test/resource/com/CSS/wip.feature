@wip
Feature: Some feature

  Scenario Outline: Testing User Roles DCSSP-930 Description: User should be able to access UAP Epic: Portal Admin
    Given I want to login to portal "<PortalName>"
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName |
      | item1 | Logo     |
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Given I want to login to portal "UAP"
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName              |
      | item1 | Installation Settings |
      | item2 | Application Settings  |
      | item3 | Resource Management   |
      | item4 | Manage Users          |
      | item5 | Sign Out              |

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password   |
      | UAP        | UserNameInput | PasswordInput | Lisa     | Dbresults1 |
      | UAP        | UserNameInput | PasswordInput | Mary     | Dbresults1 |