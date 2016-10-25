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
    And I click on "Current_Bill"
    Then I see a pdf document with name "some" generated
    
# this one is on hold because of a defect......bill is opening in the same window
    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password   | email                         |
      | CSS        | UserNameInput | PasswordInput | Michael  | Dbresults1 | hemant.shori@dbresults.com.au |