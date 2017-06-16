#Sample Feature Definition Template
Feature: WORK IN PROGRESS


  
  #@wip
  #Scenario Outline: DTSP-962: As an end user, I want to see an updated portal, so that it is easier for me to use
  #Given I want to login to portal "<PortalName>"
    #And I enter the details as
      #| Fields        | Value      |
      #| UserNameInput | <UserName> |
      #| PasswordInput | <Password> |
   #	And I hit Enter
   #	
   #	#Scenario 2: Lodgement form layout 
   #	Then I click on "Lodgements"
   #	Then I click on "Payroll Tax"
   #	Then I check I am on "Payroll Lodgement Form" page
   	
   	
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
      | Fields               | Value |
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
      | Item  | ItemName          |
      | item2 | Tax Type |
      | item2 | Set up bank account for refunds |
      | item2 | BSB |
      | item2 | Bank Account Number |
      | item2 | Bank Account Name |
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
		  | PortalName | UserName | Password   | FirstName | LastName | Position   | Organisation | ContactPhone | EmailAddress         |
      | TSS        | jbradley | Dbresults1 | J         | Bradley  | Consultant | DESIGNATE PTY. LTD. | 04 5678 9767 | jbradley@hotmail.com |
   	   	
   	@review
   	Scenario Outline: DTSP-749: As an end user I want to be able to update refund details on Tax Registration updates for different tax types
   	Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
   	And I hit Enter
   	
   	#Scenario 1: Tabs for Home page 
   	  Then I click on button "select2-chosen-1"
   	Then I enter the details as
      | Fields               | Value |
      | s2id_autogen1_search | <Organisation> |
    Then I click on button "select2-results-1"
    
    Then I check object with xpath "//a[contains(@id, 'TaxTypesTabBar')]" contains "Payroll"
    Then I check object with xpath "(//a[contains(@id, 'TaxTypesTabBar')])[2]" contains "Utilities (Network Facilities)"
    Then I check object with xpath "(//a[contains(@id, 'TaxTypesTabBar')])[3]" contains "Ambulance Levy"
    Then I check object with xpath "(//a[contains(@id, 'TaxTypesTabBar')])[4]" contains "Energy Industry Levy"
    Then I check object with xpath "(//a[contains(@id, 'TaxTypesTabBar')])[5]" contains "Income Tax Equivalent"
    
    #Scenario 3: User views ' Tax Details' Box 
    Then I check "PayrollTaxDetailsWebblock_block" exists
    Then I check object with xpath "(//div[contains(@id, 'AccountInfo')])[6]" contains "Employer Status"
    Then I check object with xpath "(//div[contains(@id, 'AccountInfo')])[7]" contains "DGE in Group Number: 19"
    Then I check object with xpath "(//div[contains(@id, 'AccountInfo')])[11]" contains "Contact Person"
   	Then I check object with xpath "(//div[contains(@id, 'AccountInfo')])[14]" contains "John Smith"
   	Then I check object with xpath "(//div[contains(@id, 'AccountInfo')])[15]" contains "04 1234 5678"
   	Then I check object with xpath "(//span[contains(@id, 'AccountInfo')])[6]" contains "Postal Address"
   	Then I check object with xpath "//*[contains(@id, 'AccountInfo_wtEmail')]" contains "abc@abc.com"
   	
   	Then I check object with xpath "(//div[contains(@id, 'AccountInfo')])[23]" contains "1 Collins Stsadfasdfasdfdsfasfd,"
   	Then I check object with xpath "(//div[contains(@id, 'AccountInfo')])[24]" contains "Melbourne, ACT, 3000"
   	 	Then I check object with xpath "(//span[contains(@id, 'AccountInfo')])[8]" contains "Business Trading Name"
   	Then I check object with xpath "(//div[contains(@id, 'AccountInfo')])[30]" contains "<Organisation>"
   	
   	
   	#Scenario 4: Edit Contact Person 
   	Then I click on button "ContactPerson_Edit"
   	Then I check I am on "Update Contact Details" page
   	 Then I check "LodgePayrollAnswer_OrganizationalName" contains "<Organisation>"
    Then I check "LodgePayrollAnswer_ABN" contains "<ABN>"
    Then I check "LodgePayrollAnswer_CRN" contains "<CRN>"
    
    Then I click on "Home"
     Then I click on button "select2-chosen-1"
   	Then I enter the details as
      | Fields               | Value |
      | s2id_autogen1_search | <Organisation> |
    Then I click on button "select2-results-1"
    
    #Scenario 5: Edit Postal Address 
    Then I click on button "PostalAddress_Edit"
    Then I check I am on "Update Contact Details" page
    Then I check "LodgePayrollAnswer_OrganizationalName" contains "<Organisation>"
    Then I check "LodgePayrollAnswer_ABN" contains "<ABN>"
    Then I check "LodgePayrollAnswer_CRN" contains "<CRN>"
    
    Then I click on "Home"
     Then I click on button "select2-chosen-1"
   	Then I enter the details as
      | Fields               | Value |
      | s2id_autogen1_search | <Organisation> |
    Then I click on button "select2-results-1"
    
    #Scenario 6: Display “Outstanding Lodgements” box 
    Then I see text "Your Outstanding Tax Returns to Lodge:" displayed
    
    #Scenario 7: User clicks on “VIEW HISTORY” button 
    Then I click on button with value "View History"
    Then I check I am on "Return History" page
    Then I click on "Home"
     Then I click on button "select2-chosen-1"
   	Then I enter the details as
      | Fields               | Value |
      | s2id_autogen1_search | <Organisation> |
    Then I click on button "select2-results-1"
    
    #Scenario 8: User clicks on “LODGE RETURN” button 
    Then I click on button with value "Lodge Return"
    Then I check I am on "Payroll Lodgement Form" page
    
    Then I click on "Home"
    #Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "OK"
     Then I click on button "select2-chosen-1"
   	Then I enter the details as
      | Fields               | Value |
      | s2id_autogen1_search | BLATCHFORD |
    Then I click on button "select2-results-1"
    
    #Scenario 10: User not registered for any tax types 
    Then I see text "This ABN is currently not registered for any tax types." displayed
    
    
   	
   	Examples:
		  | PortalName | UserName | Password   | FirstName | LastName | Position   | Organisation | ABN | CRN         |
      | TSS        | jbradley | Dbresults1 | J         | Bradley  | Consultant | DESIGNATE PTY. LTD. | 85085664197 | 400107 |
   	
    @review
    Scenario Outline: DTSP-814: As an end user, I want to be able to amend my lodged Payroll Tax returns, so that I can fix any mistakes I have made
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
   	And I hit Enter
   	Then I click on "Return History"
   	Then I check I am on "Return History" page
   	Then I click on button "select2-chosen-1"
   	 Then I enter the details as
      | Fields               | Value |
      | s2id_autogen1_search | <Organisation> |
    Then I click on button "select2-results-1"
    Then I click on "AMEND"
    
    Then I click on button with value "Next"
    
    Then I click on button "SubmitBT"
    Then I wait for "4000" millisecond
    Then I check I am on "Lodgement Summary" page
    #Then I check object with xpath "//*[contains(text(), 'Organisation Name')]/..//following-sibling::td" contains "<Organisation>"
    #Then I check object with xpath "//*[contains(text(), 'Australian Business Number (ABN)')]/..//following-sibling::td" contains "85085664197"
    #Then I check object with xpath "//*[contains(text(), 'Client Reference Number (CRN)')]/..//following-sibling::td" contains "400107"
    #
    Then I check object with xpath "//*[contains(@id, 'ACTWagesPaidorTaxable')]//tr[1]//td[2]" contains "$100,000.00"
    Then I check object with xpath "//*[contains(@id, 'ACTWagesPaidorTaxable')]//tr[2]//td[2]" contains "$0.00"
    Then I check object with xpath "//*[contains(@id, 'ACTWagesPaidorTaxable')]//tr[3]//td[2]" contains "$0.00"
    Then I check object with xpath "//*[contains(@id, 'ACTWagesPaidorTaxable')]//tr[4]//td[2]" contains "$0.00"
    Then I check object with xpath "//*[contains(@id, 'ACTWagesPaidorTaxable')]//tr[5]//td[2]" contains "$0.00"
    Then I check object with xpath "//*[contains(@id, 'ACTWagesPaidorTaxable')]//tr[6]//td[2]" contains "$0.00"
    Then I check object with xpath "//*[contains(@id, 'ACTWagesPaidorTaxable')]//tr[7]//td[2]" contains "$0.00"
    Then I check object with xpath "//*[contains(@id, 'ACTWagesPaidorTaxable')]//tr[8]//td[2]" contains "$0.00"
    Then I check object with xpath "//*[contains(@id, 'ACTWagesPaidorTaxable')]//tr[9]//td[2]" contains "$0.00"
    Then I check object with xpath "//*[contains(@id, 'ACTWagesPaidorTaxable')]//tr[10]//td[2]" contains "$0.00"
    Then I check object with xpath "//*[contains(@id, 'ACTWagesPaidorTaxable')]//tr[11]//td[2]" contains "$0.00"
    Then I check object with xpath "//*[contains(@id, 'ACTWagesPaidorTaxable')]//tr[12]//td[2]" contains "$100,000.00"
    Then I check object with xpath "//*[contains(@id, 'ACTWagesPaidorTaxable')]//tr[13]//td[2]" contains "$0.00"
    Then I check object with xpath "//*[contains(@id, 'ACTWagesPaidorTaxable')]//tr[14]//td[2]" contains "No"
    
        Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[1]//td[2]" contains "<FirstName>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[2]//td[2]" contains "<LastName>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[3]//td[2]" contains "Abacus Pty Ltd"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[4]//td[2]" contains "<Position>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[5]//td[2]" contains "<ContactPhone>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[6]//td[2]" contains "<EmailAddress>"
   	
   	
   	 Examples:
		   | PortalName | UserName | Password   | FirstName | LastName | Position   | Organisation | ContactPhone | EmailAddress         |
      | TSS        | jbradley | Dbresults1 | J         | Bradley  | Consultant | DESIGNATE PTY. LTD. | 04 5678 9767 | jbradley@hotmail.com |
   
   	@review
   	Scenario Outline: DTSP-865: As a user I want to see changes made on Payroll tax lodgements, registration page and return history so that its consistent with additional tax types
   	   Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
   	And I hit Enter
   	
   	#Scenario 1: Changes to Payroll Return History page 
   	Then I click on "Return History"
   	Then I click on button "select2-chosen-1"
   	 Then I enter the details as
      | Fields               | Value |
      | s2id_autogen1_search | <Organisation> |
    Then I click on button "select2-results-1"
    Then I wait for "3000" millisecond
   	Then I check "ReturnPeriod2" contents match regex "\w{3} \d{4}"
   	
   	#Scenario 2: Changes to Payroll Tax Registration page 
   	   Then I click on "Payroll Tax Registration"
    Then I wait for "1000" millisecond
    And I enter the details as
      | Fields                 | Value       |
      | RegistrationAnswer_ABN | 80134834334 |
    Then I click on button with value "Next"
    Then I wait for "1500" millisecond
    Then I enter the details as
      | Fields              | Value              |
      | EmployerName        | <CompanyName> |
      | BusinessTradingName | <CompanyName>  |
    Then I select "Government" from "SelectBusinessTypeCode"
		Then I click on button "TaxPayerDetailsNextBT"
		
		 Then I select "Direct Post" from "CommunicationMethodId"
    Then I enter the details as
      | Fields                    | Value              |
      | AddressLine1              | TEST               |
      | Address_City              | TEST               |
      | ContactPerson_FirstName   | TEST               |
      | ContactPerson_LastName    | TEST               |
      | ContactPerson_Email       | TEST@TEST.com      |
      | PostCode                  |        3333 |
      | ContactPerson_PhoneNumber |    1234567890 |
    #Then I select "AL" from "Address_State"
    Then I click on button "AddressLine1"
    # Then I see text "Title" not displayed
    Then I click on button "OrgDetailsNextBt"
    
    Then I check "ControlAndFinancialInterest_FirstName" exists
    Then I check "ControlAndFinancialInterest_LastName" exists
    Then I check "ControlAndFinancialInterestRelationshipType" exists
   	Then I check "GeneralDiscardBt" exists
   	Then I check "AddControlFinancialInterestButton" exists
   	 Then I enter the details as
      | Fields                    | Value              |
      | ControlAndFinancialInterest_FirstName              | TEST               |
      | ControlAndFinancialInterest_LastName              | TEST               |
		
		Then I click on button "ControlAndFinancialInterestRelationshipType"
		Then I click on "Director"
		Then I click on button "AddControlFinancialInterestButton"
		Then I check "RemoveControlFinancialInterestList" exists
		
		#Scenario 3: Changes to Payroll tax lodgement page 
		Then I click on "Lodgements"
		Then I click on "Payroll Tax"
		Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "OK"
		Then I wait for "2000" millisecond
		Then I click on button "GeneralDiscardBt"
		 Then I click on button "select2-chosen-1"
   Then I enter the details as
      | Fields               | Value         |
      | s2id_autogen1_search | BLATCHFORD |
   Then I click on button "select2-results-1"
   
   
   Then I see text "You are currently not registered for Payroll Tax" displayed
   
    Then I click on button "select2-chosen-1"
   Then I enter the details as
      | Fields               | Value         |
      | s2id_autogen1_search | QUICK SINGLE |
   Then I click on button "select2-results-1"
   Then I wait for "2000" millisecond
   
	 Then I click on "Annual Reconciliation"
	 Then I select "2016" from "AnnualObligationSelect"
	 Then I click on button with value "Save and Next"
	 Then I click on button "ClaimingACTProportion_No"
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

    Then I click on button "SubmitBT"
		Then I check I am on "Payroll Tax Lodgement Summary" page
		
		
		
   	Examples:
		  | PortalName | UserName | Password   | FirstName | LastName | Position   | Organisation | ContactPhone | EmailAddress         | CompanyName |
      | TSS        | jbradley | Dbresults1 | J         | Bradley  | Consultant | DESIGNATE PTY. LTD. | 04 5678 9767 | jbradley@hotmail.com | Dynamic Fire Pty Ltd |
      
    @review 
    Scenario Outline: DTSP-870: As an end user, I want to be able to amend my lodgements for Ambulance Levy, so that I can rectify errors  + DTSP-879: As an end user, I want to see a Summary Page, Confirmation Page, PDF and email notification for an Ambulance Levy Amendment
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
   	And I hit Enter
   	
   	Then I click on "Return History"
   	 Then I click on button "select2-chosen-1"
   	 Then I enter the details as
      | Fields               | Value |
      | s2id_autogen1_search | <Organisation> |
    Then I click on button "select2-results-1"
    Then I wait for "3000" millisecond
    Then I click on object with xpath "(//a[contains(@id, 'TaxTypesTabBar')])[3]"
    #Scenario 1: Pre populated fields 
    Then I click on "AMEND"
    Then I check I am on "Amend Ambulance Levy Lodgement" page
    	 Then I check "LodgePayrollAnswer_OrganizationalName" contains "<Organisation>"
    Then I check "LodgePayrollAnswer_ABN" contains "<ABN>"
    Then I check "LodgePayrollAnswer_CRN" contains "<CRN>"
    Then I check object with xpath "//*[contains(@id, 'ObligationToAmend')]" contents match regex "\w{3} \d{4}"
    Then I check object with xpath "//*[contains(@id, 'ReturnDate')]" contents match regex "\w{3} \d{4}"
    Then I click on button with value "Next"
    Then I click on button "SaveAndNextToSummaryBT"
    
    
    Then I check I am on "Lodgement Summary" page
    
     Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName          |
      | item2 | Number of Single Members |
      | item2 | Single Member Rate Per Week |
      | item2 | Amount Payable Per Week (Single Member) |
      | item2 | Number of Family Members |
      | item2 | Family Members Rate Per Week |
      | item2 | Amount Payable Per Week (Family Members) |
      | item2 | Total Amount Payable (Weekly) |
      | item2 | Total Amount Payable |
        Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[1]//td[2]" contains "<FirstName>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[2]//td[2]" contains "<LastName>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[3]//td[2]" contains "<Organisation>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[4]//td[2]" contains "<Position>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[5]//td[2]" contains "<ContactPhone>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[6]//td[2]" contains "<EmailAddress>"
   	
    Examples:
		  | PortalName | UserName | Password   | FirstName | LastName | Position   | Organisation | ContactPhone | EmailAddress         | CompanyName | ABN | CRN |
      | TSS        | jbradley | Dbresults1 | J         | Bradley  | Consultant | DESIGNATE PTY. LTD. | 04 5678 9767 | jbradley@hotmail.com | Dynamic Fire Pty Ltd | 85085664197 | 400107 |
      
  @review
  Scenario Outline: DTSP-877: As an end user, I want to be able to amend my lodgements for Utilitites (Network Facilities) Tax, so that I can rectify errors + DTSP-884: As an end user, I want to be able to see the Summary Page, Confirmation Page, PDF, and email notification for Energy Industry Levy Amendments
  Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
   	And I hit Enter
   	Then I click on "Return History"
   	Then I click on button "select2-chosen-1"
   	 Then I enter the details as
      | Fields               | Value |
      | s2id_autogen1_search | <Organisation> |
    Then I click on button "select2-results-1"
    Then I wait for "5000" millisecond
    
   	Then I check object with xpath "(//a[contains(@id, 'TaxTypesTabBar')])[4]" contains "Energy Industry Levy"
   	Then I click on object with xpath "(//a[contains(@id, 'TaxTypesTabBar')])[4]"
   	Then I click on "AMEND"
   	Then I check I am on "Amend Energy Industry Levy Lodgement" page
   	Then I check "LodgePayrollAnswer_OrganizationalName" contains "<Organisation>"
    Then I check "LodgePayrollAnswer_ABN" contains "<ABN>"
    Then I check "LodgePayrollAnswer_CRN" contains "<CRN>"
    Then I check "ObligationToAmend" is not empty
    Then I click on button with value "Next"
    Then I wait for "3000" millisecond
    Then I check "EstMegawattHrs2" is not empty
    Then I check "ActMegawattHrs2" is not empty
    
    Then I click on button "SaveAndNextToSummaryBT"
    
    Then I check I am on "Lodgement Summary" page
    Then I see text "Energy Industry Levy Lodgement Amendment Summary" displayed
     Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName            |
      | item2 |   Return Period   |
      | item2 |   Sector Type   |
      | item2 |    Estimate Megawatt Hours   |
      | item2 |   Estimate Fixed Component    |
      | item2 |   Estimate Variable Component   |
      | item2 |    Estimate Fix Component+(Variable Component*Megawatt Hour)  |
      | item2 |   Actual Megawatt Hours   |
      | item2 |   Actual Fixed Component   |
      | item2 |   Actual Variable Component   |
      | item2 |   Actual Fix Component+(Variable Component*Megawatt Hour)    |
      | item2 |   Levy Payable   |
      | item2 |   Method used to Calculate Total Megawatt Hours   |
      | item2 |   Total Levies Paid   |
      | item2 |   Total Estimated Amount   |
      | item2 |    Total Amount Payable  |

    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[1]//td[2]" contains "<FirstName>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[2]//td[2]" contains "<LastName>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[3]//td[2]" contains "<Organisation>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[4]//td[2]" contains "<Position>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[5]//td[2]" contains "<ContactPhone>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[6]//td[2]" contains "<EmailAddress>"
    
   	
  
  Examples:
		  | PortalName | UserName | Password   | FirstName | LastName | Position   | Organisation | ContactPhone | EmailAddress         | CompanyName | ABN | CRN |
      | TSS        | jbradley | Dbresults1 | J         | Bradley  | Consultant | DESIGNATE PTY. LTD. | 04 5678 9767 | jbradley@hotmail.com | Dynamic Fire Pty Ltd | 85085664197 | 400107 |
      
@review
		Scenario Outline: DTSP-894: As an end user, I want to limit my options on the Generic Request form in the Request Type Dropdown
		Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
   	And I hit Enter
   	
   	Then I click on "Service Requests"
   	Then I click on "Generic Request"
   	 Then I click on button "select2-chosen-1"
   	 Then I enter the details as
      | Fields               | Value |
      | s2id_autogen1_search | <Organisation> |
    Then I click on button "select2-results-1"
    Then I click on button "GenericRequest_RequestType"
    Then I see text "Compliance tip-off" displayed
    Then I see text "Exemption" displayed
    Then I see text "Payroll Tax Exclusion" displayed
    Then I see text "General Enquiry" displayed
    Then I see text "Variation" displayed
    Then I see text "Freedom of Information" not displayed
    Then I see text "Objection" not displayed
    Then I see text "Ombudsman's Request" not displayed
    
   	
   	
		Examples:
		   | PortalName | UserName | Password   | FirstName | LastName | Position   | Organisation | ContactPhone | EmailAddress         |
      | TSS        | jbradley | Dbresults1 | J         | Bradley  | Consultant | DESIGNATE PTY. LTD. | 04 5678 9767 | jbradley@hotmail.com |
      
    @review
    Scenario Outline: DTSP-895: As an end user, I want to see instructions on the Activity History page, so that I understand how to filter my entries
    
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
   	And I hit Enter
   	Then I click on "Activity History"
   	
   	Then I see text "Your lodged service requests and forms are listed here. Use the document link to view your submission." displayed
		Then I see text "Enter one or more of the below filter options to search through your activity history." displayed
		
    
    Examples:
		   | PortalName | UserName | Password   | FirstName | LastName | Position   | Organisation | ContactPhone | EmailAddress         |
      | TSS        | jbradley | Dbresults1 | J         | Bradley  | Consultant | DESIGNATE PTY. LTD. | 04 5678 9767 | jbradley@hotmail.com |


   @review
   Scenario Outline: DTSP-910: As an end user, I want to see more accurate error messages on the Service Request forms, so that I know how to fix my error
   Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
   	And I hit Enter
   	Then I click on "Service Requests"
   	#Scenario 1: Cancellation 
   	Then I click on "Tax Registration Cancellation"
   	Then I see text "Cancellation End Date" not displayed
   	#Scenario 2: Cancellation start date 
   	Then I see text "Cancellation Effective Date" displayed
   	Then I check "CancellationStartDate" exists
   	
   	#Scenario 3: Exemption error message 
   	Then I click on "Exemption Request"
   	 Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value |
      | s2id_autogen1_search | <Organisation> |
    Then I click on button "select2-results-1"
    #Then I click on button "ExemptionStartDateInput"
    #Then I click on "20170502"
    #Then I click on button "calTriggerOut"
    #Then I click on button "ExemptionEndDateInput"
    #Then I click on "20170529"
    Then I enter the details as
      | Fields             | Value |
      | JustificationInput | TEST  |
      | ExemptionStartDateInput | 120617 |
      | ExemptionEndDateInput| 110617 |
   	#Then I upload file with path "C:\\Users\\CTang\\git\\SSCP\\CSSPhase1\\ConfigData.xlsx" to "DBResultsSG_Theme_wt59_block_wtMainContent_TSSAdminCore_wt78_block_wtPlaceholder1_TSSDropZone_wt54_block_wt14"
   	Then I click on button with value "Next"
   	
   	
   	
   	Then I see text "The Requested Exemption End Date must be later than the Requested Exemption Start Date." displayed
   	#Scenario 4: Voluntary Disclosure 
   	Then I click on "Update Liability Commencement Date Request"
   	Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "OK"
   	Then I see text "Voluntary Disclosure" not displayed
   	
   		 Examples:
		   | PortalName | UserName | Password   | FirstName | LastName | Position   | Organisation | ContactPhone | EmailAddress         |
      | TSS        | jbradley | Dbresults1 | J         | Bradley  | Consultant | DESIGNATE PTY. LTD. | 04 5678 9767 | jbradley@hotmail.com |
    
    @wip
    Scenario Outline: DTSP-920: As an end user, I want to see an updated Return History for all tax types, so that I can select an obligation to amend
     Given I want to login to portal "<PortalName>"
	    And I enter the details as
	      | Fields        | Value      |
	      | UserNameInput | <UserName> |
	      | PasswordInput | <Password> |
	   	And I hit Enter
	   	Then I click on "Return History"
	   	 Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName            |
      | item2 |  RETURN PERIOD   |
      | item2 |  PAYMENT DUE DATE   |
      | item2 |  TAX PAYABLE	   |
      | item2 |  INTEREST   |
      | item2 |  PENALTY	  |
      | item2 |  PAID AMOUNT	   |
      | item2 |  BALANCE	   |
      | item2 |  PAYMENT   |
      | item2 |  SUBMIT   |
   		Examples:
		   | PortalName | UserName | Password   | FirstName | LastName | Position   | Organisation | ContactPhone | EmailAddress         |
      | TSS        | jbradley | Dbresults1 | J         | Bradley  | Consultant | DESIGNATE PTY. LTD. | 04 5678 9767 | jbradley@hotmail.com |
    
		@review
		Scenario Outline: DTSP-962: As an end user, I want to see an updated portal, so that it is easier for me to use
		 Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
   	And I hit Enter
   	Then I click on "Home"
   	
   	#Scenario 1: Date formats 
   	Then I click on "Service Requests"
   	Then I click on "Tax Registration Cancellation"
		Then I click on button "select2-chosen-1"
		 Then I enter the details as
      | Fields               | Value               |
      | s2id_autogen1_search | AQUA |
    Then I click on button "select2-results-1"
     Then I enter the details as
      | Fields            | Value |
      | ReasonDescription | TEST  |
    Then I enter the details as 
    	| Fields 							 | Value |
   		| CancellationStartDate | 16-06-2017|
   	Then I click on button with value "Next"
   	#Then I see "CancellationStartDate" contains ""
		Then I check I am on "Tax Cancellation Request Summary" page
    Then I check object with xpath "//*[contains(text(), 'Cancellation Effective Date')]/..//following-sibling::td" contains "16 Jun 2017"
		
		Then I click on button with value "Back"
		Then I wait for "2000" millisecond
		
		 Then I enter the details as 
    	| Fields 							 | Value |
   		| CancellationStartDate | 16-06-2017|
   	Then I click on button with value "Next"
   	#Then I see "CancellationStartDate" contains ""
		Then I check I am on "Tax Cancellation Request Summary" page
    Then I check object with xpath "//*[contains(text(), 'Cancellation Effective Date')]/..//following-sibling::td" contains "16 Jun 2017"
		
		Then I click on button with value "Back"
		Then I wait for "2000" millisecond
		
		 Then I enter the details as 
    	| Fields 							 | Value |
   		| CancellationStartDate | 16-06-17|
   	Then I click on button with value "Next"
   	#Then I see "CancellationStartDate" contains ""
		Then I check I am on "Tax Cancellation Request Summary" page
    Then I check object with xpath "//*[contains(text(), 'Cancellation Effective Date')]/..//following-sibling::td" contains "16 Jun 2017"
    
    Then I click on button with value "Back"
		Then I wait for "2000" millisecond
		
		Then I enter the details as 
    	| Fields 							 | Value |
   		| CancellationStartDate | 16617|
   	Then I click on button with value "Next"
   	#Then I see "CancellationStartDate" contains ""
		Then I check I am on "Tax Cancellation Request Summary" page
    Then I check object with xpath "//*[contains(text(), 'Cancellation Effective Date')]/..//following-sibling::td" contains "16 Jun 2017"
    
     Then I click on button with value "Back"
		Then I wait for "2000" millisecond
		
		Then I enter the details as 
    	| Fields 							 | Value |
   		| CancellationStartDate | 16062017|
   	Then I click on button with value "Next"
   	#Then I see "CancellationStartDate" contains ""
		Then I check I am on "Tax Cancellation Request Summary" page
    Then I check object with xpath "//*[contains(text(), 'Cancellation Effective Date')]/..//following-sibling::td" contains "16 Jun 2017"
		
		Examples:
		  | PortalName | UserName | Password   | FirstName | LastName | Position   | Organisation | ContactPhone | EmailAddress         |
      | TSS        | jbradley | Dbresults1 | J         | Bradley  | Consultant | DESIGNATE PTY. LTD. | 04 5678 9767 | jbradley@hotmail.com |
      
  
      
    @review
    Scenario Outline: DTSP-940: As an end user, I want to be displayed a message on forms if I do not have any ABNs linked to my account, so that I know why I cannot access them
     Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | taxagent1 |
      | PasswordInput | <Password> |
   	And I hit Enter
   	Then I see text "Please note, as there are currently no taxpayer accounts associated with your login, there is no information to display." displayed
   	Then I click on "Sign Out"
   	And I enter the details as
      | Fields        | Value      |
      | UserNameInput | Test2 |
      | PasswordInput | <Password> |
   	And I hit Enter
   	Then I see text "Please note, as there are currently no taxpayer accounts associated with your login, there is no information to display." displayed
   	
      Examples:
		   | PortalName | UserName | Password   | FirstName | LastName | Position   | Organisation | ContactPhone | EmailAddress         |
      | TSS        | jbradley | Dbresults1 | J         | Bradley  | Consultant | DESIGNATE PTY. LTD. | 04 5678 9767 | jbradley@hotmail.com |
      
      
  @review
  Scenario Outline: DTSP-966: As a Business Taxpayer registering for Payroll Tax, I want to see an updated Taxpayer details section, so that it is easier to use
  	Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
   	And I hit Enter
   	Then I click on "Payroll Tax Registration"
   	Then I check I am on "Payroll Tax Registration Form" page
   	#Scenario 1: Button 
   	
   	 Then I check "ABNVerify_BTN" exists
   	And I enter the details as
      | Fields                 | Value       |
      | RegistrationAnswer_ABN | 17118795716 |
    Then I click on button with value "Next"
   
    #Scenario 2: instructions
    Then I wait for "3000" millisecond
   	Then I see text "You are already registered for another tax type, please provide your Customer Reference Number (CRN) below to continue registering for Payroll Tax" displayed
   	Then I check "RegistrationAnswer_CRN" exists
  
  	 Examples:
		   | PortalName | UserName | Password   | FirstName | LastName | Position   | Organisation | ContactPhone | EmailAddress         |
      | TSS        | jbradley | Dbresults1 | J         | Bradley  | Consultant | DESIGNATE PTY. LTD. | 04 5678 9767 | jbradley@hotmail.com |
      
 	@review
		Scenario Outline: DTSP-986: As an end user, I want to see updated date field on my Ambulance Levy Lodgement and Amendment forms, so that I know when my return is due
		 Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
   	And I hit Enter
   	Then I click on "Home"
   	Then I click on "Lodgements"
   	Then I click on "Ambulance Levy"
   	Then I click on button "GeneralDiscardBt"
   	Then I click on button "select2-chosen-1"
		 Then I enter the details as
      | Fields               | Value               |
      | s2id_autogen1_search | <Organisation> |
    Then I click on button "select2-results-1"
    Then I select "Jun 2013" from "ObligationsDropdown"
    Then I check "ReturnDate" contains "Sep 2013"
    Then I check "ReturnDate" is readonly
    Then I click on button "SaveNextBT"
       Then I enter the details as
      | Fields                                       | Value |
      | LodgeAmbulanceLevyAnswer_NumberSingleMembers |    11 |
      | LodgeAmbulanceLevyAnswer_NumberFamilyMembers |    11 |
    Then I check "SaveAndNextToSummaryBT" is not readonly
    Then I click on button "SaveAndNextToSummaryBT"
    Then I check object with xpath "//*[contains(text(), 'Reference Period')]//following-sibling::td" contains "Jun 2013"
    Then I check object with xpath "//*[contains(text(), 'Return Date')]//following-sibling::td" contains "Sep 2013"
    
    Then I click on "Return History"
   	 Then I click on button "select2-chosen-1"
   	 Then I enter the details as
      | Fields               | Value |
      | s2id_autogen1_search | <Organisation> |
    Then I click on button "select2-results-1"
    Then I wait for "3000" millisecond
    Then I click on object with xpath "(//a[contains(@id, 'TaxTypesTabBar')])[3]"
    #Scenario 1: Pre populated fields 
    Then I click on "AMEND"
    Then I check I am on "Amend Ambulance Levy Lodgement" page
		
		Then I check "ObligationToAmend" is readonly
		Then I check "ReturnDate" is readonly
    Then I check object with xpath "//*[contains(@id, 'ObligationToAmend')]" contents match regex "\w{3} \d{4}"
    Then I check object with xpath "//*[contains(@id, 'ReturnDate')]" contents match regex "\w{3} \d{4}"
    Then I click on button with value "Next"
    Then I click on button "SaveAndNextToSummaryBT"
    
    Then I check object with xpath "//*[contains(text(), 'Reference Period')]//following-sibling::td" contents match regex "\w{3} \d{4}"
    Then I check object with xpath "//*[contains(text(), 'Return Date')]//following-sibling::td" contents match regex "\w{3} \d{4}"
    
    
    
   	Examples:
		  | PortalName | UserName | Password   | FirstName | LastName | Position   | Organisation | ContactPhone | EmailAddress         |
      | TSS        | jbradley | Dbresults1 | J         | Bradley  | Consultant | DESIGNATE PTY. LTD. | 04 5678 9767 | jbradley@hotmail.com |