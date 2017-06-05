Feature: Some feature

  Scenario Outline: DCSSP-730: update Profile Address Scenario 1
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
      | Item11  | Security      |
      | Item11  | Hint          |
      | Item 11 | ******        |
    And I click on "EditSettings"
    And I check I am on "EditSettings" page
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName |
      | Item2 | Submit   |
      | Item3 | Cancel   |
    And I enter the details as
      | Fields           | Value      |
      | Email            | <email>    |
      | MailingAddressL2 | <MAddress> |
    And I click on "Submit"
    Then I see "OverrideAddressConfirmation" displayed on popup and I click "OK"
    Then I see "<Message>" displayed

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password   | email          | MAddress     | Message                                    |
      | CSS        | UserNameInput | PasswordInput | mary     | Dbresults1 | test4@test.com | DBResult123s@gmail.com |                                            |
      | CSS        | UserNameInput | PasswordInput | mary     | Dbresults1 | test4@test.com |              | Your changes have been saved successfully. |

  Scenario Outline: DCSSP-730: update Profile Address Scenario 2
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    And I click on "Settings"
    And I check I am on "Setting" page
    And I click on "EditSettings"
    And I check I am on "EditSettings" page
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName |
      | Item2 | Submit   |
      | Item3 | Cancel   |
    And I enter the details as
      | Fields           | Value      |
      | Email            | <email>    |
      | MailingAddressL2 | <MAddress> |
    And I click on "Submit"
    Then I see "OverrideAddressConfirmation" displayed on popup and I click "Cancel"
    And I check I am on "EditSettings" page
    Then I see "<MAddressOld>" displayed

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password   | email          | MAddress | Message                                    | MAddressOld |
      | CSS        | UserNameInput | PasswordInput | mary     | Dbresults1 | test4@test.com | TestLine | Your changes have been saved successfully. | DBResults   |
