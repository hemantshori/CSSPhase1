#Sample Feature Definition Template
@wip
Feature: WORK IN PROGRESS

      
    	@review
   	Scenario Outline: DTSP-746: As an end user I want to be able to update contact details on Tax Registration updates for different tax types
   	Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
   	And I hit Enter
   	
   	#Scenario 1: Accurate labels and text 
   	
   	Then I click on "Tax Registration Update"
   	Then I click on "Update Contact Details"
   	 Then I check "LodgePayrollAnswer_OrganizationalName" is readonly
    Then I check "LodgePayrollAnswer_ABN" is readonly
    Then I check "LodgePayrollAnswer_CRN" is readonly
    Then I check "TaxTypeSelection" is readonly
    Then I check "ContactPerson_FirstName" is readonly
    Then I check "ContactPerson_LastName" is readonly
    Then I check "ContactPerson_Email" is readonly
    Then I check "Address_CountryId" is readonly
    Then I check "wtAddress_AddressLine" is readonly
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName          |
      | item2 | Tax Type |
      | item2 | First Name |
      | item2 | Last Name |
      | item2 | Contact Phone Number |
      | item2 | Email Address |
      | item2 | Country |
      | item2 | Address |
      | item2 | Contact Person |
      | item2 | Postal Address |
      
   	Then I click on button "select2-chosen-1"
   	Then I enter the details as
      | Fields               | Value |
      | s2id_autogen1_search | <Organisation> |
    Then I click on button "select2-results-1"
    Then I wait for "4000" millisecond
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
		
		Then I click on button with value "Next"
		Then I wait for "6000" millisecond
		Then I check I am on "Update Contact Details Summary" page
		 Then I click on button "CorrectInfoDeclared"
    Then I click on button with value "Submit" 
    Then I wait for "4000" millisecond
    Then I check I am on "Update Complete" page
    
   	
   Examples:
		  | PortalName | UserName | Password   | FirstName | LastName | Position   | Organisation | ContactPhone | EmailAddress         |
      | TSS        | jbradley | Dbresults1 | J         | Bradley  | Consultant | DESIGNATE PTY. LTD. | 04 5678 9767 | jbradley@hotmail.com |
   	