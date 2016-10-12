
Feature: this is just a wip

   Scenario Outline: DCSSP-67: Account Financial History (all)
    Given I want to login to portal "<PortalName>"
    And I enter then details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    When I click on "Accounts"
    And I click on "Account Financial History"
    And I check I am on "Activity History" page
    And I select "<DropDownValue1>" from "<DropDownField>"
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                  |
      | Item2 | Account Financial History |
      | Item3 | Date                      |
      | Item4 | Type                      |
      | Item5 | Amount                    |
      | Item6 | Balance                   |
    And table is sorted based on "descending" "Date"
    And if there are "more than" "12 transactions" I click on "ALL TRANSACTIONS"

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password   | DropDownValue1     | DropDownField    |
      | CSS        | UserNameInput | PasswordInput | Michael  | Dbresults1 | Account 2411617223 | AccountsComboBox |
 
 
 
 

 
 
Scenario Outline: DCSSP-644: User views sample PDF when they 'View Current Bill'
    Given I want to login to portal "<PortalName>"
    And I enter then details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    When I click on "Current_Bill"
   Then I see a pdf document with name "Current Bill" generated
    And I will see "Account Number:" displayed
    And I will see "Total Amount Due:" displayed
    And I will see "Due Date:" displayed
    And I will see "SELFSERVE.CLOUD" displayed

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password   |
      | CSS        | UserNameInput | PasswordInput | Michael  | Dbresults1 |
 