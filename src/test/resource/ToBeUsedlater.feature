@wip
  Scenario Outline: DCSSP-548: all; DCSSP-550: Scenario 4 >> cancelling change of password and successful change of password to reaccess account
    Given I want to login to portal "<PortalName>"
    And "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName         |
      | Item1 | Change Password  |
      | Item2 | New Password     |
      | Item3 | Confirm Password |
    And I click on "InfoIcon"
    Then I see "Password must include a minimum of 8 characters, 1 upper case character, 1 numeric or special character." displayed
    And I click on "<ButtonName1>"
    And I check I am on "Login" page
    And I want to login to portal "<PortalName>"
    And I enter then details as new
      | Fields               | Value               |
      | NewPasswordInput     | <New Password1>     |
      | ConfirmPasswordInput | <Confirm Password1> |
    And I click on "<ButtonName1>"
    Then I see "<Message1>" displayed on popup and I click "<ButtonName2>"
    And I click on "<ButtonName1>"
    Then I see "<Message1>" displayed on popup and I click "<ButtonName3>"
     And I check I am on "Login" page
    And I want to login to portal "<PortalName>"
    And I enter then details as new
      | Fields                  | Value               |
      | NewPasswordInput        | <New Password2>     |
      | ConfirmPasswordInput | <Confirm Password2> |
    And I click on "<ButtonName4>"
      And I check I am on "Login" page
    Then I see "<Message2>" displayed 


    Examples: 
      | PortalName           | ButtonName1 | New Password1 | Confirm Password1 | Message1                                       | ButtonName2 | ButtonName3 | New Password2 | Confirm Password2 | Message2                       | ButtonName4   |
      | Change Password Page | Cancel      | party         | party             | Are you sure you want to discard changes made? | Cancel      | OK          | DBResults1    | DBResults1        | Password successfully changed. | PasswordSaveButton |





  @wip
  Scenario Outline: User views the menu items, Test 1, DCSSP-245 Description: User views the menu items Epic: Common Components
    Given I want to login to portal "<PortalName>"
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName |
      | item1 | Logo     |
    And I enter then details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    And I check I am on "Dashboard" page
    And I read all "CarouselItem" from the corousel

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password  | SA Type     | ButtonName | ServiceName              | AccountNumber          | Address                                            |
      | CSS        | UserNameInput | PasswordInput | Mary     | dbresults | Electricity | Accounts   | Residential: Electricity | Account No. 9155590888 | Apt. 25, 110 Panorama Dr, San Francisco, CA, 94131 |
