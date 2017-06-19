#Sample Feature Definition Template
@wip
Feature: WORK IN PROGRESS

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
    Then I click on button "CheckboxDGE"
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
    Then I click on button "CheckboxJRL"
    	Then I select "2018" from "YearCombo"
    Then I select "Jan" from "MonthCombo"
    Then I click on button with value "Next"
    Then I wait for "1500" millisecond
    Then I check I am on "Payroll Tax Group Update Summary" page
    

    
		 
		 Examples:
		   | PortalName | UserName | Password   | FirstName | LastName | Position   | Organisation | ContactPhone | EmailAddress         |
      | TSS        | jbradley | Dbresults1 | J         | Bradley  | Consultant | DESIGNATE PTY. LTD. | 04 5678 9767 | jbradley@hotmail.com |