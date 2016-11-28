Feature: Some feature

@wip
  Scenario Outline: DCSSP-520: Already registered or already activated
    Given I want to login to portal "<PortalName>"
    And I click on "Create Account"
    And I enter then details as new
      | Fields                    | Value             |
      | InputAccountNumber        | <Account Number1> |
      | InputBillName             | <BillName1>       |
      | InputIdentificationNumber | <SSN1>            |
    And I click on "checkbox" checkbox
    And I click on "Submit"
    # Then I see "Please wait while we retrieve your account..." displayed
    And I check I am on "Account Already Activated" page
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                                                                |
      | item1 | Your account has already been activated. Please click the button below. |
    Then I click on "wtSubmitButton3"
    And I check I am on "Login" page

    Examples: 
      | PortalName | Account Number1 | BillName1          | SSN1        | Account Number2 | BillName2   | SSN2        |
      | CSS        |      9353248310 | Da Vinci, Leonardo | 777-78-7807 |      4415168071 | Test, Simon | 211-02-0091 |


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




  Scenario Outline: Read the UAP
    Given I want to login to portal "CSS"
    And I enter then details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Given I want to login to portal "UAP"
    And I click on "Application Settings"
    And I click on "Feedback Messages"
    And I check I am on "Feedback Msg Texts" page
    And I read the table on "FeedbackMsgTextTable" page 
    And I click on "Common Messages"
    And I read the table on "CommonMsgTextTable" page
    
    
    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password   | ButtonName | ServiceName              | AccountNumber          | Address                                                |
      | CSS        | UserNameInput | PasswordInput | Michael  | Dbresults1 | Accounts   | Residential: Electricity | Account No. 2411617223 | Apt. 201, 300 Mission Street, San Francisco, CA, 94105 |

 
  