
Feature: defects
#Sample Feature Definition Template

	@defect
	Scenario Outline: DTSP-355
    Given I want to login to portal "<PortalName>"
    And I check I am on "Tax Registration Form" page
    Then I wait for "2000" millisecond
    Then I select "Company" from "SelectBusinessTypeCode"
    Then I select "Mr" from "ContactPerson_Title"
    Then I select "Direct Post" from "CommunicationMethodId"
    #scenario 2: ABN/ACN combination verified against ABR, and the Organisation name entered does not match Organisation name returned from ABR (3rd party verification)
    Then I enter the details as
      | Fields                    | Value             |
      | EmployerName              | DB RESULTS PTY LT |
      | BusinessTradingName       | DB RESULTS PTY LT |
      | RegistrationAnswer_ABN    |       97110187767 |
      | RegistrationAnswer_ACN    |         110187767 |
      | AddressLine1              | TEST              |
      | Address_City              | TEST              |
      | PostCode                  |              3333 |
      | ContactPerson_FirstName   | TEST              |
      | ContactPerson_LastName    | TEST              |
      | ContactPerson_PhoneNumber |          3333333333 |
      | ContactPerson_Email       | TEST@TEST.com         |
    Then I select "Other" from "SelectBusinessTypeCode"
    #index out of range 1 blocker present here...
    Then I click on "TaxPayerDetailsNext"
    Then I wait for "1000" millisecond
    Then I see text "Your Employer Name or ACN doesn't match with your ABN. Please try again." displayed
    

    #scenario 3: ABN/ACN combination not verified against ABR (3rd party verification)
    Then I enter the details as
      | Fields                 | Value              |
      | EmployerName           | DB RESULTS PTY LTD |
      | BusinessTradingName    | DB RESULTS PTY LTD |
      | RegistrationAnswer_ABN |        97110187768 |
      | RegistrationAnswer_ACN |          110187768 |
    Then I click on "TaxPayerDetailsNext"
    Then I wait for "1000" millisecond
    Then I see text "Your ABN is not valid. Please enter a valid ABN." displayed
    #scenario 1: ABN/ACN combination verified against ABR, and the Organisation name entered matches Organisation name returned from ABR (3rd party verificati
    Then I enter the details as
      | Fields                 | Value              |
      | EmployerName           | DB RESULTS PTY LTD |
      | BusinessTradingName    | DB RESULTS PTY LTD |
      | RegistrationAnswer_ABN |        97110187767 |
      | RegistrationAnswer_ACN |          110187767 |
    Then I click on "TaxPayerDetailsNext"
    Then I wait for "2000" millisecond
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                                 |
      | item2 | Business Activity Elsewhere in Australia |
      | item3 | Business Activity Category               |
      | item4 | Control and Financial Interest           |

    Examples: 
      | PortalName       | UserNameField | PasswordField | UserName | Password   | CRN         | ABN         |
      | Tax_Registration | UserNameInput | PasswordInput | mbrown   | Dbresults1 | 12345678901 | 12345678901 |
	
