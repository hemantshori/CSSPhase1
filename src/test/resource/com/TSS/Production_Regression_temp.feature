#Sample Feature Definition Template
#DONE:
#MANUAL: 580, 601, 607, 648, 651,
@all
Feature: Regression temp

  #Stories done: 78, 136, 141, 176, 185, 522, 578, 583, 584, 592, 608, 617, 622
  @onhold
  Scenario Outline: DTSP-78: As an end user, I want to be able to select an ABN and view next payment information and lodge from the Right Navigation Panel on my Basic Dashboard
    #Business Taxpayer with many: jbradley2
    #Business Taxpayer with only one: camido
    #Business Taxpayer with none: ccover
    #Tax Agent with many: test_taxagent1
    #Tax Agent with only one: test_taxagent2
    #Tax Agent with none: test_taxagent3
    #Scenario 1: Business Taxpayer associated with multiple ABNs
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value         |
      | s2id_autogen1_search | Active Bottle |
    Then I click on button "select2-results-1"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value |
      | s2id_autogen1_search | Build |
    Then I click on button "select2-results-1"
    Then I click on "Sign Out"
    #Scenario 2: Business Taxpayer associated with only 1 ABN
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | camido     |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I check "select2-chosen-1" is readonly
    Then I click on "Sign Out"
    #Scenario 3: Tax Agent associated with multiple ABNs (i.e. clients)
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value          |
      | UserNameInput | test_taxagent1 |
      | PasswordInput | <Password>     |
    And I hit Enter
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value |
      | s2id_autogen1_search | Green |
    Then I click on button "select2-results-1"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value  |
      | s2id_autogen1_search | Domain |
    Then I click on button "select2-results-1"
    Then I click on "Sign Out"
    #Scenario 4: Tax Agent associated with only 1 ABN (i.e. client)
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value          |
      | UserNameInput | test_taxagent2 |
      | PasswordInput | <Password>     |
    And I hit Enter
    Then I check "select2-chosen-1" is readonly
    Then I click on "Sign Out"
    #Scenario 5: Display “Next Payment” box
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I see text "Next Payment Due" displayed
    #Scenario 6: Display “Next Lodgement” box
    Then I see text "Next Lodgement" displayed
    #Scenario 7: User clicks on “View History” button
    # Then I click on "View History"
    Then I click on button "BillComparation_wt61"
    Then I check I am on "Return History" page
    Then I click on "Dashboard"
    #Scenario 8: User clicks on “Lodge Return” button
    #Then I click on "Lodge Return"
    Then I click on button "BillComparation_wt88"
    Then I check I am on "Payroll Lodgement Form" page
    Then I click on "Dashboard"
    Then I click on "Sign Out"
    #Scenario 10: User has no outstanding payment
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | mbisping   |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I see text "You do not have any outstanding payments" displayed
    #Scenario 11: User has no transaction history
    Then I check "BillComparation_wt61" is readonly
    Then I click on "Sign Out"
    #Scenario 9: User has no outstanding lodgement
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value     |
      | s2id_autogen1_search | BROWNCORP |
    Then I click on button "select2-results-1"
    Then I see text "You do not have any outstanding lodgements" displayed

    #Scenario 11: TODO when 'View History' and 'Lodge Return' buttons have actual ids.
    Examples: 
      | PortalName | UserName  | Password   |
      | Production | jbradley2 | Dbresults1 |

  @review
  Scenario Outline: DTSP-136: As an end user, I want to be able to view the left navigation panel so that I can quickly access the functions that I need
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I wait for "1000" millisecond
    Then I see text "Home" displayed
    Then I see text "Payroll Tax Lodgement" displayed
    Then I see text "Payroll Tax Registration" displayed
    Then I see text "Tax Registration Update" displayed
    Then I see text "Manage Account Details" displayed
    Then I see text "User Profile" displayed
    Then I see text "Sign Out" displayed

    Then I click on "Payroll Tax Lodgement"
    Then I check I am on "Payroll Lodgement Form" page
    Then I click on "Manage Account Details"
    Then I check I am on "Manage Account Details" page
    #This part is bugged for the moment
    #Then I click on "Return History"
    #Then I check I am on "Return History" page
    Then I click on "Payroll Tax Registration"
    Then I check I am on "Payroll Tax Registration" page
    Then I click on "User Profile"
    Then I check I am on "View User Profile" page
    Then I click on "Home"
    Then I check I am on "Home" page
    Then I click on "Sign Out"
    Then I check I am on "Login" page

    Examples: 
      | PortalName | UserName  | Password   |
      | Production | jbradley2 | Dbresults1 |

  @onhold
  Scenario Outline: DTSP-141: As an end user, I want to be able to view my Recent Transactions on my Basic Dashboard, so that it shows me a quick summary of my recent/closed Lodgements and Payments.
    #Scenarios 1 and 2 are better off manually.
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    #Scenario 3
    Then I click on button with value "View History"
    Then I check I am on "Return History" page
    Then I click on "Home"
    Then I click on "Sign Out"
    #Scenario 4
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | jbradley   |
      | PasswordInput | <Password> |
    And I hit Enter
    #Then I click on "Return History"
    Then I see text "You do not have any monthly transaction history available" displayed
    Then I see text "You do not have any annual transaction history available" displayed
    Then I check "BillComparation_wt61" is readonly
    Then I click on "Sign Out"
    #Scenario 7
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | ccover     |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I see text "Please note, as there are no ABN's associated to your account, we are unable to display any information." displayed
    Then I click on "Add an ABN to my Account"
    Then I check I am on "Manage Account Details" page
    Then I click on "Sign Out"
    #Scenario 8
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value          |
      | UserNameInput | test_taxagent3 |
      | PasswordInput | <Password>     |
    And I hit Enter
    Then I see text "Please note, as there are no ABN's associated to your account, we are unable to display any information." displayed
    Then I click on "Sign Out"

    Examples: 
      | PortalName | UserName  | Password   |
      | Production | jbradley2 | Dbresults1 |

  @onhold
  Scenario Outline: DTSP-176: As an end user, I want to be able to view my Transaction History for Payroll Tax
    #Scenarios 1-4 are already tested in DTSP-78.
    #Scenarios 13-14 are already tested in DTSP-141
    #Scenarios 5, 6, 8 and 10 are best tested manually
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value            |
      | s2id_autogen1_search | SIT SPOT PTY LTD |
    Then I click on button "select2-results-1"
    #Then I click on button "select2-chosen-1"
    Then I click on "Payroll Tax Registration"
    Then I click on "Return History"
    #Scenario 7: “Next” button
    Then I click on button "ListNavigation_Next"
    #Scenario 8: "Previous" button
    Then I click on button "ListNavigation_Previous"
    #Scenario 12: BPAY and EFT Info
    Then I see text "Payment Options" displayed
    Then I see text "Biller Code" displayed
    Then I see text "EFTBSB" displayed
    Then I click on "Sign Out"
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | mbisping   |
      | PasswordInput | <Password> |
    And I hit Enter
    #Scenario 9 and 11
    Then I click on "Return History"
    Then I see text "You do not have any monthly transaction history available" displayed
    Then I see text "You do not have any annual transaction history available" displayed
    Then I click on "Sign Out"

    Examples: 
      | PortalName | UserName  | Password   |
      | Production | jbradley2 | Dbresults1 |

  @review
  Scenario Outline: DTSP-185: As an end user, I want to be able to edit my Business Address details on my Tax Registration form
    #Scenario 10 should be tested manually as it regards an email
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
    Then I see text "Update Payroll Contact Details" displayed
    Then I see text "Update Payroll Refund Details" displayed
    # Scenario 3: User elects to view "Update Business Address" details form
    Then I click on "Update Business Address"
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                                                  |
      | item2 | Taxpayer Details                                         |
      #| item3 | Update Business Address                                   |
      #| item5 | Business Address                                          |
      | item5 | Postal Address                                            |
      | item5 | Address where Business Records are located (Jurisdiction) |
    #		Scenario 4: User elects to edit "Update Business Address" details form
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value         |
      | s2id_autogen1_search | Active Bottle |
    Then I click on button "select2-results-1"
    Then I check "Address_AddressLine" is not readonly
    Then I check "Address_City" is not readonly
    Then I check "Address_State" is not readonly
    Then I check "Address_PostCode" is not readonly
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
    Then I see text "Your Update Business Address Request has been successfully submitted. An email has been sent to you for your reference." displayed
    Then I see text "To download the details you have submitted, please click the button below." displayed
    Then I see text "Transaction Reference Number:" displayed
    #		Scenario 7: Submit 'Tax Registration Updates 'data to PSRM with errors
    Given I want to login to portal "<PortalName>"
    Then I click on "Tax Registration Update"
    Then I click on "Update Business Address"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value         |
      | s2id_autogen1_search | Active Bottle |
    Then I click on button "select2-results-1"
    Then I enter the details as
      | Fields           | Value |
      | Address_PostCode |    33 |
    Then I click on button "NextBT"
    Then I see text "Please enter the correct number of digits for this field." displayed
    #		Scenario 8: User clicks 'Back' on the 'Tax Registration Updates' Summary page
    Then I enter the details as
      | Fields           | Value |
      | Address_PostCode |  3333 |
    #		Scenario 9: User views Tax Registration Updates Confirmation page
    Then I click on button "NextBT"
    Then I check I am on "Update Business Address Summary" page
    Then I click on button with value "Back"
    Then I check I am on "Update Business Address" page
    #		Scenario 11: User selects "Cancel" and common browser message is displayed and the user is re directed to the Dashboard
    Then I enter the details as
      | Fields           | Value |
      | Address_PostCode |  4444 |
    Then I click on button with value "Cancel"
    Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "Cancel"
    Then I click on button with value "Cancel"
    Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "OK"

    Examples: 
      | PortalName | UserName  | Password   |
      | Production | jbradley2 | Dbresults1 |

  @review
  Scenario Outline: DTSP-522: As a end user I want the settings page updated so I can understand what the settings page is used for
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    #Scenario 1: User views updated left hand navigation menu
    Then I see text "User Profile" displayed
    #Scenario 2: User selects 'User Profile' sub-menu item on the left hand navigation menu
    Then I click on "User Profile"
    Then I check I am on "View User Profile" page
    Then I see text "Contact Details" displayed
    Then I see text "Edit User Profile" displayed
    Then I see text "Business Taxpayer" not displayed
    Then I see text "Choose a Tax Agent" not displayed
    #Scenario 3: User selects 'Edit User Profile' on the 'View User Profile' page
    Then I click on button "EditBT"
    Then I check I am on "Edit User Profile" page
    Then I see text "Contact Details" displayed

    Examples: 
      | PortalName | UserName  | Password   |
      | Production | jbradley2 | Dbresults1 |

  @onhold
  Scenario Outline: DTSP-567: As an end user, I don't want to see any tax calculations while I am filling out the Payroll Tax Lodgement Form until they are retrieved from PSRM and populated on the Lodgement Summary page
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Payroll Tax Lodgement"
    And I check I am on "Payroll Lodgement Form" page
    Then I click on button "Discard"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value         |
      | s2id_autogen1_search | ABCAD |
    Then I click on button "select2-results-1"
    Then I click on "Annual Reconciliation"
    Then I select "2015" from "AnnualObligationSelect"
    Then I click on button "NextSection"
    #Then I click on button "TaxPayerDetailsNext"
    Then I enter the details as
      | Fields                                         | Value |
      | SalariesAndWages                               |     1000000 |
      | BonusesAndCommissions                          |     1 |
      | LodgePayrollAnswer_Commissions                 |     1 |
      | LodgePayrollAnswer_Allowances                  |     1 |
      | LodgePayrollAnswer_DirectorsFees               |     1 |
      | LodgePayrollAnswer_EligibleTerminationPayments |     1 |
      | LodgePayrollAnswer_ValueOfBenefits             |     1 |
      | LodgePayrollAnswer_ShareValue                  |     1 |
      | LodgePayrollAnswer_ServiceContracts            |     1 |
      | LodgePayrollAnswer_Superannuation              |     1 |
      | LodgePayrollAnswer_OtherTaxablePayment         |     1 |
      | LodgePayrollAnswer_ExemptWages                 |     1 |
    #Scenario 1: Remove calculated fields in the "Wages / Reconciliation" section
    Then I see text "ACT Taxable Wages" not displayed
    Then I see text "Tax-Free Threshold" not displayed
    Then I see text "Taxable wages" not displayed
    Then I see text "Tax Payable" not displayed
    Then I click on button "SalariesAndWages"
    Then I click on button "wtSubmitBT"
    #Scenario 2: Remove calculated fields in the "Total Amounts" section
    Then I see text "Amount Payable / Refund Amount Equals" not displayed
    Then I enter the details as
      | Fields                 | Value |
      | AnnualLessTotalTaxPaid |     1 |
    Then I click on button "TotalAmountsNextBt"

    #Scenario 3 is currently blocked by bug DTSP-684
    Examples: 
      | PortalName | UserName  | Password   |
      | Production | jbradley2 | Dbresults1 |

  @redo
  Scenario Outline: DTSP-578: Update Portal Registration Form to re-enable front end validation on CRN
    Given I want to login to portal "<PortalName>"
    Then I click on "Create Account"
    #Scenario 3: Business Taxpayer fails to enter a CRN
    Then I check "RegistrationSubmit" is readonly
    #Scenario 4: CRN field only accepts numeric input
    Then I click on button "RegistrationAsBusiness"
    Then I enter the details as
      | Fields         | Value |
      | InputCRNNumber | TEST  |
    Then I check "InputCRNNumber" is empty
    #Scenario 2: Business Taxpayer enters a CRN of less then 6 digits during portal registration
    Then I enter the details as
      | Fields         | Value |
      | InputABNNumber | <ABN> |
      | InputCRNNumber |  4000 |
    Then I click on button "TermsandConditionsCheckBox"
    Then I click on button "RegistrationSubmit"
    Then I see text "CRN Should be 6 digits." displayed
    #Scenario 1: Business Taxpayer enters a valid 6 digits CRN during portal registration
    Then I enter the details as
      | Fields         | Value |
      | InputABNNumber | <ABN> |
      | InputCRNNumber | <CRN> |
    Then I click on button "RegistrationSubmit"
    Then I check I am on "Complete Registration" page

    Examples: 
      | PortalName | UserName  | Password   | ABN         | CRN    |
      | Production | jbradley2 | Dbresults1 | 48613935005 | 400003 |

  @review
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
    Then I see text "Update Payroll Contact Details" displayed
    Then I see text "Update Payroll Refund Details" displayed
    # Scenario 3: User elects to view "Update Business Address" details form
    Then I click on "Update Payroll Contact Details"
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
      | s2id_autogen1_search | Active Bottle |
    Then I click on button "select2-results-1"
    Then I check "ContactPerson_FirstName" is not readonly
    Then I check "ContactPerson_LastName" is not readonly
    Then I check "ContactPerson_PhoneNumber" is not readonly
    Then I check "ContactPerson_Email" is not readonly
    Then I check "Address_AddressLine" is not readonly
    Then I check "Address_City" is not readonly
    Then I check "Address_PostCode" is not readonly
    #Then I check "Address_AddressLine7" is not readonly
    Then I click on button with value "Next"
    Then I click on button with value "Next"
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
    Then I see text "Your Update Contact Details Request has been successfully submitted. An email has been sent to you for your reference." displayed
    Then I see text "To download the details you have submitted, please click the button below." displayed
    Then I see text "Transaction Reference Number:" displayed
    #		Scenario 7: Submit 'Tax Registration Updates 'data to PSRM with errors
    Given I want to login to portal "<PortalName>"
    Then I click on "Tax Registration Update"
    Then I click on "Update Payroll Contact Details"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value         |
      | s2id_autogen1_search | Active Bottle |
    Then I click on button "select2-results-1"
    Then I enter the details as
      | Fields            | Value |
      | Address_PostCode4 |    33 |
    Then I click on button "NextBT"
    Then I wait for "5000" millisecond
    Then I see text "Please enter the correct number of digits for this field." displayed
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
      | PortalName | UserName  | Password   |
      | Production | jbradley2 | Dbresults1 |

  @review
  Scenario Outline: DTSP-592: As an end user, I want to be able to edit my Refund details on my Tax Registration form
    #Scenario 10 should be tested manually as it regards an email
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
    Then I see text "Update Payroll Contact Details" displayed
    Then I see text "Update Payroll Refund Details" displayed
    # Scenario 3: User elects to view "Update Business Address" details form
    Then I click on "Update Payroll Refund Details"
    Then I check I am on "Update Refund Details" page
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value         |
      | s2id_autogen1_search | Active Bottle |
    Then I click on button "select2-results-1"
    #Then I click on button "Refunds_YES"
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                        |
      | item2 | Taxpayer Details               |
      | item3 | Set up bank account for refunds |
    #| item5 | BSB                                          |
    #| item5 | Bank Account Number                                            |
    #| item5 | Bank Account Name |
    #		Scenario 4: User elects to edit "Update Business Address" details form
    Then I check "Answer_OrganizationalName" is not empty
    Then I check "Answer_ABN" is not empty
    Then I check "Answer_CRN" is not empty
    #Then I check "Address_State" is not readonly
    #Then I check "Address_PostCode" is not readonly
    Then I click on button with value "Next"
    Then I wait for "1000" millisecond
    #		Scenario 5: User views 'Tax Registration Update ' Summary page
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName      |
      | item3 | Declaration   |
      | item5 | Organisation  |
      | item5 | Contact Phone |
      | item5 | Email Address |
    #		Scenario 6: Submit 'Tax Registration Update ' data to PSRM without errors
    Then I click on button "CorrectInfoDeclared"
    Then I click on button with value "Submit"
    Then I see text "Your Update Refund Details Request has been successfully submitted. An email has been sent to you for your reference." displayed
    Then I see text "To download the details you have submitted, please click the button below." displayed
    Then I see text "Transaction Reference Number:" displayed
    #		Scenario 7: Submit 'Tax Registration Updates 'data to PSRM with errors
    Given I want to login to portal "<PortalName>"
    Then I click on "Tax Registration Update"
    Then I click on "Update Payroll Refund Details"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value         |
      | s2id_autogen1_search | Active Bottle |
    Then I click on button "select2-results-1"
    Then I click on button "Refunds_YES"
    Then I enter the details as
      | Fields                   | Value      |
      | Answer_BSB               |         33 |
      | Answer_BankAccountNumber | 2342354234 |
      | Answer_BankAccountName   | TEST       |
    Then I click on button with value "Next"
    #Then I see text "Invalid BSB. BSB Should be 6 digits. Please try again." displayed
    #		Scenario 8: User clicks 'Back' on the 'Tax Registration Updates' Summary page
    Then I enter the details as
      | Fields     | Value  |
      | Answer_BSB | 333333 |
    #		Scenario 9: User views Tax Registration Updates Confirmation page
    Then I click on button "NextBT"
    Then I check I am on "Update Refund Details Summary" page
    Then I click on button with value "Back"
    Then I check I am on "Update Refund Details" page
    #		Scenario 11: User selects "Cancel" and common browser message is displayed and the user is re directed to the Dashboard
    Then I enter the details as
      | Fields     | Value  |
      | Answer_BSB | 444444 |
    Then I click on button with value "Cancel"
    Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "Cancel"
    Then I click on button with value "Cancel"
    Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "OK"

    Examples: 
      | PortalName | UserName  | Password   |
      | Production | jbradley2 | Dbresults1 |

  @onhold
  Scenario Outline: DTSP-608: As a user I want to choose a Taxpayer's ABN so that those details are populated on forms
    #Scenario 2: Business Taxpayer associated with multiple ABNs
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Payroll Tax Lodgement"
    Then I click on button with value "Discard"
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                         |
      | text1 | Taxpayer Details                |
      | text1 | Choose a Taxpayer           |
      | text2 | Organisation Name              |
      | text2 | Australian Business Number (ABN) |
      | text2 | Client Reference Number (CRN)    |
      | text2 | Return Type                      |
      | text2 | Monthly Return                   |
      | text2 | Annual Reconciliation            |
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value         |
      | s2id_autogen1_search | Active Bottle |
    Then I click on button "select2-results-1"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value    |
      | s2id_autogen1_search | NAVY PTY |
    Then I click on button "select2-results-1"
    Then I click on "Sign Out"
    #Scenario 3: Business Taxpayer associated with ONLY one ABN
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | camido     |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Payroll Tax Lodgement"
    Then I click on button with value "Discard"
    Then I check "select2-chosen-1" is readonly
    Then "Answer_OrganizationalName" displays "AUTOLINE PTY LTD" by default
    Then I check "Answer_ABN" contains "50600468817"
    Then I check "Answer_CRN" contains "400011"
    Then I click on "Sign Out"
    #Scenario 4: Tax Agent associated with multiple ABN (i.e. clients)
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value          |
      | UserNameInput | test_taxagent1 |
      | PasswordInput | <Password>     |
    And I hit Enter
    Then I click on "Payroll Tax Lodgement"
    Then I click on button with value "Discard"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value |
      | s2id_autogen1_search | Green |
    Then I click on button "select2-results-1"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value  |
      | s2id_autogen1_search | Domain |
    Then I click on button "select2-results-1"
    Then I click on "Sign Out"
    #Scenario 5: Tax Agent associated with ONLY one ABN (i.e. clients)
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | camido     |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Payroll Tax Lodgement"
    Then I click on button with value "Discard"
    Then I check "select2-chosen-1" is readonly
    Then "Answer_OrganizationalName" displays "AUTOLINE PTY LTD" by default
    Then I check "Answer_ABN" contains "50600468817"
    Then I check "Answer_CRN" contains "400011"
    Then I click on "Sign Out"
    #Scenario 6:
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Payroll Tax Lodgement"
    Then I click on button with value "Discard"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value         |
      | s2id_autogen1_search | Active Bottle |
    Then I click on button "select2-results-1"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value    |
      | s2id_autogen1_search | NAVY PTY |
    Then I click on button "select2-results-1"
    Then I click on "Annual Reconciliation"
    Then I select "2015" from "AnnualObligationSelect"
    Then I click on button "NextSection"
    Then I click on button "MonthlyReturnBackBt"
    Then I check "Answer_OrganizationalName" is readonly
    Then I check "Answer_ABN" is readonly
    Then I check "Answer_CRN" is readonly
    Then I click on "Sign Out"
    #Scenario 7: Business Taxpayer views Payroll Tax Lodgement with no associated ABN's
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | ccover     |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Payroll Tax Lodgement"
    Then I see text "Please note, as there are no ABN's associated to your account, we are unable to display any information." displayed
    Then I see text "Add an ABN to my Account" displayed
    Then I click on "Sign Out"
    #Scenario 8: Tax Agent views Payroll Tax Lodgement with no associated ABN's
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value          |
      | UserNameInput | test_taxagent3 |
      | PasswordInput | <Password>     |
    And I hit Enter
    Then I click on "Payroll Tax Lodgement"
    Then I see text "Please note, as there are no ABN's associated to your account, we are unable to display any information." displayed
    #Then I see text "Add an ABN to my Account" displayed
    Then I click on "Sign Out"

    Examples: 
      | PortalName | UserName  | Password   |
      | Production | jbradley2 | Dbresults1 |

  @review
  Scenario Outline: DTSP-617: Annual Payroll Tax Lodgements (Check for outstanding monthly obligations in PSRM)
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Payroll Tax Lodgement"
    Then I click on button with value "Discard"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value          |
      | s2id_autogen1_search | <SearchString> |
    Then I click on button "select2-results-1"
    Then I click on button "PayrollAnswer_TypeAnnual"
    #Then I see text "2012" displayed
    Then I see text "2013" displayed
    Then I see text "2014" displayed
    Then I see text "2015" displayed
    Then I see text "2016" displayed
    Then I click on "Monthly Return"
    Then I click on button "PayrollAnswer_TypeMonthly"
    Then I see text "Jul 2016" displayed
    Then I see text "Aug 2016" displayed
    Then I see text "Sep 2016" displayed
    Then I see text "Oct 2016" displayed
    Then I see text "Nov 2016" displayed
    Then I see text "Dec 2016" displayed
    Then I see text "Jan 2017" displayed
    Then I see text "Feb 2017" displayed

    Examples: 
      | PortalName | UserName  | Password   | SearchString  |
      | Production | jbradley2 | Dbresults1 | ABL |

  @review
  Scenario Outline: DTSP-622: As an end user (Business Taxpayer), I want to be able to manage tax details
    #NOTE: DO SCENARIOs 6 and 8 manually
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Manage Account Details"
    #Scenario 1: Display Manage Tax Details page (Business Taxpayer associated to One ABN)
    #Scenario 2: Display Manage Tax Details page (Business Taxpayer associated to Multiple ABNs)
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName          |
      | item2 | ABN               |
      | item3 | CRN               |
      | item4 | Organisation Name |
      | item5 | Tax Agent         |
    #Scenario 4: Display the “Edit Tax Agent” pop up window
    Then I click on button "EditABN"
    Then I switch to frame "0"
    Then I see text "ABN" displayed
    Then I see text "CRN" displayed
    Then I see text "Organisation Name" displayed
    Then I see text "Tax Agent" displayed
    #Then "<Item>" is displayed as "<ItemName>"
    #| Item  | ItemName          |
    #| item2 | ABN               |
    #| item3 | CRN               |
    #| item4 | Organisation Name |
    #| item5 | Tax Agent         |
    #Scenario 5: Edit Tax Agent nomination of an ABN
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value          |
      | s2id_autogen1_search | <SearchString> |
    Then I click on button "select2-results-1"
    Then I click on button "SaveBtn"
    Then I check I am on "Manage Account Details" page
    #Scenario 7: Display the Add Additional ABN page
    Then I click on button "AddABN"
    Then I switch to frame "0"
    Then I see text "ABN" displayed
    Then I see text "CRN" displayed
    #Scenario 10: Mandatory Information on the “Add Additional ABN” page
    Then I check "SaveBtn" is readonly
    And I enter the details as
      | Fields             | Value         |
      | BusinessEntity_ABN | 1111111111111 |
      | BusinessEntity_CRN |        111111 |
    Then I click on button "SaveBtn"
    Then I see text "Invalid ABN or CRN" displayed

    Examples: 
      | PortalName | UserName  | Password   | SearchString |
      | Production | jbradley2 | Dbresults1 | FISH AND CO  |
