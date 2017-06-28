#Sample Feature Definition Template
@wip
Feature: WORK IN PROGRESS

  @redo
  Scenario Outline: DTSP-526, 531: Update the ABN LookUp Rules for Payroll Tax Registration Form / Update the first page of the Portal Registration process
    Given I want to login to portal "<PortalName>"
    #This user has the ABN 12345678933, but since it's a tax agent user it isn't shown in the lodgement form
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Payroll Tax Registration"
    And I enter the details as
      | Fields                 | Value       |
      | RegistrationAnswer_ABN | 85613104316 |
    Then I click on button with value "Next"
    Then I wait for "4000" millisecond
    Then I select "Other" from "SelectBusinessTypeCode"
    #Then I select "Mr" from "ContactPerson_Title"
    #Then I select "Direct Post" from "CommunicationMethodId"
    #Then I select "Other" from "SelectBusinessTypeCode"
    #Then I enter the details as
    #| Fields                    | Value         |
    #| Address_AddressLine1      | TEST          |
    #| Address_City              | TEST          |
    #| PostCode                  |          3333 |
    #| ContactPerson_FirstName   | TEST          |
    #| ContactPerson_LastName    | TEST          |
    #| ContactPerson_PhoneNumber |     333333333 |
    #| ContactPerson_Email       | test@test.com |
    #Scenario 7: ABN Lookup for Inactive ABN
    Then I enter the details as
      | Fields              | Value                |
      | EmployerName        | CODAVALLI, AARADHANA |
      | BusinessTradingName | CODAVALLI, AARADHANA |
    Then I click on button "TaxPayerDetailsNextBT"
    Then I wait for "4000" millisecond
    Then I see text "Your ABN is not valid. Please enter a valid ABN." displayed
    Then I click on "Payroll Tax Registration"
    Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "OK"
    #Then I click on button "EmployerName"
    #Then I click on button "TaxPayerDetailsNext"
    #Scenario 8:ABN Lookup for Invalid ABN
    And I enter the details as
      | Fields                 | Value       |
      | RegistrationAnswer_ABN | 99999999999 |
    Then I click on button with value "Next"
    Then I wait for "4000" millisecond
    Then I select "Other" from "SelectBusinessTypeCode"
    Then I enter the details as
      | Fields              | Value |
      | EmployerName        | TEST  |
      | BusinessTradingName | TEST  |
    Then I click on button "TaxPayerDetailsNextBT"
    Then I wait for "4000" millisecond
    Then I see text "Your ABN is not valid. Please enter a valid ABN." displayed
    Then I click on "Payroll Tax Registration"
    Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "OK"
    #Scenario 6: ABN Lookup for Tax Agent with an active ABN, incorrect Registered Business Name, and Entity Type is not 'Individual'
    And I enter the details as
      | Fields                 | Value |
      | RegistrationAnswer_ABN | <ABN> |
    Then I click on button with value "Next"
    Then I wait for "4000" millisecond
    Then I select "Other" from "SelectBusinessTypeCode"
    Then I enter the details as
      | Fields              | Value                       |
      | EmployerName        | The Fire Company Pty Limite |
      | BusinessTradingName | The Fire Company Pty Limite |
    Then I click on button "RegistrationAnswer_ACN"
    Then I wait for "4000" millisecond
    Then I click on button "TaxPayerDetailsNextBT"
    Then I wait for "4000" millisecond
    Then I see text "Your Organisation Name doesn't match with your ABN. Please try again." displayed
    Then I click on "Payroll Tax Registration"
    Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "OK"
    #Scenario 4: ABN Lookup for Tax Agent with an active ABN, incorrect Registered Business Name, and Entity Type = Individual
    And I enter the details as
      | Fields                 | Value       |
      | RegistrationAnswer_ABN | 71583328324 |
    Then I click on button with value "Next"
    Then I wait for "4000" millisecond
    Then I enter the details as
      | Fields              | Value          |
      | EmployerName        | PSALTIS, COSMA |
      | BusinessTradingName | PSALTIS, COSMA |
    Then I select "Other" from "SelectBusinessTypeCode"
    Then I click on button "TaxPayerDetailsNextBT"
    Then I wait for "4000" millisecond
    Then I see text "Your Organisation Name doesn't match with your ABN. Please try again." displayed
    Then I click on "Payroll Tax Registration"
    Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "OK"
    #Scenario 3: ABN Lookup for Tax Agent with an active ABN, correct Registered Business Name, and Entity Type = Individual
    And I enter the details as
      | Fields                 | Value       |
      | RegistrationAnswer_ABN | 71583328324 |
    Then I click on button with value "Next"
    Then I wait for "4000" millisecond
    Then I enter the details as
      | Fields              | Value           |
      | EmployerName        | PSALTIS, COSMAS |
      | BusinessTradingName | PSALTIS, COSMAS |
    Then I select "Other" from "SelectBusinessTypeCode"
    Then I click on button "TaxPayerDetailsNextBT"
    Then I enter the details as
      | Fields                    | Value      |
      | AddressLine1              | TEST       |
      | Address_City              | TEST       |
      | PostCode                  |       3333 |
      | ContactPerson_FirstName   | TEST       |
      | ContactPerson_LastName    | TEST       |
      | ContactPerson_PhoneNumber | 1234567890 |
    Then I click on "Payroll Tax Registration"
    Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "OK"
    #Scenario 5: ABN Lookup for Tax Agent with an active ABN, correct Registered Business Name, and Entity Type is not 'Individual'
    And I enter the details as
      | Fields                 | Value |
      | RegistrationAnswer_ABN | <ABN> |
    Then I click on button with value "Next"
    Then I wait for "4000" millisecond
    Then I enter the details as
      | Fields              | Value         |
      | EmployerName        | <CompanyName> |
      | BusinessTradingName | <CompanyName> |
    Then I select "Other" from "SelectBusinessTypeCode"
    Then I click on button "TaxPayerDetailsNextBT"
    Then I enter the details as
      | Fields                    | Value      |
      | AddressLine1              | TEST       |
      | Address_City              | TEST       |
      | PostCode                  |       3333 |
      | ContactPerson_FirstName   | TEST       |
      | ContactPerson_LastName    | TEST       |
      | ContactPerson_PhoneNumber | 1234567890 |

    Examples: 
      | PortalName | CompanyName          | ABN         | UserName | Password   |
      | TSSAdmin        | Dynamic Fire Pty Ltd | 80134834334 | jbradley | Dbresults1 |
