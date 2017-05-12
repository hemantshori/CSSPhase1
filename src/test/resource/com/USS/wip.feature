@wip
Feature: Some feature

Scenario Outline: DCSSP-162, DCSSP-236 edit settings......................Ellen Please verify these
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    And I click on "Settings"
    And I check I am on "Setting" page
    Then "<Item>" is displayed as "<ItemName>"
      | Item    | ItemName      |
      # | Item1   | Profile       |
      # | Item2   | Settings      |
      | Item3   | User Name     |
      | Item4   | First Name    |
      | Item6   | Last Name     |
      | Item7   | Date of Birth |
      | Item8   | Preferences   |
      | Item9   | Language      |
      | Item10  | Contact       |
      | Item11  | Security      |
      | Item11  | Hint          |
      | Item 11 | ******        |
 #   And I scroll down the page
    And I click on "Profile"
    And I click on "Contact"
    And I click on "Security"
    And I click on "EditSettings"
    And I check I am on "EditSettings" page
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName |
      | Item2 | Submit   |
      | Item3 | Cancel   |
    And I enter the details as
      | Fields | Value   |
      | Email  | <email> |
    And I click on "Submit"
    Then I see "<Message>" displayed

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password   | email          | Message                                    |
      | CSS        | UserNameInput | PasswordInput | mary     | Dbresults1 | test4@test.com | Your changes have been saved successfully. |
