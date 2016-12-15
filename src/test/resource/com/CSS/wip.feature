@wip
Feature: Some feature

    Scenario Outline: DCSSP-493 :As a user I want to login to the CSS using my email address so that I can access my information
    Given I want to login to portal "<PortalName>"
    And I enter then details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    And I click on "Settings"
    And I click on "EditSettings"
    And I enter then details as
      | Fields | Value   |
      | Email  | <email> |
    And I click on "Submit"
    And I click on "Sign Out"
    And I check I am on "Login" page
    And I enter then details as
      | Fields        | Value      |
      | UserNameInput | <email>    |
      | PasswordInput | <Password> |
    And I hit Enter
    And I check I am on "Dashboard" page
    And I click on "Sign Out"
    And I enter then details as
      | Fields        | Value         |
      | UserNameInput | <wrong email> |
      | PasswordInput | <Password>    |
    And I hit Enter
    Then I see "<Message>" displayed

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password   | email                              | wrong email         | Message                                                |
      | CSS        | UserNameInput | PasswordInput | mary     | Dbresults1 | automationtest2_for_Jane@gmail.com | blah_blah@gmail.com | Invalid Username, Email or Password. Please try again. |
  