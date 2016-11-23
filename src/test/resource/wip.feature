Feature: Some feature

  Scenario Outline: Read the UAP
    Given I want to login to portal "CSS"
    And I enter then details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Given I want to login to portal "UAP"
    And I click on "Application Settings"

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password   | ButtonName | ServiceName              | AccountNumber          | Address                                                |
      | CSS        | UserNameInput | PasswordInput | Michael  | Dbresults1 | Accounts   | Residential: Electricity | Account No. 2411617223 | Apt. 201, 300 Mission Street, San Francisco, CA, 94105 |

 
  Scenario Outline: DCSSP-67 : As a user I want to view my account’s financial history so that I can review the account's transactions over a period of time
    Given I want to login to portal "<PortalName>"
    And I enter then details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    And I click on "Accounts"
    Then "<DropDownField>" displays "<DropDownValue1>" by default
    And I click on "Account Financial History"
    And I check I am on "Account Financial History" page
    Then I see "Account Financial History" displayed
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName |
      | Item3 | Date     |
      | Item4 | Type     |
      | Item6 | Amount   |
      | Item7 | Balance  |
    And I verify the "TableRecords" count is "equal" to "13"
    And I click on "AllTransactions"
    Then I verify the "TableRecords" count is "more" to "13"

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password   | email                         | DropDownValue1     | DropDownField   | DropDownValue2 | DropDownField2  |
      | CSS        | UserNameInput | PasswordInput | Mary     | Dbresults1 | hemant.shori@dbresults.com.au | Account 0370837468 | AccountComboBox |     5133801785 | AccountComboBox |
      | CSS        | UserNameInput | PasswordInput | Mary     | Dbresults1 | hemant.shori@dbresults.com.au | Account 2754232312 | AccountComboBox |     2754232312 | AccountComboBox |

  Scenario Outline: DCSSP-67 : As a user I want to view my account’s financial history is empty Scenario 3
    Given I want to login to portal "<PortalName>"
    And I enter then details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    And I click on "Accounts"
    And I click on "Account Financial History"
    And I check I am on "Account Financial History" page
    Then I see "Account Financial History" displayed
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName          |
      | Item3 | Date              |
      | Item4 | Type              |
      | Item6 | Amount            |
      | Item7 | Balance           |
      | Item8 | Insufficient Data |

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password  | email                  |
      | CSS        | UserNameInput | PasswordInput | Mlara    | dbresults | mlara@dbresults.com.au |
