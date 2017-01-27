@wip
Feature: Some feature

  Scenario Outline: Check Usage Menu Item List Test 1, DCSSP-245 Description: User views the menu items Epic: Common Components
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    And I click on "<ButtonName>"
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName      |
      | item2 | Usage History |
    And I click on "<ButtonName2>"
    And I wait for "3000" millisecond
    Then I see "Residential - Electricity Usage History" displayed
              
    Then I see "5% discount!" displayed

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password   | ButtonName | ServiceName              | ButtonName2   | ButtonName3 |
      | CSS        | UserNameInput | PasswordInput | Michael  | Dbresults1 | Usage      | Residential: Electricity | Usage History | Contact Us  |

