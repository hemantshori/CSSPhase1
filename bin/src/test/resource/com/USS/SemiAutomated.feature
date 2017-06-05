 
 @wip
 Feature: This is a semiautomated test, in between scrript 1 and 2, CAPTCHA needs to be resolved and the link from mail has to be copied before 2nd script is executed.
  Scenario Outline: DCSSP-493 :As a user I want to login to the CSS using my email address so that I can access my information
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    And I click on "Settings"
    And I click on "EditSettings"
    And I enter the details as
      | Fields | Value   |
      | Email  | <email> |
    And I click on "Submit"
    And I click on "Sign Out"
    And I check I am on "Login" page
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <email>    |
      | PasswordInput | <Password> |
    And I hit Enter
    And I check I am on "Dashboard" page
    And I click on "Sign Out"
    And I enter the details as
      | Fields        | Value         |
      | UserNameInput | <wrong email> |
      | PasswordInput | <Password>    |
    And I hit Enter
    Then I see "<Message>" displayed
    Given I want to login to portal "<PortalName2>"
    And I click on "Forgot Password?"
     And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <email> |
      And I hit Enter
      Then i see "Invalid human validation. Please try again." displayed

    Examples: 
      | PortalName | PortalName2 | UserNameField | PasswordField | UserName | Password  | email                         | wrong email         | Message                                                |
      | CSS        | CSS2        | UserNameInput | PasswordInput | Mary      | Dbresults1 | hemant.shori@dbresults.com.au | blah_blah@gmail.com | Invalid Username, Email or Password. Please try again. |

     #################################################################################################################################
     ## Resolve CAPTCHA
     ## Move @wip from script 1 to 2
     ## Paste link from mail in 2nd script
     
     
     
     ##################################################################################################################################### 
      




  Scenario Outline: DCSSP-548: all; DCSSP-550: all >> cancelling change of password and successful change of password to reaccess account
    Given I want to login to portal "<PortalName>"
    And "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName         |
      | Item1 | Change Password  |
      | Item2 | New Password     |
      | Item3 | Confirm Password |
    And I click on "InfoIcon"
    Then I see "Password must include a minimum of 8 characters, 1 upper case character, 1 numeric or special character." displayed
    And I click on "Cancel"
    And I check I am on "Login" page
    And I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields               | Value               |
      | NewPasswordInput     | <New Password1>     |
      | ConfirmPasswordInput | <Confirm Password1> |
    And I click on "Cancel"
    Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "Cancel"
    And I click on "Cancel"
    Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "OK"
    And I check I am on "Login" page
    And I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields               | Value               |
      | NewPasswordInput     | <New Password2>     |
      | ConfirmPasswordInput | <Confirm Password2> |
    And I click on "PasswordSaveButton"
    Then I see "Mandatory field!" displayed
    And I enter the details as
      | Fields               | Value               |
      | NewPasswordInput     | <New Password3>     |
      | ConfirmPasswordInput | <Confirm Password3> |
    And I click on "PasswordSaveButton"
    Then I see "New Password is invalid. Please try again." displayed
    And I enter the details as
      | Fields               | Value               |
      | NewPasswordInput     | <New Password4>     |
      | ConfirmPasswordInput | <Confirm Password4> |
    And I click on "PasswordSaveButton"
    Then I see "New Password and Confirm Password do not match. Please try again." displayed
    And I enter the details as
      | Fields               | Value               |
      | NewPasswordInput     | <New Password5>     |
      | ConfirmPasswordInput | <Confirm Password5> |
    And I click on "PasswordSaveButton"
    And I check I am on "Login" page
    Then I see "Password successfully changed." displayed

    Examples: 
      | PortalName   | New Password1 | Confirm Password1 | New Password2 | Confirm Password2 | New Password3 | Confirm Password3 | New Password4 | Confirm Password4 | New Password5 | Confirm Password5 |
      | copyFromMail | dbr           | dbr               |               |                   | dbr           | dbr               | Dbresults1    | dbr               | Dbresults1    | Dbresults1        |


 Scenario Outline: DCSSP-548: all; DCSSP-550: all >> cancelling change of password and successful change of password to reaccess account
    Given I want to login to portal "<PortalName>"
    And "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName         |
      | Item1 | Change Password  |
      | Item2 | New Password     |
      | Item3 | Confirm Password |
    And I click on "InfoIcon"
    Then I see "Password must include a minimum of 8 characters, 1 upper case character, 1 numeric or special character." displayed
    And I click on "Cancel"
    And I check I am on "Login" page
    And I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields               | Value               |
      | NewPasswordInput     | <New Password1>     |
      | ConfirmPasswordInput | <Confirm Password1> |
    And I click on "Cancel"
    Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "Cancel"
    And I click on "Cancel"
    Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "OK"
    And I check I am on "Login" page
    And I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields               | Value               |
      | NewPasswordInput     | <New Password2>     |
      | ConfirmPasswordInput | <Confirm Password2> |
    And I click on "PasswordSaveButton"
    Then I see "Mandatory field!" displayed
    And I enter the details as
      | Fields               | Value               |
      | NewPasswordInput     | <New Password3>     |
      | ConfirmPasswordInput | <Confirm Password3> |
    And I click on "PasswordSaveButton"
    Then I see "New Password is invalid. Please try again." displayed
    And I enter the details as
      | Fields               | Value               |
      | NewPasswordInput     | <New Password4>     |
      | ConfirmPasswordInput | <Confirm Password4> |
    And I click on "PasswordSaveButton"
    Then I see "New Password and Confirm Password do not match. Please try again." displayed
    And I enter the details as
      | Fields               | Value               |
      | NewPasswordInput     | <New Password5>     |
      | ConfirmPasswordInput | <Confirm Password5> |
    And I click on "PasswordSaveButton"
    And I check I am on "Login" page
    Then I see "<Message2>" displayed

    Examples: 
      | PortalName   | New Password1 | Confirm Password1 | New Password2 | Confirm Password2 | New Password3 | Confirm Password3 | New Password4 | Confirm Password4 | New Password5 | Confirm Password5 | Message2                       |
      | copyFromMail | dbr           | dbr               |               |                   | dbr           | dbr               | Dbresults1    | dbr               | Dbresults11    | Dbresults11        | Password successfully changed. |
