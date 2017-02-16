Feature: wip

  #	@wip
  #	Scenario Outline:
  @review
  Scenario Outline: DTSP-461: Update the Capture User Details page
    Given I want to login to portal "<PortalName>"
    Then I click on "Create Account"
    Then I check I am on "Registration" page
    #Scenario 1: User accesses the 'Capture User Details' page
    Then I enter the details as
      | Fields                  | Value       |
      | InputABNNumber_Business | 12345678949 |
      | InputCRNNumber_Business | 12345678949 |
    Then I click on button "TermsandConditionsCheckBox2"
    Then I click on button "RegistrationSubmit"
    Then I check I am on "Complete Registration" page
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName           |
      | item2 | Username           |
      | item3 | First Name         |
      | item5 | Last Name          |
      | item5 | Email Address      |
      | item5 | Phone Number       |
      | item5 | Choose a Tax Agent |
      | item5 | Password           |
      | item5 | New Password       |
      | item5 | Confirm Password   |
      | item5 | Hint               |
    #Scenario 2: User tries to enter incorrect input type into a restricted fields (e.g. entering ABC into a Number field)
    Then I enter the details as
      | Fields      | Value |
      | PhoneNumber | TEST  |
    Then I check "Registration_PhoneNumber" is empty
    #Scenario 5: Details entered do not pass validation
    Then I check "Submit" is readonly
    Then I enter the details as
      | Fields          | Value                 |
      | FirstName       | TEST                  |
      | LastName        | TEST                  |
      | PhoneNumber     |                 33333 |
      | Email           | TEST                  |
      | Username        | TEST                  |
      | NewPassword     | adsfasdfaf            |
      | ConfirmPassword | asfsadfsadf           |
      | Hint            | testsetsetwetstsetset |
    Then I wait for "1000" millisecond
    Then I click on button "irstName"
    Then I click on button "Submit"
    Then I see text "Invalid email address format. Please try again." displayed
    #Then I see text "This is an invalid phone number" displayed
    Then I see text "Invalid password. Please try again" displayed
    Then I see text "Passwords do not match. Please try again." displayed
    #Scenario 7: User cancels with unsaved changes
    Then I click on button "Cancel"
    Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "Cancel"
    Then I click on button "Cancel"
    Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "OK"
    Then I click on "Create Account"
    Then I check I am on "Registration" page
    #Scenario 1: User accesses the 'Capture User Details' page
    Then I enter the details as
      | Fields                  | Value       |
      | InputABNNumber_Business | 12345678949 |
      | InputCRNNumber_Business | 12345678949 |
    Then I click on button "TermsandConditionsCheckBox2"
    Then I click on button "RegistrationSubmit"
    #Scenario 6: User cancels registration with no unsaved changes
    Then I click on button "Cancel"
    Then I click on "Create Account"
    Then I check I am on "Registration" page
    Then I enter the details as
      | Fields                  | Value       |
      | InputABNNumber_Business | 12345678949 |
      | InputCRNNumber_Business | 12345678949 |
    Then I click on button "TermsandConditionsCheckBox2"
    Then I click on button "RegistrationSubmit"
    Then I enter the details as
      | Fields          | Value                 |
      | FirstName       | TEST                  |
      | LastName        | TEST                  |
      | PhoneNumber     |             333333333 |
      | Email           | TEST@TEST             |
      | Username        | TEST                  |
      | NewPassword     | Dbresults1            |
      | ConfirmPassword | Dbresults1            |
      | Hint            | testsetsetwetstsetset |
    Then I check "Submit" is not readonly

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password   | CRN         | ABN         |
      | TSS        | UserNameInput | PasswordInput | jbradley | Dbresults1 | 12121212121 | 21212121212 |

  @onhold
  Scenario Outline: DTSP-305: As a Customer Portal Administrator (CPA), I want to be able to edit the taxpayer tips displayed on specific forms so that I can help the end user better understand the form fields
    # ONHOLD until Hemant can give me advice about the firefinder not detecting xpaths in the popups
    Given I access URL "https://test-ssc.dbresults.com.au/SS_Admin/Tooltips.aspx"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Given I access URL "https://test-ssc.dbresults.com.au/SS_Admin/Tooltips.aspx"
    #Scenario 1: CPA accesses the 'Edit Tool Tip' pop up window
    Then I click on button "EditTooltip"
    Then I wait for "1000" millisecond
    #Scenario 2: Number of remaining characters displays
    And I enter the details as
      | Fields              | Value |
      | Tooltip_Description | TEST  |
    Then I see text "Characters left:232" displayed
    #Scenario 3: CPA edits the tool tip Description
    Then I click on button "SaveTooltipChanges"
    #Scenario 5: CPA deactivates a tool tips
    Then I click on button "EditTooltip"
    Then I click on button "Tooltip_IsVisible"
    Then I click on button "SaveTooltipChanges"
    Then I click on button "EditTooltip"
    Then I see checkbox "Tooltip_IsVisible" as not selected
    #Scenario 4: CPA activates a tool tips
    Then I click on button "Tooltip_IsVisible"
    Then I click on button "SaveTooltipChanges"
    Then I click on button "EditTooltip"
    Then I see checkbox "Tooltip_IsVisible" as selected
    #Scenario 6: All mandatory fields has not been filled
    Then I click on button "EditTooltip"
    And I enter the details as
      | Fields              | Value |
      | Tooltip_Description |       |
    Then I check "SaveTooltipChanges" is readonly
    And I enter the details as
      | Fields              | Value             |
      | Tooltip_Description | asdfasdfasdfasdfa |
    #Scenario 7: CPA clicks 'CANCEL' with unsaved changes
    Then I click on button "Cancel"
    Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "Cancel"
    Then I click on button "Cancel"
    Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "OK"
    #Scenario 8: CPA clicks 'CANCEL' with saved changes
    Then I click on button "EditTooltip"
    Then I click on button "Cancel"
    Then I click on button "EditTooltip"

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password   | CRN         | ABN         |
      | TSS        | UserNameInput | PasswordInput | jbradley | Dbresults1 | 12121212121 | 21212121212 |

  

  @onhold
  Scenario Outline: DTSP-470
    #ON HOLD UNTIL THE DIV OVERLAPPING ISSUE WITH THE SAVE AND EXIT BUTTON CAN BE RESOLVED
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    #Scenario 2: User clicks on Discard when completing a Payroll Tax Form
    Then I click on "Payroll Tax Lodgement"
    Then I click on button "Discard"
    Then I check I am on "Payroll Lodgement Form" page
    Then I see checkbox "Answer_TypeAnnual" as not selected
    Then I click on button "NextSection"
    #Scenario 4: User has not filled out all the Mandatory fields within the section.
    Then I check "TaxPayerDetailsNext" is readonly
    #Scenario 3: User clicks on Save and Exit when completing a Payroll Tax Form (unsaved data pass's validation)
    Then I select "2014" from "YearOfReturn"
    Then I select "March" from "MonthOfReturn"
    Then I click on "Designated group employer for a group and lodging for itself"
    Then I click on "TaxPayerDetailsNext"
    Then I wait for "1000" millisecond
    Then I enter the details as
      | Fields           | Value |
      | SalariesAndWages |   100 |
    Then I click on button "ACTWagesPaidNext"
    Then I click on button "MonthlyReturnBack"
    Then I click on button "ACTWagesPaidBack"
    Then I click on button "TaxPayerDetailsBT"
    Then I scroll up
    Then I wait for "2000" millisecond
    Then I click on button "SaveAndExitBt"
    Then I check I am on "HomePage" page
    Then I click on "Payroll Tax Lodgement"
    Then I check I am on "Payroll Lodgement Form" page
    Then I click on button "NextSection"
    Then I click on button "TaxPayerDetailsNext"
    Then I check "SalariesAndWages" contains "100"
    Then I click on button "ACTWagesPaidNext"
    Then I click on button "MonthlyReturnNext"
    #Scenario 5: User has not filled out all the Mandatory fields within the section.
    Then I check "SaveAndExitBt" is readonly
    And I enter the details as
      | Fields              | Value     |
      | PersonFullName      | test      |
      | LegalEntityName     | Test2     |
      | EmployerDeclaration | test      |
      | PhoneNumber         | 042213324 |
      | EmailAddress        | abc       |
    Then I click on button "SaveAndExitBt"

    Examples: 
      | PortalName | UserName | Password   |
      | TSS        | jscott   | Dbresults1 |
      
   @wipwip
   Scenario Outline: DTSP-443: As a Tax Agent I want the ability to select the Tax Payer I am lodging a return for so that I can lodge the return on their behalf
   Given I access URL "https://test-ssc.dbresults.com.au/SS_Admin/Tooltips.aspx"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Payroll Tax Lodgement"
    #Scenario 1: New section on the Payroll Tax page for Tax Agent 
    Then I see text "Choose a Client" displayed
    
    #Scenario 2: New Field in the 'Client' section for Tax Agent to select Tax Payer 
	Then I select "" "BusinessEntityDropdown"
    
    Then 
   
	 Examples: 
      | PortalName | UserName | Password   |
      | TSS        | taxagent1   | Dbresults1 |
