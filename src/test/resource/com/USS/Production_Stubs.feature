
Feature: To test the functionality of Appication as described in Jira Stories for Iteration 1

  @ShakeOutProductionStubs
  Scenario Outline: User views the menu items, Test 1, DCSSP-245, DCSSP-533 Description: User views the menu items Epic: Common Components
    Given I want to login to portal "<PortalName>"
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName |
      | item1 | Logo     |
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    And I check I am on "Dashboard" page
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName          |
      | item1 | Logo on main page |
      | item2 | Usage             |
      | item3 | Billing History   |
      | item4 | Payments          |
      | item6 | Accounts          |
      | item8 | Settings          |
      | item9 | Sign Out          |
    When I view the left hand panel of screen
    Then I see "<ServiceName>" displayed
    Then I see "<AccountNumber>" displayed
    Then I see text "<Address>" displayed

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password   | ButtonName | ServiceName      | AccountNumber          | Address                             |
      | CSS        | UserNameInput | PasswordInput | Jane     | Dbresults1 | Accounts   | Residential: Gas | Account No. 1025577469 | 101 Spruce Ct, San Rafael, CA 94903 |

  @ShakeOutProductionStubs
  Scenario Outline: Check Usage Menu Item List Test 1, DCSSP-245 Description: User views the menu items Epic: Common Components
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    And I click on "<ButtonName>"
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName      |
      #| item1 | Comparison    |
      | item2 | Usage History |
    And I click on "<ButtonName2>"
    Then I see "Residential - Gas Usage History" displayed
    Then I see "5% discount!" displayed

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password   | ButtonName | ServiceName      | ButtonName2   | ButtonName3 |
      | CSS        | UserNameInput | PasswordInput | Jane     | Dbresults1 | Usage      | Residential: Gas | Usage History | Contact Us  |

  @ShakeOutProductionStubs
  Scenario Outline: Check User Menu Item List Test 1, DCSSP-245 Description: check for feature under development
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName            |
      | Item1 | Current_Bill        |
      | Item2 | Pay                 |
      | Item  | Due Date            |
      | Item  | Account Total       |
      | Item3 | Set Up Direct Debit |
      | Item4 | Set Up eBilling     |
      | item1 | Logo on main page   |
    And I click on "<LinkName>"

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password   | LinkName            |
      | CSS        | UserNameInput | PasswordInput | Jane     | Dbresults1 | Set Up Direct Debit |
      | CSS        | UserNameInput | PasswordInput | Jane     | Dbresults1 | Set Up eBilling     |
      | CSS        | UserNameInput | PasswordInput | Jane     | Dbresults1 | Current_Bill        |

  Scenario Outline: Test20, Test21, Test22, Test23, Test24, Test26, Check Billing history page elements.
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    And I click on "<ButtonName>"
    Then I see "5% discount!" displayed
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName            |
      | Item1 | Current_Bill        |
      | item1 | Logo on main page   |
      | Item2 | Pay                 |
      | Item  | Due Date            |
      | Item  | Account Total       |
      | Item3 | Set Up Direct Debit |
      | Item4 | Set Up eBilling     |
      | Item5 | Last Bill           |
      | Item6 | Last Year           |

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password   | ButtonName      | ServiceName      | ButtonName2                         | ButtonName3   |
      | CSS        | UserNameInput | PasswordInput | Jane     | Dbresults1 | Billing History | Residential: Gas | 101 Spruce Ct, San Rafael, CA 94903 | Usage History |

  Scenario Outline: Test 25, User views the Billing History page
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    And I click on "<ButtonName>"
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName            |
      | Item1 | Current_Bill        |
      | item1 | Logo on main page   |
      | Item2 | Pay                 |
      | Item2 | Pay                 |
      | Item  | Due Date            |
      | Item  | Account Total       |
      | Item3 | Set Up Direct Debit |
      | Item4 | Set Up eBilling     |
      | Item5 | Last Bill           |
      | Item6 | Last Year           |
    Then I see "5% discount!" displayed
    And the graph for "billinghistory" is displayed
    And I will see message "<Graph Message>"

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password   | ButtonName      | Graph Message                     |
      | CSS        | UserNameInput | PasswordInput | Jane     | Dbresults1 | Billing History | Residential - Gas Billing History |
@RegressionProduction
  Scenario Outline: DCSSP-422, 423, PAYMENTS
    Given I want to login to portal "<PortalName>"
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName |
      | item1 | Logo     |
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    And I select "<DropDownValue1>" from "<DropDownField>"
    And I select "<DropDownValue2>" from "<DropDownField2>"
    Then I compare "<CurrentBill>" to "<LastBill>" to check if variation is displayed correctly

     Then I compare "<CurrentBill>" to "<Account total>" to check if variation is displayed correctly
    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password   | DropDownValue1     | DropDownField   | DropDownValue2 | DropDownField2  | CurrentBill     | LastBill     | Account total        | percent change in bill  |
      | CSS        | UserNameInput | PasswordInput | Jane     | Dbresults1 | Account 1025577469 | AccountComboBox |     94903 | PremiseComboBox | CurrentBillCost | LastBillCost | BillingAccountAmount | LastBillNegativeRedBill |

  Scenario Outline: Covers tests around billing history check, Scenario 189
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    And I click on "<ButtonName>"
    And I check I am on "Billing History" page
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                   |
      | Item2 | Understanding Your Charges |
      | Item3 | Pending Transactions       |
      | Item4 | Completed Transactions     |
      | Item5 | Date                       |
      | Item6 | Type                       |
      | Item7 | Amount                     |
      | Item8 | 5% discount!               |
      | Item9 | Understanding Your Charges |
    And I will see message "Your highest billing month was in"
    And I will see message "Your lowest billing month was in"
    And I will see message "Your average daily cost for the last 12 months is"

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password   | ButtonName      | Graph Message                     |
      | CSS        | UserNameInput | PasswordInput | Jane     | Dbresults1 | Billing History | Residential - Gas Billing History |

  Scenario Outline: Covers tests around Usage history check, Scenario 189
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    And I click on "Usage"
    And I click on "Usage History"
    And I check I am on "Usage History" page
    Then "<Item>" is displayed as "<ItemName>"
      | Item   | ItemName                 |
      | Item2  | Understanding Your Usage |
      | Item3  | Past Usage               |
      | Item4  | Bill Period              |
      | Item6  | Average Temperature      |
      | Item7  | 5% discount!             |
      | Item8  | Set Up Direct Debit      |
      | Item9  | Set Up eBilling          |
      | Item10 | Last Bill                |
      | Item11 | Last Year                |

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password   |
      | CSS        | UserNameInput | PasswordInput | Jane     | Dbresults1 |

  #########################################################################
  ###############################PAYMENTS##################################
  #########################################################################
  Scenario Outline: DCSSP-450,DCSSP-451,DCSSP-457, PAYMENTS, To make payment from RHS "PAY" button.
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    And I click on "<ButtonName>"
    And I check I am on "MakePayment" page
    And I enter the details as
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
      | CSS        | UserNameInput | PasswordInput | Bob      | Dbresults1 | Pay        |     689608083 |               | Bob Test     | 4007000000027 |           11 |          20 |           112 | Mandatory field!                   |
      | CSS        | UserNameInput | PasswordInput | Bob      | Dbresults1 | Pay        |     689608083 |            20 |              | 4007000000027 |           11 |          20 |           112 | Mandatory field!                   |
      | CSS        | UserNameInput | PasswordInput | Bob      | Dbresults1 | Pay        |     689608083 |            20 | Bob Test     |               |           11 |          20 |           112 | Mandatory field!                   |
      | CSS        | UserNameInput | PasswordInput | Bob      | Dbresults1 | Pay        |     689608083 |            20 | Bob Test     | 4007000000027 |              |          20 |           112 | Mandatory field!                   |
      | CSS        | UserNameInput | PasswordInput | Bob      | Dbresults1 | Pay        |     689608083 |            20 | Bob Test     | 4007000000027 |           11 |             |           112 | Mandatory field!                   |
      | CSS        | UserNameInput | PasswordInput | Bob      | Dbresults1 | Pay        |     689608083 |            20 | Bob Test     | 4007000000027 |           11 |          20 |               | Mandatory field!                   |
      | CSS        | UserNameInput | PasswordInput | Bob      | Dbresults1 | Pay        |     689608083 |            20 | Bob Test     |    4007000000 |           11 |          20 |           223 | The credit card number is invalid. |

  #    | CSS        | UserNameInput | PasswordInput | Bob     | Dbresults11 | Pay        | 689608083     | 1.00          | Bob Test    | 4007000000027 | 11           | 20          | 112           | Thank you, your payment has been received. |
  Scenario Outline: DCSSP-422, 423, SUCCESSFUL PAYMENTS, To make payment from RHS "PAY" button.
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    And I click on "<ButtonName>"
    And I check I am on "MakePayment" page
    And I enter the details as
      | Fields        | Value           |
      | PaymentAmount | <PaymentAmount> |
      | NameOnCard    | <Name on Card>  |
      | CardNumber    | <Card Number>   |
      | ExpiryMonth   | <Expiry Month>  |
      | ExpiryYear    | <Expiry Year>   |
      | SecurityCode  | <Security Code> |
    And I click on "Submit"
    Then I see text "<Message>" displayed

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password   | ButtonName | AccountNumber | PaymentAmount | Name on Card | Card Number   | Expiry Month | Expiry Year | Security Code | Message                                    |
      | CSS        | UserNameInput | PasswordInput | Bob      | Dbresults1 | Pay        |     689608083 |          1.10 | Bob Test     | 4007000000027 |           05 |          20 |           113 | Thank you, your payment has been received. |

  #########################################################################
  ###############################EDIT SETTINGS##################################
  #########################################################################
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
      | Fields | Value   |
      | Email  | <email> |
    And I click on "Submit"
    Then I will see message "<Message>"

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password   | email          | Message                                    |
      | CSS        | UserNameInput | PasswordInput | Bob      | Dbresults1 | test4@test.com | Your changes have been saved successfully. |

  Scenario Outline: DCSSP-433, DCSSP-550 (reset password is manual), DCSSP-162 Edit Settings>> reset pwd
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
    And I enter the details as new
      | Fields                  | Value                  |
      | CurrentPasswordInput    | <Current Password>     |
      | NewPasswordInput        | <New Password>         |
      | NewPasswordConfirmInput | <Confirm New Password> |
    And I click on "Submit"
    Then I see "<Message>" displayed

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password   | Current Password | New Password | Confirm New Password | Message                                                           |
      | CSS        | UserNameInput | PasswordInput | Bob      | Dbresults1 | Dbresults1       | Dbresults1   |                      | New Password and Confirm Password do not match. Please try again. |
      | CSS        | UserNameInput | PasswordInput | Bob      | Dbresults1 | Dbresults1       |              | Dbresults1           | New Password and Confirm Password do not match. Please try again. |
      | CSS        | UserNameInput | PasswordInput | Bob      | Dbresults1 |                  | Dbresults1   | Dbresults1           | Please input your current password to change your new password.   |
      | CSS        | UserNameInput | PasswordInput | Bob      | Dbresults1 | Dbresults1       | DBR          | DBR                  | New Password is invalid. Please try again.                        |

  # | CSS        | UserNameInput | PasswordInput | mary    | Dbresults1 | Dbresults1        | Dbresults1    | Dbresults1            | Your changes have been saved successfully.                                             |
  ########################## TO DO ADD PAYMENT VERIFICATIONS#####################################################
  Scenario Outline: DCSSP-450; DCSSP-457; DCSSP-451: Scenario 1, Scenario 2 Test 1, To make payment from LHS
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    And I click on "Payments"
    And I click on "Make a Payment"
    And I check I am on "MakePayment" page
    And I hover on "InfoTooltip OSInline" to verify "3 digit number on the back of your card or 4 digit number on your American Express" is displayed
    And I enter the details as
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
      | PortalName | UserNameField | PasswordField | UserName | Password   | ButtonName | AccountNumber     | PaymentAmount | Name on Card | Card Number   | Expiry Month | Expiry Year | Security Code | Message                            |
      | CSS        | UserNameInput | PasswordInput | Bob      | Dbresults1 | Pay        | Account 689608083 |               | Mary Test    | 4007000000027 |           11 |          20 |           112 | Mandatory field!                   |
      | CSS        | UserNameInput | PasswordInput | Bob      | Dbresults1 | Pay        | Account 689608083 |            20 | Mary Test    |               |           11 |          20 |           112 | Mandatory field!                   |
      | CSS        | UserNameInput | PasswordInput | Bob      | Dbresults1 | Pay        | Account 689608083 |            20 | Mary Test    | 4007000000027 |           11 |             |           112 | Mandatory field!                   |
      | CSS        | UserNameInput | PasswordInput | Bob      | Dbresults1 | Pay        | Account 689608083 |            20 | Mary Test    | 4007000000027 |           11 |          20 |               | Mandatory field!                   |
      | CSS        | UserNameInput | PasswordInput | Bob      | Dbresults1 | Pay        | Account 689608083 |            20 | Mary Test    |    4007000000 |           11 |          20 |           112 | The credit card number is invalid. |

  ######################################################################
  ############################    LHS successful payment  back to billing    ############################
  ######################################################################
  #############################################################ALL IS WELLLLLLLLLLLLLLLL#####################################################
  Scenario Outline: DCSSP-450; DCSSP-457; DCSSP-451; DCSSP-492: Scenario 1, Scenario 2 Test 1, To make payment from LHS
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    And I click on "Payments"
    And I click on "Make a Payment"
    And I check I am on "MakePayment" page
    And "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName            |
      | Item1 | Total Due           |
      | Item2 | Payment Amount      |
      | Item3 | Name on Card        |
      | Item4 | Card Number         |
      | Item5 | Expiry Date (mm/yy) |
      | Item6 | Security Code       |
    And I hover on "InfoTooltip OSInline" to verify "3 digit number on the back of your card or 4 digit number on your American Express" is displayed
    And I enter the details as
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
    And "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName        |
      | Item1 | Receipt Sent To |
    And I click on "BillingHistoryButton"
    And I check I am on "Billing History" page

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password   | ButtonName | AccountNumber     | PaymentAmount | Name on Card | Card Number   | Expiry Month | Expiry Year | Security Code |
      | CSS        | UserNameInput | PasswordInput | Bob      | Dbresults1 | Pay        | Account 689608083 |          1.00 | Bob Test     | 4007000000027 |           11 |          20 |           112 |

  ######################################################################
  ############################    LHS successful payment  back to make another payment    ############################
  ######################################################################
  Scenario Outline: DCSSP-450; DCSSP-457; DCSSP-451: Scenario 1, Scenario 2 Test 1, To make payment from LHS
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    And I click on "Payments"
    And I click on "Make a Payment"
    And I check I am on "MakePayment" page
    And "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName            |
      | Item1 | Total Due           |
      | Item2 | Payment Amount      |
      | Item3 | Name on Card        |
      | Item4 | Card Number         |
      | Item5 | Expiry Date (mm/yy) |
      | Item6 | Security Code       |
    And I hover on "InfoTooltip OSInline" to verify "3 digit number on the back of your card or 4 digit number on your American Express" is displayed
    And I enter the details as
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
    And "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName        |
      | Item1 | Receipt Sent To |
    And I click on "MakeAnotherPaymentButton"
    And I check I am on "MakePayment" page

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password   | ButtonName | AccountNumber      | PaymentAmount | Name on Card    | Card Number   | Expiry Month | Expiry Year | Security Code |
      | CSS        | UserNameInput | PasswordInput | Bob      | Dbresults1 | Pay        | Account 1071805034 |          1.00 | another payment | 4007000000027 |           11 |          20 |           112 |

  #############################################################################################################################################################################################
  #############################################################################################################################################################################################
  #############################################################################################################################################################################################
  #############################################################################################################################################################################################
  #############################################################################################################################################################################################
  ###################                                                    ITERATION 4 STORIES                                   ################################################################
  #############################################################################################################################################################################################
  #############################################################################################################################################################################################
  #############################################################################################################################################################################################
  #############################################################################################################################################################################################
  #############################################################################################################################################################################################
  Scenario Outline: DCSSP-493: Invalid Login using email (scenario 3); DCSSP-551: Password Hint during login; DCSSP-28: Account locked after no of unsuccessful login attempts
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value               |
      | UserNameInput | <UserName or Email> |
      | PasswordInput | <Invalid Password1> |
    And I hit Enter
    Then I see "<message1>" displayed
    And I enter the details as
      | Fields        | Value               |
      | UserNameInput | <UserName or Email> |
      | PasswordInput | <Invalid Password2> |
    And I hit Enter
    Then I see "<message1>" displayed
    And I enter the details as
      | Fields        | Value               |
      | UserNameInput | <UserName or Email> |
      | PasswordInput | <Invalid Password3> |
    And I hit Enter
    Then I see "<message2>" displayed
    And I enter the details as
      | Fields        | Value               |
      | UserNameInput | <UserName or Email> |
      | PasswordInput | <Invalid Password4> |
    And I hit Enter
    And I check I am on "Locked Account" page
    And I click on "<Button2>"
    And I check I am on "Forgot Your Password?" page

    Examples: 
      | PortalName | UserNameOrEmailField | InvalidPasswordField | UserName or Email | Invalid Password1 | Invalid Password2 | Invalid Password3 | Password4 | message1                                               | Button2 | message2                                                            |
      | CSS        | UserNameOrEmailInput | InvalidPasswordInput | Bob               | sss               | sdfg              | sfdg              | sgfsd     | Invalid Username, Email or Password. Please try again. | Reset   | Invalid Username, Email or Password. Password Hint: First Pet Name. |

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

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password   | email                      | wrong email         | Message                                                |
      | CSS        | UserNameInput | PasswordInput | Bob      | Dbresults1 | bob.jones@dbresults.com.au | blah_blah@gmail.com | Invalid Username, Email or Password. Please try again. |

  Scenario Outline: DCSSP-607: As a user I want to view the Terms and Conditions before registering an account so that I know the rules I need to follow when using CSSAs a user I want to enter my user details so that I can complete the registration process
    Given I want to login to portal "<PortalName>"
    And I click on "Create Account"
    And I enter the details as new
      | Fields                    | Value             |
      | InputAccountNumber        | <Account Number1> |
      | InputBillName             | <BillName1>       |
      | InputIdentificationNumber | <SSN1>            |
    And I click on "Submit"
    Then I see "You must accept the Terms and Conditions to proceed" displayed
    And I click on "Terms & Conditions"
    And I hit Enter
    Then a new page "http://dbresults.com.au/terms/" is launched

    Examples: 
      | PortalName | Account Number1 | BillName1  | SSN1        |
      | CSS        |      8970235184 | Pan, Peter | 888-99-8761 |

  Scenario Outline: DCSSP-450; DCSSP-457; DCSSP-451; DCSSP-492: Scenario 1, Scenario 2 Test 1, To make payment from LHS; DCSSP-459: scenario 1, 2, 3
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    And I click on "Payments"
    And I click on "Make a Payment"
    And I check I am on "MakePayment" page
    And "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName            |
      | Item1 | Total Due           |
      | Item2 | Payment Amount      |
      | Item3 | Name on Card        |
      | Item4 | Card Number         |
      | Item5 | Expiry Date (mm/yy) |
      | Item6 | Security Code       |
    And I click on "Cancel"
    And I hover on "InfoTooltip OSInline" to verify "3 digit number on the back of your card or 4 digit number on your American Express" is displayed
    And I enter the details as
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
    And "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName        |
      | Item1 | Receipt Number  |
      | Item2 | Date            |
      | Item3 | Account Number  |
      | Item4 | Payment Method  |
      | Item5 | Receipt Sent To |
    And I click on "BillingHistoryButton"
    And I check I am on "Billing History" page

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password   | ButtonName | AccountNumber     | PaymentAmount | Name on Card | Card Number   | Expiry Month | Expiry Year | Security Code |
      | CSS        | UserNameInput | PasswordInput | Bob      | Dbresults1 | Pay        | Account 689608083 |          0.10 | Bob Test     | 4007000000027 |           11 |          20 |           112 |

  Scenario Outline: DCSSP-450; DCSSP-457; DCSSP-451: Scenario 1, Scenario 2 Test 1, To make payment from LHS; DCSSP-459: scenario 4
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    And I click on "Payments"
    And I click on "Make a Payment"
    And I check I am on "MakePayment" page
    And "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName            |
      | Item1 | Total Due           |
      | Item2 | Payment Amount      |
      | Item3 | Name on Card        |
      | Item4 | Card Number         |
      | Item5 | Expiry Date (mm/yy) |
      | Item6 | Security Code       |
    And I hover on "InfoTooltip OSInline" to verify "3 digit number on the back of your card or 4 digit number on your American Express" is displayed
    And I click on "Cancel"
    And I check I am on "MakePayment" page
    And I enter the details as
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
    And "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName        |
      | Item1 | Receipt Sent To |
    And I click on "MakeAnotherPaymentButton"
    And I check I am on "MakePayment" page

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password   | ButtonName | AccountNumber     | PaymentAmount | Name on Card    | Card Number   | Expiry Month | Expiry Year | Security Code |
      | CSS        | UserNameInput | PasswordInput | Bob      | Dbresults1 | Pay        | Account 689608083 |          0.15 | another payment | 4007000000027 |           11 |          20 |           112 |

  Scenario Outline: DCSSP-489 As a user I want my name displayed in the portal so that I know I'm currently logged in
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I see text "<Welcome Message>" displayed
    And I click on "<Welcome Message>"
    And I check I am on "Setting" page

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password   | Welcome Message |
      | CSS        | UserNameInput | PasswordInput | Bob      | Dbresults1 | Welcome         |

  Scenario Outline: DCSSP-449: all (Edit phone and mailing address); DCSSP-553: covers update of info (excludes ccb check)
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    And I click on "Settings"
    And I check I am on "Setting" page
    And I click on "EditSettings"
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName   |
      | Item2 | First Name |
      | Item3 | Last Name  |
    And I enter the details as
      | Fields      | Value               |
      | MobilePhone | <Mobile Number1>    |
      | HomePhone   | <HomePhone Number1> |
      | WorkPhone   | <WorkPhone Number1> |
    And I hover on "hint" to verify "(999) 999-9999" is displayed
    And I click on "Submit"
    Then I see "Mobile format invalid. Expected format: (999) 999-9999" displayed
    And I enter the details as
      | Fields      | Value               |
      | MobilePhone | <Mobile Number2>    |
      | HomePhone   | <HomePhone Number2> |
    And I click on "Submit"
    Then I see "Home Phone format invalid. Expected format: (999) 999-9999" displayed
    And I enter the details as
      | Fields    | Value               |
      | HomePhone | <HomePhone Number1> |
      | WorkPhone | <WorkPhone Number2> |
    And I click on "Submit"
    Then I see "Work Phone format invalid. Expected format: (999) 999-9999" displayed
    And I enter the details as
      | Fields           | Value               |
      | Email            | <Email>             |
      | WorkPhone        | <WorkPhone Number1> |
      | MailingAddressL1 | <Address Line1>     |
      | MailingAddressL2 | <Address Line2>     |
      | City             | <City>              |
      | State            | <State>             |
      | PostCode         | <Post Code>         |
    And I select "<DropDownValue1>" from "<DropDownField>"
    And I click on "Submit"

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password   | Mobile Number1 | HomePhone Number1 | WorkPhone Number1 | Mobile Number2 | HomePhone Number2 | WorkPhone Number2 | Address Line1                | Address Line2 | City          | State | Post Code | DropDownValue1           | DropDownField     | Email                   |
      | CSS        | UserNameInput | PasswordInput | Jane     | Dbresults1 | (999) 11-g     | (999) 989-1122    | (888) 777-6654    | (903) 888-7161 | (99) 77-60        | (88) 71           | Apt. 26, 30 Saint Francis Pl |               | San Francisco | CA    |     94107 | United States of America | CountriesComboBox | email@Dbresults1.com.au |

  Scenario Outline: DCSSP-493 :As a user I want to login to the CSS using my email address so that I can access my information. This will keep runing the validations till CAPTCHA
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
      | Fields        | Value   |
      | UserNameInput | <email> |
    And I hit Enter
    Then I see "Invalid human validation. Please try again." displayed

    Examples: 
      | PortalName | PortalName2 | UserNameField | PasswordField | UserName | Password   | email                      | wrong email        | Message                                                |
      | CSS        | CSS2        | UserNameInput | PasswordInput | Jane     | Dbresults1 | bob.jones@dbresults.com.au | bob.hllo@gmail.com | Invalid Username, Email or Password. Please try again. |

 

  Scenario Outline: DCSSP-758: This is for defect 758, email address should not be duplicated with edit settings option. This should not accept the duplicate email address.
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    And I check I am on "Dashboard" page
    And I click on "Settings"
    And I click on "EditSettings"
    And I check I am on "EditSettings" page
    And I enter the details as
      | Fields | Value   |
      | Email  | <email> |
    And I hit Enter
    Then I see "Email address already exists. Please try again." displayed

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password   | email                         |
      | CSS        | UserNameInput | PasswordInput | Jane     | Dbresults1 | hemant.shori@dbresults.com.au |

  Scenario Outline: DCSSP-758: This is for defect 758, email address should not be duplicated with edit settings option. This should not accept the duplicate email address.
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    And I check I am on "Dashboard" page
    And I click on "Set Up Direct Debit"
    Then I see text "Please contact" displayed
    Then I see text "to set up your Direct Debit" displayed
    And I click on "Set Up eBilling"
    Then I see text "Please contact" displayed
    Then I see text "to set up eBilling" displayed

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password   |
      | CSS        | UserNameInput | PasswordInput | Jane     | Dbresults1 |
