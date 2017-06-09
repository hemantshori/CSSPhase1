#Sample Feature Definition Template
Feature: WORK IN PROGRESS

  @wip
  Scenario Outline: DTSP-33: As an end user, I want to be able to submit an Ambulance Levy Lodgement Form so that I can validate in PSRM
    #Scenario 1: Ambulance Levy  Lodgement
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Lodgements"
    Then I see text "Payroll Tax" displayed
    Then I see text "Ambulance Levy" displayed
    Then I click on "Ambulance Levy"
    Then I check I am on "Ambulance Levy Lodgement Form" page
    Then I click on button "GeneralDiscardBt"
    Then I check "SelectTaxPayer" exists
    Then I check "LodgePayrollAnswer_OrganizationalName" exists
    Then I check "LodgePayrollAnswer_ABN" exists
    Then I check "LodgePayrollAnswer_CRN" exists
    Then I check "ObligationsDropdown" exists
    #Scenario 2: Selected ABN is not registered for "Ambulance Levy "
    Then I click on button "GeneralDiscardBt"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value               |
      | s2id_autogen1_search | <WrongOrganisation> |
    Then I click on button "select2-results-1"
    Then I see text "You are currently not registered for Ambulance Levy" displayed
    Then I check "ObligationsDropdown" is readonly
    #Scenario 3: Selected ABN is registered for "Ambulance Levy"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value                 |
      | s2id_autogen1_search | <CorrectOrganisation> |
    Then I click on button "select2-results-1"
    Then I check "ObligationsDropdown" is not readonly
    Then I select "2014" from "ObligationsDropdown"
    #Scenario 4: Buttons
    Then I click on button "SaveNextBT"
    Then I check "SaveAndNextToSummaryBT" is readonly
    #Scenario 5: PSRM validation
    Then I enter the details as
      | Fields                                       | Value |
      | LodgeAmbulanceLevyAnswer_NumberSingleMembers |    11 |
      | LodgeAmbulanceLevyAnswer_NumberFamilyMembers |    11 |
    Then I check "SaveAndNextToSummaryBT" is not readonly
    Then I click on button "SaveAndNextToSummaryBT"
    Then I check I am on "Lodgement Summary" page

    Examples: 
      | PortalName | UserName | Password   | FirstName | LastName | Position   | WrongOrganisation | CorrectOrganisation | ContactPhone | EmailAddress         |
      | TSS        | jbradley | Dbresults1 | J         | Bradley  | Consultant | AQUA PTY LTD      | DESIGNATE PTY. LTD. | 04 5678 9767 | jbradley@hotmail.com |

  @review
  Scenario Outline: DTSP-34: As an end user, I want to be able to submit a Energy Industry Levy Return form so that I can validate in PSRM
    #Scenario 1: Ambulance Levy  Lodgement
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Lodgements"
    Then I see text "Payroll Tax" displayed
    Then I see text "Energy Industry Levy" displayed
    Then I click on "Energy Industry Levy"
    Then I check I am on "Energy Industry Levy Lodgement Form" page
    Then I click on button "GeneralDiscardBt"
    Then I check "SelectTaxPayer" exists
    Then I check "LodgePayrollAnswer_OrganizationalName" exists
    Then I check "LodgePayrollAnswer_ABN" exists
    Then I check "LodgePayrollAnswer_CRN" exists
    Then I check "ObligationsDropdown" exists
    #Scenario 2: Selected ABN is not registered for "Ambulance Levy "
    Then I click on button "GeneralDiscardBt"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value               |
      | s2id_autogen1_search | <WrongOrganisation> |
    Then I click on button "select2-results-1"
    Then I see text "You are currently not registered for the Energy Industry Levy" displayed
    Then I check "ObligationsDropdown" is readonly
    #Scenario 3: Selected ABN is registered for "Ambulance Levy"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value                 |
      | s2id_autogen1_search | <CorrectOrganisation> |
    Then I click on button "select2-results-1"
    Then I check "ObligationsDropdown" is not readonly
    Then I select "2014" from "ObligationsDropdown"
    #Scenario 4: Buttons
    Then I click on button "SaveNextBT"
    Then I check "RemoveBTN" is readonly
    Then I check "AddBTN" is readonly
    Then I check "SaveAndNextToSummaryBT" is readonly
    #Scenario 5: PSRM validation
    Then I select "Electricity Distribution Sector" from "SupplyDistributionSector_SectorType"
    Then I enter the details as
      | Fields                                             | Value |
      | SupplyDistributionSector_EstimateMegawattHours     |    50 |
      | SupplyDistributionSector_ActualMegawattHours       |    50 |
      | SupplyDistributionSector_MethodCalculateTotalMegaw | TeST  |
    Then I check "SaveAndNextToSummaryBT" is not readonly
    Then I check "AddBTN" is not readonly
    Then I check "RemoveBTN" is readonly
    Then I click on button "AddBTN"
    Then I click on button "AddBTN"
    Then I check "RemoveBTN" is readonly
    Then I select "Electricity Supply Sector" from "SupplyDistributionSector_SectorType"
    Then I enter the details as
      | Fields                                             | Value |
      | SupplyDistributionSector_EstimateMegawattHours     |    50 |
      | SupplyDistributionSector_ActualMegawattHours       |    50 |
      | SupplyDistributionSector_MethodCalculateTotalMegaw | TeST  |
    Then I check "SaveAndNextToSummaryBT" is not readonly
    Then I click on button "SaveAndNextToSummaryBT"
    Then I check I am on "Lodgement Summary" page

    Examples: 
      | PortalName | UserName | Password   | FirstName | LastName | Position   | WrongOrganisation | CorrectOrganisation | ContactPhone | EmailAddress         |
      | TSS        | jbradley | Dbresults1 | J         | Bradley  | Consultant | AQUA PTY LTD      | DESIGNATE PTY. LTD. | 04 5678 9767 | jbradley@hotmail.com |
		
	@review
  Scenario Outline: DTSP-38: As an end user, I want to be able to complete a Utilities(Network Facilities) Tax Return Form so that I can validate it in PSRM
    #Scenario 1: Ambulance Levy  Lodgement
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Lodgements"
    Then I see text "Payroll Tax" displayed
    Then I see text "Utilities (Network Facilities) Tax" displayed
    Then I click on "Utilities (Network Facilities) Tax"
    Then I check I am on "Network Utilities Lodgement Form" page
    Then I click on button "GeneralDiscardBt"
    Then I check "SelectTaxPayer" exists
    Then I check "LodgePayrollAnswer_OrganizationalName" exists
    Then I check "LodgePayrollAnswer_ABN" exists
    Then I check "LodgePayrollAnswer_CRN" exists
    Then I check "ObligationsDropdown" exists
    #Scenario 2: Selected ABN is not registered for "Ambulance Levy "
    Then I click on button "GeneralDiscardBt"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value               |
      | s2id_autogen1_search | <WrongOrganisation> |
    Then I click on button "select2-results-1"
    Then I see text "You are currently not registered for Utilities(Network Facilities) Tax" displayed
    Then I check "ObligationsDropdown" is readonly
    #Scenario 3: Selected ABN is registered for "Ambulance Levy"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value                 |
      | s2id_autogen1_search | <CorrectOrganisation> |
    Then I click on button "select2-results-1"
    Then I check "ObligationsDropdown" is not readonly
    Then I select "2017" from "ObligationsDropdown"
    #Scenario 4: Buttons
    Then I click on button "SaveNextBT"
    Then I check "RemoveBTN" is readonly
    Then I check "AddBTN" is readonly
    Then I check "SaveAndNextToSummaryBT" is readonly
    #Scenario 5: PSRM validation
    Then I select "Gas Distribution Network" from "NetworkDetail_UtilityTypeDropdown"
    Then I enter the details as
      | Fields                                             | Value |
      | KMOfRouteLength     |    50 |
      #| SupplyDistributionSector_ActualMegawattHours       |    50 |
      #| SupplyDistributionSector_MethodCalculateTotalMegaw | TeST  |
    Then I check "SaveAndNextToSummaryBT" is not readonly
    Then I check "AddBTN" is not readonly
    Then I check "RemoveBTN" is readonly
    Then I click on button "AddBTN"
    Then I click on button "AddBTN"
    Then I check "RemoveBTN" is readonly
    Then I select "Sewerage Network" from "NetworkDetail_UtilityTypeDropdown"
    Then I enter the details as
      | Fields                                             | Value |
       | KMOfRouteLength     |    50 |
    Then I check "SaveAndNextToSummaryBT" is not readonly
    Then I click on button "SaveAndNextToSummaryBT"
    Then I check I am on "Lodgement Summary" page

    Examples: 
      | PortalName | UserName | Password   | FirstName | LastName | Position   | WrongOrganisation | CorrectOrganisation | ContactPhone | EmailAddress         |
      | TSS        | jbradley | Dbresults1 | J         | Bradley  | Consultant | AQUA PTY LTD      | JOINT ACTION PTY. LTD. | 04 5678 9767 | jbradley@hotmail.com |
		
		@review
		 Scenario Outline: DTSP-151: As an end user, I want to be able to view my Return History for Network Utilities Tax Type
    
    #Scenario 1: Selecting relevant tab 
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Return History"
     Then I click on button "select2-chosen-1"
     Then I enter the details as
      | Fields               | Value               |
      | s2id_autogen1_search | <Organisation> |
    Then I click on button "select2-results-1"
    Then I click on "Utilities (Network Facilities)"
    Then I wait for "1000" millisecond
    Then I see text "RETURN PERIOD" displayed
		Then I see text "PAYMENT DUE DATE" displayed
		Then I see text "TAX PAYABLE" displayed
		Then I see text "INTEREST" displayed
		Then I see text "PENALTY" displayed
		Then I see text "PAID AMOUNT" displayed
		Then I see text "BALANCE" displayed
		Then I see text "PAYMENT" displayed
		Then I see text "SUBMIT" displayed
      
    #Scenario 2: PAYMENT DETAILS link 
    Then I click on "DETAILS"
    Then I switch to frame "0"
    #Then I see text "Please Note: Payment cannot be made directly through the Self-Serve portal. Please use the details below to make payment through your financial institution." displayed
     #Then "<Item>" is displayed as "<ItemName>"
      #| Item  | ItemName                        |
      #| item | Amount |
      #| item | Due Date |
      #| item | Biller Code |
      #| item | Reference Number |
    Then I click on button with value "CANCEL"

      Examples: 
      | PortalName | UserName | Password   | FirstName | LastName | Position   | Organisation | ContactPhone | EmailAddress         |
      | TSS        | jbradley | Dbresults1 | J         | Bradley  | Consultant | DESIGNATE PTY. LTD.  | 04 5678 9767 | jbradley@hotmail.com |
    
    	@review
		 Scenario Outline: DTSP-154: As an end user, I want to be able to navigate to different Tax type return history pages using tabs (Includes 753, 754 and 755)
    
    #Scenario 1: Scenario 1: Order of Tax type Tabs 
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Return History"
     Then I click on button "select2-chosen-1"
     Then I enter the details as
      | Fields               | Value               |
      | s2id_autogen1_search | <Organisation> |
    Then I click on button "select2-results-1"
    Then I check object with xpath "//*[contains(@id, 'TSSAccountMgmtCore_wtTaxTypesTabBar')]//*[contains(@id, 'TSSAccountMgmtCore_wtTaxTypesTabBar')]" contains "Payroll"
    Then I check object with xpath "//div[contains(@id, 'TSSAccountMgmtCore_wtTaxTypesTabBar')][2]" contains "Utilities (Network Facilities)"
    Then I check object with xpath "//*[contains(@id, 'TSSAccountMgmtCore_wtTaxTypesTabBar')]//*[contains(@id, 'TSSAccountMgmtCore_wtTaxTypesTabBar')][3]" contains "Ambulance Levy"
    Then I check object with xpath "//*[contains(@id, 'TSSAccountMgmtCore_wtTaxTypesTabBar')]//*[contains(@id, 'TSSAccountMgmtCore_wtTaxTypesTabBar')][4]" contains "Energy Industry Levy"
    Then I check object with xpath "//*[contains(@id, 'TSSAccountMgmtCore_wtTaxTypesTabBar')]//*[contains(@id, 'TSSAccountMgmtCore_wtTaxTypesTabBar')][5]" contains "Income Tax Equivalent"
    Then I click on "Payroll"
    Then I wait for "1000" millisecond
    Then I see text "RETURN PERIOD" displayed
		Then I see text "PAYMENT DUE DATE" displayed
		Then I see text "TAX PAYABLE" displayed
		Then I see text "INTEREST" displayed
		Then I see text "PENALTY" displayed
		Then I see text "PAID AMOUNT" displayed
		Then I see text "BALANCE" displayed
		Then I see text "PAYMENT" displayed
		Then I see text "SUBMIT" displayed
		
		Then I click on "Utilities (Network Facilities)"
		Then I click on object with xpath "//div[contains(@id, 'TSSAccountMgmtCore_wtTaxTypesTabBar')]//a[text() = 'Ambulance Levy']"
		
		Then I click on object with xpath "//div[contains(@id, 'TSSAccountMgmtCore_wtTaxTypesTabBar')]//a[text() = 'Energy Industry Levy']"
		Then I click on "Income Tax Equivalent"
		
		Then I click on button "select2-chosen-1"
     Then I enter the details as
      | Fields               | Value               |
      | s2id_autogen1_search | BLATCHFORD |
    Then I click on button "select2-results-1"
    
    Then I see text "This ABN is currently not registered for any tax types." displayed
    		Then I click on button "select2-chosen-1"
     Then I enter the details as
      | Fields               | Value               |
      | s2id_autogen1_search | SUBMIT |
    Then I click on button "select2-results-1"
		Then I see text "Utilities (Network Facilities)" not displayed
		Then I see text "Ambulance Levy" not displayed
		Then I see text "Energy Industry Levy" not displayed
		Then I see text "Income Tax Equivalent" not displayed
		
		Then I click on button "select2-chosen-1"
     Then I enter the details as
      | Fields               | Value               |
      | s2id_autogen1_search | BULB |
    Then I click on button "select2-results-1"
    
    Then I check object with xpath "//div[contains(@id, 'TSSAccountMgmtCore_wtTaxTypesTabBar')]//div[contains(@id, 'TSSAccountMgmtCore_wtTaxTypesTabBar')][2]" contains "Utilities (Network Facilities)"
		
      Examples: 
      | PortalName | UserName | Password   | FirstName | LastName | Position   | Organisation | ContactPhone | EmailAddress         |
      | TSS        | jbradley | Dbresults1 | J         | Bradley  | Consultant | DESIGNATE PTY. LTD.  | 04 5678 9767 | jbradley@hotmail.com |
   

   
   @review
   Scenario Outline:  DTSP-705: As an end user, I want to be able to raise a Voluntary Disclosure Request on the portal so that I can disclose any changes in date for my tax registration for a chosen tax type
     Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    #Scenario 1: Display "Voluntary Disclosure Request" Form 
     Then I click on "Service Requests"
     Then I see text "Update Liability Commencement Date Request" displayed
     Then I click on "Update Liability Commencement Date Request"
    Then I check "SelectTaxPayer" exists
    Then I check "LodgePayrollAnswer_OrganizationalName" is readonly
    Then I check "LodgePayrollAnswer_ABN" is readonly
    Then I check "LodgePayrollAnswer_CRN" is readonly
    
    #Scenario 2: "Voluntary Disclosure Request" section displayed on the "Voluntary Disclosure Request" Form 
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value               |
      | s2id_autogen1_search | <Organisation> |
    Then I click on button "select2-results-1"
    Then I check "NextBT" is readonly
    
    
   Then I click on button "TaxTypeSelection"		
		Then I see text "Ambulance Levy" displayed
		Then I see text "Energy Industry Levy" displayed
		Then I see text "Income Tax Equivalent" displayed
		Then I see text "Payroll Tax" displayed
   #Then I select "Payroll Tax" from "TaxTypeSelection"
   #Scenario 3: Request details pass PSRM validation 
    Then I enter the details as 
    	| Fields 			| Value |
    	| DisclosureDateInput | 090916 |
   
   Then I check "NextBT" is not readonly
   Then I click on button "NextBT" 
   
   Then I see text "For tax type PAYROLL disclosure form is not valid because there is a tax role 6800964293 starting at 2013-05-01 which is prior to the disclosure date." displayed
   
    Then I enter the details as 
    	| Fields 			| Value |
    	| DisclosureDateInput | 010513 |
   Then I click on button "NextBT"
   Then I check I am on "Update Liability Commencement Date Request Summary" page
   
     #check declaration
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[1]//td[2]" contains "<FirstName>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[2]//td[2]" contains "<LastName>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[3]//td[2]" contains "<Organisation>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[4]//td[2]" contains "<Position>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[5]//td[2]" contains "<ContactPhone>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[6]//td[2]" contains "<EmailAddress>"
    
      #Then I check object with xpath "//*[contains(text(), 'Utility Type')]//following-sibling::td" contains "Gas Distribution Network"
    #Then I check object with xpath "//*[contains(text(), 'Kilometres of Route Length')]//following-sibling::td" contains "50.00 KM"
    #Then I check object with xpath "//*[contains(text(), 'Rate Per Kilometre')]//following-sibling::td" contains "$1,042.00 /KM"
    #Then I check object with xpath "//*[contains(text(), 'Tax Payable')]//following-sibling::td" contains "$52,100.00"
    #
    #Then I check object with xpath "//*[contains(text(), 'Total Amount Payable')]/..//following-sibling::td//div" contains "$52,100.00"
    
    Then I check object with xpath "//*[contains(text(), 'Organisation Name')]/..//following-sibling::td" contains "<Organisation>"
    Then I check object with xpath "//*[contains(text(), 'Australian Business Number (ABN)')]/..//following-sibling::td" contains "85085664197"
    Then I check object with xpath "//*[contains(text(), 'Client Reference Number (CRN)')]/..//following-sibling::td" contains "400107"

    Then I check object with xpath "//*[contains(text(), 'Liability Commencement Date')]//following-sibling::td" contains "01 May 2013"
   	Then I check object with xpath "//*[contains(text(), 'Tax Type')]//following-sibling::td" contains "Payroll Tax"
   	
   	 Then I click on button "CorrectInfoDeclared"
    Then I check "SummarySubmitBT" is not readonly
		Then I click on button with value "Back"
		Then I click on button with value "Cancel"
		Then I check I am on "Home" page
    Examples: 
      | PortalName | UserName | Password   | FirstName | LastName | Position   | Organisation | ContactPhone | EmailAddress         |
      | TSS        | jbradley | Dbresults1 | J         | Bradley  | Consultant | DESIGNATE PTY. LTD.  | 04 5678 9767 | jbradley@hotmail.com |
      
  @current
  Scenario Outline: DTSP-706: As an end user, I want to be able to raise a Refund Request on the portal so that I can request a refund for the Carry forward amount to the Tax Office
  
   Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
     Then I click on "Service Requests"
     Then I see text "Refund Request" displayed
     Then I click on "Refund Request"
		#Scenario 1: Selected ABN is not eligible for "Refund Request"     Then I check "SelectTaxPayer" exists
    Then I check "LodgePayrollAnswer_OrganizationalName" is readonly
    Then I check "LodgePayrollAnswer_ABN" is readonly
    Then I check "LodgePayrollAnswer_CRN" is readonly
    
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value               |
      | s2id_autogen1_search | DESIGNATE |
    Then I click on button "select2-results-1"
    Then I check "NextBT" is readonly
    Then I see text "You currently do not have any obligations with credit balance." displayed
    
    Then I check "LodgePayrollAnswer_OrganizationalName" is readonly
    Then I check "LodgePayrollAnswer_ABN" is readonly
    Then I check "LodgePayrollAnswer_CRN" is readonly
    
    #Scenario 2: Selected ABN is eligible for "Refund Request" 
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value               |
      | s2id_autogen1_search | Late Cut Pty Ltd |
    Then I click on button "select2-results-1"
     Then I check "LodgePayrollAnswer_OrganizationalName" contains "Late Cut Pty Ltd"
    Then I check "LodgePayrollAnswer_ABN" contains "56114795274"
    Then I check "LodgePayrollAnswer_CRN" contains "400106"
    
    Then I check "RefundRequest_TaxPayerBalance" contains "$ -30,490.83"
    Then I check "ObligationDescription" contains "Utilities Network Tax,01/07/2015-31/03/2016"
    Then I check "CreditAmount" contains "$ -30,490.83"
     Then I enter the details as 
    	| Fields 			| Value |
    	| CarryForwardAmount | 23423423423243 |
   	Then I click on button with value "Next"
   	Then I see text "Amount to Carry Forward cannot be greater than Credit Amount" displayed
   	Then I see text "There are outstanding filing/lodgments that the taxpayer is eligible for." displayed

    
   #Then I click on button "TaxTypeSelection"		
#		Then I see text "Ambulance Levy" displayed
#		Then I see text "Energy Industry Levy" displayed
#		Then I see text "Income Tax Equivalent" displayed
#		Then I see text "Payroll Tax" displayed
   #Then I select "Payroll Tax" from "TaxTypeSelection"
   #Scenario 3: Request details pass PSRM validation 
   
   #Then I check "NextBT" is not readonly
   #Then I click on button "NextBT" 
    #
    Then I click on button "CancelBT"
    Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "OK"
    Then I check I am on "Home" page
    
   Examples: 
      | PortalName | UserName | Password   | FirstName | LastName | Position   | Organisation | ContactPhone | EmailAddress         |
      | TSS        | jbradley | Dbresults1 | J         | Bradley  | Consultant | DESIGNATE PTY. LTD.  | 04 5678 9767 | jbradley@hotmail.com |
  
  
  @done
  Scenario Outline: DTSP-742: As an end user I want to be able to update Objection Request Form to cater for different Tax Types
  
  Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    
    Then I click on "Service Requests"
    #Scenario 1: Portal Navigation 
    Then I see text "Objection Request" displayed
    Then I click on "Objection Request"
    Then I check "SelectTaxPayer" exists
    Then I check "LodgePayrollAnswer_OrganizationalName" exists
    Then I check "LodgePayrollAnswer_ABN" exists
    Then I check "LodgePayrollAnswer_CRN" exists
    #Then I click on button "GeneralDiscardBt"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value               |
      | s2id_autogen1_search | <Organisation> |
    Then I click on button "select2-results-1"
		Then I click on button "TaxTypeSelection"
		
		Then I see text "Ambulance Levy" displayed
		Then I see text "Energy Industry Levy" displayed
		Then I see text "Income Tax Equivalent" displayed
		Then I see text "Payroll Tax" displayed
		Then I see text "Utilities(Network Facilities) Tax" displayed
		
		Then I click on button "select2-chosen-1"
		 Then I enter the details as
      | Fields               | Value               |
      | s2id_autogen1_search | Abacus |
    Then I click on button "select2-results-1"
		Then I check "TaxTypeSelection" is readonly
		Then I check "TaxTypeSelection" contains "PAYROLL"
		Then I click on "Objection Request"
		Then I click on button "select2-chosen-1"
		 Then I enter the details as
      | Fields               | Value               |
      | s2id_autogen1_search | <Organisation> |
    Then I click on button "select2-results-1"
    Then I click on button "TaxTypeSelection"
    Then I click on "Utilities(Network Facilities) Tax"
		
#		Then I see text "Ambulance Levy" displayed
#		Then I see text "Energy Industry Levy" displayed
#		Then I see text "Income Tax Equivalent" displayed
#		Then I see text "Payroll Tax" displayed
#		Then I see text "Utilities(Network Facilities) Tax" displayed
#		
		  Then I click on button "ObjectionOutOfTimeYES"
    Then I enter the details as
      | Fields             | Value                  |
      | Objection_Comments | ObjectionComment       |
      | LodgeFailureReason | LodgementFailureReason |
    Then I click on button "CheckPenalty"
    Then I click on button with value "Next"
    Then I check I am on "Objection Request Summary" page
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                                          |
      | item2 | Organisation Name                                 |
      | item3 | Australian Business Number (ABN)                  |
      | item4 | Client Reference Number (CRN)                     |
      | item5 | Subject of Objection                              |
      | item6 | Is the Objection out of time                      |
      | item7 | Reason for failing to lodge the objection on time |
      | item7 | Comments                                          |
    Then I check object with xpath "//*[contains(@id, 'ObjectionInformation')]//..//tr[3]//td[2]" contains "Yes"
    Then I check object with xpath "//*[contains(text(), 'Tax Type')]/following-sibling::td" contains "Utilities (Network Facilities) Tax"
    Then I check object with xpath "//*[contains(text(), 'Subject of Objection')]/..//following-sibling::td" contains "Penalty"
    Then I check object with xpath "//*[contains(text(), 'Reason for failing to lodge the objection on time')]/..//following-sibling::td" contains "LodgementFailureReason"
    Then I check object with xpath "//*[contains(text(), 'Comments')]/..//following-sibling::td" contains "ObjectionComment"
    
    #check declaration
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[1]//td[2]" contains "<FirstName>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[2]//td[2]" contains "<LastName>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[3]//td[2]" contains "<Organisation>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[4]//td[2]" contains "<Position>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[5]//td[2]" contains "<ContactPhone>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[6]//td[2]" contains "<EmailAddress>"
		
		
   Examples: 
      | PortalName | UserName | Password   | FirstName | LastName | Position   | Organisation | ContactPhone | EmailAddress         |
      | TSS        | jbradley | Dbresults1 | J         | Bradley  | Consultant | DESIGNATE PTY. LTD.  | 04 5678 9767 | jbradley@hotmail.com |
      
  @done
  Scenario Outline: DTSP-743: As an end user I want to be able to update Exemption Request Form to cater for different Tax Types
  
  Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    
    Then I click on "Service Requests"
  Then I click on "Exemption Request"
    #Scenario 1: Display "Objection Request" Form
    Then I check "OrganizationalName" is readonly
    Then I check "PayrollAnswer_ABN" is readonly
    Then I check "PayrollAnswer_CRN" is readonly
    Then I check "ExemptionStartDateInput" is readonly
    Then I check "ExemptionEndDateInput" is readonly
    Then I check "JustificationInput" is readonly
    #Scenario 2: "Objection Information" section displayed on the "Objection Request" Form
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value               |
      | s2id_autogen1_search | <Organisation> |
    Then I click on button "select2-results-1"
		Then I click on button "TaxTypeSelection"
		
		Then I see text "Ambulance Levy" displayed
		Then I see text "Energy Industry Levy" displayed
		Then I see text "Income Tax Equivalent" displayed
		Then I see text "Payroll Tax" displayed
		Then I see text "Utilities(Network Facilities) Tax" displayed
		
		Then I click on button "select2-chosen-1"
		 Then I enter the details as
      | Fields               | Value               |
      | s2id_autogen1_search | Abacus |
    Then I click on button "select2-results-1"
		Then I check "TaxTypeSelection" is readonly
		Then I check "TaxTypeSelection" contains "PAYROLL"
		Then I click on "Exemption Request"
		Then I click on button "select2-chosen-1"
		 Then I enter the details as
      | Fields               | Value               |
      | s2id_autogen1_search | <Organisation> |
    Then I click on button "select2-results-1"
#		Then I click on button "TaxTypeSelection"
    #Then I click on "Income Tax Equivalent Tax"
		
#		Then I see text "Ambulance Levy" displayed
#		Then I see text "Energy Industry Levy" displayed
#		Then I see text "Income Tax Equivalent" displayed
#		Then I see text "Payroll Tax" displayed
#		Then I see text "Utilities(Network Facilities) Tax" displayed
			 Then I enter the details as
      | Fields               | Value               |
      | ExemptionStartDateInput | 020617 |
      | ExemptionEndDateInput | 030617 |
#		Then I click on button "ExemptionStartDateInput"
    #Then I click on "20170602"
    #Then I click on button "calTriggerOut"
    #Then I click on button "ExemptionEndDateInput"
    #Then I click on "20170603"
    # Then I click on button "calTriggerOut"
    Then I enter the details as
      | Fields             | Value |
      | JustificationInput | TEST  |
    Then I click on button with value "Next"
    Then I check object with xpath "//*[contains(text(), 'Requested Exemption Start Date')]/..//following-sibling::td" contains "02 Jun 2017"
    Then I check object with xpath "//*[contains(text(), 'Requested Exemption End Date')]/..//following-sibling::td" contains "03 Jun 2017"
    Then I check object with xpath "//*[contains(text(), 'Tax Type')]//following-sibling::td" contains "Payroll Tax"
    Then I check object with xpath "//*[contains(text(), 'Exemption Request Justification')]/..//following-sibling::td" contains "TEST"
    Then I check I am on "Exemption Request Summary" page
    
    
     #check declaration
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[1]//td[2]" contains "<FirstName>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[2]//td[2]" contains "<LastName>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[3]//td[2]" contains "<Organisation>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[4]//td[2]" contains "<Position>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[5]//td[2]" contains "<ContactPhone>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[6]//td[2]" contains "<EmailAddress>"

		
   Examples: 
      | PortalName | UserName | Password   | FirstName | LastName | Position   | Organisation | ContactPhone | EmailAddress         |
      | TSS        | jbradley | Dbresults1 | J         | Bradley  | Consultant | DESIGNATE PTY. LTD.  | 04 5678 9767 | jbradley@hotmail.com |
      
  
  @blocked
  Scenario Outline: DTSP-744: As an end user I want to be able to update Liquidation Advice Form to cater for different Tax Types
  	#BLOCKED BY COMMUNICATION METHOD FIELD, TO BE FIXED IN THE NEXT ITERATION
  Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    
    Then I click on "Service Requests"
  Then I click on "Liquidation Advice"
    #Scenario 1: Display "Objection Request" Form
    Then I check "OrganizationalName" is empty
    Then I check "PayrollAnswer_ABN" is empty
    Then I check "PayrollAnswer_CRN" is empty
    Then I check "ExemptionStartDateInput" is readonly
    Then I check "ExemptionEndDateInput" is readonly
    Then I check "JustificationInput" is readonly
    #Scenario 2: "Objection Information" section displayed on the "Objection Request" Form
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value               |
      | s2id_autogen1_search | <Organisation> |
    Then I click on button "select2-results-1"
		Then I check "TaxTypes" contains "Ambulance Levy / Energy Industry Levy / Income Tax Equivalent / Payroll Tax / Utilities(Network Facilities) Tax"
		Then I click on button "select2-chosen-1"
		 Then I enter the details as
      | Fields               | Value               |
      | s2id_autogen1_search | Abacus |
    Then I click on button "select2-results-1"
		Then I check "TaxTypes" contains "Payroll Tax"
		Then I click on "Liquidation Advice"
		Then I click on button "select2-chosen-1"
		 Then I enter the details as
      | Fields               | Value               |
      | s2id_autogen1_search | <Organisation> |
    Then I click on button "select2-results-1"
		
#		Then I see text "Ambulance Levy" displayed
#		Then I see text "Energy Industry Levy" displayed
#		Then I see text "Income Tax Equivalent" displayed
#		Then I see text "Payroll Tax" displayed
#		Then I see text "Utilities(Network Facilities) Tax" displayed
			 Then I enter the details as
      | Fields               | Value               |
      | LiquidationStartDate | 020617 |
#		Then I click on button "LiquidationStartDate"
    #Then I click on "20170603"
    Then I click on button "ContactPerson_CommunicationMethodId"
    Then I click on "Email"
     Then I select "Victoria" from "Address_State4"
    # Then I click on button "calTriggerOut"
    Then I enter the details as
      | Fields              | Value           |
      | FirstName           | TEST            |
      | LastName            | TEST            |
      | PhoneNumber         | 33 33333333     |
      | ContactPerson_Email | TES@asdsdaf.com |
      | Address_AddressLine | TesT            |
      | Address_City4       | TEST            |
      | Address_PostCode    |      3333333333 |
    Then I click on button with value "Next"
    Then I check I am on "Liquidation Advice Summary" page
    Then I see text "Utilities (Network Facilities) Tax" displayed

		
   Examples: 
      | PortalName | UserName | Password   | FirstName | LastName | Position   | Organisation | ContactPhone | EmailAddress         |
      | TSS        | jbradley | Dbresults1 | J         | Bradley  | Consultant | DESIGNATE PTY. LTD.  | 04 5678 9767 | jbradley@hotmail.com |

   @review
  Scenario Outline: DTSP-745: As an end user I want to be able to update Tax Registration Cancellation Form to cater for registration cancellation of different Tax Types
  
  Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    
    Then I click on "Service Requests"
  Then I click on "Tax Registration Cancellation"
    #Scenario 1: Display "Objection Request" Form
   Then I check "OrganizationalName" is empty
    Then I check "PayrollAnswer_ABN" is empty
    Then I check "PayrollAnswer_CRN" is empty
    Then I check "CancellationStartDate" is readonly
    #Scenario 2: "Objection Information" section displayed on the "Objection Request" Form
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value               |
      | s2id_autogen1_search | DESIGNATE |
    Then I click on button "select2-results-1"
		Then I click on button "TaxTypeSelection"
		
		Then I see text "Ambulance Levy" displayed
		Then I see text "Energy Industry Levy" displayed
		Then I see text "Income Tax Equivalent" displayed
		Then I see text "Payroll Tax" displayed
		Then I see text "Utilities(Network Facilities) Tax" displayed
		
		Then I click on button "select2-chosen-1"
		 Then I enter the details as
      | Fields               | Value               |
      | s2id_autogen1_search | Abacus |
    Then I click on button "select2-results-1"
		Then I check "TaxTypeSelection" is readonly
		Then I check "TaxTypeSelection" contains "PAYROLL"
		 Then I click on "Tax Registration Cancellation"
		Then I click on button "select2-chosen-1"
		 Then I enter the details as
      | Fields               | Value               |
      | s2id_autogen1_search | <Organisation> |
    Then I click on button "select2-results-1"
		#Then I select "Utilities(Network Facilities) Tax" from "TaxTypeSelection"
		
#		Then I see text "Ambulance Levy" displayed
#		Then I see text "Energy Industry Levy" displayed
#		Then I see text "Income Tax Equivalent" displayed
#		Then I see text "Payroll Tax" displayed
#		Then I see text "Utilities(Network Facilities) Tax" displayed
 Then I enter the details as
      | Fields               | Value               |
      | CancellationStartDate | 020617 |
#		Then I click on button "CancellationStartDate"
    #Then I click on "20170603"
    Then I enter the details as
      | Fields            | Value |
      | ReasonDescription | TEST  |
    Then I click on button with value "Next"
    Then I check I am on "Tax Cancellation Request Summary" page
    Then I check object with xpath "//*[contains(text(), 'Cancellation Effective Date')]/..//following-sibling::td" contains "02 Jun 2017"
    #Then I check object with xpath "//*[contains(text(), 'Requested Exemption End Date')]/..//following-sibling::td" contains "03 Jun 2017"
    Then I check object with xpath "//*[contains(text(), 'Tax Type')]//following-sibling::td" contains "Payroll Tax"
    Then I check object with xpath "//*[contains(text(), 'Reason Description')]/..//following-sibling::td" contains "TEST"
    
    
     #check declaration
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[1]//td[2]" contains "<FirstName>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[2]//td[2]" contains "<LastName>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[3]//td[2]" contains "<Organisation>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[4]//td[2]" contains "<Position>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[5]//td[2]" contains "<ContactPhone>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[6]//td[2]" contains "<EmailAddress>"

		
   Examples: 
      | PortalName | UserName | Password   | FirstName | LastName | Position   | Organisation | ContactPhone | EmailAddress         |
      | TSS        | jbradley | Dbresults1 | J         | Bradley  | Consultant | AQUA PTY LTD   | 04 5678 9767 | jbradley@hotmail.com |
      
  	@review
  Scenario Outline: DTSP-788: As an end user, I want to be able to complete a Utilities(Network Facilities) Tax Return Form so that I can validate it in PSRM
    #Scenario 1: Ambulance Levy  Lodgement
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Lodgements"
    Then I see text "Payroll Tax" displayed
    Then I see text "Utilities (Network Facilities) Tax" displayed
    Then I click on "Utilities (Network Facilities) Tax"
    Then I check I am on "Network Utilities Lodgement Form" page
    Then I click on button "GeneralDiscardBt"
    Then I check "SelectTaxPayer" exists
    Then I check "LodgePayrollAnswer_OrganizationalName" exists
    Then I check "LodgePayrollAnswer_ABN" exists
    Then I check "LodgePayrollAnswer_CRN" exists
    Then I check "ObligationsDropdown" exists
    #Scenario 2: Selected ABN is not registered for "Ambulance Levy "
    Then I click on button "GeneralDiscardBt"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value               |
      | s2id_autogen1_search | <WrongOrganisation> |
    Then I click on button "select2-results-1"
    Then I see text "You are currently not registered for Utilities(Network Facilities) Tax" displayed
    Then I check "ObligationsDropdown" is readonly
    #Scenario 3: Selected ABN is registered for "Ambulance Levy"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value                 |
      | s2id_autogen1_search | <CorrectOrganisation> |
    Then I click on button "select2-results-1"
    Then I check "ObligationsDropdown" is not readonly
    Then I select "2017" from "ObligationsDropdown"
    #Scenario 4: Buttons
    Then I click on button "SaveNextBT"
    Then I check "RemoveBTN" is readonly
    Then I check "AddBTN" is readonly
    Then I check "SaveAndNextToSummaryBT" is readonly
    #Scenario 5: PSRM validation
    Then I select "Gas Distribution Network" from "NetworkDetail_UtilityTypeDropdown"
    Then I enter the details as
      | Fields                                             | Value |
      | KMOfRouteLength     |    50 |
      #| SupplyDistributionSector_ActualMegawattHours       |    50 |
      #| SupplyDistributionSector_MethodCalculateTotalMegaw | TeST  |
    Then I check "SaveAndNextToSummaryBT" is not readonly
    Then I check "AddBTN" is not readonly
    Then I check "RemoveBTN" is readonly
    Then I click on button "AddBTN"
    #Then I click on button "AddBTN"
    #Then I check "RemoveBTN" is readonly
    #Then I select "Sewerage Network" from "NetworkDetail_UtilityTypeDropdown"
    #Then I enter the details as
      #| Fields                                             | Value |
       #| KMOfRouteLength     |    50 |
    #Then I check "SaveAndNextToSummaryBT" is not readonly
    Then I click on button "SaveAndNextToSummaryBT"
    Then I check I am on "Lodgement Summary" page
     Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[1]//td[2]" contains "<FirstName>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[2]//td[2]" contains "<LastName>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[3]//td[2]" contains "<CorrectOrganisation>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[4]//td[2]" contains "<Position>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[5]//td[2]" contains "<ContactPhone>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[6]//td[2]" contains "<EmailAddress>"
    
    
    Then I check object with xpath "//*[contains(text(), 'Utility Type')]//following-sibling::td" contains "Gas Distribution Network"
    Then I check object with xpath "//*[contains(text(), 'Kilometres of Route Length')]//following-sibling::td" contains "50.00 KM"
    Then I check object with xpath "//*[contains(text(), 'Rate Per Kilometre')]//following-sibling::td" contains "$1,042.00 /KM"
    Then I check object with xpath "//*[contains(text(), 'Tax Payable')]//following-sibling::td" contains "$52,100.00"
    
    Then I check object with xpath "//*[contains(text(), 'Total Amount Payable')]/..//following-sibling::td//div" contains "$52,100.00"
    
    Then I check object with xpath "//*[contains(text(), 'Organisation Name')]/..//following-sibling::td" contains "JOINT ACTION PTY. LTD."
    Then I check object with xpath "//*[contains(text(), 'Australian Business Number (ABN)')]/..//following-sibling::td" contains "58080858724"
    Then I check object with xpath "//*[contains(text(), 'Client Reference Number (CRN)')]/..//following-sibling::td" contains "400108"

    Then I check object with xpath "//*[contains(text(), 'Return Period')]//following-sibling::td" contains "01 Apr 2017 - 31 Mar 2018"


    
		Then I click on button with value "Back"
		Then I check I am on "Network Utilities Lodgement Form" page
		Then I click on button "SaveNextBT"
		Then I click on button "SaveAndNextToSummaryBT"
		#Then I check "SaveAndNextToSummaryBT" is readonly
		Then I check I am on "Lodgement Summary" page
		 Then I click on button "CorrectInfoDeclared"
    Then I check "SummarySubmitBT" is not readonly
		
    Examples: 
      | PortalName | UserName | Password   | FirstName | LastName | Position   | WrongOrganisation | CorrectOrganisation | ContactPhone | EmailAddress         |
      | TSS        | jbradley | Dbresults1 | J         | Bradley  | Consultant | AQUA PTY LTD      | JOINT ACTION PTY. LTD. | 04 5678 9767 | jbradley@hotmail.com |
		

			@review
  Scenario Outline: DTSP-792: As an end user, I want to be able to view the Ambulance Levy lodgement summary page
    #Scenario 1: Ambulance Levy  Lodgement
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Lodgements"
    Then I see text "Payroll Tax" displayed
    Then I see text "Ambulance Levy" displayed
    Then I click on "Ambulance Levy"
    Then I check I am on "Ambulance Levy Lodgement Form" page
    Then I click on button "GeneralDiscardBt"
    Then I check "SelectTaxPayer" exists
    Then I check "LodgePayrollAnswer_OrganizationalName" exists
    Then I check "LodgePayrollAnswer_ABN" exists
    Then I check "LodgePayrollAnswer_CRN" exists
    Then I check "ObligationsDropdown" exists
    #Scenario 2: Selected ABN is not registered for "Ambulance Levy "
    Then I click on button "GeneralDiscardBt"
    Then I click on button "select2-chosen-1"
   Then I enter the details as
      | Fields               | Value                 |
      | s2id_autogen1_search | <Organisation> |
    Then I click on button "select2-results-1"
    Then I check "ObligationsDropdown" is not readonly
    Then I select "2014" from "ObligationsDropdown"
    #Scenario 4: Buttons
    Then I click on button "SaveNextBT"
    Then I wait for "2000" millisecond
    Then I check "SaveAndNextToSummaryBT" is readonly
    #Scenario 5: PSRM validation
    Then I enter the details as
      | Fields                                       | Value |
      | LodgeAmbulanceLevyAnswer_NumberSingleMembers |    11 |
      | LodgeAmbulanceLevyAnswer_NumberFamilyMembers |    11 |
    Then I check "SaveAndNextToSummaryBT" is not readonly
    Then I click on button "SaveAndNextToSummaryBT"
    Then I check I am on "Lodgement Summary" page
    
     Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[1]//td[2]" contains "<FirstName>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[2]//td[2]" contains "<LastName>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[3]//td[2]" contains "<Organisation>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[4]//td[2]" contains "<Position>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[5]//td[2]" contains "<ContactPhone>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[6]//td[2]" contains "<EmailAddress>"
    Then I check object with xpath "//*[contains(text(), 'Number of Single Members')]/..//following-sibling::td//div" contains "11"
    Then I check object with xpath "//*[contains(text(), 'Single Member Rate Per Week')]/..//following-sibling::td//div" contains "$2.20"
    Then I check object with xpath "//*[contains(text(), 'Amount Payable Per Week (Single Member)')]/..//following-sibling::td//div" contains "$24.20"
    
    Then I check object with xpath "//*[contains(text(), 'Number of Family Members')]/..//following-sibling::td//div" contains "11"
    Then I check object with xpath "//*[contains(text(), 'Family Members Rate Per Week')]/..//following-sibling::td//div" contains "$4.40"
    Then I check object with xpath "//*[contains(text(), 'Amount Payable Per Week (Family Members)')]/..//following-sibling::td//div" contains "$48.40"
    Then I check object with xpath "//*[contains(text(), 'Total Amount Payable (Weekly)')]/..//following-sibling::td//div" contains "$72.60"
    
    Then I check object with xpath "//*[contains(text(), 'Total Amount Payable')]/..//following-sibling::td//div" contains "$72.60"
    
    #
    #Then I check object with xpath "//*[contains(text(), 'Utility Type')]//following-sibling::td" contains "Gas Distribution Network"
    #Then I check object with xpath "//*[contains(text(), 'Kilometres of Route Length')]//following-sibling::td" contains "50.00 KM"
    #Then I check object with xpath "//*[contains(text(), 'Rate Per Kilometre')]//following-sibling::td" contains "$1,042.00 /KM"
    #Then I check object with xpath "//*[contains(text(), 'Tax Payable')]//following-sibling::td" contains "$52,100.00"
    #
    #Then I check object with xpath "//*[contains(text(), 'Total Amount Payable')]/..//following-sibling::td//div" contains "$52,100.00"
    #
    Then I check object with xpath "//*[contains(text(), 'Organisation Name')]/..//following-sibling::td" contains "DESIGNATE PTY. LTD."
    Then I check object with xpath "//*[contains(text(), 'Australian Business Number (ABN)')]/..//following-sibling::td" contains "85085664197"
    Then I check object with xpath "//*[contains(text(), 'Client Reference Number (CRN)')]/..//following-sibling::td" contains "400107"

    Then I check object with xpath "//*[contains(text(), 'Return Date')]//following-sibling::td" contains "May 2014"
    Then I check object with xpath "//*[contains(text(), 'Reference Period')]//following-sibling::td" contains "Feb 2014"
    
		Then I click on button with value "Back"
		Then I check I am on "Ambulance Levy Lodgement Form" page
		Then I click on button "SaveNextBT"
		Then I click on button "SaveAndNextToSummaryBT"
		#Then I check "SaveAndNextToSummaryBT" is readonly
		Then I check I am on "Lodgement Summary" page
		 Then I click on button "CorrectInfoDeclared"
    Then I check "SummarySubmitBT" is not readonly
		
    Examples: 
      | PortalName | UserName | Password   | FirstName | LastName | Position   | Organisation | ContactPhone | EmailAddress         |
      | TSS        | jbradley | Dbresults1 | J         | Bradley  | Consultant | DESIGNATE PTY. LTD. | 04 5678 9767 | jbradley@hotmail.com |
      

	@review
  Scenario Outline: DTSP-796: As an end user, I want to be able to view the Energy Industry Levy lodgement summary page with all calculated fields for Energy Industry Levy
    #Scenario 1: Ambulance Levy  Lodgement
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Lodgements"
    Then I see text "Payroll Tax" displayed
    Then I see text "Energy Industry Levy" displayed
    Then I click on "Energy Industry Levy"
    Then I click on button "GeneralDiscardBt"
    Then I check I am on "Energy Industry Levy Lodgement Form" page
    
    Then I check "SelectTaxPayer" exists
    Then I check "LodgePayrollAnswer_OrganizationalName" exists
    Then I check "LodgePayrollAnswer_ABN" exists
    Then I check "LodgePayrollAnswer_CRN" exists
    Then I check "ObligationsDropdown" exists
    #Scenario 2: Selected ABN is not registered for "Ambulance Levy "
    Then I click on button "GeneralDiscardBt"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value               |
      | s2id_autogen1_search | <WrongOrganisation> |
    Then I click on button "select2-results-1"
    Then I see text "You are currently not registered for the Energy Industry Levy" displayed
    Then I check "ObligationsDropdown" is readonly
    #Scenario 3: Selected ABN is registered for "Ambulance Levy"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value                 |
      | s2id_autogen1_search | <Organisation> |
    Then I click on button "select2-results-1"
    Then I check "ObligationsDropdown" is not readonly
    Then I select "2014" from "ObligationsDropdown"
    #Scenario 4: Buttons
    Then I click on button "SaveNextBT"
    Then I check "RemoveBTN" is readonly
    Then I check "AddBTN" is readonly
    Then I check "SaveAndNextToSummaryBT" is readonly
    #Scenario 5: PSRM validation
    Then I select "Electricity Distribution Sector" from "SupplyDistributionSector_SectorType"
    Then I enter the details as
      | Fields                                             | Value |
      | SupplyDistributionSector_EstimateMegawattHours     |    50 |
      | SupplyDistributionSector_ActualMegawattHours       |    50 |
      | SupplyDistributionSector_MethodCalculateTotalMegaw | TeST  |
    Then I check "SaveAndNextToSummaryBT" is not readonly
    Then I check "AddBTN" is not readonly
    Then I check "RemoveBTN" is readonly
    Then I click on button "AddBTN"
    Then I click on button "AddBTN"
    Then I check "RemoveBTN" is readonly
    Then I select "Electricity Supply Sector" from "SupplyDistributionSector_SectorType"
    Then I enter the details as
      | Fields                                             | Value |
      | SupplyDistributionSector_EstimateMegawattHours     |    50 |
      | SupplyDistributionSector_ActualMegawattHours       |    50 |
      | SupplyDistributionSector_MethodCalculateTotalMegaw | TeST  |
    Then I check "SaveAndNextToSummaryBT" is not readonly
    Then I click on button "SaveAndNextToSummaryBT"
    Then I check I am on "Lodgement Summary" page
    
       Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[1]//td[2]" contains "<FirstName>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[2]//td[2]" contains "<LastName>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[3]//td[2]" contains "<Organisation>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[4]//td[2]" contains "<Position>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[5]//td[2]" contains "<ContactPhone>"
    Then I check object with xpath "//*[contains(@id, 'DeclarationData')]//tr[6]//td[2]" contains "<EmailAddress>"
    Then I check object with xpath "//*[contains(text(), 'Sector Type')]/..//following-sibling::td//div" contains "Electricity Supply Sector"
    #Then I check object with xpath "//*[contains(text(), 'Return Period')]/..//following-sibling::td//div" contains "01 Jul 2013 - 30/06/2014"
    Then I check object with xpath "//*[contains(text(), 'Total Amount Payable')]/..//following-sibling::td//div" contains "$15,183.90"
    Then I check object with xpath "//*[contains(text(), 'Estimate Megawatt Hours')]/..//following-sibling::td//div" contains "50"
		Then I check object with xpath "//*[contains(text(), 'Actual Megawatt Hours')]/..//following-sibling::td//div" contains "50"
		Then I check object with xpath "//*[contains(text(), 'Method used to Calculate Total Megawatt Hours')]/..//following-sibling::td//div" contains "TeST"
	
    Examples: 
      | PortalName | UserName | Password   | FirstName | LastName | Position   | WrongOrganisation | Organisation | ContactPhone | EmailAddress         |
      | TSS        | jbradley | Dbresults1 | J         | Bradley  | Consultant | AQUA PTY LTD      | DESIGNATE PTY. LTD. | 04 5678 9767 | jbradley@hotmail.com |
		

		@review
		 Scenario Outline: DTSP-836: As an end user, I want to be required to select a JRL if I have group members that are not lodging itselfs
		 
			Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
   	And I hit Enter
    Then I click on "Group Management"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value         |
      | s2id_autogen1_search | <Organisation> |
    Then I click on button "select2-results-1"
    Then I wait for "1500" millisecond
    Then I click on button with value "Update Group"
    
    #Scenario 1: Group members without a JRL 
    
    #Click on ticked box
    Then I click on button "ctl03_wt87"
    	Then I select "2018" from "YearCombo"
    Then I select "Jan" from "MonthCombo"
    Then I click on button with value "Next"
    Then I wait for "1500" millisecond
    Then I see text "You must nominate a group member as a DGE and/or JRL if you have any group members with a Group Role as 'Group Member'" displayed
    
    Then I click on "Group Management"
    #Scenario 2: DGE is the only ACT Group Member in a 'Group Member' Group Role 
    
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value         |
      | s2id_autogen1_search | <Organisation> |
    Then I click on button "select2-results-1"
    Then I wait for "1500" millisecond
    Then I click on button with value "Update Group"
    Then I click on button "ctl03_wt49"
    	Then I select "2018" from "YearCombo"
    Then I select "Jan" from "MonthCombo"
    Then I click on button with value "Next"
    Then I wait for "1500" millisecond
    Then I check I am on "Payroll Tax Group Update Summary" page
    

    
		 
		 Examples:
		   | PortalName | UserName | Password   | FirstName | LastName | Position   | Organisation | ContactPhone | EmailAddress         |
      | TSS        | jbradley | Dbresults1 | J         | Bradley  | Consultant | DESIGNATE PTY. LTD. | 04 5678 9767 | jbradley@hotmail.com |
  
  @review
	Scenario Outline: DTSP-837: As a an end user creating/updating a group, I want to see a more detailed error message when I am prevented from adding a particular group member
		Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
   	And I hit Enter
    Then I click on "Group Management"
    Then I click on button "select2-chosen-1"
   Then I enter the details as
      | Fields               | Value         |
      | s2id_autogen1_search | <Organisation> |
    Then I click on button "select2-results-1"
    Then I wait for "1000" millisecond
    #Scenario 1: Not valid in PSRM 
     Then I click on button with value "Update Group"
    Then I click on button with value "Add Act Group Member"
    Then I wait for "1000" millisecond
    Then I switch to frame "0"
    Then I click on button "GroupRoleComboBox"
    Then I click on "Group Member"
    Then I select "Common Control" from "GroupReasonComboBox"
    And I enter the details as
      | Fields        | Value      |
      | GrpMember_ABN | 1231231231 |
    Then I click on button "PopUpSaveBT"
    
    Then I see text "Please enter an ABN that is registered for Payroll Tax" displayed
    
    #Scenario 2: In another group 
    Then I wait for "2000" millisecond
      Then I click on button with value "Add Act Group Member"
    Then I wait for "1000" millisecond
    Then I switch to frame "0"
    #Then I select "Group Member" from "GroupRoleComboBox"
    Then I click on button "GroupRoleComboBox"
    Then I click on "Group Member"
    Then I select "Common Control" from "GroupReasonComboBox"
    And I enter the details as
      | Fields        | Value      |
      | GrpMember_ABN | 25612700008 |
    Then I click on button "PopUpSaveBT"
    
     Then I see text "Please enter an ABN that is not already part of a Payroll Tax Group." displayed
    
    #Scenario 3: Adding a Non-ACT Group Member 
    
    Then I click on button "AddNonActPopUp"
    Then I wait for "3000" millisecond
     Then I switch to frame "0"
    Then I enter the details as
      | Fields               | Value         |
      | wtGrpMember_RegisteredName |TEST NON ACT  |
      | GrpMember_ABN | 234234234|
    Then I select "Victoria" from "GrpMember_State"
    Then I check "PopUpSaveBT" is not readonly
    Then I click on button "PopUpSaveBT"
    
    Then I see text "Please enter a valid ABN" displayed
    
    
	 Examples:
		   | PortalName | UserName | Password   | FirstName | LastName | Position   | Organisation | ContactPhone | EmailAddress         |
      | TSS        | jbradley | Dbresults1 | J         | Bradley  | Consultant | DESIGNATE PTY. LTD. | 04 5678 9767 | jbradley@hotmail.com |
  
  @review
  Scenario Outline: DTSP-838: As an end user, I want to see instructions when I am submitting an Annual Lodgement request
  	Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    
    Then I click on "Service Requests"
    #Scenario 1: Portal Navigation 
    Then I click on "Annual Lodgement Request"
     Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value        |
      | s2id_autogen1_search | <Organisation> |
    Then I click on button "select2-results-1"
    Then I see text "Your annual tax liability must be $6,000 or less to be eligible for annual lodgement." displayed
    
  Examples:
		   | PortalName | UserName | Password   | FirstName | LastName | Position   | Organisation | ContactPhone | EmailAddress         |
      | TSS        | jbradley | Dbresults1 | J         | Bradley  | Consultant | DESIGNATE PTY. LTD. | 04 5678 9767 | jbradley@hotmail.com |
  
  @review
  Scenario Outline: DTSP-840: As a user I want to add Non-ACT members in my group using Radio buttons for overseas members
  		Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
   	And I hit Enter
    Then I click on "Group Management"
    Then I click on button "select2-chosen-1"
   Then I enter the details as
      | Fields               | Value         |
      | s2id_autogen1_search | <Organisation> |
    Then I click on button "select2-results-1"
    Then I wait for "1000" millisecond
     Then I click on button with value "Update Group"
   
    #Scenario 1: Pop up 
    
    Then I click on button "AddNonActPopUp"
    Then I wait for "3000" millisecond
     Then I switch to frame "0"
     Then I click on button "OverseasRadioButtonYES"
    Then I enter the details as
      | Fields               | Value         |
      | RegisteredName |TEST NON ACT  |
      | OverseasRegNumber | 234234234|
    Then I select "Lebanon" from "CountryComboBox"
    Then I check "PopUpSaveBT" is not readonly
    Then I click on button "PopUpSaveBT"

    #Scenario 2: NON-ACT Group member Table 
		Then I check object with xpath "//*[contains(@id, 'TableNonACTMembers')]//td[3]" contains "TEST NON ACT"
		Then I check object with xpath "//*[contains(@id, 'TableNonACTMembers')]//td[4]" contains "234234234"
		Then I check object with xpath "//*[contains(@id, 'TableNonACTMembers')]//td[6]" contains "Lebanon"
		
		
    #Scenario 3: Summary page 
    Then I click on button "ctl03_wt49"
    	Then I select "2018" from "YearCombo"
    Then I select "Jan" from "MonthCombo"
    Then I click on button with value "Next"
    Then I wait for "2400" millisecond
    Then I check I am on "Payroll Tax Group Update Summary" page
    Then I check object with xpath "//*[contains(@id, 'NewNonACTGrpMembersDiv')]//tr//td" contains "Overseas Member"
    Then I check object with xpath "//*[contains(@id, 'NewNonACTGrpMembersDiv')]//tr//td[2]" contains "Yes"
    
    Then I check object with xpath "//*[contains(@id, 'NewNonACTGrpMembersDiv')]//tr[2]//td" contains "Registered Name"
    Then I check object with xpath "//*[contains(@id, 'NewNonACTGrpMembersDiv')]//tr[2]//td[2]" contains "TEST NON ACT"
    
    Then I check object with xpath "//*[contains(@id, 'NewNonACTGrpMembersDiv')]//tr[3]//td" contains "Overseas Member Registration Number"
    Then I check object with xpath "//*[contains(@id, 'NewNonACTGrpMembersDiv')]//tr[3]//td[2]" contains "234234234"
    
    Then I check object with xpath "//*[contains(@id, 'NewNonACTGrpMembersDiv')]//tr[5]//td" contains "Country"
    Then I check object with xpath "//*[contains(@id, 'NewNonACTGrpMembersDiv')]//tr[5]//td[2]" contains "Lebanon"
    
  Examples:
		   | PortalName | UserName | Password   | FirstName | LastName | Position   | Organisation | ContactPhone | EmailAddress         |
      | TSS        | jbradley | Dbresults1 | J         | Bradley  | Consultant | DESIGNATE PTY. LTD. | 04 5678 9767 | jbradley@hotmail.com |
      
  @review
  Scenario Outline: DTSP-850: As an end user, I want to update the Payroll Tax Registration form, so that it is easier to use
  	Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
   	And I hit Enter
   	Then I click on "Payroll Tax Registration"
   	
   	#Scenario 1: Registered for tax other than payroll 
   	 And I enter the details as
      | Fields                 | Value       |
      | RegistrationAnswer_ABN | 17118795716 |
    Then I click on button with value "Next"
    
    Then I see text "You are already registered for another tax type, please provide your Customer Reference Number (CRN) below to continue registering for Payroll Tax" displayed
   	Then I check "RegistrationAnswer_CRN" exists
   	Then I check "SelectBusinessTypeCode" does not exist
   	Then I check "RegistrationAnswer_BusinessTradingName" does not exist
   	Then I check "RegistrationAnswer_ACN" does not exist
   	Then I click on button with value "Discard"
   	Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "OK"
      
    #Scenario 2: ABN not registered in PSRM 
     And I enter the details as
      | Fields                 | Value       |
      | RegistrationAnswer_ABN | 12332451324 |
    Then I click on button with value "Next"
   	Then I check "SelectBusinessTypeCode" exists
   	Then I check "RegistrationAnswer_BusinessTradingName" exists
   	Then I check "RegistrationAnswer_ACN" exists
   
   	#Scenario 3: ABR validation 
   	 Then I select "Government" from "SelectBusinessTypeCode"
   	Then I enter the details as
      | Fields                 | Value       |
      | EmployerName           | TEST        |
      | RegistrationAnswer_BusinessTradingName    | TEST        |
    Then I click on button "TaxPayerDetailsNextBT"
    Then I see text "Your ABN is not valid. Please enter a valid ABN." displayed
    
    #Scenario 4: Successful ABR Validation 
    Then I click on "Payroll Tax Registration"
   	Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "OK"
    And I wait for "3000" millisecond
    And I enter the details as
      | Fields                 | Value       |
      | RegistrationAnswer_ABN | 80134834334 |
    Then I click on button with value "Next"
    Then I wait for "1500" millisecond
		Then I check label "Label_EmployerName" contains "Organisation Name"
    Then I enter the details as
      | Fields              | Value              |
      | EmployerName        | <CompanyName> |
      | BusinessTradingName | <CompanyName>  |
    Then I select "Government" from "SelectBusinessTypeCode"
		Then I click on button "TaxPayerDetailsNextBT"
		Then I wait for "2000" millisecond
    #Then I select "Mr" from "ContactPerson_Title"
    Then I select "Direct Post" from "CommunicationMethodId"
    Then I enter the details as
      | Fields                    | Value              |
      | AddressLine1              | TEST               |
      | Address_City              | TEST               |
      | ContactPerson_FirstName   | TEST               |
      | ContactPerson_LastName    | TEST               |
      | ContactPerson_Email       | TEST@TEST.com      |
      | PostCode                  |               3333 |
      | ContactPerson_PhoneNumber | 1234567890 |
  	Then I click on button "OrgDetailsNextBt"
   	
  Examples:
		   | PortalName | UserName | Password   | FirstName | LastName | Position   | Organisation | ContactPhone | EmailAddress         | CompanyName                  |
      | TSS        | jbradley | Dbresults1 | J         | Bradley  | Consultant | DESIGNATE PTY. LTD. | 04 5678 9767 | jbradley@hotmail.com | Dynamic Fire Pty Ltd |
  
	@review
	Scenario Outline: DTSP-899: As an end user I want to see the "Activity Type" drop down on activity history updated to cater for all Tax types
		Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
   	And I hit Enter
   	Then I click on "Activity History"
   	Then I click on button "ActivityType"
   	Then I see text "Activity Type" displayed
   	Then I select "Group Management Update" from "ActivityType"
   	Then I select "Lodgement & Amendment" from "ActivityType"
   	Then I select "Tax Registration Update" from "ActivityType"
   	Then I select "Service Request" from "ActivityType"
	 Examples:
		   | PortalName | UserName | Password   | FirstName | LastName | Position   | Organisation | ContactPhone | EmailAddress         | CompanyName                  |
      | TSS        | jbradley | Dbresults1 | J         | Bradley  | Consultant | DESIGNATE PTY. LTD. | 04 5678 9767 | jbradley@hotmail.com | Dynamic Fire Pty Ltd |
  