Feature: Some feature

 @wip
 Scenario Outline: UAP Dropdown Test
  Given I want to login to portal "CSS"
     And I enter then details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
   And I hit Enter
	Given I want to login to portal "UAP"
	Then I click on "Installation Settings"
	Then I click on "Organisation Profile"
	Then I select "<Pattern>" from "DateDisplay"
	Then I click on "Save"
	#Then I print all values from dropdown "DateDisplay"
	Given I want to login to portal "CSS"
	Then I check that an element with "id" as "block_wtDueDate" and "class" as "DateField" matches pattern "<Pattern>"
	Then I click on "Usage"
	Then I click on "Usage History"
	And I check that an element with "id" as "block_wtDueDate" and "class" as "DateField" matches pattern "<Pattern>"
	Then I click on "Goals & Targets"
	And I check that an element with "id" as "block_wtDueDate" and "class" as "DateField" matches pattern "<Pattern>"
	Then I click on "Billing History"
	And I check element with "id" as "wtTDDate" matches pattern "<Pattern>"
	Then I click on "Accounts"
	Then I click on "Account Financial History"
	And I check element with "id" as "wtDate" matches pattern "<Pattern>"
	Then I click on "Activity History"
	And I check element with xpath "//*[contains(@id, 'ActivityTable')]/tbody/tr[1]/td[1]/div" matches pattern "<Pattern>"
	# And I check element with "class" as "TableRecords NoResponsive OSFillParent" matches pattern "<Pattern>"
	Then I click on "Settings"
	And I check element with "id" as "wtDOBShow" matches pattern "<Pattern>"
	

  Examples: 
      | UserName | Password   | Pattern     |
			| Michael  | Dbresults1 | MONTHDDYYYY |
			| Michael  | Dbresults1 | DDMMYYYY 		|
			| Michael  | Dbresults1 | DDMONTHYYYY |
			| Michael  | Dbresults1 | DDMONYYYY 	|
			| Michael  | Dbresults1 | MMDDYYYY 		|
			| Michael  | Dbresults1 | MONDDYYYY 	|
			| Michael  | Dbresults1 | MONTHDDYYYY |
			| Michael  | Dbresults1 | YYDDMON 		|
			| Michael  | Dbresults1 | YYMMDD 			|
			| Michael  | Dbresults1 | YYMONTHDD 	|
			| Michael  | Dbresults1 | YYYYDDMON 	|
			| Michael  | Dbresults1 | YYYYMMDD 		|
			| Michael  | Dbresults1 | YYYYMONTHDD |