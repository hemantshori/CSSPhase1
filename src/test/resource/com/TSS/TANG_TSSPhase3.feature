#Author: your.email@your.domain.com
#Keywords Summary :
#Feature: List of scenarios.
#Scenario: Business rule through list of steps with arguments.
#Given: Some precondition step
#When: Some key actions
#Then: To observe outcomes or validation
#And,But: To enumerate more Given,When,Then steps
#Scenario Outline: List of steps for data-driven as an Examples and <placeholder>
#Examples: Container for s table
#Background: List of steps run before each of the scenarios
#""" (Doc Strings)
#| (Data Tables)
#@ (Tags/Labels):To group Scenarios 
#<> (placeholder)
#""
## (Comments)

#Sample Feature Definition Template
Feature: Stuff for TSS Phase 3
  @done
  Scenario Outline: DTSP-401: As an end user, I should not be able to view/select the 'Return Type' section on the Payroll Tax Lodgement forms when I am on subsequent sections after clicking 'Next'
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    And I click on "Payroll Tax"
    Then I click on "Cancel"
    Then I click on "Payroll Tax"
    Then I click on "Answer_TypeAnnual"
    Then I click on button "NextSection"
    Then I click on button "ACTWagesPaidBackBt2"
    Then I check "PayrollAnswer_TypeAnnual" is readonly

    Examples: 
      | PortalName | UserName | Password   |
      | TSS        | jscott   | Dbresults1 |
    
    
    @review
  Scenario Outline: DTSP-8
  # REMEMBER TO WAIT FOR FIVE MINUTES BETWEEN EACH RUN OF THIS SCENARIO
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | WRONG      |
    Then I hit Enter
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | WRONG      |
    Then I hit Enter
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | WRONG      |
    Then I hit Enter
    Then I see text "Password Hint" displayed
    Then I see text "<Password>" displayed
    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password   | 
      | TSS        | UserNameInput | PasswordInput | jscott   | Dbresults1 |

  @review
  Scenario Outline: DTSP-13, DTSP-14
    #Scenario 2: Reset Password link has expired
    Given I want to login to portal "ExpiredPassword"
    Then I see text "Reset Password Link Invalid" displayed
    Then I see text "Sorry, the link is not valid." displayed
    Then I see text "Please click the Reset Password button again in the email or click the button below." displayed
    Then I click on button "ResetPasswordInvalidButton"
    Then I check I am on "Forgot Your Password?" page
    Then I see text "Forgot Your Password?" displayed
    #Scenario 3
    Given I want to login to portal "InvalidPasswordLink"
    Then I see text "The page cannot be found. Please make sure you typed the URL correctly." displayed

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password   | CRN         | ABN         |
      | TSS        | UserNameInput | PasswordInput | jscott   | Dbresults1 | 12345678901 | 12345678901 |

  @review
  Scenario Outline: DTSP-25: As an organisation I want a user's details verified during registration so that only valid users register with the portal (page 1)
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
    #Scenario 5
    Then I click on "Create Account"
    Then I click on "Terms & Conditions"
    Then a new page "http://dbresults.com.au/terms/" is launched
    Then I check I am on "Terms of Use | DB Results - Digital Business specialists" page
    Then I see text "Terms of Use" displayed
    Given I want to login to portal "<PortalName>"
    And I click on "Create Account"
    #Scenario 3
    Then I enter the details as
      | Fields                     | Value     |
      | InputAccountNumber         | 33333333333333333333333333333333333333333333333333      |
      | InputBillName              | 33333333333      |
      | InputIdentificationNumber  | 333333333 |
    Then I click on button "RegistrationSubmit"
    Then I see text "You must accept the Terms and Conditions to proceed" displayed
    Then I click on button "TermsandConditionsCheckBox"
    Then I click on button "RegistrationSubmit"
    Then I see text "Account details cannot be found. Please try again." displayed
    Then I enter the details as
      | Fields                     | Value       |
      | InputAccountNumber         | 12345678961 |
      | InputBillName              | 12345678961 |
      | InputIdentificationNumber  | 12345678961 |
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
      | item7 | Language Preference      |
      | item7 | Already have an account? |
    #Scenario 4: User cancels with unsaved changes
    Then I click on button "Cancel"
    Then I check I am on "Login" page
    Given I want to login to portal "<PortalName>"
    And I click on "Create Account"
    Then I enter the details as
      | Fields                     | Value       |
      | InputAccountNumber         | 12345678961 |
      | InputBillName              | 12345678961 |
      | InputIdentificationNumber  | 12345678961 |
    Then I click on button "RegistrationSubmit"
    Then I click on button "TermsandConditionsCheckBox"
    Then I check I am on "Registration" page
    Then I click on button "Submit"
    Then I see text "Required field" displayed
    #Scenario 3: Details entered do not pass validation (Can't fully complete on this due to WIP done on the page)
    Then I enter the details as
      | Fields                | Value       |
      | Registration_Email    | 12345678961 |
      | Registration_Username | 12345678961 |
      | NewPassword           | 12345678961 |
      | Registration_Hint     | 12345678961 |
    Then I click on button "Submit"
    Then I see text "Invalid email address. Please try again." displayed
    #Scenario 5: User cancels with unsaved changes
    Then I click on button "Cancel"
    Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "Cancel"
    Then I check I am on "Registration" page
    Then I click on button "Cancel"
    Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "OK"
    Then I check I am on "Login" page

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password   | CRN         | ABN         |
      | TSS        | UserNameInput | PasswordInput | jscott   | Dbresults1 | 12345678901 | 12345678901 |

  @review
  Scenario Outline: DTSP-32: As an end user, I want to activate my portal account so that I can log into the portal to access the self service features
    #Scenario 3: User account is already activated
    Given I want to login to portal "ExpiredActivation"
    Then I check I am on "Account Already Activated" page
    Then I see text "Account Already Activated" displayed
    Then I see text "Your account has already been activated. Please click the button below." displayed
    Then I click on button "SubmitButton3"
    Then I see text "The page cannot be found. Please make sure you typed the URL correctly." displayed
    
    #TODO: Ask Christian to add an id to the SIGN IN button
    #Scenario 3
    Given I want to login to portal "InvalidActivation"
    Then I see text "The page cannot be found. Please make sure you typed the URL correctly." displayed

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password   | CRN         | ABN         |
      | TSS        | UserNameInput | PasswordInput | jscott   | Dbresults1 | 12345678901 | 12345678901 |