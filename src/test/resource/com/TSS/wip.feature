#Sample Feature Definition Template
Feature: WORK IN PROGRESS

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
   	Then I click on button with value "Next"
   	Then I see text "The Requested Exemption End Date must be later than the Requested Exemption Start Date." displayed
   	#Scenario 4: Voluntary Disclosure 
   	Then I click on "Update Liability Commencement Date Request"
   	Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "OK"
   	Then I see text "Voluntary Disclosure" not displayed
   	
   		 Examples:
		   | PortalName | UserName | Password   | FirstName | LastName | Position   | Organisation | ContactPhone | EmailAddress         |
      | TSS        | jbradley | Dbresults1 | J         | Bradley  | Consultant | DESIGNATE PTY. LTD. | 04 5678 9767 | jbradley@hotmail.com |
      
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
      
      @wip
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
      
    