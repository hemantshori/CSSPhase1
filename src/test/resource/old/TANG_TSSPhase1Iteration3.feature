#Sample Feature Definition Template
Feature: Stuff for TSS Phase 3

  @done
  Scenario Outline: DTSP-25: As an organisation I want a user's details verified during registration so that only valid users register with the portal (page 1)
    #
    #scenario 1: Same year check
    Given I want to login to portal "<PortalName>"
    And I click on "Create Account"
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                        |
      | item2 | Client Reference Number (CRN)   |
      | item3 | ABN                             |
      | item4 | ACN                             |
      | item7 | By creating an account, I agree |
    #Scenario 4
    Then I click on "Sign In"
    Then I check I am on "Login" page
    #Scenario p
    Then I click on "Create Account"
    Then I click on "Terms & Conditions"
    Then a new page "http://dbresults.com.au/terms/" is launched
    Then I check I am on "Terms of Use | DB Results - Digital Business specialists" page
    Then I see text "Terms of Use" displayed
    Given I want to login to portal "<PortalName>"
    And I click on "Create Account"
    #Scenario 3
    Then I enter the details as
      | Fields         | Value       |
      | InputABNNumber | 33333333333 |
      | InputCRNNumber | 33333333333 |
    Then I click on button "RegistrationSubmit"
    Then I see text "By creating an account, I agree to the" displayed
    Then I click on button "TermsandConditionsCheckBox"
    Then I click on button "RegistrationSubmit"
    Then I see text "Invalid CRN, ABN or ACN. Please try again." displayed
    Then I enter the details as
      | Fields         | Value       |
      | InputABNNumber | 12345678961 |
      | InputCRNNumber | 12345678961 |
    Then I click on button "RegistrationSubmit"
    Then I check I am on "Registration" page
    #DTSP-29: As a user I want to enter my user details so that I can complete the registration process (page 2)
    #Scenario 1
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                 |
      | item2 | First Name               |
      | item3 | Last Name                |
      | item4 | Email Address            |
      | item5 | Choose Username          |
      | item6 | Choose Password          |
      | item7 | Hint                     |
      | item7 | Confirm Password         |
      | item7 | Already have an account? |
    #Scenario 4: User cancels with unsaved changes
    Then I click on button "Cancel"
    Then I check I am on "Login" page
    Given I want to login to portal "<PortalName>"
    And I click on "Create Account"
    Then I enter the details as
      | Fields         | Value       |
      | InputABNNumber | 12345678961 |
      | InputCRNNumber | 12345678961 |
    Then I click on button "RegistrationSubmit"
    Then I click on button "TermsandConditionsCheckBox"
    Then I check I am on "Registration" page
    Then I click on button "Submit"
    #Scenario 3: Details entered do not pass validation (Can't fully complete on this due to WIP done on the page)
    Then I enter the details as
      | Fields                 | Value       |
      | Registration_Email     | 12345678961 |
      | Registration_FirstName | Test        |
      | Registration_LastName  | Test        |
      | Registration_Username  | 12345678961 |
      | NewPassword            | 12345678961 |
      | ConfirmPassword        |   123456781 |
      | ConfirmPassword        |   123456781 |
      | PhoneNumber            |    12345671 |
      | Registration_Hint      |      123123 |
    Then I click on button "Submit"
    Then I see text "Invalid email address format. Please try again." displayed
    Then I see text "Invalid password. Please try again." displayed
    Then I see text "Passwords do not match. Please try again." displayed
    #Scenario 5: User cancels with unsaved changes
    Then I click on button "Cancel"
    Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "Cancel"
    Then I check I am on "Registration" page
    Then I click on button "Cancel"
    Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "OK"
    Then I check I am on "Login" page

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password   | CRN         | ABN         |
      | TSS        | UserNameInput | PasswordInput | mbrown   | Dbresults1 | 12345678901 | 12345678901 |

  @done
  Scenario Outline: DTSP-318: As a Customer Portal Administrator (CPA), I want to be able to search for taxpayer tips on Manage Tips page so that I can find the tips I need
    Given I access URL "https://test-ssc.dbresults.com.au/SS_Admin/Tooltips.aspx"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Given I access URL "https://test-ssc.dbresults.com.au/SS_Admin/Tooltips.aspx"
    # Scenario 1: CPA access the 'Manage Tips' page
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName             |
      | item2 | Page                 |
      | item3 | Section              |
      | item5 | Tooltips Description |
      | item5 | Identifier           |
      | item5 | Status               |
    And I enter the details as
      | Fields      | Value      |
      | SearchInput | PayrollTax |
    Then I click on button "SearchBT"
    #Scenario 2: CPA searches for the taxpayer tips on the 'Manage Tips' page
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                         |
      | item2 | PayrollTax_AustralianWide        |
      | item3 | PayrollTax_BonusesAndCommissions |
      | item5 | PayrollTax_SuperAnnuation        |
      | item5 | PayrollTax_PayrollTaxGroupNumber |
      | item5 | PayrollTax_MonthOfReturn         |
    Then I click on button "ResetBT"
    #Scenario 3: CPA filters tips on the 'Manage Tips' page
    Then I click on button "FilterByDescription"
    And I enter the details as
      | Fields                                  | Value   |
      | FilterByDescription_block_wtinputFilter | Account |
    Then I hit Enter
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                      |
      | item2 | AccountAlreadyActivatedLine1  |
      | item3 | AccountAlreadyActivatedLine2  |
      | item5 | AccountAlreadyRegisteredLine1 |
      | item5 | AccountAlreadyRegisteredLine2 |
      | item5 | AddNewAccountIntro            |
      | item5 | LockedAccountLine1            |
    #Scenario 4: More than 10 search results
    Given I access URL "https://test-ssc.dbresults.com.au/SS_Admin/Tooltips.aspx"
    And I enter the details as
      | Fields      | Value      |
      | SearchInput | PayrollTax |
    Then I click on button "SearchBT"
    Then I see "Counter" displayed
    And I enter the details as
      | Fields      | Value   |
      | SearchInput | Account |
    Then I see "Counter" displayed

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password   | CRN         | ABN         |
      | TSS        | UserNameInput | PasswordInput | jbradley | Dbresults1 | 12121212121 | 21212121212 |

  @testagain
  Scenario Outline: DTSP-145
    Given I want to login to portal "<PortalName>"
    Then I check "UserNameEmailLabel" has a CSS property "content" with value ""*""
    Then I check "PasswordLabel" has a CSS property "content" with value ""*""
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Given I want to login to portal "AccountManagement"
    Then I check I am on "View Settings" page
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName      |
      | item2 | Profile       |
      | item2 | Username      |
      | item3 | First Name    |
      | item5 | Last Name     |
      | item2 | Contact       |
      | item5 | Email Address |
      | item5 | Phone Number  |
      | item5 | Tax Agent     |
      | item5 | Security      |
      | item5 | Password      |
      | item5 | Hint          |

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password   | CRN         | ABN         |
      | TSS        | UserNameInput | PasswordInput | jbradley | Dbresults1 | 12121212121 | 21212121212 |

  @done
  Scenario Outline: DTSP-147
    Given I want to login to portal "<PortalName>"
    Then I check "UserNameEmailLabel" has a CSS property "content" with value ""*""
    Then I check "PasswordLabel" has a CSS property "content" with value ""*""
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Given I want to login to portal "AccountManagement"
    Then I click on button "EditBT"
    #Scenario 1: User accesses the edit function
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
    #Scenario 2: User enters incorrect input type into a restricted fields (e.g. entering 123 into an alphabet field)
    Then I enter the details as
      | Fields            | Value |
      | Input_PhoneNumber | TEST  |
    Then I check "Input_PhoneNumber" is empty
    #Scenario 3: User has not entered all the mandatory fields
    Then I check "CancelBT" is readonly
    #Scenario 4, 6: Scenario 6: Profile settings details does not pass all validations
    Then I enter the details as
      | Fields                   | Value                 |
      | Input_FirstName          | TEST                  |
      | Input_LastName           | TEST                  |
      | Input_PhoneNumber        |                 33333 |
      | Input_Email              | TEST                  |
      | Input_NewPassword        | adsfasdfaf            |
      | Input_NewpasswordConfirm | asfsadfsadf           |
      | Input_Hint               | testsetsetwetstsetset |
    Then I wait for "1000" millisecond
    Then I click on button "Input_FirstName"
    Then I click on button "Submit"
    #Then I see text "Please enter a valid email address" displayed
    Then I see text "Email expected!" displayed
    Then I see text "This is an invalid phone number" displayed
    Then I see text "New Password is invalid. Please try again." displayed
    Then I see text "New Password and Confirm Password do not match. Please try again." displayed
    #Scenario 8: User cancels edit function with unsaved changes
    Then I click on button "Cancel"
    Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "Cancel"
    Then I click on button "Cancel"
    Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "OK"
    Then I check I am on "View Settings" page
    Given I want to login to portal "AccountManagement"
    #Then I click on button "Cancel"
    Then I check I am on "View Settings" page
    #Scenario 5: Profile settings details pass all validations
    Then I click on button "EditBT"
    Then I enter the details as
      | Fields                   | Value             |
      | Input_FirstName          | TEST              |
      | Input_LastName           | TEST              |
      | Input_PhoneNumber        |          33333333 |
      | Input_Email              | TEST@TESTTESTTSET |
      | Input_NewPassword        | Dbresults1        |
      | Input_NewpasswordConfirm | Dbresults1        |
      | Input_Hint               | DB RESULTS ONE    |
    #Scenario 9: User update's Tax Agent Details (Tax Agent registered and activated on the Portal)
    Then I select "OrganizationWithA_Z TaxAgents (98765432102)" from "ChooseTaxAgent"
    Then I click on button "Input_FirstName"
    Then I click on button "Submit"
    Then I see text "Your changes have been successfully saved." displayed
    Then I check I am on "View Settings" page

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password   | CRN         | ABN         |
      | TSS        | UserNameInput | PasswordInput | jbradley | Dbresults1 | 12121212121 | 21212121212 |

  @done
  Scenario Outline: DTSP-460: s an organisation I want user inputs to be restricted & validated during Tax Agent's portal registration so that human error can be minimised
    Given I want to login to portal "<PortalName>"
    Then I click on "Create Account"
    Then I check I am on "Registration" page
    Then I see checkbox "RegistrationAsBusiness" as selected
    Then I see checkbox "RegistrationAsTaxAgent" as not selected
    Then I click on "Register as a Tax Agent"
    #Scenario 1: User tries to enter incorrect input type into a restricted fields (e.g. entering ABC into a number field)
    Then I enter the details as
      | Fields                   | Value |
      | InputTaxAgentRegId       | TEST  |
      | InputTaxAgentABN         | TEST  |
      | BusinessAddress_Postcode | TEST  |
    Then I check "InputTaxAgentRegId" is empty
    Then I check "InputTaxAgentABN" is empty
    Then I check "BusinessAddress_Postcode" is empty
    #Scenario 2: Tax Agent Registration details do not pass the frontend validation
    Then I enter the details as
      | Fields                    | Value            |
      | InputTaxAgentABN          |               11 |
      | InputTaxAgentBusinessName | Automated Tester |
    Then I click on button "TermsandConditionsCheckBox2"
    Then I click on button "RegistrationSubmit"
    Then I wait for "1000" millisecond
    Then I see text "Invalid ABN. ABN Should be 11 Digits. Please try again." displayed

    Examples: 
      | PortalName | UserName | Password   |
      | TSS        | jscott   | Dbresults1 |

  @done
  Scenario Outline: DTSP-401: As an end user, I should not be able to view/select the 'Return Type' section on the Payroll Tax Lodgement forms when I am on subsequent sections after clicking 'Next'
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    And I click on "Payroll Tax Lodgement"
    Then I click on button "Discard"
    Then I click on "Annual Reconciliation"
    Then I click on button "NextSection"
    Then I click on button "TaxPayerDetailsBT"
    Then I check "PayrollAnswer_TypeMonthly" is readonly
    Then I check "PayrollAnswer_TypeAnnual" is readonly

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password   | CRN         | ABN         |
      | TSS        | UserNameInput | PasswordInput | jbradley | Dbresults1 | 12121212121 | 21212121212 |

  @done
  Scenario Outline: DTSP-440 and DTSP-441: As an organisation I want to know the type of user who is registering so that the relevant verification information can be presented.
    #ONHOLD until the tax agent registration bug can be fixed
    Given I want to login to portal "<PortalName>"
    Then I click on "Create Account"
    Then I check I am on "Registration" page
    #DTSP-440: Scenario 1 and 2
    Then I see checkbox "RegistrationAsBusiness" as selected
    Then I see checkbox "RegistrationAsTaxAgent" as not selected
    #DTSP-441, Scenario 1:
    Then I click on "Register as a Tax Agent"
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                               |
      | item2 | Registration ID                        |
      | item3 | Australian Business Number (ABN)       |
      | item5 | Business Trading Name                  |
      | item5 | Business Address                       |
      | item5 | Country                                |
      | item5 | Address Line 1                         |
      | item5 | Address Line 2                         |
      | item5 | Suburb / City                          |
      | item5 | Territory / State                      |
      | item5 | Postcode                               |
      | item5 | By creating an account, I agree to the |
    #DTSP-441, Scenario 3:
    Then I check "RegistrationSubmit" is readonly
    #DTSP-441, Scenario 4: User clicks on the ‘Sign In’ link
    Then I click on "Sign In"
    Then I check I am on "Login" page
    #DTSP-441, Scenario 5: User views Terms and Conditions
    Then I click on "Create Account"
    Then I click on "Terms & Conditions"
    Then a new page "http://dbresults.com.au/terms/" is launched
    Given I want to login to portal "<PortalName>"
    Then I click on "Create Account"
    Then I click on "Register as a Tax Agent"
    Then I enter the details as
      | Fields                    | Value            |
      | InputTaxAgentABN          |      10000000313 |
      | InputTaxAgentBusinessName | Automated Tester |
      | BusinessAddress_Address1  | TEST             |
      | BusinessAddress_Address2  | TEST             |
      | BusinessAddress_Suburb    | TEST             |
      | BusinessAddress_Postcode  |             3333 |
    Then I select "Australia" from "BusinessAddress_CountryId"
    Then I click on button "TermsandConditionsCheckBox2"
    Then I click on button "RegistrationSubmit"
    Then I check I am on "Complete Registration" page
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName         |
      | item2 | First Name       |
      | item3 | Last Name        |
      | item5 | Phone Number     |
      | item5 | Email Address    |
      | item5 | Choose Username  |
      | item5 | Choose Password  |
      | item5 | Confirm Password |
      | item5 | Hint             |
    Then I enter the details as
      | Fields                       | Value             |
      | Registration_FirstName       | TEST              |
      | Registration_LastName        | TEST              |
      | Registration_PhoneNumber     |          33333333 |
      | Registration_Email           | TEST@asdfasdfafsd |
      | Registration_Username        | TeSTMANMAN        |
      | Registration_NewPassword     | Dbresults1        |
      | Registration_ConfirmPassword | Dbresults1        |
      | Registration_Hint            |              3333 |
    Then I check "Submit" is not readonly

    Examples: 
      | PortalName | UserName | Password   |
      | TSS        | jscott   | Dbresults1 |

  @done
  Scenario Outline: DTSP-459
    Given I want to login to portal "<PortalName>"
    Then I click on "Create Account"
    Then I check I am on "Registration" page
    #Scenario 1: User accesses the 'Registration Verification' page
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                               |
      | item2 | Australian Business Number (ABN)       |
      | item3 | Client Reference Number (CRN)          |
      | item5 | By creating an account, I agree to the |
    #Scenario 7: User clicks on the ‘Sign In’ link
    Then I click on "Sign In"
    Then I check I am on "Login" page
    #Scenario 8: User views Terms and Conditions
    Then I click on "Create Account"
    Then I click on "Terms & Conditions"
    Then a new page "http://dbresults.com.au/terms/" is launched
    Given I want to login to portal "<PortalName>"
    Then I click on "Create Account"
    #Scenario 3: User has not entered all the mandatory fields
    Then I check "RegistrationSubmit" is readonly
    #Scenario 2: User tries to enter incorrect input type into a restricted fields (e.g. entering ABC into a Number field)
    Then I enter the details as
      | Fields                  | Value |
      | InputABNNumber_Business | TEST  |
      | InputCRNNumber_Business | TEST  |
    Then I check "InputABNNumber_Business" is empty
    Then I check "InputCRNNumber_Business" is empty
    #Scenario 4: Registration details do not pass the frontend validation
    Then I enter the details as
      | Fields                  | Value |
      | InputABNNumber_Business |     3 |
      | InputCRNNumber_Business |     3 |
    Then I click on button "TermsandConditionsCheckBox"
    Then I click on button "RegistrationSubmit"
    Then I see text "Invalid ABN. ABN Should be 11 Digits. Please try again." displayed
    Then I see text "Invalid CRN. Please try again." displayed
    #Scenario 6: Registration details failed the verification with stubs
    Then I enter the details as
      | Fields                  | Value       |
      | InputABNNumber_Business | 33333333333 |
      | InputCRNNumber_Business |      333333 |
    Then I click on button "RegistrationSubmit"
    Then I wait for "1000" millisecond
    Then I see text "Invalid CRN, ABN or ACN. Please try again" displayed
    #Scenario 5: Registration details verified with stubs
    Then I enter the details as
      | Fields                  | Value       |
      | InputABNNumber_Business | 12345678949 |
      | InputCRNNumber_Business | 12345678949 |
    Then I click on button "RegistrationSubmit"
    Then I check I am on "Complete Registration" page

    Examples: 
      | PortalName | UserName | Password   |
      | TSS        | jscott   | Dbresults1 |

  

  @done
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
      | PortalName | UserNameField | PasswordField | UserName | Password   |
      | TSS        | UserNameInput | PasswordInput | jbradley | Dbresults1 |

  @done
  Scenario Outline: DTSP-463: Display all the mandatory fields with an Asterisk (*)
    #On hold until a clear standard for the mandatory field asterisks can be made
    #PART 1: Login Screen
    Given I want to login to portal "<PortalName>"
    Then I check "UserNameEmailLabel" has a CSS property "content" with value ""*""
    Then I check "PasswordLabel" has a CSS property "content" with value ""*""
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    And I click on "Payroll Tax Lodgement"
    Then I click on button "Discard"
    #Part 2: Payroll Tax (Annual)
    Then I click on "Payroll Tax Lodgement"
    Then I click on "Monthly Return"
    Then I click on button "NextSection"
    Then I select "2014" from "YearOfReturn"
    Then I select "January" from "MonthOfReturn"
    Then I check "YearOfReturnLabel" has a CSS property "content" with value ""*""
    Then I check "MonthOfReturnLabel" has a CSS property "content" with value ""*""
    Then I check "CurrentEmployerStatusLabel" has a CSS property "content" with value ""*""
    Then I click on "Designated group employer for a group and lodging for itself"
    Then I click on button "TaxPayerDetailsNext"
    Then I check "ClaimingACTProportion_Label" has a CSS property "content" with value ""*""
    Then I click on button "ClaimingACTProportion_Yes"
    Then I click on button "ACTWagesPaidNext"
    Then I check "AusWideWages" has a CSS property "content" with value ""*""
    Then I check "GroupActWages" has a CSS property "content" with value ""*""
    Then I enter the details as
      | Fields                       | Value |
      | PayrollAnswer_AustralianWide |     1 |
      | PayrollAnswer_GroupActWages  |    98 |
    Then I click on button "MonthlyReturnBack"
    Then I click on button "ACTWagesPaidNext"
    Then I click on button "MonthlyReturnNext"
    Then I check "PersonFullNameLabel" has a CSS property "content" with value ""*""
    Then I check "LegalEntityNameLabel" has a CSS property "content" with value ""*""
    Then I check "EmployerDeclarationLabel" has a CSS property "content" with value ""*""
    Then I check "PhoneNumberLabel" has a CSS property "content" with value ""*""
    Then I check "EmailAddressLabel" has a CSS property "content" with value ""*""
    And I enter the details as
      | Fields              | Value       |
      | PersonFullName      | test        |
      | LegalEntityName     | Test2       |
      | EmployerDeclaration | test        |
      | PhoneNumber         |  0422184033 |
      | EmailAddress        | abc@abc.com |
    Then I click on button "DeclarationBack"
    Then I click on button "MonthlyReturnNext"
    Then I click on button "DeclarationConfirm"
    Then I click on "Sign Out"
    #PART 3: Create Account (TODO Once labels have IDs)
    Given I want to login to portal "<PortalName>"
    Then I click on "Create Account"
    Then I click on button "TermsandConditionsCheckBox2"
    Then I check "InputAccountNumberLabel" has a CSS property "content" with value ""*""
    #Then I check "SelectBusinessType" has a CSS property "content" with value ""*""
    Then I click on button "RegistrationAsTaxAgent"
    Then I check "InputTaxAgentABNLabel" has a CSS property "content" with value ""*""
    Then I check "InputTaxAgentBusinessNameLabel" has a CSS property "content" with value ""*""
    Then I click on button "RegistrationAsBusiness"
    Then I enter the details as
      | Fields                  | Value       |
      | InputABNNumber_Business | 12345678949 |
      | InputCRNNumber_Business | 12345678949 |
    Then I click on button "RegistrationSubmit"
    Then I check "Registration_FirstNameLabel" has a CSS property "content" with value ""*""
    Then I check "Registration_LastNameLabel" has a CSS property "content" with value ""*""
    Then I check "Registration_EmailLabel" has a CSS property "content" with value ""*""
    Then I check "Registration_UsernameLabel" has a CSS property "content" with value ""*""
    Then I check "Registration_NewPasswordLabel" has a CSS property "content" with value ""*""
    Then I check "Registration_ConfirmPasswordLabel" has a CSS property "content" with value ""*""
    Then I check "Registration_HintLabel" has a CSS property "content" with value ""*""
    #PART 4: Tax Registration Form
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Payroll Tax Registration"
    Then I wait for "2000" millisecond
    Then I check "SelectBusinessType" has a CSS property "content" with value ""*""
    Then I check "EmployerName" has a CSS property "content" with value ""*""
    Then I check "BusinessTradingName" has a CSS property "content" with value ""*""
    Then I check "Label_AustralianBusinessNumber_ABN" has a CSS property "content" with value ""*""
    Then I check "Label_BusinessAdress_Country" has a CSS property "content" with value ""*""
    Then I check "Label_BusinessAddress_AddressLine1" has a CSS property "content" with value ""*""
    Then I check "Label_BusinessAdress_Suburb" has a CSS property "content" with value ""*""
    Then I check "Label_BusinessAdress_Territory" has a CSS property "content" with value ""*""
    Then I check "Label_BusinessAdress_Postcode" has a CSS property "content" with value ""*""
    #Then I check "Text_PostalAddress" has a CSS property "content" with value ""*""
    #Then I check "Text_AddresswhereBusinessRecordsarelocated_Jurisdi" has a CSS property "content" with value ""*""
    Then I check "Label_ContactPerson_Title" has a CSS property "content" with value ""*""
    Then I check "ContactPerson_FirstName" has a CSS property "content" with value ""*""
    Then I check "ContactPerson_LastName" has a CSS property "content" with value ""*""
    Then I check "Label_ContactPerson_ContactPhoneNumber" has a CSS property "content" with value ""*""
    Then I check "Label_ContactPerson_EmailAddress" has a CSS property "content" with value ""*""
    Then I check "Label_PreferedCommunicationMethod" has a CSS property "content" with value ""*""
    #Then I check "Label_PostalAddress" has a CSS property "content" with value ""*""
    Then I select "Company" from "SelectBusinessTypeCode"
    Then I select "Miss" from "ContactPerson_Title"
    Then I select "SMS" from "CommunicationMethodId"
    Then I enter the details as
      | Fields                    | Value              |
      | EmployerName              | DB RESULTS PTY LTD |
      | BusinessTradingName       | DB RESULTS PTY LTD |
      | RegistrationAnswer_ABN    |        97110187767 |
      | RegistrationAnswer_ACN    |          110187767 |
      | AddressLine1              | TEST               |
      | Address_City              | TEST               |
      | PostCode                  |               3333 |
      | ContactPerson_FirstName   | TEST               |
      | ContactPerson_LastName    | TEST               |
      | ContactPerson_PhoneNumber |           33333333 |
      | ContactPerson_Email       | TEST@TEST          |
    #Then I select "AL" from "Address_State"
    Then I select "Other" from "SelectBusinessTypeCode"
    Then I click on "TaxPayerDetailsNext"
    Then I check "Label_BusinessActivityCategory" has a CSS property "content" with value ""*""
    Then I wait for "2000" millisecond
    Then I click on "ACTWagesPaidNext"
    Then I wait for "2000" millisecond
    Then I check "Label_DateBusinessCommencedEmployinginACT" has a CSS property "content" with value ""*""
    Then I check "Label_DateBusinessBecameLiableintheACT" has a CSS property "content" with value ""*""
    Then I check "Label_NumberofEmployeesinyourACTBusiness" has a CSS property "content" with value ""*""
    #Then I see text "Are you a member of a group?*" displayed
    Then I check "Label_Asaneligibleemployer_doyouwishtoapplyforannu" has a CSS property "content" with value ""*""
    Then I check "Label_AnnualLodgementRequestJustification" has a CSS property "content" with value ""*""
    #Then I check "Text_ContactPersonforPayrollTax" has a CSS property "content" with value ""*""
    Then I click on "DateBusinessStart"
    Then I click on "20170206"
    Then I click on "DateBusinessLiable"
    Then I click on "20170207"
    Then I enter the details as
      | Fields               | Value |
      | NumberOfEmployees    |    33 |
      | RequestJustification | TEST  |
    Then I click on "GroupMember_UNSURE"
    Then I click on button "AnnualLodgementApproval_NO"
    Then I click on "PayrollNext"
    Then I wait for "2000" millisecond
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                        |
      | item2 | Set Up Bank Account for Refunds |
      | item3 | BSB                             |
      | item4 | Bank Account Number             |
    Then I check "Label_BSB" has a CSS property "content" with value ""*""
    Then I check "Label_BankAccountNumber" has a CSS property "content" with value ""*""
    Then I check "Label_BankAccountName" has a CSS property "content" with value ""*""
    Then I click on button "Refunds_NO"
    Then I click on button "RefundDetailsNext"
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                                                                         |
      | item2 | Declaration                                                                      |
      | item3 | Declarer                                                                         |
      | item5 | I declare that this information is true and correct to the best of my knowledge. |
    Then I check "Label_Declarer" has a CSS property "content" with value ""*""
    Then I check "Label_Organisation" has a CSS property "content" with value ""*""
    Then I check "Label_Employer" has a CSS property "content" with value ""*""
    Then I check "Label_ContactPhone" has a CSS property "content" with value ""*""
    Then I check "Label_EmailAdress" has a CSS property "content" with value ""*""

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password   | CRN         | ABN         |
      | TSS        | UserNameInput | PasswordInput | jbradley | Dbresults1 | 12121212121 | 21212121212 |

 
      
  @done
   Scenario Outline: DTSP-508: As an end user, I want to see a reminder message on the top of the Payroll Tax Registration form so I know I cannot save an incomplete form
  Given I want to login to portal "<PortalName>"
  And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
  And I hit Enter
  Then I click on "Payroll Tax Registration"
  Then I see text "Because you are not logged in, you cannot save an incomplete form for later. Please complete your form and submit it before closing your session" displayed
  Examples:
      | PortalName | UserName | Password   |
      | TSS        | jbradley | Dbresults1 |
  #@review
  #Scenario Outline: DTSP-8
    # REMEMBER TO WAIT FOR FIVE MINUTES BETWEEN EACH RUN OF THIS SCENARIO
    #Given I want to login to portal "<PortalName>"
    #And I enter the details as
      #| Fields        | Value      |
      #| UserNameInput | <UserName> |
      #| PasswordInput | WRONG      |
    #Then I hit Enter
    #And I enter the details as
      #| Fields        | Value      |
      #| UserNameInput | <UserName> |
      #| PasswordInput | WRONG      |
    #Then I hit Enter
    #Then I see text "Password Hint" displayed
    #Then I see text "<Password>" displayed
#
    #Examples: 
      #| PortalName | UserNameField | PasswordField | UserName | Password   |
      #| TSS        | UserNameInput | PasswordInput | jscott   | Dbresults1 |
#
  #@review
  #Scenario Outline: DTSP-13, DTSP-14
    #Scenario 2: Reset Password link has expired
    #Given I want to login to portal "ExpiredPassword"
    #Then I see text "Reset Password Link Invalid" displayed
    #Then I see text "Sorry, the link is not valid." displayed
    #Then I see text "Please click the Reset Password button again in the email or click the button below." displayed
    #Then I click on button "ResetPasswordInvalidButton"
    #Then I check I am on "Forgot Your Password?" page
    #Then I see text "Forgot Your Password?" displayed
    #Scenario 3
    #Given I want to login to portal "InvalidPasswordLink"
    #Then I see text "The page cannot be found. Please make sure you typed the URL correctly." displayed
#
    #Examples: 
      #| PortalName | UserNameField | PasswordField | UserName | Password   | CRN         | ABN         |
      #| TSS        | UserNameInput | PasswordInput | jscott   | Dbresults1 | 12345678901 | 12345678901 |
