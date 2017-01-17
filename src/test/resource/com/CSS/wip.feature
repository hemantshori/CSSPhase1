@wip
Feature: Some feature

<<<<<<< HEAD
  Scenario Outline: DCSSP-162, DCSSP-236 edit settings......................Ellen Please verify these
=======
   
   Scenario Outline: DCSSP-162, DCSSP-236 edit settings......................Ellen Please verify these
    Given I want to login to portal "<PortalName>"
    And I enter then details as
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
    And I enter then details as
      | Fields | Value   |
      | Email  | <email> |
    And I click on "Submit"
    Then I see "<Message>" displayed

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password   | email          | Message                                    |
      | CSS        | UserNameInput | PasswordInput | mary     | Dbresults1 | test4@test.com | Your changes have been saved successfully. |
 Scenario Outline: DCSSP-450; DCSSP-457; DCSSP-451; DCSSP-492: Scenario 1, Scenario 2 Test 1, To make payment from LHS. + DCSSP-743-- Check payment made on activity history page.
>>>>>>> workInProgress
    Given I want to login to portal "<PortalName>"
    And I enter then details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
<<<<<<< HEAD
    And I click on "Settings"
    And I check I am on "Setting" page
    #Then "<Item>" is displayed as "<ItemName>"
    #| Item    | ItemName      |
    # | Item1   | Profile       |
    # | Item2   | Settings      |
    #| Item3   | User Name     |
    #| Item4   | First Name    |
    #| Item6   | Last Name     |
    #| Item7   | Date of Birth |
    #| Item8   | Preferences   |
    #| Item9   | Language      |
    #| Item10  | Contact       |
    #| Item11  | Security      |
    #| Item11  | Hint          |
    #| Item 11 | ******        |
    And I click on "Profile"
    And I click on "Contact"
    And I click on "Security"
    And I click on "EditSettings"
    And I check I am on "EditSettings" page
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName |
      | Item2 | Submit   |
      | Item3 | Cancel   |
    And I enter then details as
      | Fields | Value   |
      | Email  | <email> |
    And I click on "Submit"
    Then I see "<Message>" displayed

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password   | email          | Message                                    |
      | CSS        | UserNameInput | PasswordInput | mary     | Dbresults1 | test4@test.com | Your changes have been saved successfully. |
=======
    And I click on "Payments"
    And I click on "Make a Payment"
    And I check I am on "MakePayment" page
    And I hover on "InfoTooltip OSInline" to verify "3 digit number on the back of your card or 4 digit number on your American Express" is displayed
    And I enter then details as
      | Fields        | Value           |
      | PaymentAmount | <PaymentAmount> |
      | NameOnCard    | <Name on Card>  |
      | CardNumber    | <Card Number>   |
      | ExpiryMonth   | <Expiry Month>  |
      | ExpiryYear    | <Expiry Year>   |
      | SecurityCode  | <Security Code> |
    And I click on "Submit"
    And I check I am on "PaymentConfirm" page
    Then I see "Thank you, your payment has been received." displayed
    And I capture "ReceiptNumberId"
    And I click on "ActivityHistoryButton"
    And "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName    |
      | Item1 | Date        |
      | Item1 | Activity    |
      | Item1 | Description |
    And I check I am on "Activity History" page
    Then I see "Activity History" displayed
    And I Check "Wrapper" contains "ReceiptNumberId"

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password   | ButtonName | AccountNumber      | PaymentAmount | Name on Card | Card Number   | Expiry Month | Expiry Year | Security Code |
      | CSS        | UserNameInput | PasswordInput | mary     | Dbresults1 | Pay        | Account 1071805034 |          0.11 | Mary Test    | 4007000000027 |           11 |          20 |           112 |  
>>>>>>> workInProgress
