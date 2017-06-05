Feature: Some feature

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

  #alt username: hemant.shori
  #alt password: USBcoffee1
  @tss
  Scenario Outline: DTSP-55 : As a DB Portal Administrator I want to edit a message's description so that I can customise the description for an organisation
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Given I want to login to portal "MessageEdit"
    Then I click on "Edit"
    Then "<Item>" is displayed as "<ItemName>"
      | Item   | ItemName          |
      | text1  | Feedback Msg Code |
      | text2  | Description       |
      | Button | Save              |
      | Button | Cancel            |
    Then I click on "Save"
    Then I click on "Edit"
    Then I click on "Cancel"
    Then I see "Are you sure?" displayed on popup and I click "OK"
    Then I click on "Edit"
    Then I select "<DropDownOption>" from "<DropDownName>"
    And I enter the details as
      | Fields           | Value |
      | Text_Description | TEST  |
    Then I click on "Save"
    Then I click on "Edit"
    Then I select "<DropDownOption>" from "<DropDownName>"
    And I enter the details as
      | Fields           | Value                                                                                      |
      | Text_Description | Your Aus wide group wages (including ACT) must be equal to or greater than your ACT wages. |
    Then I click on "Save"

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password  | DropDownName    | DropDownOption      |
      | TSS        | UserNameInput | PasswordInput | bob      | dbresults | FeedbackMsgText | InvalidAusWideWages |

  @tss
  Scenario Outline: DTSP-56 :As a DB Portal Administrator I want to add a new message so that required messages are displayed in the portal
    								DTSP-57 :As a DB Portal Administrator I want to delete a message so that I can remove messages no longer required

    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Given I want to login to portal "MessageEdit"
    Then I click on "AddNew"
    Then "<Item>" is displayed as "<ItemName>"
      | Item   | ItemName          |
      | text1  | Feedback Msg Code |
      | text2  | Description       |
      | Button | Save              |
      | Button | Cancel            |
    Then I see text "Description" displayed
    Then I click on "Cancel"
    Then I see "Are you sure?" displayed on popup and I click "OK"
    Then I click on "AddNew"
    Then I select "<DropDownOption>" from "<DropDownName>"
    And I enter the details as
      | Fields           | Value |
      | Text_Description | TEST  |
    Then I click on "Save"
    Then I click on "Delete"
    Then I see "<ErrorMessage>" displayed on popup and I click "OK"
    Then I click on "Delete"
    Then I see "<ErrorMessage>" displayed on popup and I click "Cancel"
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName             |
      | text1 | InvalidAusWideWages  |
      | text2 | InvalidGroupACTWages |
      | text2 | InvalidPhone         |
      | text2 | InvalidForm          |
      | text2 | SuccessSaveForm      |
      | text2 | InvalidABN           |

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password  | ErrorMessage                     | DropDownName    | DropDownOption      |
      | TSS        | UserNameInput | PasswordInput | bob      | dbresults | Are you sure you want to delete? | FeedbackMsgText | InvalidAusWideWages |

  @tss
  Scenario Outline: DTSP-233: As a DB Portal Administrator, I want to be able to search/add/edit/remove the tool tips displayed on forms so that I can help the end user better understand the form field/s
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Given I want to login to portal "PageTexts"
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName  |
      | item2 | Text Code |
      | item4 | Is Active |
    Then I see text "Description" displayed
    # check for search
    And I enter the details as
      | Fields      | Value    |
      | SearchInput | Password |
    Then I click on "Serch"
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                  |
      | item2 | PasswordValidation        |
      | item2 | ResetPasswordExpiredLine2 |
      | item2 | ResetPasswordInvalidLine1 |
      | item2 | ForgotPasswordEmailLine3  |
      | item2 | ResetPasswordLine2        |
      | item2 | ResetPasswordInvalidLine2 |
      | item2 | ResetPasswordExpiredLine1 |
      | item2 | ForgotPasswordEmailLine2  |
      | item2 | ResetPasswordLine1        |
      | item2 | ForgotPasswordEmailLine1  |
    And I enter the details as
      | Fields      | Value |
      | SearchInput |       |
    
    Then I click on "Serch"
    Then I click on "Edit"
    # check for editing
    
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName    |
      | item2 | Text Code   |
      | item3 | Description |
      | item4 | Is Visible  |
    Then I click on "Cancel"
    
    #edit a dummy description
    Then I click on "Edit"
    Then I click on "PageText_TextCode"
    Then I click on "RegistrationConfirmationLine1"
    And I enter the details as
      | Fields               | Value |
      | PageText_Description | TEST  |
    Then I click on "Save"
    
    #set the description back to normal
    Then I click on "Edit"
    Then I click on "PageText_TextCode"
    Then I click on "RegistrationConfirmationLine1"
    And I enter the details as
      | Fields               | Value                         |
      | PageText_Description | RegistrationConfirmationLine1 |
    Then I click on "Save"
    
    # add a new message
    Then I click on "AddNew"
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName    |
      | item2 | Text Code   |
      | item3 | Description |
      | item4 | Is Visible  |
    Then I click on "Cancel"
    Then I click on "AddNew"
    Then I click on "PageText_TextCode"
    Then I click on "RegistrationConfirmationLine1"
    And I enter the details as
      | Fields               | Value                         |
      | PageText_Description | RegistrationConfirmationLine1 |
    Then I click on "Save"
    
    # now delete it
    Then I click on "Delete"
    Given I want to login to portal "PageTexts"

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password  |
      | TSS        | UserNameInput | PasswordInput | bob      | dbresults |
      

  @tss
  Scenario Outline: DTSP-240 : As an end user, I want to be able to download the Tax Lodgement or Registration forms in PDF format, so that I can keep a record of my lodgements
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    And I check I am on "HomePage" page
    And I click on "Payroll Tax"
    And I click on "Cancel"
    Then I click on "Payroll Tax"
    And I select "<DropDownValue1>" from "<DropDownField>"
    Then I click on "Answer_TypeAnnual"
    #And I select "<DropDownValue2>" from "<DropDownField2>"
    And I click on "Next"
    And I click on "ACTWagesPaidNext"
    And I click on "MonthlyReturnNext"
    Then I wait for "3500" millisecond
    And I enter the details as
      | Fields          | Value          |
      | PersonFullName  | TEST           |
      | LegalEntityName | TEST           |
      | PhoneNumber     | 6143 585 74 90 |
      | EmailAddress    | TEST@TEST      |
    And I click on "DeclarationConfirm"
    And I click on "ConfirmForSubmission"
    And I click on "Submit"
    Then I check I am on "Lodgement Summary" page
    Then I click on "SummarySubmit"
    Then I check I am on "Submission Confirmation" page
    And I click on "Download"

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password  | ButtonName1 | DropDownValue1 | DropDownField | DropDownValue2 | DropDownField2 | Message                                    |
      | TSS        | UserNameInput | PasswordInput | bob      | dbresults | TypeMonthly |           2012 | YearOfReturn  | September      | MonthOfReturn  | Your changes have been successfully saved. |			

  @tss
  Scenario Outline: DTSP-358: As an end user, I want to be able to submit my Annual Payroll Tax Return Form
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    And I check I am on "HomePage" page
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName   |
      | item9 | Lodgements |
    And I click on "Payroll Tax"
    And I check I am on "Payroll Lodgement Form" page
    Then I click on "Cancel"
    Then I click on "Payroll Tax"
    And I check I am on "Payroll Lodgement Form" page
    Then I click on "Answer_TypeAnnual"
    Then I click on "YearOfReturn"
    Then I click on "2012"
    Then I click on "TaxPayerDetailsNext"
    Then I click on "ACTWagesPaidNext"
    Then I click on "MonthlyReturnNext"
   	And I wait for "3000" millisecond
    And I enter the details as
      | Fields          | Value        |
      | PersonFullName  | test         |
      | LegalEntityName | Test2        |
      | PhoneNumber     | 610422184033 |
      | EmailAddress    | abc@abc.com  |
    Then I click on "DeclarationConfirm"
    Then I click on "ConfirmBack"
    Then I click on "DeclarationBack"
    Then I click on "MonthlyReturnNext"
    Then I click on "DeclarationConfirm"
    Then I check "Submit" is readonly
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                                            |
      | item9 | Client Number                                       |
      | item9 | Reporting Period                                    |
      | item9 | Claiming Tax-free Threshold                         |
      | item9 | I have checked the form and confirmed these details |
    Then I click on "ConfirmForSubmission"
    Then I click on "Submit"
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                                                              |
      | item2 | Tax Payer Details                                                     |
      | item2 | Client Reference Number                                               |
      | item2 | ABN                                                                   |
      | item2 | Payroll Tax Group Number                                              |
      | item2 | ACT Wages Paid or Taxable                                             |
      | item9 | Full Name                                                             |
      | item9 | Legal Entity Name                                                     |
    Then I check I am on "Lodgement Summary" page
    Then I click on "SummarySubmit"
    Then I check I am on "Submission Confirmation" page
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                |
      | item9 | wtMainContent 					|
      
       Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password  | 
      | TSS        | UserNameInput | PasswordInput | bob      | dbresults |
