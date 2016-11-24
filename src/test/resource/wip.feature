Feature: Some feature

@wip
  Scenario Outline: Read the UAP
    Given I want to login to portal "CSS"
    And I enter then details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Given I want to login to portal "UAP"
    And I click on "Application Settings"
    And I click on "Feedback Messages"
    And I check I am on "Feedback Msg Texts" page
    And I read the table on "FeedbackMsgTextTable" page 
    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password   | ButtonName | ServiceName              | AccountNumber          | Address                                                |
      | CSS        | UserNameInput | PasswordInput | Michael  | Dbresults1 | Accounts   | Residential: Electricity | Account No. 2411617223 | Apt. 201, 300 Mission Street, San Francisco, CA, 94105 |

 
  