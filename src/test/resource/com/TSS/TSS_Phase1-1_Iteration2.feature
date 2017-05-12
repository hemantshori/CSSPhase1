#Sample Feature Definition Template
#DONE: 101, 105, 116, 124, 595, 596, 647, 682
#MANUAL: 580, 601, 607, 648, 651,

@all
Feature: TSS Phase 1.1 Iteration 2

  @review
  Scenario Outline: DTSP-101: As an end user, I want to be able raise an Objection Request so that I can object on the tax amount, penalty, interest and decision on previous objections.
    #Scenarios 4, 5 and 6 must be done manually
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Service Requests"
    Then I click on "Objection Request"
    #Scenario 1: Display "Objection Request" Form
    Then I check "OrganizationalName" is readonly
    Then I check "PayrollAnswer_ABN" is readonly
    Then I check "PayrollAnswer_CRN" is readonly
    Then I check "Objection_Comments" is readonly
    Then I check "ObjectionOutOfTimeYES" is readonly
    Then I check "ObjectionOutOfTimeNO" is readonly
    Then I check "CheckTaxAmount" is readonly
    Then I check "CheckPenalty" is readonly
    Then I check "CheckInterest" is readonly
    Then I check "CheckDecision" is readonly
    #Scenario 2: "Objection Information" section displayed on the "Objection Request" Form
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value         |
      | s2id_autogen1_search | Active Bottle |
    Then I click on button "select2-results-1"
    Then I check "Objection_Comments" is readonly
    Then I check "ObjectionOutOfTimeYES" is not readonly
    Then I check "ObjectionOutOfTimeNO" is not readonly
    Then I check "CheckTaxAmount" is not readonly
    Then I check "CheckPenalty" is not readonly
    Then I check "CheckInterest" is not readonly
    Then I check "CheckDecision" is not readonly
    #Scenario 3: "Objection Request" Summary page
    Then I click on button "ObjectionOutOfTimeYES"
    Then I enter the details as
      | Fields             | Value |
      | Objection_Comments | TEST  |
      | LodgeFailureReason | TEST  |
    Then I click on button "CheckPenalty"
    Then I click on button with value "Next"
    Then I check I am on "Objection Request Summary" page
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                                          |
      | item2 | Organisation Name                                 |
      | item3 | Australian Business Number (ABN)                  |
      | item4 | Client Reference Number (CRN)                     |
      | item5 | Subject Of Objection                              |
      | item6 | Is the Objection out of time                      |
      | item7 | Reason for failing to lodge the objection on time |
      | item7 | Comments                                          |

    Examples: 
      | PortalName | UserName | Password   |
      | TSS        | jbradley | Dbresults1 |

  @fixed
  Scenario Outline: DTSP-105: As an end user, I want to be able to submit an Exemption Request so that I can request for an exemption on my Payroll Tax
    # Bug: Title in Exemption Summary is incorrect, has been raised.
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
      | Fields               | Value |
      | s2id_autogen1_search | Aqua  |
    Then I click on button "select2-results-1"
    Then I check "ExemptionStartDateInput" is not readonly
    Then I check "ExemptionEndDateInput" is not readonly
    Then I check "JustificationInput" is not readonly
    #Scenario 4: Error display
    Then I click on button "ExemptionStartDateInput"
    Then I click on "20170420"
    Then I click on button "calTriggerOut"
    Then I click on button "ExemptionEndDateInput"
    Then I click on "20170419"
    Then I click on button "calTriggerOut"
    Then I enter the details as
      | Fields             | Value |
      | JustificationInput | TEST  |
    Then I click on button with value "Next"
    Then I see text "Requested Exemption End Date should be greater than Requested Exemption Start Date" displayed
    #Scenario 3: "Objection Request" Summary page
    Then I click on button "ExemptionEndDateInput"
    Then I click on "20170421"
    #Then I click on button "calTriggerOut"
    Then I enter the details as
      | Fields             | Value |
      | JustificationInput | TEST  |
    Then I click on button with value "Next"
    Then I check I am on "Exemption Request Summary" page
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                         |
      | item2 | Organisation Name                |
      | item3 | Australian Business Number (ABN) |
      | item4 | Client Reference Number (CRN)    |
      | item5 | Requested Exemption Start Date   |
      | item6 | Requested Exemption End Date     |
      | item7 | Exemption Request Justification  |
      | item7 | Declaration                         |
      | item7 | Organisation                     |
      | item7 | Contact Phone                    |
      | item7 | Email Address                    |

    Examples: 
      | PortalName | UserName | Password   |
      | TSS        | jbradley | Dbresults1 |

  @has_bug
  Scenario Outline: DTSP-116: As an end user, I want to be able to submit a Payroll Tax Registration Cancellation Request so that I can cancel my current Payroll Tax Registration
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Service Requests"
    Then I click on "Payroll Tax Cancellation"
    #Scenario 1: Display "Payroll Tax Cancellation" Form
    Then I check "OrganizationalName" is empty
    Then I check "PayrollAnswer_ABN" is empty
    Then I check "PayrollAnswer_CRN" is empty
    Then I check "CancellationStartDate" is readonly
    Then I check "CancellationEndDate" is readonly
    Then I check "ReasonDescription" is readonly
    #Scenario 2: "Payroll Tax Cancellation Information" section becomes
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value         |
      | s2id_autogen1_search | Active Bottle |
    Then I click on button "select2-results-1"
    Then I check "CancellationStartDate" is not readonly
    Then I check "CancellationEndDate" is not readonly
    Then I check "ReasonDescription" is not readonly
    ##Scenario 4: Error display
    Then I click on button "CancellationStartDate"
    Then I click on "20170420"
    Then I click on button "calTriggerOut"
    Then I enter the details as
      | Fields            | Value |
      | ReasonDescription | TEST  |
    Then I click on button with value "Next"
    Then I see text "Not all returns for (Payroll Tax Annual Reconciliation Return) have been submitted. Cancelation eligibility rules violated." displayed
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value |
      | s2id_autogen1_search | Aqua  |
    Then I click on button "select2-results-1"
    Then I click on button "CancellationStartDate"
    Then I click on "20170420"
    #Then I click on button "calTriggerOut"
    Then I click on button "CancellationEndDate"
    Then I click on "20170414"
    #Then I click on button "calTriggerOut"
    Then I enter the details as
      | Fields            | Value |
      | ReasonDescription | TEST  |
    Then I click on button with value "Next"
    Then I see text "Cancellation End Date must be greater than Cancellation Start Date." displayed
    #Scenario 3: "Payroll Tax Cancellation" Summary page
    Then I click on button "CancellationEndDate"
    Then I click on "20170421"
    Then I click on button with value "Next"
    Then I see text "Payroll Tax Cancellation Request Summary" displayed
    #Scenario 5: Payroll Tax Cancellation Submission
    Then I click on button "CorrectInfoDeclared"
    Then I click on button with value "Submit"
    
    #can't submit here due to error
    Then I see text "Payroll Tax Cancellation Confirmation" displayed 

    Examples: 
      | PortalName | UserName | Password   |
      | TSS        | jbradley | Dbresults1 |

  @done
  Scenario Outline: DTSP-124: As an end user, I want to be able to submit an Annual Lodgement Request so that I can submit a request to change my lodgement frequency from monthly to annual
    #Title error in Annual Lodgement Request Summary page, has been flagged
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Service Requests"
    Then I click on "Annual Lodgement Request"
    Then I check "OrganizationalName" is empty
    Then I check "PayrollAnswer_ABN" is empty
    Then I check "PayrollAnswer_CRN" is empty
    Then I check "YearCombo" is readonly
    Then I check "MonthCombo" is readonly
    Then I check "AnnualLodgementRequestJustification" is readonly
    #Scenario 2: "Payroll Tax Cancellation Information" section becomes
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value         |
      | s2id_autogen1_search | Active Bottle |
    Then I click on button "select2-results-1"
    Then I check "YearCombo" is not readonly
    Then I check "MonthCombo" is readonly
    Then I check "AnnualLodgementRequestJustification" is not readonly
    ##Scenario 4: Error display
    #Scenario 3: "Payroll Tax Cancellation" Summary page
    Then I select "2018" from "YearCombo"
    Then I select "Jan" from "MonthCombo"
    And I enter the details as
      | Fields                              | Value |
      | AnnualLodgementRequestJustification | TEST  |
    Then I click on button with value "Next"
    #Scenario 5: Payroll Tax Cancellation Submission
    Then I check I am on "Annual Lodgement Request Summary" page
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                               |
      | item2 | Organisation Name                      |
      | item3 | Australian Business Number (ABN)       |
      | item4 | Client Reference Number (CRN)          |
      | item5 | Requested Effective Date               |
      | item6 | Annual Lodgement Request Justification |
      | item7 | Declaration                               |
      | item7 | Organisation                           |
      | item7 | Contact Phone                          |
      | item7 | Email Address                          |

    Examples: 
      | PortalName | UserName | Password   |
      | TSS        | jbradley | Dbresults1 |

  @has_bug
  Scenario Outline: DTSP-127: As an end user, I want to be able to submit an Annual Lodgement Request so that I can submit a request to change my lodgement frequency from monthly to annual
   	#Known error relating to the title of Liquidation Advice Summary and Confirmation page. Has been flagged
   
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Service Requests"
    Then I click on "Liquidation Advice"
    Then I check "OrganizationalName" is empty
    Then I check "PayrollAnswer_ABN" is empty
    Then I check "PayrollAnswer_CRN" is empty
    Then I check "FirstName" is readonly
    Then I check "LastName" is readonly
    Then I check "PhoneNumber" is readonly
    Then I check "ContactPerson_Email" is readonly
    Then I check "Address_AddressLine" is readonly
    Then I check "Address_City4" is readonly
    Then I check "Address_PostCode" is readonly
    Then I check "CommunicationMethodId" is readonly
    Then I check "CountryId4" is readonly
    Then I check "Address_State4" is readonly
    #Scenario 2: "Payroll Tax Cancellation Information" section becomes
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value         |
      | s2id_autogen1_search | Active Bottle |
    Then I click on button "select2-results-1"
    Then I check "FirstName" is not readonly
    Then I check "LastName" is not readonly
    Then I check "PhoneNumber" is not readonly
    Then I check "ContactPerson_Email" is not readonly
    Then I check "Address_AddressLine" is not readonly
    Then I check "Address_City4" is not readonly
    Then I check "Address_PostCode" is not readonly
    Then I check "CommunicationMethodId" is not readonly
    Then I check "CountryId4" is not readonly
    Then I check "Address_State4" is not readonly
    ##Scenario 4: Error display
    Then I click on button "LiquidationStartDate"
    Then I click on "20170420"
    Then I click on button "calTriggerOut"
    Then I click on button "ContactPerson_CommunicationMethodId"
    Then I click on "Email"
    Then I select "Victoria" from "Address_State4"
    Then I enter the details as
      | Fields              | Value         |
      | FirstName           | TEST          |
      | LastName            | TEST          |
      | PhoneNumber         | 33 3|
      | ContactPerson_Email | TES |
      | Address_AddressLine | TesT          |
      | Address_City4       | TEST          |
      | Address_PostCode    |          33 |
    Then I click on button with value "Next"
    Then I see text "Invalid Phone Number. Phone Number should be 10 digits. Please try again." displayed
    Then I see text "Please enter the correct number of digits for this field." displayed
    Then I see text "Incorrect Email Format." displayed
    
    
    
    #Scenario 3: "Payroll Tax Cancellation" Summary page
     Then I enter the details as
      | Fields              | Value         |
      | FirstName           | TEST          |
      | LastName            | TEST          |
      | PhoneNumber         | 33 33333333|
      | ContactPerson_Email | TES@asdsdaf.com |
      | Address_AddressLine | TesT          |
      | Address_City4       | TEST          |
      | Address_PostCode    |    3333333333 |
    Then I click on button with value "Next"
    Then I check I am on "Liquidation Advice Summary" page
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                               |
      | item2 | Organisation Name                     |
      | item3 | Australian Business Number (ABN)       |
      | item4 | Client Reference Number (CRN)          |
      | item5 | Liquidation Start Date               |
      | item6 | Liquidator Contact Details |
      | item7 | Application Details                              |
      | item7 | Declaration |
      | item7 | Organisation                           |
      | item7 | Contact Phone                          |
      | item7 | Email Address                          |
      | item7 | Declaration |
    
    
    #Scenario 5: Payroll Tax Cancellation Submission
    Then I click on button "CorrectInfoDeclared"
    Then I click on button with value "Submit"
		Then I see text "Liquidation Advice Confirmation" displayed
		
    Examples: 
      | PortalName | UserName | Password   |
      | TSS        | jbradley | Dbresults1 |
	
	@has_bug
	Scenario Outline: DTSP-595: As an end user, I want to be able to add/edit/remove ACT group members to my Payroll Tax Group
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
      | s2id_autogen1_search | Active Bottle |
    Then I click on button "select2-results-1"
    #Scenario 1: Display "Add ACT Group Member" button 
    #Scenario 2: Display "Add ACT Group Member" button 
    
    Then I click on button with value "Create Group"
    Then I switch to frame "0"
    Then I select "Group Member" from "GroupRoleComboBox"
    Then I select "Common Control" from "GroupReasonComboBox"
    
    Then I click on button with value "Save"
    Then I check "AddACTPopUp" exists
    Then I click on button "AddACTPopUp"
    Then I switch to frame "0"
    #Scenario 3: Pop up 
    Then I see text "ABN" displayed
    Then I see text "Group Role" displayed
    Then I see text "Grouping Reason" displayed
    Then I see text "Other Grouping Reason" displayed
    Then I click on button "GroupRoleComboBox"
    Then I click on "Group Member"
    Then I select "Common Control" from "GroupReasonComboBox"
      And I enter the details as
      | Fields        | Value      |
      | GrpMember_ABN | 78602736943 |
    #Scenario 4: Save button activated 
    Then I check "PopUpSaveBT" is not readonly
    #Scenario 5: Successfully validated ABN in PSRM 
    Then I click on button "PopUpSaveBT"
    
    #Scenario 6: Unsuccessfully validated ABN in PSRM 
    Then I click on button "AddACTPopUp"
    Then I switch to frame "0"
    Then I click on button "GroupRoleComboBox"
    Then I click on "Group Member"
    Then I select "Common Control" from "GroupReasonComboBox"
    And I enter the details as
      | Fields        | Value      |
      | GrpMember_ABN | 22222222222 |
    Then I click on button "PopUpSaveBT"
    Then I see text "ABN not recognized" displayed
    
    #Scenario 14: Adding a Group Member validations 
    Then I click on button "AddACTPopUp"
    Then I switch to frame "0"
    Then I click on button "GroupRoleComboBox"
    Then I click on "Group Member"
    Then I select "Common Control" from "GroupReasonComboBox"
    And I enter the details as
      | Fields        | Value      |
      | GrpMember_ABN | 67607795808 |
    Then I click on button "PopUpSaveBT"
    Then I see text "Business already exists in another group" displayed
    
    #Scenario 15: Group Member (lodging for itself) 
    Then I click on button "l03_wtPopupLink"
    Then I switch to frame "0"
    Then I click on button "GroupRoleComboBox"
    Then I click on "Group Member (lodging itself)"
    Then I select "Common Control" from "GroupReasonComboBox"
    Then I click on button "PopUpSaveBT"
    Then I click on button "ctl03_wt83"
    Then I see text "The nominated DGE cannot have a Group Role of 'Group Member (lodging itself)" displayed
    
    #Scenario 7: Remove ACT Group Member 
    Then I click on button "ctl03_wt127"
    Then I see "Do you really want to remove the organisation from your Payroll Tax Group?" displayed on popup and I click "OK"
    Then I see text "ACTIVE BOTTLE PTY. LTD." not displayed
    
    #Scenario 16: DGE 
    Then I click on button "l03_wtPopupLink"
    Then I switch to frame "0"
    Then I click on button "GroupRoleComboBox"
    Then I click on "Group Member (lodging itself)"
    Then I select "Common Control" from "GroupReasonComboBox"
    Then I click on button "PopUpSaveBT"
    Then I click on button "ctl03_wt83"
    Then I see text "The nominated DGE cannot have a Group Role of 'Group Member (lodging itself)" displayed
    
    
    #Scenario 12: User attempts to remove themselves 
   	Then I select "2018" from "YearCombo"
    Then I select "Jan" from "MonthCombo"
    Then I click on button with value "Next"
    
    #popup has extraneous spacing
    Then I see "You have elected to remove yourself from this Payroll Tax Group. Do you wish to proceed?" displayed on popup and I click "Cancel"
    
    #Scenarios 5, 6, 9, 10, 11 are best done manually
    
    Examples: 
      | PortalName | UserName | Password   |
      | TSS        | jbradley | Dbresults1 |
      
  @done
	Scenario Outline: DTSP-596: As a Payroll Tax Group member, I want to be able to view the details of my Payroll Tax Group
		Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
   	And I hit Enter
    Then I click on "Group Management"
    
    #Scenario 1: Display "Group Management" Form 
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                     |
      | item2 | Choose a Taxpayer ABN |
      | item3 | Organisational Name             |
      | item4 | Australian Business Number (ABN)           |
      | item5 | Client Reference Number (CRN)                   |
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value         |
      | s2id_autogen1_search | LONG LOG |
    Then I click on button "select2-results-1"
    
    
    #Scenario 4: "Group Management" "Update Group" button 
    Then I click on button with value "Update Group"
		Then I click on button with value "Add Act Group Member"
		Then I switch to frame "0"
		Then I click on button with value "Cancel"
		
		Then I click on button with value "Add Non-Act Group Member"
		Then I switch to frame "0"
		Then I click on button with value "Cancel"
		
		Then I click on "Group Management"
		 Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value         |
      | s2id_autogen1_search | LOG ON |
    Then I click on button "select2-results-1"
    Then I click on button with value "Update Group"
    
    #Scenario 5: View no "ACT Group Members" 
    Then I click on button "ctl03_wt127"
    Then I see "Do you really want to remove the organisation from your Payroll Tax Group?" displayed on popup and I click "OK"
    
    Then I click on button "ctl03_wt127"
    Then I see "Do you really want to remove the organisation from your Payroll Tax Group?" displayed on popup and I click "OK"
    
    Then I click on button "ctl03_wt127"
    Then I see "Do you really want to remove the organisation from your Payroll Tax Group?" displayed on popup and I click "OK"
    
    Then I see text "You currently do not have any group members" displayed
    
    #Scenario 6: View no "Non-ACT Group Members" 
    Then I see text "You currently do not have any non-ACT group members" displayed
    
    #Scenario 7: Selected ABN not part of payroll tax group 
    Then I click on "Group Management"
		Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value         |
      | s2id_autogen1_search | DAY |
    Then I click on button "select2-results-1"
   	Then I see text "You are not currently a part of a Payroll Tax Group" displayed
   	Then I click on button with value "Create Group"
   	Then I switch to frame "0"
   	 Then I click on button "GroupRoleComboBox"
    Then I click on "Group Member (lodging itself)"
    Then I select "Common Control" from "GroupReasonComboBox"
    Then I click on button "PopUpSaveBT"
   	
   	#Scenario 13: Page Title 
   	Then I click on "Group Management"
   	Then I see text "Payroll Tax Group Summary" displayed
   	Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value         |
      | s2id_autogen1_search | DAY |
    Then I click on button "select2-results-1"
   	#Scenario 10: Adding selected ABN to group first 
   	Then I click on button with value "Create Group"
   	Then I switch to frame "0"
   	Then I check "GrpMember_ABN" contains "44105791697"
   	Then I check "RichWidgets_wt18_block_wtMainContent_wt13" contains "DAY & CO PTY LIMITED"
    Then I select "Group Member" from "GroupRoleComboBox"
    Then I select "Common Control" from "GroupReasonComboBox"
    Then I click on button with value "Save"
    Then I see text "Update Payroll Tax Group" displayed
   	
   	Then I see text "DAY & CO PTY LIMITED" displayed
   	Then I see text "44105791697" displayed
   	
    #Scenarios 2, 3, 8, 9, 12 are best done manually
    
    Examples: 
      | PortalName | UserName | Password   |
      | TSS        | jscott | Dbresults1 |
	
	@onhold
	Scenario Outline: DTSP-646: Update phone number field validation rules to reflect Australian numbers and allow future dates selection in PayRoll Tax Registration form
	 Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    
    #Scenario 1: User enters Phone Number on any TSS forms 
    Then I click on "Payroll Tax Registration"
    And I enter the details as
      | Fields        | Value      |
      | ContactPerson_PhoneNumber | 3333333333 |
    Then I check "ContactPerson_PhoneNumber" contents match regex "\d\d \d\d\d\d \d\d\d\d"
   	
		#Then I click on "Payroll Tax Registration"
    #Then I check "TaxPayerDetailsNext" is readonly
    Then I select "Government" from "SelectBusinessTypeCode"
    #Then I select "Mr" from "ContactPerson_Title"
    Then I select "Direct Post" from "CommunicationMethodId"
    Then I enter the details as
      | Fields                    | Value              |
      | EmployerName              | DB RESULTS PTY LTD |
      | BusinessTradingName       | DB RESULTS PTY LTD |
      | AddressLine1              | TEST               |
      | Address_City              | TEST               |
      | ContactPerson_FirstName   | TEST               |
      | ContactPerson_LastName    | TEST               |
      | ContactPerson_Email       | TEST@TEST.com      |
      | RegistrationAnswer_ABN    |        97110187767 |
      | RegistrationAnswer_ACN    |          110187767 |
      | PostCode                  |               3333 |
    #Then I select "AL" from "Address_State"
    Then I select "Other" from "SelectBusinessTypeCode"
    Then I click on button "AddressLine1"
    # Then I see text "Title" not displayed
    Then I click on button "TaxPayerDetailsNext"
    #Scenario 1:User should see 4 digit codes after industry name (retrieved from PSRM) under the Business Activity Category dropdown
    Then I see text "Business Activity Elsewhere in Australia" displayed
    Then I click on button "ACTWagesPaidBackBt"
    And I enter the details as
      | Fields        | Value      |
      | ContactPerson_PhoneNumber | 33333333 |
    Then I click on button "TaxPayerDetailsNext"
    Then I see text "Invalid Phone Number. Phone Number should be 10 digits. Please try again." displayed
    And I enter the details as
      | Fields        | Value      |
      | ContactPerson_PhoneNumber | 3333333333 |
     Then I click on button "TaxPayerDetailsNext"
      Then I click on button "select2-chosen"
    Then I enter the details as
      | Fields               | Value |
      | s2id_autogen4_search |  6940 |
    Then I click on button "select2-results"
    # Then I see text "Advertising Services" displayed
    #Then I click on button "ACTWagesPaidNext"
    #Then I click on "DateBusinessStart"
    #Then I click on "20170428"
    #Then I click on "DateBusinessLiable"
    #Then I click on "20170428"
    #Then I enter the details as
    #	| Fields 			| Value |
    #	| DateBusinessStart | 12-04-1995 | 
    #	| DateBusinessLiable| 01-19-1996 | 
    #	| NumberOfEmployees | 33 |	
   #	Then I click on button "PayrollNextBT"
   #	Then I click on button "ConfirmBackBt"
   #	
   #	Then I click on "DateBusinessStart"
    #Then I click on "20170428"
    #Then I click on "DateBusinessLiable"
    #Then I click on "20170428"
   #	Then I enter the details as
    #	| Fields 			| Value |
    #	| DateBusinessStart | 12-04-2019 | 
    #	| DateBusinessLiable| 01-19-2020 | 
    #Then I click on button "PayrollNextBT"
   #	Then I click on button "ConfirmBackBt"
   #	
   #	Then I click on "DateBusinessStart"
    #Then I click on "20170428"
    #Then I click on "DateBusinessLiable"
    #Then I click on "20170428"
   #	Then I enter the details as
    #	| Fields 			| Value |
    #	| DateBusinessStart | 12-04-2017 | 
    #	| DateBusinessLiable| 12-04-2017 | 
    #Then I click on button "PayrollNextBT"
   #	Then I click on button "ConfirmBackBt"
     #
    #Then I click on "Payroll Tax Registration Updates"
    Then I click on "Payroll Tax Registration Update"
    Then I click on "Update Contact Details"
		Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "OK"
    
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value         |
      | s2id_autogen1_search | AQUA |
    Then I click on button "select2-results-1"
		And I enter the details as
      | Fields        | Value      |
      | ContactPerson_PhoneNumber | 3333333333 |
    Then I check "ContactPerson_PhoneNumber" contents match regex "\d\d \d\d\d\d \d\d\d\d"
    Then I click on button with value "Next"
    Then I check I am on "Update Contact Details Summary" page
    Then I click on button with value "Back"
    And I enter the details as
      | Fields        | Value      |
      | ContactPerson_PhoneNumber | 33333333 |
    Then I click on button with value "Next"
    Then I see text "Invalid Phone Number. Phone Number should be 10 digits. Please try again." displayed
    Then I click on "User Profile"
    Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "OK"
    Then I click on button with value "Edit User Profile"
    And I enter the details as
    	| Fields		| Value |
    	| PhoneNumber | 33333333 |
   	Then I click on button with value "Submit"
   	Then I see text "Invalid Phone Number. Phone Number should be 10 digits. Please try again." displayed
   	And I enter the details as
    	| Fields		| Value |
    	| PhoneNumber | 3333333333 |
   	
   	Then I click on button with value "Submit"
   	Then I check I am on "View User Profile" page
   	
   	#Scenarios 3 and 4 are best done manuallyS
    
		Examples: 
      | PortalName | UserName | Password   |
      | TSS        | jbradley | Dbresults1 |
	
  @review
  Scenario Outline: DTSP-647: Update Payroll Tax Registration form for ease of use
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    #Scenario 3:The User should not see any Title field on the Payroll Tax Registration Form
    Then I click on "Payroll Tax Registration"
    Then I check "TaxPayerDetailsNext" is readonly
    Then I select "Government" from "SelectBusinessTypeCode"
    #Then I select "Mr" from "ContactPerson_Title"
    Then I select "Direct Post" from "CommunicationMethodId"
    Then I enter the details as
      | Fields                    | Value              |
      | EmployerName              | DB RESULTS PTY LTD |
      | BusinessTradingName       | DB RESULTS PTY LTD |
      | AddressLine1              | TEST               |
      | Address_City              | TEST               |
      | ContactPerson_FirstName   | TEST               |
      | ContactPerson_LastName    | TEST               |
      | ContactPerson_Email       | TEST@TEST.com      |
      | RegistrationAnswer_ABN    |        97110187767 |
      | RegistrationAnswer_ACN    |          110187767 |
      | PostCode                  |               3333 |
      | ContactPerson_PhoneNumber | 13 2432 5664       |
    #Then I select "AL" from "Address_State"
    Then I select "Other" from "SelectBusinessTypeCode"
    Then I click on button "AddressLine1"
    # Then I see text "Title" not displayed
    Then I click on button "TaxPayerDetailsNext"
    #Scenario 1:User should see 4 digit codes after industry name (retrieved from PSRM) under the Business Activity Category dropdown
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value |
      | s2id_autogen1_search |  4400 |
    Then I click on button "select2-results-1"
    #Then I see text "Accomodation" displayed
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value |
      | s2id_autogen1_search |  6932 |
    Then I click on button "select2-results-1"
    # Then I see text "Accounting Services" displayed
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value |
      | s2id_autogen1_search |  6940 |
    Then I click on button "select2-results-1"
    # Then I see text "Advertising Services" displayed
    Then I click on button "ACTWagesPaidNext"
    #Scenario 2: User should only see 2 options "Yes" or "No" in the radio buttons for the question “Are you a member of a group?”
    Then I click on button "GroupMember_YES"
    Then I click on button "GroupMember_NO"
    #Scenario 5: "Provide Group Number" field should be options
    Then I click on button "GroupMember_YES"
    Then I see text "Provide group number" displayed
    #Scenario 4: The User should not see any Title field on the Update Contact Person Form
    Then I click on "Payroll Tax Registration Update"
    Then I click on "Update Contact Details"

    #Then I see text "Title" not displayed
    Examples: 
      | PortalName | UserName | Password   |
      | TSS        | jbradley | Dbresults1 |
      
  @redo
  Scenario Outline: DTSP-649: Add Validation Rules and make other changes to the Payroll Tax Lodgement Form
   Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
   Then I click on "Payroll Tax Lodgement"
   Then I click on button "Discard"
	#Scenario 1: Australia-wide Wages incl. ACT >= ACT Taxable Wages 
	#Scenario 4: Days where you paid or were liable to pay taxable or interstate <= no. of days in that particular filing period 
	
	 Then I click on button "select2-chosen-1"
   Then I enter the details as
      | Fields               | Value         |
      | s2id_autogen1_search | ACTIVE BOTTLE |
   Then I click on button "select2-results-1"
	 Then I click on "Annual Reconciliation"
	 Then I select "2016" from "AnnualObligationSelect"
	 Then I click on button with value "Save and Next"
	 Then I click on button "ClaimingACTProportion_Yes"
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
      | AustralianWide																 | 999 	 |
      | DaysPaidTaxable 															 | 367  	 |
    Then I click on button "SubmitBT"
    Then I see text "Australia-wide Wages incl. ACT should be greater than or equal to the ACT Taxable Wages." displayed
		Then I see text "Days where you paid or were liable to pay taxable or interstate should be less than or equal to the number of days in that particular filing period." displayed
		Then I click on "Payroll Tax Lodgement"
		Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "OK"
		Then I click on button "Discard"
		#Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "OK"
		
	#Scenario 2: Group ACT Wages >= ACT Taxable Wages 
	#Scenario 3: Australia-wide Group Wages incl. ACT >= Group ACT Wages 
	
	 Then I click on button "select2-chosen-1"
   Then I enter the details as
      | Fields               | Value         |
      | s2id_autogen1_search | LONG LOG |
   Then I click on button "select2-results-1"
	 Then I click on "Monthly Return"
	 Then I select "Dec 2016" from "MonthlyObligationSelect"
	 Then I click on button with value "Save and Next"
	 Then I click on button "ClaimingACTProportion_Yes"
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
      | GroupActWages																 | 10 	 |
      | AustralianWide 															 | 1  	 |
    Then I click on button "SubmitBT"
  Then I see text "Group ACT Wages should be greater than or equal to the ACT Taxable Wages." displayed
  Then I see text "Australia-wide Group Wages incl. ACT should be greater than or equal to the Group ACT Wages." displayed
#		Then I click on "Payroll Tax Lodgement"
#		Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "OK"
#		Then I click on button "Discard"
	
	#Scenario 5: Days where 1 group member paid or was liable to pay taxable or interstate <= no. of days in that particular filing period 
	Then I click on "Sign Out"
	Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "OK"
	Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName2> |
      | PasswordInput | <Password> |
    And I hit Enter
   Then I click on "Payroll Tax Lodgement"
   Then I click on button "Discard"
   Then I click on button "select2-chosen-1"
   Then I enter the details as
      | Fields               | Value         |
      | s2id_autogen1_search | LOG ON |
   Then I click on button "select2-results-1"
	 Then I click on "Annual Reconciliation"
	 Then I select "2012" from "AnnualObligationSelect"
	 Then I click on button with value "Save and Next"
	 Then I click on button "ClaimingACTProportion_Yes"
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
      | AustralianWide																 | 999 	 |
      | GroupActWages																 	| 10 	 	|
      | DaysPaidTaxable 															 | 300  	 |
    Then I click on button "SubmitBT"
    Then I see text "Days where 1 group member paid or was liable to pay taxable or interstate should be less than or equal to the number of days in that particular filing period." displayed
   #Scenario 6: Hints to remind users of the max. no. of days in that filing period 
    Then I see text "Max days" displayed
    
    #Scenario 7: Accordion header and layout of the "Wages / Reconciliation" section 
    Then I see text "(01/02/2012 - 30/06/2012 / Designated group employer for a group and lodging for itself / Group Number: 8)" displayed
   
		#Scenario 9: "Monthly Return" and "Annual Reconciliation" section    
    Then I see text "Monthly Return" not displayed
    Then I see text "Annual Reconciliation" not displayed
	
		#Scenario 8: "Total Amount" section 
		Then I enter the details as
      | Fields                                         | Value |
			| AustralianWide																 | 10000000 	 |
      | GroupActWages																 		| 10000000 	 	|
      | DaysPaidTaxable 															 | 150  	 |
		Then I click on button "SubmitBT"
		Then I see text "Less Total Tax Paid" not displayed

	
	

  
  Examples: 
      | PortalName | UserName | Password   | UserName2 |
      | TSS        | jbradley | Dbresults1 | jscott 	 |

	@review
	Scenario Outline: DTSP-676:  As a Payroll Tax Group Member, I want to be able to add/edit/remove 'Non-ACT Group Members' to my group
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
      | s2id_autogen1_search | ACTIVE BOTTLE |
    Then I click on button "select2-results-1"
    Then I click on button with value "Create Group"
    Then I switch to frame "0"
    Then I select "Group Member" from "GroupRoleComboBox"
    Then I select "Common Control" from "GroupReasonComboBox"
    Then I click on button with value "Save"
    Then I check "AddNonActPopUp" exists
    
    #Scenario 2: Display "Add Non-ACT Group Member" button 
     Then I click on "Group Management"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value         |
      | s2id_autogen1_search | LONG LOG |
    Then I click on button "select2-results-1"
    Then I click on button with value "Update Group"
    
    Then I check "AddNonActPopUp" exists
    
    #Scenario 3: Pop up 
    Then I click on button "AddNonActPopUp"
    Then I switch to frame "0"
    Then I check "OverseasMemberCheckBox" exists
    Then I check "RegisteredName" exists
    Then I check "OverseasRegNumber" exists
    Then I check "CountryComboBox" exists
    Then I check "GrpMember_ABN" exists
    Then I check "GrpMember_State" exists
    
    #Scenario 4: Save button activated
    Then I click on button "OverseasMemberCheckBox"
    Then I enter the details as
      | Fields               | Value         |
      | RegisteredName |TEST NON ACT  |
      | OverseasRegNumber | 234234234|
    Then I select "Lebanon" from "CountryComboBox"
    Then I check "PopUpSaveBT" is not readonly
    Then I click on button "PopUpSaveBT"

    
    
    #Scenarios 5, 6 and 7 are best tested manually
    
    Examples: 
      | PortalName | UserName | Password   |
      | TSS        | jbradley | Dbresults1 |
      
  @onhold
  Scenario Outline: DTSP-682: Update Country field in Pay Roll Tax Registration form
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Payroll Tax Registration Update"
    Then I click on "Update Business Address"
    #Scenario 2: Update Business Address Form
    Then I check "CountryCode" is readonly
    Then I check "CountryCode" contains "AUS"
    Then I click on button "Address_State"
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                     |
      | item2 | Australian Capital Territory |
      | item3 | New South Wales              |
      | item4 | Northern Territory           |
      | item5 | Queensland                   |
      | item6 | South Australia              |
      | item7 | Tasmania                     |
      | item7 | Victoria                     |
      | item7 | Western Australia            |
      
    #Scenario 3: Update Contact Person Form 
		Then I click on "Update Contact Details"
		Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value         |
      | s2id_autogen1_search | Active Bottle |
    Then I click on button "select2-results-1"
    Then I check "CountryId4" contains "AUS"
    Then I click on button "Address_State"
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                     |
      | item2 | Australian Capital Territory |
      | item3 | New South Wales              |
      | item4 | Northern Territory           |
      | item5 | Queensland                   |
      | item6 | South Australia              |
      | item7 | Tasmania                     |
      | item7 | Victoria                     |
      | item7 | Western Australia            |
    Then I select "Aruba" from "CountryId"
    Then I see text "Postcode" not displayed
    Then I see text "Territory" not displayed
    Then I see text "Suburb" not displayed
    #Scenario 1: Payroll Tax Registration Form 
    Then I click on "Payroll Tax Registration"
    Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "OK"
    Then I check "CountryCode" is readonly
    Then I check "CountryCode" contains "AUS"
    Then I click on button "CheckBusinessAdress"
    Then I check "CountryCode2" contains "AUS"
    Then I click on button "Address_State2" 
     Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                     |
      | item2 | Australian Capital Territory |
      | item3 | New South Wales              |
      | item4 | Northern Territory           |
      | item5 | Queensland                   |
      | item6 | South Australia              |
      | item7 | Tasmania                     |
      | item7 | Victoria                     |
      | item7 | Western Australia            |
    Then I click on button "Address_CountryCode2"
    Then I click on "Aruba"
   # Then I select "Aruba" from "CountryCode2"
    Then I check "Address_City2" does not exist
    Then I check "Address_PostCode2" does not exist
    Then I check "Address_State2" does not exist
    
    Then I click on button "CheckSameAsJurisdiction"
    Then I check "CountryCode3" contains "AUS"
    Then I click on button "Address_State3" 
     Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                     |
      | item2 | Australian Capital Territory |
      | item3 | New South Wales              |
      | item4 | Northern Territory           |
      | item5 | Queensland                   |
      | item6 | South Australia              |
      | item7 | Tasmania                     |
      | item7 | Victoria                     |
      | item7 | Western Australia            |
    Then I click on button "CountryCode3"
    Then I click on "Aruba"
    Then I check "Address_City3" does not exist
    Then I check "Address_PostCode3" does not exist
    Then I check "Address_State3" does not exist
    Examples: 
      | PortalName | UserName | Password   |
      | TSS        | jbradley | Dbresults1 |

      
   @review
   Scenario Outline: DTSP-758: As an end user, I want to be limited to only a month and year selection when I am creating/editing my Payroll Tax Group
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
      | s2id_autogen1_search | LONG LOG |
    Then I click on button "select2-results-1"
   	Then I click on button with value "Update Group"
   	
   	#Scenario 1
   	Then I click on button "YearCombo"
   	Then I see text "2012" displayed
   	Then I see text "2013" displayed
   	Then I see text "2014" displayed
   	Then I see text "2015" displayed
   	Then I see text "2016" displayed
   	Then I see text "2017" displayed
   	Then I see text "2018" displayed
   	Then I see text "2019" displayed
   	
   	#Scenario 2
   	Then I click on button "MonthCombo"
   	Then I see text "Jan" displayed
   	Then I see text "Feb" displayed
   	Then I see text "Mar" displayed
   	Then I see text "Apr" displayed
   	Then I see text "May" displayed
   	Then I see text "Jun" displayed
   	Then I see text "Jul" displayed
   	Then I see text "Aug" displayed
   	Then I see text "Sep" displayed
   	Then I see text "Oct" displayed
   	Then I see text "Nov" displayed
   	Then I see text "Dec" displayed
   	
   	#Scenario 3
   	
   Examples: 
      | PortalName | UserName | Password   |
      | TSS        | jbradley | Dbresults1 |