#Sample Feature Definition Template
@wip
Feature: WORK IN PROGRESS



      
 	@current
  Scenario Outline: DTSP-595: As an end user, I want to be able to add/edit/remove ACT group members to my Payroll Tax Group
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Group Management"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value         |
      | s2id_autogen1_search | QUICK SINGLE PTY LTD |
    Then I click on button "select2-results-1"
    Then I wait for "5000" millisecond
    #Scenario 1: Display "Add ACT Group Member" button
    #Scenario 2: Display "Add ACT Group Member" button
    Then I click on button with value "Create Group"
    Then I wait for "5000" millisecond
    Then I switch to frame "1"
    Then I click on button "GroupRoleComboBox"
    Then I click on "Group Member"
    Then I click on button "GroupReasonComboBox" 
    Then I click on "Common Control" 
    Then I click on button with value "SAVE"
    Then I check "AddACTPopUp" exists
    Then I click on button "AddACTPopUp"
    Then I switch to frame "1"
    #Scenario 3: Pop up
    Then I see text "ABN" displayed
    Then I see text "Group Role" displayed
    Then I see text "Grouping Reason" displayed
    Then I see text "Other Grouping Reason" displayed
    Then I click on button "GroupRoleComboBox"
    Then I click on "Group Member"
    Then I select "Common Control" from "GroupReasonComboBox"
    And I enter the details as
      | Fields        | Value       |
      | GrpMember_ABN | 78602736943 |
    #Scenario 4: Save button activated
    Then I check "PopUpSaveBT" is not readonly
    #Scenario 5: Successfully validated ABN in PSRM
    Then I click on button "PopUpSaveBT"
    #Scenario 6: Unsuccessfully validated ABN in PSRM
    Then I wait for "4000" millisecond
    Then I click on button "AddACTPopUp"
    Then I switch to frame "1"
    Then I click on button "GroupRoleComboBox"
    Then I click on "Group Member"
    Then I select "Common Control" from "GroupReasonComboBox"
    And I enter the details as
      | Fields        | Value       |
      | GrpMember_ABN | 22222222222 |
    Then I click on button "PopUpSaveBT"
    Then I see text "Please enter an ABN that is registered for Payroll Tax" displayed
    #Scenario 14: Adding a Group Member validations
    Then I wait for "4000" millisecond
    Then I click on button "AddACTPopUp"
    Then I switch to frame "1"
    Then I click on button "GroupRoleComboBox"
    Then I click on "Group Member"
    Then I select "Common Control" from "GroupReasonComboBox"
    And I enter the details as
      | Fields        | Value       |
      | GrpMember_ABN | 85085664197 |
    Then I click on button "PopUpSaveBT"
    Then I wait for "4000" millisecond
    Then I see text "Please enter an ABN that is not already part of a Payroll Tax Group." displayed
    #Scenario 15: Group Member (lodging for itself)
    #Then I click on button "l03_wtPopupLink"
    #Then I switch to frame "1"
    #Then I click on button "GroupRoleComboBox"
    #Then I click on "Group Member (lodging itself)"
    #Then I select "Common Control" from "GroupReasonComboBox"
    #Then I click on button "PopUpSaveBT"
    #Then I click on button "ctl03_wt83"
    #Then I see text "The nominated DGE cannot have a Group Role of 'Group Member (lodging itself)" displayed
    #Scenario 7: Remove ACT Group Member
    Then I click on object with xpath "(//table[contains(@id, 'TableACTGroupMembers')]//tr//td//a)[2]"
    Then I see "Do you really want to remove the organisation from your Payroll Tax Group?" displayed on popup and I click "OK"
    Then I see text "FORMULA CHARGER PTY. LTD." not displayed
    Then I click on object with xpath "(//table[contains(@id, 'TableACTGroupMembers')]//tr//td//a)[2]"
    Then I see "Do you really want to remove the organisation from your Payroll Tax Group?" displayed on popup and I click "OK"
    #Scenario 16: DGE
    #Then I click on button "l03_wtPopupLink"
    #
    #Then I switch to frame "1"
    #Then I click on button "GroupRoleComboBox"
    #Then I click on "Group Member (lodging itself)"
    #Then I select "Common Control" from "GroupReasonComboBox"
    #Then I click on button "PopUpSaveBT"
    #Then I click on button "ctl03_wt83"
    #Then I see text "The nominated DGE cannot have a Group Role of 'Group Member (lodging itself)" displayed
    #
    #
    #Scenario 12: User attempts to remove themselves
    Then I select "2018" from "YearCombo"
    Then I select "Jan" from "MonthCombo"
    Then I click on button with value "Next"
    #popup has extraneous spacing
    #Then I see "You have elected to remove yourself from this Payroll Tax Group. Do you wish to proceed?" displayed on popup and I click "Cancel"

    #Scenarios 5, 6, 9, 10, 11 are best done manually
    Examples: 
      | PortalName | UserName | Password   |
      | TSSAdmin        | jbradley | Dbresults1 |
 

	 @review
  Scenario Outline: DTSP-676:  As a Payroll Tax Group Member, I want to be able to add/edit/remove 'Non-ACT Group Members' to my group
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Group Management"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value        |
      | s2id_autogen1_search | QUICK SINGLE |
    Then I click on button "select2-results-1"
    Then I wait for "2000" millisecond
    Then I click on button with value "Create Group"
    Then I wait for "2000" millisecond
    Then I switch to frame "1"
    Then I select "Group Member" from "GroupRoleComboBox"
    Then I select "Common Control" from "GroupReasonComboBox"
    Then I click on button with value "SAVE"
    Then I check "AddNonActPopUp" exists
    #Scenario 2: Display "Add Non-ACT Group Member" button
    Then I click on "Group Management"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value     |
      | s2id_autogen1_search | DESIGNATE |
    Then I click on button "select2-results-1"
    Then I click on button with value "Update Group"
    Then I check "AddNonActPopUp" exists
    #Scenario 3: Pop up
    Then I click on button "AddNonActPopUp"
    Then I wait for "2000" millisecond
    Then I switch to frame "1"
    Then I check "OverseasRadioButtonYES" exists
    Then I check "OverseasRadioButtonNO" exists
    Then I check "RegisteredName" exists
    Then I check "OverseasRegNumber" exists
    Then I check "CountryComboBox" exists
    Then I check "GrpMember_ABN" exists
    Then I check "GrpMember_State" exists
    #Scenario 4: Save button activated
    Then I click on button "OverseasRadioButtonYES"
    Then I enter the details as
      | Fields            | Value        |
      | RegisteredName    | TEST NON ACT |
      | OverseasRegNumber |    234234234 |
    Then I select "Lebanon" from "CountryComboBox"
    Then I check "PopUpSaveBT" is not readonly
    Then I click on button "PopUpSaveBT"

    #Scenarios 5, 6 and 7 are best tested manually
    Examples: 
      | PortalName | UserName | Password   |
      | TSSAdmin        | jbradley | Dbresults1 |
      
 
   Scenario Outline: <return period> / <employer status> / Group Number <group number> under wages section
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Lodgements"
    Then I click on "Payroll Tax"
    #Designated group employer for a group and lodging for itself
    Then I click on button with value "Discard"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value     |
      | s2id_autogen1_search | DESIGNATE |
    Then I click on button "select2-results-1"
    Then I click on button "LodgePayrollAnswer_TypeMonthly"
    Then I select "May 2017" from "MonthlyObligationSelect"
    Then I click on button "NextSection"
    Then I wait for "5000" millisecond
    Then I check object with xpath "//*[contains(@id, 'Titlewages')]//div[3]" contents match regex "\(\d{2} \w+ \d{4} - \d{2} \w+ \d{4} / ([\w|\s|\W]+ / [\w|\s]+:\s\d+)\)"
    Then I click on button with value "Discard"
    Given I want to login to portal "<PortalName>"
    Then I click on "Lodgements"
    Then I click on "Payroll Tax"
    Then I click on button with value "Discard"
    Then I click on button "select2-chosen-1"
    #Member of a group lodging for itself
    Then I enter the details as
      | Fields               | Value  |
      | s2id_autogen1_search | MEMBER |
    Then I click on button "select2-results-1"
    Then I click on button "LodgePayrollAnswer_TypeMonthly"
    Then I select "May 2017" from "MonthlyObligationSelect"
    Then I click on button "NextSection"
    Then I wait for "5000" millisecond
    Then I check object with xpath "//*[contains(@id, 'Titlewages')]//div[3]" contents match regex "\(\d{2} \w+ \d{4} - \d{2} \w+ \d{4} / ([\w|\s|\W]+ / [\w|\s]+:\s\d+)\)"
    Then I click on button with value "Discard"
    Given I want to login to portal "<PortalName>"
    Then I click on "Lodgements"
    Then I click on "Payroll Tax"
    Then I click on button with value "Discard"
    Then I click on button "select2-chosen-1"
    #Independent employer (non-group) lodging for itself
    Then I enter the details as
      | Fields               | Value  |
      | s2id_autogen1_search | GOOD FOR |
    Then I click on button "select2-results-1"
    Then I click on button "LodgePayrollAnswer_TypeMonthly"
    Then I select "May 2017" from "MonthlyObligationSelect"
    Then I click on button "NextSection"
    Then I wait for "5000" millisecond
    Then I check object with xpath "//*[contains(@id, 'Titlewages')]//div[3]" contents match regex "\(\d{2} \w+ \d{4} - \d{2} \w+ \d{4} / ([\w|\s|\W]+ / [\w|\s]+:\s\d+)|([\w|\s|\W]+)\)"
    Then I click on button with value "Discard"
    Given I want to login to portal "<PortalName>"
    Then I click on "Lodgements"
    Then I click on "Payroll Tax"
    Then I click on button with value "Discard"
    Then I click on button "select2-chosen-1"
    #Independent employer (non-group) lodging for itself
    Then I enter the details as
      | Fields               | Value |
      | s2id_autogen1_search | JOINT |
    Then I click on button "select2-results-1"
    Then I click on button "LodgePayrollAnswer_TypeAnnual"
    Then I select "01 Jul 2014 - 30 Jun 2015" from "AnnualObligationSelect"
    Then I click on button "NextSection"
    Then I wait for "5000" millisecond
    Then I check object with xpath "//*[contains(@id, 'Titlewages')]//div[3]" contents match regex "\(\d{2} \w+ \d{4} - \d{2} \w+ \d{4} / ([\w|\s|\W]+ / [\w|\s]+:\s\d+)\)"

    Examples: 
      | PortalName | CompanyName          | ABN         | UserName | Password   |
      | TSSAdmin        | Dynamic Fire Pty Ltd | 80134834334 | jbradley | Dbresults1 |
      
 @review
  Scenario Outline: DTSP-747: As an end user I want to be able to update refund details on Tax Registration updates for different tax types
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    #Scenario 1: Accurate labels and text
    Then I click on "Tax Registration Update"
    Then I click on "Update Refund Details"
    Then I check "LodgePayrollAnswer_OrganizationalName" is readonly
    Then I check "LodgePayrollAnswer_ABN" is readonly
    Then I check "LodgePayrollAnswer_CRN" is readonly
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value          |
      | s2id_autogen1_search | <Organisation> |
    Then I click on button "select2-results-1"
    Then I click on button "Refunds_YES"
    Then I check "TaxTypeSelection" is readonly
    Then I check "Refunds_YES" is readonly
    Then I check "Refunds_NO" is readonly
    Then I check "RegistrationAnswer_BSB" is readonly
    Then I check "RegistrationAnswer_BankAccountNumber" is readonly
    Then I check "RegistrationAnswer_BankAccountName" is readonly
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                        |
      | item2 | Tax Type                        |
      | item2 | Set up bank account for refunds |
      | item2 | BSB                             |
      | item2 | Bank Account Number             |
      | item2 | Bank Account Name               |
    #| item2 | Country |
    #| item2 | Address |
    #| item2 | Contact Person |
    #| item2 | Postal Address |
    #	Then I click on button "select2-chosen-1"
    #	Then I enter the details as
    #| Fields               | Value |
    #| s2id_autogen1_search | <Organisation> |
    #Then I click on button "select2-results-1"
    #Then I wait for "4000" millisecond
    #Scenario 2: Drop down
    Then I click on button "TaxTypeSelection"
    Then I see text "Utilities (Network Facilities)" not displayed
    Then I see text "Ambulance Levy" not displayed
    Then I see text "Energy Industry Levy" not displayed
    Then I see text "Income Tax Equivalent" not displayed
    Then I see text "Payroll Tax" not displayed
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value |
      | s2id_autogen1_search | ABCAD |
    Then I click on button "select2-results-1"
    Then I check "TaxTypeSelection" exists
    Then I click on button "Refunds_NO"
    Then I click on button with value "Next"
    Then I wait for "6000" millisecond
    Then I check I am on "Update Refund Details Summary" page
    Then I click on button "CorrectInfoDeclared"
    Then I click on button with value "Submit"
    Then I wait for "4000" millisecond
    Then I check I am on "Update Complete" page

    Examples: 
      | PortalName | UserName | Password   | FirstName | LastName | Position   | Organisation        | ContactPhone | EmailAddress         |
      | TSSAdmin        | jbradley | Dbresults1 | J         | Bradley  | Consultant | DESIGNATE PTY. LTD. | 04 5678 9767 | jbradley@hotmail.com |
      

 @done
  Scenario Outline: DTSP-461: Update the Capture User Details page
    Given I want to login to portal "<PortalName>"
    Then I click on "Create Account"
    Then I check I am on "Registration" page
    #Scenario 1: User accesses the 'Capture User Details' page
    Then I click on "Register as a Business"
    Then I enter the details as
      | Fields         | Value |
      | InputABNNumber | <ABN> |
      | InputCRNNumber | <CRN> |
    Then I click on button "TermsandConditionsCheckBox2"
    Then I click on button "RegistrationSubmit"
    Then I check I am on "Complete Registration" page
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName         |
      | item2 | Choose Username  |
      | item3 | First Name       |
      | item5 | Last Name        |
      | item5 | Email Address    |
      | item5 | Phone Number     |
      | item5 | Choose Password  |
      | item5 | Confirm Password |
      | item5 | Hint             |
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
    Then I wait for "5000" millisecond
    Then I click on button "irstName"
    Then I click on button "Submit"
    Then I see text "Incorrect Email Format." displayed
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
    Then I click on "Register as a Business"
    Then I enter the details as
      | Fields         | Value |
      | InputABNNumber | <ABN> |
      | InputCRNNumber | <CRN> |
    Then I click on button "TermsandConditionsCheckBox2"
    Then I click on button "RegistrationSubmit"
    #Scenario 6: User cancels registration with no unsaved changes
    Then I click on button "Cancel"
    Then I click on "Create Account"
    Then I check I am on "Registration" page
    Then I click on "Register as a Business"
    Then I enter the details as
      | Fields         | Value |
      | InputABNNumber | <ABN> |
      | InputCRNNumber | <CRN> |
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

  @done
  Scenario Outline: Tax Agent Account Activation Error + Disappearing Position field after Registration bug (Tax Agent) + No ABN Information check
    #Onhold due to laggy Registration part 2 page
    Given I want to login to portal "<PortalName>"
    Then I click on "Create Account"
    Then I click on button "RegistrationAsTaxAgent"
    Then I wait for "5000" millisecond
    Then I enter the details as
      | Fields                   | Value         |
      | TaxAgentBusinessName     | <CompanyName> |
      | InputTaxAgentABN         | <ABN>         |
      | BusinessAddress_Postcode |          3333 |
      | BusinessAddress_Address  | TEST          |
      | BusinessAddress_Suburb   | TEST          |
    Then I click on button "TermsandConditionsCheckBox"
    Then I select "Victoria" from "BusinessAddress_StateId"
    Then I click on button "RegistrationSubmit"
    Then I wait for "5000" millisecond
    Then I enter the details as
      | Fields                       | Value                           |
      | Registration_FirstName       | TEST                            |
      | Registration_LastName        | TEST                            |
      | Registration_Position        | TEST                            |
      | Registration_PhoneNumber     |                      1234567890 |
      | Registration_Email           | <NewEmail>                      |
      | Registration_Username        | <NewUserName>                   |
      | Registration_NewPassword     | <Password>                      |
      | Registration_ConfirmPassword | <Password>                      |
      | Registration_Hint            | Done as a result of automation! |
    Then I click on button "SubmitAjaxRfrsh"
    Then I wait for "5000" millisecond
    Then I see text "Registration Confirmation" displayed
    Then I want to login to portal "RegistrationLinkTable"
    Then I click on object with xpath "//*[contains(text(), 'automation_taxagent10')]/../following-sibling::td/a"
    And I enter the details as
      | Fields        | Value         |
      | UserNameInput | <NewUserName> |
      | PasswordInput | <Password>    |
    And I hit Enter
    Then I check I am on "Home" page
    Then I see text "Please note, as there are currently no taxpayer accounts associated with your login, there is no information to display." displayed
    Then I click on "User Profile"
    Then I click on button "EditBT"
    Then I check "Input_LastName2" is not empty

    #NewUserName and NewEmail must be changed with every registration
    Examples: 
      | PortalName | CompanyName                                 | ABN         | NewUserName           | NewEmail                  | Password   |
      | TSSAdmin        | The trustee for MD & KJ Fragar Family Trust | 70167081615 | automation_taxagent10 | TaxAgent10@automation.com | Dbresults1 |

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password   | ABN         | CRN    |
      | TSSAdmin        | UserNameInput | PasswordInput | jbradley | Dbresults1 | 12054547368 | 400043 |

#@wip
  #Scenario Outline: DTSP-537
    #Given I want to login to portal "<PortalName>"
    #And I enter the details as
      #| Fields        | Value      |
      #| UserNameInput | jbradley   |
      #| PasswordInput | <Password> |
    #And I hit Enter
    #Scenario 1: Annual Rec [Single Emp Status]
    #Then I click on "Lodgements"
    #Then I click on "Payroll Tax"
    #Then I click on button "GeneralDiscardBt"
    #Then I click on button "select2-chosen-1"
    #Then I enter the details as
      #| Fields               | Value |
      #| s2id_autogen1_search | QUICK |
    #Then I click on button "select2-results-1"
    #Then I wait for "5000" millisecond
    #Then I click on "Annual Reconciliation"
    #Then I select "2016" from "AnnualObligationSelect"
    #Then I click on button with value "Save and Next"
    #Then I wait for "5000" millisecond
    #Then I check object with xpath "//*[contains(@id, 'Titlewages')]//div[3]" contents match regex "\(\d{2} \w+ \d{4} - \d{2} \w+ \d{4} / [\w|\s|\W|\(|\)]+\)"
    #Then I click on "Payroll Tax"
    #Then I click on button with value "Discard"
    #Scenario 2: Annual Rec [Multi Emp Status]
    #Then I click on button "select2-chosen-1"
    #Then I enter the details as
      #| Fields               | Value |
      #| s2id_autogen1_search | QUICK |
    #Then I click on button "select2-results-1"
    #Then I wait for "5000" millisecond
    #Then I click on "Annual Reconciliation"
    #Then I select "2016" from "AnnualObligationSelect"
    #Then I click on button "NextSection"
    #Then I wait for "5000" millisecond
    #Then I see text "Annual Reconciliation Return" displayed
    #Scenario 5: Days paid wage group Australia-wide" field removed from Payroll Tax
    #Then I see text "Days paid wage group Australia-wide" not displayed
    #Then I wait for "5000" millisecond
    #Then I check object with xpath "//*[contains(@id, 'Titlewages')]//div[3]" contents match regex "\(\d{2} \w+ \d{4} - \d{2} \w+ \d{4} / [\w|\s|\W|\(|\)]+\)"
    #Scenario 3: Monthly Return
    #Then I click on "Payroll Tax"
    #Then I click on button with value "Discard"
    #Then I click on button "select2-chosen-1"
    #Then I enter the details as
      #| Fields               | Value     |
      #| s2id_autogen1_search | DESIGNATE |
    #Then I click on button "select2-results-1"
    #Then I wait for "5000" millisecond
    #Then I select "May 2017" from "MonthlyObligationSelect"
    #Then I click on button "NextSection"
    #Then I wait for "5000" millisecond
    #Scenario 4: Exempt wages question updated
    #Then I see text "ACT wages not included on this return" displayed
    #Scenario 6: (Designated group employer for a group and lodging for itself’) Rename the field ‘Days where you paid or were liable to pay taxable or interstate wages’ to ‘Days where 1 group member paid or was liable to pay taxable or interstate wages’
    #Then I click on "Payroll Tax"
    #Then I click on button with value "Discard"
    #Then I click on button "select2-chosen-1"
    #Then I enter the details as
      #| Fields               | Value     |
      #| s2id_autogen1_search | DESIGNATE |
    #Then I click on button "select2-results-1"
    #Then I wait for "5000" millisecond
    #Then I click on "Annual Reconciliation"
    #Then I select "2016" from "AnnualObligationSelect"
    #Then I click on button "NextSection"
    #Then I wait for "5000" millisecond
    #Then I click on button "ClaimingACTProportion_Yes"
    #Then I enter the details as
      #| Fields                                         | Value   |
      #| SalariesAndWages                               | 1000000 |
      #| BonusesAndCommissions                          |     100 |
      #| LodgePayrollAnswer_Commissions                 |     100 |
      #| LodgePayrollAnswer_Allowances                  |     100 |
      #| LodgePayrollAnswer_DirectorsFees               |     100 |
      #| LodgePayrollAnswer_EligibleTerminationPayments |     100 |
      #| LodgePayrollAnswer_ValueOfBenefits             |     100 |
      #| LodgePayrollAnswer_ShareValue                  |     100 |
      #| LodgePayrollAnswer_ServiceContracts            |     100 |
      #| LodgePayrollAnswer_Superannuation              |     100 |
      #| LodgePayrollAnswer_OtherTaxablePayment         |     100 |
      #| LodgePayrollAnswer_ExemptWages                 |     100 |
    #Then I see text "Days where 1 group member paid or was liable to pay taxable or interstate wages" displayed
    #Scenario 7:  (Designated group employer and lodging a joint return for itself and other ACT group members) Rename the field ‘Days where you paid or were liable to pay taxable or interstate wages’ to ‘Days where 1 group member paid or was liable to pay taxable or interstate wages’
    #Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "OK"
    #Then I click on "Home"
    #Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "OK"
    #Then I click on "Lodgements"
    #Then I click on "Payroll Tax"
    #Then I click on button with value "Discard"
    #Then I click on button "select2-chosen-1"
    #Then I enter the details as
      #| Fields               | Value     |
      #| s2id_autogen1_search | DESIGNATE |
    #Then I click on button "select2-results-1"
    #Then I wait for "5000" millisecond
    #Then I click on "Annual Reconciliation"
    #Then I select "2016" from "AnnualObligationSelect"
    #Then I click on button "NextSection"
    #Then I click on button "ClaimingACTProportion_Yes"
    #Then I see text "Days where 1 group member paid or was liable to pay taxable or interstate wages" displayed
#
    #Examples: 
      #| PortalName | UserNameField | PasswordField | Password   |
      #| TSSAdmin        | UserNameInput | PasswordInput | Dbresults1 |
