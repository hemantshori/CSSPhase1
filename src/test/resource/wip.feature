Feature: Some feature

 @wip

  Scenario Outline: DCSSP-117,167,754 : Goals and Targets setting,verification and removal. DCSSP-128
    Given I want to login to portal "<PortalName>"
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName         |
      | Item1 | Mandatory Fields |
      | Item1 | Sign In          |
      | Item1 | Forgot Password? |
      | Item1 | Create Account   |
    And I enter then details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    And I click on "Usage"
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName        |
      | Item1 | Usage History   |
      | item1 | Goals & Targets |
    And I click on "Goals & Targets"
    Then I check I am on "Goals and Targets" page
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName        |
      | Item3 | Goals & Targets |
      | Item4 | Starter         |
      | Item6 | Saver           |
      | Item7 | Eco             |
      | Item7 | Custom          |
    And I select "SetGoal" from "Column1"
    Then I see "This goal will be applied for the next 12 months. Your goal traker will reset to the selected goal. Are you sure you want to update your goals?" displayed on popup and I click "OK"
    Then I see "5% Starter Goal" displayed
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName   |
      | Item1 | Lighting   |
      | Item2 | Heating    |
      | Item3 | Cooling    |
      | Item4 | Appliances |
    And I click on "Lighting"
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                                                                                   |
      | Item1 | Turning off your lights when you                |
      | Item2 | Replace your lightbulbs with LED       |
      | Item3 | Make sure you are using the right lightbulb for the fixture |
      | Item4 | Use motion-detection light outdoors, as they are not in use a lot of the time.             |
      | Item5 | Consider using timer-based lights during the week when you are at work.                    |
    And I click on "Sign Out"
    And I check I am on "Login" page
    And I enter then details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    And I check I am on "Dashboard" page
    And I click on "Usage"
    And I click on "Goals & Targets"
    Then I check I am on "Goals and Targets" page
    Then I see "5% Starter Goal" displayed
    And I click on "MenuIcon"
    And I click on "Remove Goal"
    Then I see "Are you sure you want to remove your savings goal?" displayed on popup and I click "OK"
    Then I see "Goal removed successfully." displayed
    And I click on "Lighting"
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                                                                                   |
      | Item1 | Turning off your lights when you                |
      | Item2 | Replace your lightbulbs with LED       |
      | Item3 | Make sure you are using the right lightbulb for the fixture |
      | Item4 | Use motion-detection light outdoors, as they are not in use a lot of the time.             |
      | Item5 | Consider using timer-based lights during the week when you are at work.                    |
   # to do....add top 10 (configurable) after UAP is automated.
    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password   |
      | CSS        | UserNameInput | PasswordInput | Michael  | Dbresults1 |
 @wip
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
    And I select "<DropDownValue2>" from "<DropDownField2>"

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password   | email                         | DropDownValue1     | DropDownField   | DropDownValue2 | DropDownField2  |
      | CSS        | UserNameInput | PasswordInput | Mary     | Dbresults1 | hemant.shori@dbresults.com.au | Account 0370837468 | AccountComboBox |     5133801785 | AccountComboBox |
@wip
  Scenario Outline: DCSSP-758: This is for defect 758, email address should not be duplicated with edit settings option. This should not accept the duplicate email address.
    Given I want to login to portal "<PortalName>"
    And I enter then details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    And I check I am on "Dashboard" page
    And I click on "Current_Bill"
    Then I see a pdf document with name "some" generated

    # this one is on hold because of a defect......bill is opening in the same window
    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password   | email                         |
      | CSS        | UserNameInput | PasswordInput | Michael  | Dbresults1 | hemant.shori@dbresults.com.au |
