@Regression
Feature: Some feature

  Scenario Outline: DCSSP-493: Invalid Login using email (scenario 3); DCSSP-551: Password Hint during login; DCSSP-28: Account locked after no of unsuccessful login attempts
    Given I want to login to portal "<PortalName>"
    And I enter then details as
      | Fields        | Value               |
      | UserNameInput | <UserName or Email> |
      | PasswordInput | <Invalid Password1> |
    And I hit Enter
    Then I see "<message1>" displayed
    And I enter then details as
      | Fields        | Value               |
      | UserNameInput | <UserName or Email> |
      | PasswordInput | <Invalid Password2> |
    And I hit Enter
    Then I see "<message1>" displayed
    And I enter then details as
      | Fields        | Value               |
      | UserNameInput | <UserName or Email> |
      | PasswordInput | <Invalid Password3> |
    And I hit Enter
    Then I see "<message2>" displayed
    And I enter then details as
      | Fields        | Value               |
      | UserNameInput | <UserName or Email> |
      | PasswordInput | <Invalid Password4> |
    And I hit Enter
    And I check I am on "Locked Account" page
    And I click on "<Button2>"
    And I check I am on "Forgot Your Password?" page

    Examples: 
      | PortalName | UserNameOrEmailField | InvalidPasswordField | UserName or Email | Invalid Password1 | Invalid Password2 | Invalid Password3 | Password4 | message1                                               | Button2 | message2                                                          |
      | CSS        | UserNameOrEmailInput | InvalidPasswordInput | mary              | sss               | sdfg              | sfdg              | sgfsd     | Invalid Username, Email or Password. Please try again. | Reset   | Invalid Username, Email or Password. Password Hint: life is life. |
