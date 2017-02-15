Feature: WIP

  @wip
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
      | item5 | Registered Business Name                 |
      | item5 | Registered Business Address                       |
      | item5 | Country                                |
      | item5 | Address Line 1                         |
      | item5 | Address Line 2                         |
      | item5 | Suburb / City                          |
      | item5 | Territory / State                      |
      | item5 | Postcode                               |
      | item5 | By creating an account, I agree to the |
    #DTSP-441, Scenario 3:
    Then I check "RegistrationSubmit" is readonly
    #DTSP-441, Scenario 4: User clicks on the â€˜Sign Inâ€™ link
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
      | InputTaxAgentABN          |      92622632200 |
      | InputTaxAgentBusinessName | GANG LE TANG     |
      | BusinessAddress_Address1  | TEST             |
      | BusinessAddress_Address2  | TEST             |
      | BusinessAddress_Suburb    | TEST             |
      | BusinessAddress_Postcode  |             3333 |
      And I select "Victoria" from "StateIdLabel"
    #Then I select "Australia" from "BusinessAddress_CountryId"
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

 