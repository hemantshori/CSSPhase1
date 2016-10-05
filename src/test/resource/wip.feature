@wip
Feature: this is just a wip
 Scenario Outline: DCSSP-450,DCSSP-451,DCSSP-457, PAYMENTS, To make payment from RHS "PAY" button.
    Given I want to login to portal "<PortalName>"
    And I enter then details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    And I click on "<ButtonName>"
    And I check I am on "MakePayment" page
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
      | PortalName | UserNameField | PasswordField | UserName | Password   | ButtonName | AccountNumber | PaymentAmount | Name on Card | Card Number   | Expiry Month | Expiry Year | Security Code | Message                            |
      | CSS        | UserNameInput | PasswordInput | mary     | Dbresults1 | Pay        | 689608083     | 20            | Mary Test    | 4007000000    | 11           | 21          | 112           | The credit card number is invalid. |