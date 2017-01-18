Feature: wip

  @done
  Scenario Outline: DTSP-7: As an end user, I want to be able to log into the portal using my portal credentials, so that I can access self service related functions
    #scenario 1: Same year check
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
    And I hit Enter
    #scenario 1: Scenario 1: Mandatory fields not filled in
    Then I see text "Required field!" displayed
    #scenario 3:
    And I enter the details as
      | Fields        | Value     |
      | UserNameInput | WRONG     |
      | PasswordInput | ALSOWRONG |
    And I hit Enter
    Then I see text "Invalid Username, Email or Password. Please try again." displayed
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    And I check I am on "HomePage" page

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password   | CRN         | ABN         |
      | TSS        | UserNameInput | PasswordInput | jscott   | Dbresults1 | 12345678901 | 12345678901 |

  @done
  Scenario Outline: DTSP-378: As a user I want the ability to enter my business details on the Tax Registration form so that I can register for Payroll Tax
    Given I want to login to portal "<PortalName>"
    And I check I am on "Tax Registration Form" page
    Then I wait for "2000" millisecond
    Then "<Item>" is displayed as "<ItemName>"
      #Scenario 1 (Part 1): User views the registration form
      | Item   | ItemName                                                  |
      | item2  | Select Business Type                                      |
      | item3  | Employer Name                                             |
      | item4  | Business Trading Name                                     |
      | item5  | Australian Business Number (ABN)                          |
      | item6  | Australian Company Name (ACN)                             |
      | item7  | Business Address                                          |
      | item7  | Country                                                   |
      | item7  | Address Line 1                                            |
      | item7  | Address Line 2                                            |
      | item7  | Suburb / City                                             |
      | item7  | Territory / State                                         |
      | item7  | Postcode                                                  |
      | item7  | Postal Address                                            |
      | item7  | Address where Business Records are located (Jurisdiction) |
      | item7  | Contact Person                                            |
      | item7  | Title                                                     |
      | item7  | First Name                                                |
      | item7  | Last Name                                                 |
      | item7  | Contact Phone Number                                      |
      | item7  | Email                                                     |
      | item7  | Prefered Communication Method                             |
      | item7  | Postal Address                                            |
      | item 7 | Next                                                      |
    #Scenario 2: User has a different postal address than business address (element 16)
    Then I see checkbox "CheckBusinessAdress" as selected
    Then I click on button "CheckBusinessAdress"
    Then I check "Address_AddressLine3" is empty
    Then I check "Address_AddressLine4" is empty
    Then I check "Address_City2" is empty
    Then I check "Address_PostCode2" is empty
    #Scenario 3: User has a different business records address than business address (element 17)
    Then I see checkbox "CheckSameAsJurisdiction" as selected
    Then I click on button "CheckSameAsJurisdiction"
    Then I check "Address_AddressLine5" is empty
    Then I check "Address_AddressLine6" is empty
    Then I check "Address_City3" is empty
    Then I check "Address_PostCode3" is empty
    #Scenario 4: User has a different contact person address than business address (element 25)
    Then I see checkbox "ContactPerson_PostalAddressId" as selected
    Then I click on button "ContactPerson_PostalAddressId"
    Then I check "Address_AddressLine7" is empty
    Then I check "Address_AddressLine8" is empty
    Then I check "Address_City4" is empty
    Then I check "Address_PostCode4" is empty
    #Scenario 1 (PART 2);
    Then I click on button "CheckBusinessAdress"
    Then I click on button "CheckSameAsJurisdiction"
    Then I click on button "ContactPerson_PostalAddressId"
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
    Then I select "Other" from "SelectBusinessTypeCode"
    Then I click on button "TaxPayerDetailsNext"
    Then I wait for "2000" millisecond
    Then "<Item>" is displayed as "<ItemName>"
      #Scenario 1 (Part 2): User views the registration form
      | Item  | ItemName                                         |
      | item2 | Business Activity Details                        |
      | item3 | Business Activity Elsewhere in Australia         |
      | item4 | Business Activity Category                       |
      | item5 | Control and Financial Interest                   |
      | item6 | (shares, beneficiaries if greater than 20% each) |
      | item7 | Relationship Type                                |

    Examples: 
      | PortalName       | UserNameField | PasswordField | UserName | Password  | CRN         | ABN         |
      | Tax_Registration | UserNameInput | PasswordInput | mbrown   | dbresults | 12345678901 | 12345678901 |

  @done
  Scenario Outline: DTSP-379: As a user I want the ability to enter my Business Activity Details on the Tax Registration form so that I can register for Payroll Tax
    Given I want to login to portal "<PortalName>"
    And I check I am on "Tax Registration Form" page
    Then I wait for "2000" millisecond
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
    Then I select "Other" from "SelectBusinessTypeCode"
    Then I click on button "TaxPayerDetailsNext"
    Then I wait for "2000" millisecond
    #Scenario 1: User views Business Activity Details details
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                                         |
      | item2 | Business Activity Details                        |
      | item3 | Business Activity Elsewhere in Australia         |
      | item4 | Business Activity Category                       |
      | item5 | Control and Financial Interest                   |
      | item6 | (shares, beneficiaries if greater than 20% each) |
      | item7 | Relationship Type                                |
    #Scenario 2: User navigates to the previous section
    Then I click on button "ACTWagesPaidBackBt"
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                                                  |
      | item2 | Select Business Type                                      |
      | item3 | Employer Name                                             |
      | item4 | Business Trading Name                                     |
      | item5 | Australian Business Number (ABN)                          |
      | item6 | Australian Company Name (ACN)                             |
      | item7 | Address where Business Records are located (Jurisdiction) |
      | item7 | Prefered Communication Method                             |
      | item7 | Postal Address                                            |
      | item7 | Next                                                      |
    Then I click on button "TaxPayerDetailsNext"
    # Scenario 4: User adds another control and financial interest contact
    Then I wait for "2000" millisecond
    #Then I select "Mrs." from "wtControlAndFinancialInterestTitle"
    Then I enter the details as
      | Fields                                | Value |
      | ControlAndFinancialInterest_FirstName | TEST  |
      | ControlAndFinancialInterest_LastName  | TEST  |
    Then I select "Account Manager" from "ControlAndFinancialInterestRelationshipType"
    Then I select "Miss" from "ControlAndFinancialInterestTitle"
    Then I click on button "AddControlFinancialInterestButton"
    Then I wait for "2000" millisecond
    #doesn't seem to be a way to differentiate between already added records and the record input fields
    Then "ControlAndFinancialInterestListRecord$ctl00$wt7$wtControlAndFinancialInterestTitle" displays "Miss" by default
    Then I check "ControlAndFinancialInterestListRecord_ctl00_wt7_wtControlAndFinancialInterest_FirstName" contains "TEST"
    Then I check "ControlAndFinancialInterestListRecord_ctl00_wt7_wtControlAndFinancialInterest_LastName" contains "TEST"
    Then "ControlAndFinancialInterestListRecord$ctl00$wt7$wtControlAndFinancialInterestRelationshipType" displays "Account Manager" by default
    Then I see text "Remove" displayed
    #Scenario 5: User removes a control and financial interest contact
    Then I click on "Remove"
    Then I see "Are you sure you want to remove this contact?" displayed on popup and I click "Cancel"
    Then I click on "Remove"
    Then I see "Are you sure you want to remove this contact?" displayed on popup and I click "OK"
    #Scenario 3: User navigates to the next section
    Then I click on button "ACTWagesPaidNext"
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                                                                     |
      | item2 | Business Activity in the ACT                                                 |
      | item3 | Date Business Commenced Employing in ACT                                     |
      | item4 | Date Business Became Liable in the ACT (or                                   |
      | item5 | Number of Employees in your ACT Business                                     |
      | item6 | Grouping for Payroll Tax Purposes                                            |
      | item7 | Are you a member of a group?                                                 |
      | item7 | As an eligible employer, do you wish to apply for annual lodgement approval? |
      | item7 | Annual Lodgement Request Justification                                       |
      | item7 | Contact Person for Payroll Tax                                               |

    Examples: 
      | PortalName       | UserNameField | PasswordField | UserName | Password  | CRN         | ABN         |
      | Tax_Registration | UserNameInput | PasswordInput | mbrown   | dbresults | 12345678901 | 12345678901 |

  @done
  Scenario Outline: DTSP-381: As a user I want the ability to enter my refund details on the Tax Registration form so that I can register for Payroll Tax, DTSP-382: As a user I want the ability to complete the declaration on the Tax Registration form so that I can register for Payroll Tax
    Given I want to login to portal "<PortalName>"
    And I check I am on "Tax Registration Form" page
    Then I wait for "2000" millisecond
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
    Then I wait for "2000" millisecond
    Then I click on "ACTWagesPaidNext"
    Then I wait for "2000" millisecond
    Then I click on "DateBusinessStart"
    Then I click on "20170102"
    Then I click on "DateBusinessLiable"
    Then I click on "20170103"
    Then I enter the details as
      | Fields               | Value |
      | NumberOfEmployees    |    33 |
      | RequestJustification | TEST  |
    Then I click on "GroupMember_UNSURE"
    Then I click on "PayrollNext"
    Then I wait for "2000" millisecond
    #381 Scenario 1: User views Refund details
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                        |
      | item2 | Set Up Bank Account for Refunds |
      | item3 | BSB                             |
      | item4 | Bank Account Number             |
    Then I click on button "ConfirmBack"
    Then I wait for "2000" millisecond
    #381 Scenario 2: User navigates to the previous section
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                                                                     |
      | item2 | Business Activity in the ACT                                                 |
      | item3 | Date Business Commenced Employing in ACT                                     |
      | item4 | Date Business Became Liable in the ACT (or                                   |
      | item5 | Number of Employees in your ACT Business                                     |
      | item6 | Grouping for Payroll Tax Purposes                                            |
      | item7 | Are you a member of a group?                                                 |
      | item7 | As an eligible employer, do you wish to apply for annual lodgement approval? |
      | item7 | Annual Lodgement Request Justification                                       |
      | item7 | Contact Person for Payroll Tax                                               |
    Then I click on "PayrollNext"
    #381 Scenario 3: User navigates to the next section
    Then I click on button "Refunds_NO"
    Then I click on button "RefundDetailsNext"
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                                                                         |
      | item2 | Declaration                                                                      |
      | item3 | Declarer                                                                         |
      | item5 | I declare that this information is true and correct to the best of my knowledge. |
    #382 Scenario 1: User does not check Declaration
    Then I see checkbox "CorrectInfoDeclared" as not selected
    Then I check "DeclarationNext" is readonly

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
  #@wip
  #Scenario Outline: DTSP-9: As an end user I want my portal account locked after a number of unsuccessful login attempts so that unathorised users cannot access my portal account
    #scenario 1: Same year check
    #Given I want to login to portal "<PortalName>"
    #And I enter the details as
      #| Fields        | Value     |
      #| UserNameInput | <UserName>        |
      #| PasswordInput | ALSOWRONG |
    #And I hit Enter
    #And I enter the details as
      #| Fields        | Value     |
      #| UserNameInput | <UserName>        |
      #| PasswordInput | ALSOWRONG |
    #And I hit Enter
    #And I enter the details as
      #| Fields        | Value     |
      #| UserNameInput | <UserName>        |
      #| PasswordInput | ALSOWRONG |
    #And I hit Enter
    #And I enter the details as
      #| Fields        | Value     |
      #| UserNameInput | <UserName>        |
      #| PasswordInput | ALSOWRONG |
    #And I hit Enter
    #And I enter the details as
    #| Fields        | Value     |
    #| UserNameInput | <UserName>        |
    #| PasswordInput | ALSOWRONG |
    #And I hit Enter
    #Then I check I am on "Locked Account" page
    #Given I want to login to portal "<PortalName>"
    #And I enter the details as
      #| Fields        | Value     |
      #| UserNameInput | bob       |
      #| PasswordInput | ALSOWRONG |
    #And I hit Enter
    #Then I check I am on "Locked Account" page
    #scenario 1: Scenario 1: Mandatory fields not filled in
    #Then I check I am on "Locked Account" page
#
   # scenario 3:
    #And I enter the details as
    #| Fields        | Value     |
    #| UserNameInput | WRONG     |
    #| PasswordInput | ALSOWRONG |
    #And I hit Enter
    #Then I see text "Invalid Username, Email or Password. Please try again." displayed
    #And I enter the details as
    #| Fields        | Value      |
    #| UserNameInput | <UserName> |
    #| PasswordInput | <Password> |
    #And I hit Enter
    #And I check I am on "HomePage" page
    #Examples: 
      #| PortalName | UserNameField | PasswordField | UserName | Password  | CRN         | ABN         |
      #| TSS        | UserNameInput | PasswordInput | jscott   | Dbresults1 | 12345678901 | 12345678901 |
