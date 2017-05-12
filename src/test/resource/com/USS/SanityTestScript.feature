
Feature: To test the basic functionality of Appication ....to be used for shakeout script

  Scenario Outline: User views the menu items, Test 1, DCSSP-245 Description: User views the menu items Epic: Common Components
    Given I want to login to portal "<PortalName>"
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName |
      | item1 | Logo     |
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName          |
      | item1 | Logo on main page |
      #  | item1 | Dashboard         |
      | item2 | Usage             |
      | item3 | Billing History   |
      | item4 | Payments          |
      | item5 | Stop & Transfer   |
      | item6 | Accounts          |
      | item7 | Contact Us        |
      | item8 | Settings          |
      | item9 | Sign Out          |
    And I click on "<ButtonName>"
    Then I will see message "Feature is currently in development"
    When I view the left hand panel of screen
    Then I see "<ServiceName>" displayed
    Then I see "<AccountNumber>" displayed
    Then I see text "<Address>" displayed

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password   | ButtonName | ServiceName              | AccountNumber          | Address                                                |
      | CSS        | UserNameInput | PasswordInput | Michael  | Dbresults1 | Accounts   | Residential: Electricity | Account No. 2411617223 | Apt. 201, 300 Mission Street, San Francisco, CA, 94105 |

  Scenario Outline: Check Usage Menu Item List Test 1, DCSSP-245 Description: User views the menu items Epic: Common Components
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    And I click on "<ButtonName>"
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName        |
      | item1 | Comparison      |
      | item2 | Usage History   |
      | item3 | Goals & Targets |
      | item4 | Tips & Tricks   |
    And I click on "<ButtonName2>"
    Then I see "Residential - Electricity Usage History" displayed
      And I click on "<ButtonName3>"
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName           |
      | item1 | Logo on main page  |
      | item1 | Faults & Enquiries |
      | item2 | Report Outage      |
      | item3 | Locations          |
    And I will see message "Feature is currently in development"
    Then I see "5% discount!" displayed

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password   | ButtonName | ServiceName              | ButtonName2   | ButtonName3   |
      | CSS        | UserNameInput | PasswordInput | Michael  | Dbresults1 | Usage      | Residential: Electricity | Usage History | Contact Us  |

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
    And I will see message "Feature is currently in development"

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password   | LinkName            |
      | CSS        | UserNameInput | PasswordInput | Michael  | Dbresults1 | Set Up Direct Debit |
      | CSS        | UserNameInput | PasswordInput | Michael  | Dbresults1 | Set Up eBilling     |
      | CSS        | UserNameInput | PasswordInput | Michael  | Dbresults1 | Current_Bill        |

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
      | PortalName | UserNameField | PasswordField | UserName | Password   | ButtonName      | ServiceName              | ButtonName2                                                 | ButtonName3   |
      | CSS        | UserNameInput | PasswordInput | Michael  | Dbresults1 | Billing History | Residential: Electricity | Apt. 201, 300 Mission Street, San Francisco, CA, 94105 2603 | Usage History |
