#Sample Feature Definition Template
@wip
Feature: WORK IN PROGRESS

 @BLOCKED
  Scenario Outline: DTSP-583: As an end user, I want to be able to edit my Contact Person details on my Tax Registration form
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    #	Scenario 1: User views update left hand Navigation menu items
    # Scenario 2: User views "Tax Registration Updates" sub menu items
    Then I click on "Tax Registration Update"
    Then I see text "Update Business Address" displayed
    Then I see text "Update Contact Details" displayed
    Then I see text "Update Refund Details" displayed
    # Scenario 3: User elects to view "Update Business Address" details form
    Then I click on "Update Contact Details"
    Then I check I am on "Update Contact Details" page
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName          |
      | item2 | Taxpayer Details |
    #| item3 | Update Business Address                                   |
    #| item5 | Business Address                                          |
    #| item5 | Update Contact Details                                           |
    #		Scenario 4: User elects to edit "Update Business Address" details form
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value         |
      | s2id_autogen1_search | <BusinessName> |
    Then I click on button "select2-results-1"
    Then I check "ContactPerson_FirstName" is not readonly
    Then I check "ContactPerson_LastName" is not readonly
    Then I check "ContactPerson_PhoneNumber" is not readonly
    Then I check "ContactPerson_Email" is not readonly
    Then I check "Address_AddressLine7" is not readonly
    Then I check "Address_City4" is not readonly
    Then I check "Address_PostCode4" is not readonly
    #Then I check "Address_AddressLine7" is not readonly
    Then I click on button "NextBT"
    #		Scenario 5: User views 'Tax Registration Update ' Summary page
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName      |
      | item3 | Declaration   |
      | item5 | Organisation  |
      | item5 | Contact Phone |
      | item5 | Email Address |
    #		Scenario 6: Submit 'Tax Registration Update ' data to PSRM without errors
    Then I click on button "CorrectInfoDeclared"
    Then I click on button "SubmitBT"
    Then I see text "Your Payroll Tax Update Contact Details Request has been successfully submitted. An email has been sent to you for your reference." displayed
    Then I see text "To download the details you have submitted, please click the button below." displayed
    #		Scenario 7: Submit 'Tax Registration Updates 'data to PSRM with errors
    Given I want to login to portal "<PortalName>"
    Then I click on "Tax Registration Update"
    Then I click on "Update Contact Details"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value         |
      | s2id_autogen1_search | <BusinessName> |
    Then I click on button "select2-results-1"
    Then I enter the details as
      | Fields            | Value |
      | Address_PostCode4 |    33 |
    Then I click on button "NextBT"
    Then I wait for "5000" millisecond
    Then I see text "Invalid Post Code, should have length 4 and should contain only digits." displayed
    #		Scenario 8: User clicks 'Back' on the 'Tax Registration Updates' Summary page
    Then I enter the details as
      | Fields            | Value |
      | Address_PostCode4 |  3333 |
    #		Scenario 9: User views Tax Registration Updates Confirmation page
    Then I click on button "NextBT"
    Then I check I am on "Update Contact Details Summary" page
    Then I click on button with value "Back"
    Then I check I am on "Update Contact Details" page
    #		Scenario 11: User selects "Cancel" and common browser message is displayed and the user is re directed to the Dashboard
    Then I enter the details as
      | Fields           | Value |
      | Address_PostCode |  4444 |
    Then I click on button with value "Cancel"
    Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "Cancel"
    Then I click on button with value "Cancel"
    Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "OK"

    Examples: 
      | PortalName | UserName | Password   | BusinessName |
      | TSS        | jbradley | Dbresults1 | DESIGNATE PTY. LTD. |


