Feature: Some feature

  
  
  
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
    Then I see "Please wait while we retrieve your account..." displayed
    And I check I am on "Account Already Activated" page
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                                                                |
      | item1 | Your account has already been activated. Please click the button below. |
    Then I click on "wtSubmitButton3"
    And I check I am on "Login" page

    Examples: 
      | PortalName | Account Number1 | BillName1          | SSN1        | Account Number2 | BillName2   | SSN2        |
      | CSS        | 9353248310      | Da Vinci, Leonardo | 777-78-7807 | 4415168071      | Test, Simon | 211-02-0091 |

  @wip
  Scenario Outline: DCSSP-520: Already registered or already activated and user tries again.
    Given I want to login to portal "<PortalName>"
    And I click on "Create Account"
    And I enter then details as new
      | Fields                    | Value             |
      | InputAccountNumber        | <Account Number1> |
      | InputBillName             | <BillName1>       |
      | InputIdentificationNumber | <SSN1>            |
    And I click on "checkbox" checkbox
    And I click on "Submit"
    Then I see "Please wait while we retrieve your account..." displayed
    And I check I am on "Account Already Activated" page
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                                                                |
      | item1 | Your account has already been activated. Please click the button below. |
    Then I click on "wtSubmitButton3"
    And I check I am on "Login" page
    And I click on "Create Account"
    And I enter then details as new
      | Fields                    | Value             |
      | InputAccountNumber        | <Account Number2> |
      | InputBillName             | <BillName2>       |
      | InputIdentificationNumber | <SSN2>            |
    And I click on "checkbox" checkbox
    And I click on "Submit"
    Then I see "Please wait while we retrieve your account..." displayed
    And I check I am on "Registration" page
    And I enter then details as new
      | Fields          | Value               |
      | Email           | <Email Address1>    |
      | Username        | <Choose UserName1>  |
      | NewPassword     | <Choose Password1>  |
      | ConfirmPassword | <Confirm Password1> |
      | Hint            | <Hint1>             |
    And I select "<DropDownValue1>" from "<DropDownField>"
    And I click on "Submit"
    And I check I am on "Registration Confirmation" page
    And I see text "Registration Confirmation" displayed

    Examples: 
      | PortalName | Account Number1 | BillName1          | SSN1        | Account Number2 | BillName2   | SSN2        | Email Address1     | Choose UserName1 | Choose Password1 | Confirm Password1 | Hint1        | DropDownField      | DropDownValue1 |
      | CSS        | 9353248310      | Da Vinci, Leonardo | 777-78-7807 | 4415168071      | Test, Simon | 998-11-1515 | timepass@gtail.com | Simon            | Dbresults1       | Dbresults1        | life is life | LanguagePreference | English (GB)   |

  Scenario Outline: Continue with 520, Scenario 2: User registers and their account is not activated
    Given I want to login to portal "<PortalName>"
    And I click on "Create Account"
    And I enter then details as new
      | Fields                    | Value             |
      | InputAccountNumber        | <Account Number2> |
      | InputBillName             | <BillName2>       |
      | InputIdentificationNumber | <SSN2>            |
    And I click on "checkbox" checkbox
    And I click on "Submit"
    And I check I am on "Account Already Registered" page
    Then I see text "Already Registered!" displayed

    Examples: 
      | PortalName | Account Number1 | BillName1          | SSN1        | Account Number2 | BillName2   | SSN2        | Email Address1     | Choose UserName1 | Choose Password1 | Confirm Password1 | Hint1        | DropDownField      | DropDownValue1 |
      | CSS        | 9353248310      | Da Vinci, Leonardo | 777-78-7807 | 4415168071      | Test, Simon | 998-11-1515 | timepass@gtail.com | Simon            | Dbresults1       | Dbresults1        | life is life | LanguagePreference | English (GB)   |
  
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