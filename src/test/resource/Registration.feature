Feature: this is just a wip

  @wip
  Scenario Outline: DCSSP-413 User already have account
    Given I want to login to portal "<PortalName>"
    And I click on "Sign In Link"
    And I see "<Some Page>"
    Then "<Item>" is displayed as "<ItemName>"

    Examples: 
      | Some Page |
      | Login     |

  @wip
  Scenario Outline: DCSSP-413 As a user I want the portal to validate the account details I've entered so that I know I've registered the correct account.
    Given I want to login to portal "<PortalName>"
    And I click on "<LinkName>"
    And I see "<Some Page>"
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                 |
      | Item1 | Account Number           |
      | item1 | Full Name                |
      | Item2 | Logo                     |
      | Date  | SSN                      |
      | Item  | SUBMIT                   |
      | Item  | Already have an Account? |
      | Item  | Sign In                  |
    And user registers using "<Account Number>" , "<Full Name>" and "<SSN>"
    And I click on "Submit"
    Then I view message "some wait message"
    Then I view message "<some message>"

    Examples: 
      | PortalName | LinkName       | Some Page | Account Number      | Full Name            | SSN         | some message                                       |
      | CSS        | Create Account | Some Page | wrong UserNameInput | correctPasswordInput | correct Bob | Account details cannot be found. Please try again. |
      | CSS        | Create Account | Some Page | c UserNameInput     | w PasswordInput      | c Bob       | Account details cannot be found. Please try again. |
      | CSS        | Create Account | Some Page | c UserNameInput     | c PasswordInput      | w Bob       | Account details cannot be found. Please try again. |
      | CSS        | Create Account | Some Page | c UserNameInput     | c PasswordInput      | c Bob       | xyz                                                |

  @wip
  Scenario Outline: DCSSP-414 Account verified, Registration page checks
    Given I want to login to portal "<PortalName>"
    And I click on "<LinkName>"
    And I see "<Some Page>"
    And user registers using "<Account Number>" , "<Full Name>" and "<SSN>"
    And I click on "Submit"
    Then I view message "<some message>"
    And And I see "<Some Page2>"
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                 |
      | Item1 | Logo                     |
      | item1 | First Name               |
      | item1 | Last Name                |
      | item1 | Email Address            |
      | item1 | Choose User name          |
      | item1 | Choose Password          |
      | item1 | Confirm Password         |
      | item1 | Hint                     |
      | item1 | Language Preference      |
      | item1 | Cancel                   |
      | item1 | SUBMIT                   |
      | Item  | Sign In                  |
      | Item  | Already have an Account? |
    And I click on "PassWord Question Mark"
    Then I see "Password must contain the following:" displayed
    And I click on "<Hint Question Mark>"
    Then I see "Setting up a hint will help you if you ever forget your password" displayed
    And I click on "Sign In Link"
    And I see "<Some Page2>"

    Examples: 
      | PortalName | LinkName       | Some Page                 | Account Number  | Full Name       | SSN   | some message | Some Page2    | Some Page2 | PassWord Question Mark |
      | CSS        | Create Account | Registration User Details | c UserNameInput | c PasswordInput | c Bob | xyz          | Registerpage2 | Login      | Question Mark          |

  @wip
  Scenario Outline: DCSSP-414 Account verified, Registration page mandatory fields, Also covers cancellation DCSSP-415
    Given I want to login to portal "<PortalName>"
    And I click on "<LinkName>"
    And I see "<Some Page>"
    And user registers using "<Account Number>" , "<Full Name>" and "<SSN>"
    And I click on "Submit"
    Then I view message "<some message>"
    And And I see "user registration page"
    And I click on "Submit"
    Then I view message "Email address already exists. Please try again."
    Then I view message "Username already exists. Please try again"
    Then I view message "Invalid Password. Please try again."
    Then I view message "Passwords do not match. Please try again"
    And I click on "Cancel"
    And I see "<Login Page>"

    Examples: 
      | PortalName | LinkName       | Some Page                 | Account Number  | Full Name       | SSN   |
      | CSS        | Create Account | Registration User Details | c UserNameInput | c PasswordInput | c Bob |

  Scenario Outline: DCSSP-414 Account verified, Registration page mandatory fields, Also covers cancellation DCSSP-415
    Given I want to login to portal "<PortalName>"
    And I click on "<LinkName>"
    And I see "<Some Page>"
    And user registers using "<Account Number>" , "<Full Name>" and "<SSN>"
    And I click on "Submit"
    And And I see "user registration page"
    And I enter then details as
      | Fields     | Value        |
      | First Name | <First Name> |
      | Last name  | <last name>  |
    And I click on "Cancel"
    Then I view message "Are you sure you want to discard changes made?"
    And I click on "No"
    And I see "User rego page"
    And I click on "Cancel"
    Then I view message "Are you sure you want to discard changes made?"
    And I click on "Yes"
    And I see "<Login Page>"

    Examples: 
      | PortalName | LinkName       | Some Page                 | Account Number  | Full Name       | SSN   |
      | CSS        | Create Account | Registration User Details | c UserNameInput | c PasswordInput | c Bob |

  @wip
  Scenario Outline: DCSSP-431 As a user I want to know if my account has been activated so that I know I completed the registration process
    Given I want to login to portal "<PortalName>"
    And I click on "<LinkName>"
    And I see "<Some Page>"
    And user registers using "<Account Number>" , "<Full Name>" and "<SSN>"
    And I click on "Submit"

    Examples: 
      | PortalName | LinkName       | Some Page                 | Account Number  | Full Name       | SSN   |
      | CSS        | Create Account | Registration User Details | c UserNameInput | c PasswordInput | c Bob |

  ##########################################################################################################################
  ##########################################################################################################################
  ############################                   User Profile Settings                        ##############################
  ##########################################################################################################################
  ##########################################################################################################################
  @wip
  Scenario Outline: DCSSP-236, In continuation of test cases above, check if user data (entered above) is diplayed and edited with addition of new fields.
    Given I want to login to portal "<PortalName>"
    And user is logged using "<UserNameField>" and "<PasswordField>" as "<UserName>" and "<Password>"
    And I hit Enter
    And I click on "Settings"
    And I check I am on "Usage History" page
    Then "<fieldName>" contains "<fieldValue>" ///add steps
      | fieldName  | fieldValue   |
      | First Name | <first Name> |
    Examples: 
      | PortalName | LinkName       | Some Page                 | Account Number  | Full Name       | SSN   |
      | CSS        | Create Account | Registration User Details | c UserNameInput | c PasswordInput | c Bob |
