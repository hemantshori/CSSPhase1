Feature: WIP

  @defect
  Scenario Outline: DTSP-54 : As a DB Portal Administrator I want to search for a message so that I can quickly access the message I want to view
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Given I want to login to portal "<PortalName2>"
    And I hit Enter
    Given I want to login to portal "MessageEdit"
    Then I see text "Feedback Message Text" displayed
    Then I see text "Feedback Msg Code" displayed
    Then I see text "Description" displayed
    And I enter the details as
      | Fields      | Value        |
      | SearchInput | AusWideWages |
    Then I click on "Search"
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                                                                                   |
      | item2 | InvalidAusWideWages                                                                        |
      | item3 | Your Aus wide group wages (including ACT) must be equal to or greater than your ACT wages. |
    And I enter the details as
      | Fields      | Value   |
      | SearchInput | Success |
    Then I click on "Search"
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                                   |
      | item2 | SuccessSaveForm                            |
      | item3 | Your changes have been successfully saved. |
    And I enter the details as
      | Fields      | Value   |
      | SearchInput | Invalid |
    Then I click on "Search"
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName             |
      | item2 | InvalidAusWideWages  |
      | item3 | InvalidGroupACTWages |
      | item4 | InvalidPhone         |
      | item5 | InvalidForm          |
      | item6 | InvalidABN           |

    Examples: 
      | PortalName | PortalName2 | UserNameField | PasswordField | UserName | Password   |
      | TSS        | TSSUAP      | UserNameInput | PasswordInput | mbrown   | Dbresults1 |
