Feature: Some feature

  
  
  
  
 Scenario Outline: DCSSP-433, DCSSP-550 (reset password is manual), DCSSP-162 Edit Settings>> reset pwd
    Given I want to login to portal "<PortalName>"
    And I enter then details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    And I click on "Settings"
    And I check I am on "Setting" page
    And I click on "EditSettings"
    And I check I am on "EditSettings" page
    And I enter then details as new
      | Fields                  | Value                  |
      | CurrentPasswordInput    | <Current Password>     |
      | NewPasswordInput        | <New Password>         |
      | NewPasswordConfirmInput | <Confirm New Password> |
    And I click on "Submit"
    Then I see "<Message>" displayed

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password   | Current Password | New Password | Confirm New Password | Message                                                           |
      | CSS        | UserNameInput | PasswordInput | mary     | Dbresults1 | Dbresults1       | Dbresults1   |                      | New Password and Confirm Password do not match. Please try again. |
      | CSS        | UserNameInput | PasswordInput | mary     | Dbresults1 | Dbresults1       |              | Dbresults1           | New Password and Confirm Password do not match. Please try again. |
      | CSS        | UserNameInput | PasswordInput | mary     | Dbresults1 |                  | Dbresults1   | Dbresults1           | Please input your current password to change your new password.   |
      | CSS        | UserNameInput | PasswordInput | mary     | Dbresults1 | Dbresults1       | DBR          | DBR                  | New Password is invalid. Please try again.                        |
 
 
 
   @wip
  Scenario Outline: User changes password with password strength. DCSSP-790 Description: Change password rule
    Given I want to login to portal "<PortalName>"
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName |
      | item1 | Logo     |
    And I enter then details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    And I click on "Settings"
    And I check I am on "Settings" page
    And I click on "EditSettings"
    And I check I am on "EditSettings" page
    And I enter then details as
      | Fields                 | Value            |
      | CurrentPasswordInput   | <Password>       |
      | NewPasswordInput       | <NewPassword>    |
      | NewPasswordConfirm     | <NewPassConfirm> |
      | UserDataExtention_Hint | <UDETable>       |
    And I click on "Submit"
    Then I see "<Message>" displayed

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password   | NewPassword | NewPassConfirm | UDETable         | Message                                    |
      | CSS        | UserNameInput | PasswordInput | Michael  | Dbresults1 | abc         |                |                  | Your password is too short                 |
      | CSS        | UserNameInput | PasswordInput | Michael  | Dbresults1 |      123456 |                |                  | Your password contains sequences           |
      | CSS        | UserNameInput | PasswordInput | Michael  | Dbresults1 | mattlara    |                |                  | Medium                                     |
      | CSS        | UserNameInput | PasswordInput | Michael  | Dbresults1 | CSSPhase1   |                |                  | Strong                                     |
      | CSS        | UserNameInput | PasswordInput | Michael  | Dbresults1 | CSSPhase@1  |                |                  | Very Strong                                |
      | CSS        | UserNameInput | PasswordInput | Michael  | Dbresults1 | DBResults1  | DBResults1     | ApplesandOranges | Your changes have been saved successfully. |
      | CSS        | UserNameInput | PasswordInput | Michael  | DBResults1 | Dbresults1  | Dbresults1     | ApplesandOranges | Your changes have been saved successfully. |

  Scenario Outline: DCSSP-117,167,754 : Goals and Targets setting,verification and removal.
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

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password   |
      | CSS        | UserNameInput | PasswordInput | Michael  | Dbresults1 |

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
