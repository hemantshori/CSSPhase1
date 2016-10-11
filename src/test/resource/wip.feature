@wip
Feature: this is just a wip

  Scenario Outline: DCSSP-414: As a user I want to enter my user details so that I can complete the registration process
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
    And I check I am on "Registration" page
    And I click on "Sign In"
    And I check I am on "Login" page
    And I click on "Create Account"
    And I enter then details as new
      | Fields                    | Value             |
      | InputAccountNumber        | <Account Number1> |
      | InputBillName             | <BillName1>       |
      | InputIdentificationNumber | <SSN1>            |
    And I click on "checkbox" checkbox
    And I hit Enter
    And I click on "Submit"
    Then I see "Please wait while we retrieve your account..." displayed
    And I check I am on "Registration" page
    And I click on "Cancel"
    And I check I am on "Login" page
    And I click on "Create Account"
    And I enter then details as new
      | Fields                    | Value             |
      | InputAccountNumber        | <Account Number1> |
      | InputBillName             | <BillName1>       |
      | InputIdentificationNumber | <SSN1>            |
    And I click on "checkbox" checkbox
    And I click on "Submit"
    Then I see "Please wait while we retrieve your account..." displayed
    And I check I am on "Registration" page
    And I click on "PasswordInfoIcon"
    Then I see "Password must include a minimum of 8 characters, 1 upper case character, 1 numeric or special character." displayed
    And I click on "HintInfoIcon"
    Then I see "Setting up a hint will help you if you ever forget your password." displayed
    And "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName   |
      | Item1 | First Name |
      | Item2 | Last Name  |
    And I enter then details as new
      | Fields          | Value               |
      | Email           | <Email Address1>    |
      | Username        | <Choose UserName1>  |
      | NewPassword     | <Choose Password1>  |
      | ConfirmPassword | <Confirm Password1> |
      | Hint            | <Hint1>             |
    And I select "<DropDownValue1>" from "<DropDownField>"
    And I click on "Submit"
    Then I see "Email address already exists. Please try again." displayed
    And I enter then details as new
      | Fields          | Value               |
      | Email           | <Email Address2>    |
      | NewPassword     | <Choose Password2>  |
      | ConfirmPassword | <Confirm Password2> |
    And I hit Enter
    And I click on "Submit"
    Then I see "Invalid email address. Please try again." displayed
    And I enter then details as new
      | Fields          | Value               |
      | Email           | <Email Address3>    |
      | Username        | <Choose UserName3>  |
      | NewPassword     | <Choose Password3>  |
      | ConfirmPassword | <Confirm Password3> |
   
    And I click on "Submit"
    Then I see "Username already exists. Please try again." displayed
    And I enter then details as new
      | Fields          | Value               |
      | Username        | <Choose UserName4>  |
      | NewPassword     | <Choose Password4>  |
      | ConfirmPassword | <Confirm Password4> |
  
    And I click on "Submit"
    Then I see "Invalid password. Please try again." displayed
    And I enter then details as new
      | Fields          | Value               |
      | NewPassword     | <Choose Password5>  |
      | ConfirmPassword | <Confirm Password5> |
    
    And I click on "Submit"
    Then I see "Passwords do not match. Please try again." displayed
    And I click on "Cancel"
    Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "Cancel"
    And I click on "Cancel"
    Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "OK"
    

    Examples: 
      | PortalName | Account Number1 | BillName1  | SSN1        | Email Address1                   | Choose UserName1 | Choose Password1 | Confirm Password1 | Hint1        | DropDownField      | DropDownValue1 | Email Address2 | Choose Password2 | Confirm Password2 | Email Address3             | Choose UserName3 | Choose Password3 | Confirm Password3 | Choose UserName4 | Choose Password4 | Confirm Password4 | Choose Password5 | Confirm Password5 |
      | CSS        | 8970235184      | Pan, Peter | 888-99-8761 | ellen.truefeldt@Dbresults.com.au | PeterPan1        | Dbresults1       | Dbresults1        | life is life | LanguagePreference | English (GB)   | ellentruefeldt | Dbresults11      | Dbresults11       | ellen.truefeldt2@gmail.com | bob              | Dbresults11      | Dbresults11       | TestUser4        | dbr              | dbr               | Dbresults11      | hi                |
