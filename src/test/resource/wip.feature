
Feature: this is just a wip
  Scenario Outline: DCSSP-449: all (Edit phone and mailing address); DCSSP-553: covers update of info (excludes ccb check)
    Given I want to login to portal "<PortalName>"
    And I enter then details as
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
    And I enter then details as
      | Fields      | Value               |
      | MobilePhone | <Mobile Number1>    |
      | HomePhone   | <HomePhone Number1> |
      | WorkPhone   | <WorkPhone Number1> |
    And I hover on "hint" to verify "(999) 999-9999" is displayed
    And I click on "Submit"
    Then I see "Mobile format invalid. Expected format: (999) 999-9999" displayed
    And I enter then details as
      | Fields      | Value               |
      | MobilePhone | <Mobile Number2>    |
      | HomePhone   | <HomePhone Number2> |
    And I click on "Submit"
    Then I see "Home Phone format invalid. Expected format: (999) 999-9999" displayed
    And I enter then details as
      | Fields    | Value               |
      | HomePhone | <HomePhone Number1> |
      | WorkPhone | <WorkPhone Number2> |
    And I click on "Submit"
    Then I see "Work Phone format invalid. Expected format: (999) 999-9999" displayed
    And I enter then details as
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
      | CSS        | UserNameInput | PasswordInput | mary     | Dbresults1 | (999) 11-g     | (999) 989-1122    | (888) 777-6654    | (903) 888-7161 | (99) 77-60        | (88) 71           | Apt. 26, 30 Saint Francis Pl |               | San Francisco | CA    | 94107     | United States of America | CountriesComboBox | email@Dbresults1.com.au |
