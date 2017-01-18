@wip
Feature: Some feature

   
  @ShakeOut
    Scenario Outline: DCSSP-450,DCSSP-451,DCSSP-457, DCSSP-876

    Given I want to login to portal "CSS"
     And I enter then details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
   And I hit Enter
Given I want to login to portal "UAP"
And I click on "fa fa-fw fa-pencil fa-lg"

    And I click on "Application Settings"
    And I click on "Payment Settings"
    And I verify the "TableRecords" count is "equal" to "13"
    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password   | ButtonName | 
      | UAP       | UserNameInput | PasswordInput | mary     | Dbresults1 | Pay        |    