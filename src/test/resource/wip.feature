@wip
Feature: this is just a wip

  Scenario Outline: DCSSP-450; DCSSP-457; DCSSP-451: Scenario 1, Scenario 2 Test 1, To make payment from LHS
    Given I want to login to portal "<PortalName>"
    And I enter then details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    And I click on "Payments"
    And I click on "Make a Payment"
    And I check I am on "MakePayment" page
  #  And "<Item>" is displayed as "<ItemName>"   diablin these as they are checked when payment is made successfully
    #  | Item  | ItemName            |
     # | Item1 | Total Due           |
     # | Item2 | Payment Amount      |
     # | Item3 | Name on Card        |
     # | Item4 | Card Number         |
     # | Item5 | Expiry Date (mm/yy) |
     # | Item6 | Security Code       |
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
    Then I see "<Message>" displayed
    And I check I am on "MakePayment" page

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password   | ButtonName | AccountNumber      | PaymentAmount | Name on Card | Card Number   | Expiry Month | Expiry Year | Security Code | Message                            |
      | CSS        | UserNameInput | PasswordInput | mary     | Dbresults1 | Pay        | Account 1071805034 |               | Mary Test    | 4007000000027 | 11           | 20          | 112           | Mandatory field!                   |
      | CSS        | UserNameInput | PasswordInput | mary     | Dbresults1 | Pay        | Account 1071805034 | 20            | Mary Test    |               | 11           | 20          | 112           | Mandatory field!                   |
      | CSS        | UserNameInput | PasswordInput | mary     | Dbresults1 | Pay        | Account 1071805034 | 20            | Mary Test    | 4007000000027 | 11           |             | 112           | Mandatory field!                   |
      | CSS        | UserNameInput | PasswordInput | mary     | Dbresults1 | Pay        | Account 1071805034 | 20            | Mary Test    | 4007000000027 | 11           | 20          |               | Mandatory field!                   |
      | CSS        | UserNameInput | PasswordInput | mary     | Dbresults1 | Pay        | Account 1071805034 | 20            | Mary Test    | 4007000000    | 11           | 20          | 112           | The credit card number is invalid. |
