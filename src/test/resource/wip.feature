@wip
Feature: Some feature

  Scenario Outline: DCSSP-730: update Profile Address Scenario 1
    Given I want to login to portal "<PortalName>"
    And I enter then details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I see "highcharts-tracker" displayed
   

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password   | email          | MAddress               | Message                                    |
      | CSS        | UserNameInput | PasswordInput | mary     | Dbresults1 | test4@test.com |                        |   |
      | CSS        | UserNameInput | PasswordInput | mary     | Dbresults1 | test4@test.com | DBResult123s@gmail.com | Your changes have been saved successfully. |

 