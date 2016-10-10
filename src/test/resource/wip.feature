@wip
Feature: this is just a wip
 Scenario Outline: DCSSP-493 :As a user I want to login to the CSS using my email address so that I can access my information. This will keep runing the validations till CAPTCHA
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
    Given I want to login to portal "<PortalName2>"
    And I click on "Forgot Password?"
    And I enter then details as
      | Fields        | Value   |
      | UserNameInput | <email> |
    And I hit Enter
    Then i see "Invalid human validation. Please try again." displayed

    Examples: 
      | PortalName | PortalName2 | UserNameField | PasswordField | UserName | Password   | email                         | wrong email         | Message                                                |
      | CSS        | CSS2        | UserNameInput | PasswordInput | Mary     | Dbresults1 | hemant.shori@dbresults.com.au | blah_blah@gmail.com | Invalid Username, Email or Password. Please try again. |
