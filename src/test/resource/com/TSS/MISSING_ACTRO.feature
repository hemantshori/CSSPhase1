#Author: your.email@your.domain.com
#Keywords Summary :
#Feature: List of scenarios.
#Scenario: Business rule through list of steps with arguments.
#Given: Some precondition step
#When: Some key actions
#Then: To observe outcomes or validation
#And,But: To enumerate more Given,When,Then steps
#Scenario Outline: List of steps for data-driven as an Examples and <placeholder>
#Examples: Container for s table
#Background: List of steps run before each of the scenarios
#""" (Doc Strings)
#| (Data Tables)
#@ (Tags/Labels):To group Scenarios
#<> (placeholder)
#""
## (Comments)
#Sample Feature Definition Template
@all
Feature: Missing ACTRO Stuff

  @done
  Scenario Outline: Tax Agent Account Activation Error + Disappearing Position field after Registration bug (Tax Agent) + No ABN Information check
    #Onhold due to laggy Registration part 2 page
    Given I want to login to portal "<PortalName>"
    Then I click on "Create Account"
    Then I click on button "RegistrationAsTaxAgent"
    Then I enter the details as
      | Fields                   | Value         |
      | TaxAgentBusinessName     | <CompanyName> |
      | InputTaxAgentABN         | <ABN>         |
      | BusinessAddress_Postcode |          3333 |
      | BusinessAddress_Address  | TEST          |
      | BusinessAddress_Suburb   | TEST          |
    Then I click on button "TermsandConditionsCheckBox"
    Then I select "Victoria" from "BusinessAddress_StateId"
    Then I click on button with value "Next"
    Then I wait for "1500" millisecond
    Then I enter the details as
      | Fields                       | Value                           |
      | Registration_FirstName       | TEST                            |
      | Registration_LastName        | TEST                            |
      | Registration_Position        | TEST                            |
      | Registration_PhoneNumber     |                      1234567890 |
      | Registration_Email           | <NewEmail>                      |
      | Registration_Username        | <NewUserName>                   |
      | Registration_NewPassword     | <Password>                      |
      | Registration_ConfirmPassword | <Password>                      |
      | Registration_Hint            | Done as a result of automation! |
    Then I click on button with value "Submit"
    Then I check I am on "Registration Confirmation" page
    Then I want to login to portal "RegistrationLinkTable"
    Then I click on button "ActivationLink"
    And I enter the details as
      | Fields        | Value         |
      | UserNameInput | <NewUserName> |
      | PasswordInput | <Password>    |
    And I hit Enter
    Then I check I am on "Home" page
    Then I see text "Please note, as there are currently no taxpayer accounts associated with your login, there is no information to display." displayed
    Then I click on "User Profile"
    Then I click on button "EditBT"
    Then I check "Input_LastName2" is not empty

    #NewUserName and NewEmail must be changed with every registration
    Examples: 
      | PortalName | CompanyName                                 | ABN         | NewUserName          | NewEmail                 | Password   |
      | TSS        | The trustee for MD & KJ Fragar Family Trust | 70167081615 | automation_taxagent5 | TaxAgent5@automation.com | Dbresults1 |

  @done
  Scenario Outline: Disappearing Position field after Registration bug (Business Registration)
    #Onhold due to laggy Registration part 2 page
    Given I want to login to portal "<PortalName>"
    Then I click on "Create Account"
    Then I click on button "RegistrationAsBusiness"
    Then I enter the details as
      | Fields                  | Value |
      | InputABNNumber_Business | <ABN> |
      | InputCRNNumber_Business | <CRN> |
    Then I click on button "TermsandConditionsCheckBox"
    Then I click on button with value "Next"
    Then I wait for "1500" millisecond
    Then I enter the details as
      | Fields                       | Value                           |
      | Registration_FirstName       | Automation Test                 |
      | Registration_LastName        | Automation Test                 |
      | Registration_Position        | This was automated              |
      | Registration_PhoneNumber     |                      1234567890 |
      | Registration_Email           | <NewEmail>                      |
      | Registration_Username        | <NewUserName>                   |
      | Registration_NewPassword     | <Password>                      |
      | Registration_ConfirmPassword | <Password>                      |
      | Registration_Hint            | Done as a result of automation! |
    #Then I select "Victoria" from "BusinessAddress_StateId"
    Then I click on button with value "Submit"
    Then I check I am on "Registration Confirmation" page
    Then I want to login to portal "RegistrationLinkTable"
    Then I click on button "ActivationLink"
    And I enter the details as
      | Fields        | Value         |
      | UserNameInput | <NewUserName> |
      | PasswordInput | <Password>    |
    And I hit Enter
    Then I check I am on "Home" page
    Then I click on "User Profile"
    Then I click on button "EditBT"
    Then I check "Input_LastName2" is not empty

    #automation_business1 needs to be changed with every success!
    Examples: 
      | PortalName | CompanyName                                 | ABN         | CRN    | NewUserName          | NewEmail                 | Password   |
      | TSS        | The trustee for MD & KJ Fragar Family Trust | 62163296044 | 400105 | automation_business4 | business4@automation.com | Dbresults1 |


  @done
  Scenario Outline: The Exemption Request Form does not allow the user to enter a start date in the past but PSRM will allow a past date.
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Service Requests"
    Then I click on "Exemption Request"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value |
      | s2id_autogen1_search | ABCAD |
    Then I click on button "select2-results-1"
    Then I click on button "ExemptionStartDateInput"
    Then I click on "20170502"
    #Then I click on button "calTriggerOut"
    Then I click on button "ExemptionEndDateInput"
    Then I click on "20170529"
    Then I enter the details as
      | Fields             | Value |
      | JustificationInput | TEST  |
    Then I click on button with value "Next"
    Then I check I am on "Exemption Request Summary" page

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password   | CRN         | ABN         |
      | TSS        | UserNameInput | PasswordInput | jbradley | Dbresults1 | 12121212121 | 21212121212 |

  @done
  Scenario Outline: Check if Update Refund Details form has the Organization section of the Declaration filled
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Tax Registration Update"
    Then I click on "Update Payroll Refund Details"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value                |
      | s2id_autogen1_search | ABCAD DESIGN PTY LTD |
    Then I click on button "select2-results-1"
    Then I click on button "Refunds_NO"
    Then I click on button with value "Next"
    Then I check object with xpath "//*[contains(@name, 'Label_Organisation')]/parent::td/following-sibling::td" contains "ABCAD DESIGN PTY LTD"

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password   | CRN         | ABN         |
      | TSS        | UserNameInput | PasswordInput | jbradley | Dbresults1 | 12121212121 | 21212121212 |

  @done
  Scenario Outline: ACN field in Payroll Tax Registration Form bug
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Payroll Tax Registration"
    And I enter the details as
      | Fields                 | Value       |
      | RegistrationAnswer_ABN | 83117378917 |
    Then I click on button with value "Verify"
    Then I wait for "1500" millisecond
    Then I enter the details as
      | Fields              | Value              |
      | EmployerName        | <CompanyName> |
      | BusinessTradingName | <CompanyName>  |
    Then I select "Government" from "SelectBusinessTypeCode"
    Then I check "RegistrationAnswer_ACN" is empty
		Then I click on button with value "Next"
		Then I wait for "1500" millisecond
		 Then I enter the details as
		  | Fields                    | Value              |
      | AddressLine1              | TEST               |
      | Address_City              | TEST               |
      | ContactPerson_FirstName   | TEST               |
      | ContactPerson_LastName    | TEST               |
      | ContactPerson_Email       | TEST@TEST.com      |
    Then I click on button with value "Cancel"
    Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "OK"
    Given I want to login to portal "<PortalName>"
    Then I click on "Payroll Tax Registration"
     And I enter the details as
      | Fields                 | Value       |
      | RegistrationAnswer_ABN | 83117378917 |
    Then I click on button with value "Verify"
    Then I wait for "1500" millisecond
    Then I enter the details as
      | Fields              | Value              |
      | EmployerName        | sadfasdfadsf |
      | BusinessTradingName | asdfadsfadsfasdf  |
      | RegistrationAnswer_ACN | 27349832721342134124302 |
    Then I select "Company" from "SelectBusinessTypeCode"
		Then I click on button with value "Next"
		
		Then I see text "Your Employer Name doesn't match with your ABN. Please try again." displayed
		Then I see text "Your ACN doesn't match with your ABN. Please try again." displayed
		 Then I enter the details as
      | Fields              | Value              |
      | EmployerName        | <CompanyName> |
      | BusinessTradingName | <CompanyName>  |
      | RegistrationAnswer_ACN | 117378917 |
		Then I click on button with value "Next"
		Then I wait for "1500" millisecond
		Then I enter the details as
		  | Fields                    | Value              |
      | AddressLine1              | TEST               |
      | Address_City              | TEST               |
      | ContactPerson_FirstName   | TEST               |
      | ContactPerson_LastName    | TEST               |
      | ContactPerson_Email       | TEST@TEST.com      |

    Examples: 
      | PortalName | CompanyName                  | ABN         | UserName | Password   |
      | TSS        | The Fire Company Pty Limited | 83117378917 | jbradley | Dbresults1 |

@done
  Scenario Outline: Total Taxable Wages in Payroll Tax Registration dropdown bug
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Payroll Tax Registration"
    And I enter the details as
      | Fields                 | Value       |
      | RegistrationAnswer_ABN | 83117378917 |
    Then I click on button with value "Verify"
    Then I wait for "1500" millisecond
    Then I enter the details as
      | Fields              | Value              |
      | EmployerName        | <CompanyName> |
      | BusinessTradingName | <CompanyName>  |
    Then I select "Government" from "SelectBusinessTypeCode"
    Then I check "RegistrationAnswer_ACN" is empty
		Then I click on button with value "Next"
		Then I wait for "1500" millisecond
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
  	Then I click on button "select2-chosen"
    Then I enter the details as
      | Fields               | Value |
      | s2id_autogen1_search |  6940 |
    Then I click on button "select2-results"
    Then I click on button "ACTWagesPaidNextBt"
    Then I select "FY 2011/12" from "YearComboBox"
		Then I select "FY 2012/13" from "YearComboBox"
		Then I select "FY 2013/14" from "YearComboBox"
		Then I select "FY 2014/15" from "YearComboBox"
		Then I select "FY 2015/16" from "YearComboBox"
		
		
    Examples: 
      | PortalName | CompanyName                  | ABN         | UserName | Password   |
      | TSS        | The Fire Company Pty Limited | 83117378917 | jbradley | Dbresults1 |
      
   @done
   Scenario Outline: Current Employer Status on Dashboard bug
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
   	Then I check I am on "Home" page
   #Independent Employer 
   Then I click on button "select2-chosen-1"
   Then I enter the details as
      | Fields               | Value                |
      | s2id_autogen1_search | Late Cut Pty Ltd |
   Then I click on button "select2-results-1"
   Then I wait for "4000" millisecond
   #change these to regex matches and find them by id once Jonathan makes the fix
   Then I check object with xpath "//*[contains(@id, 'EmployerStatus')]//div//div[2]" contains "Independent Employer"
   #Group Member
   Then I click on button "select2-chosen-1"
   Then I enter the details as
      | Fields               | Value                |
      | s2id_autogen1_search | MEMBER CHECK PTY LIMITED |
   Then I click on button "select2-results-1"
   Then I wait for "4000" millisecond
   Then I check object with xpath "//*[contains(@id, 'EmployerStatus')]//div//div[2]" contains "Group Member in Group Number: 19"
   #DGE
   Then I click on button "select2-chosen-1"
   Then I enter the details as
      | Fields               | Value                |
      | s2id_autogen1_search | DESIGNATE |
   Then I click on button "select2-results-1"
   Then I wait for "4000" millisecond
   Then I check object with xpath "//*[contains(@id, 'EmployerStatus')]//div//div[2]" contains "DGE in Group Number: 19"
   #DGE and JRL
    Then I click on button "select2-chosen-1"
   Then I enter the details as
      | Fields               | Value                |
      | s2id_autogen1_search | JOINT ACTION |
   Then I click on button "select2-results-1"
   Then I wait for "4000" millisecond
   Then I check object with xpath "//*[contains(@id, 'EmployerStatus')]//div//div[2]" contains "DGE and JRL in Group Number: 20"
   
   	Examples: 
      | PortalName | CompanyName                  | ABN         | UserName | Password   |
      | TSS        | The Fire Company Pty Limited | 83117378917 | jbradley | Dbresults1 |
      
      
   @done
   Scenario Outline: Organisation Name on Payroll Tax Registration instead of Employer Name
   	Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Payroll Tax Registration"
    And I enter the details as
      | Fields                 | Value       |
      | RegistrationAnswer_ABN | 83117378917 |
    Then I click on button with value "Verify"
    Then I wait for "1500" millisecond
		Then I check label "Label_EmployerName" contains "Organisation Name"
    Then I enter the details as
      | Fields              | Value              |
      | EmployerName        | <CompanyName> |
      | BusinessTradingName | <CompanyName>  |
    Then I select "Government" from "SelectBusinessTypeCode"
		Then I click on button with value "Next"
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
  	Then I click on button "select2-chosen"
    Then I enter the details as
      | Fields               | Value |
      | s2id_autogen1_search |  6940 |
    Then I click on button "select2-results"
    Then I click on button "ACTWagesPaidNextBt"
		 Then I click on "DateBusinessStart"
    Then I click on "20170501"
    Then I click on "DateBusinessLiable"
    Then I click on "20170502"
     Then I enter the details as
      | Fields                   | Value |
      | NumberOfEmployees        | 33    |
     Then I click on "PayrollNext"
    Then I click on button "Refunds_NO"
    Then I click on button "RefundDetailsBT"
    Then I check label "Label_Declarer_Organisation" contains "Organisation Name"
   	Examples: 
      | PortalName | CompanyName                  | ABN         | UserName | Password   |
      | TSS        | The Fire Company Pty Limited | 83117378917 | jbradley | Dbresults1 |
      
   
   @done
   Scenario Outline: <return period> / <employer status> / Group Number <group number> under wages section
   
   	Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Lodgements"
    Then I click on "Payroll Tax"
    
    #Designated group employer for a group and lodging for itself 
    Then I click on button with value "Discard"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value  |
      | s2id_autogen1_search | DESIGNATE |
    Then I click on button "select2-results-1"
    Then I click on button "LodgePayrollAnswer_TypeMonthly"
    Then I select "May 2017" from "MonthlyObligationSelect"
    Then I click on "NextSection"
    Then I wait for "3000" millisecond
   	Then I check object with xpath "//*[contains(@id, 'Titlewages')]//div[3]" contents match regex "\(\d{2} \w+ \d{4} - \d{2} \w+ \d{4} / ([\w|\s|\W]+ / [\w|\s]+:\s\d+)\)"
   
   	Then I click on button with value "Discard"
   	Given I want to login to portal "<PortalName>"
   	Then I click on "Lodgements"
    Then I click on "Payroll Tax"
    Then I click on button with value "Discard"
    Then I click on button "select2-chosen-1"
     
    #Member of a group lodging for itself 
    Then I enter the details as
      | Fields               | Value  |
      | s2id_autogen1_search | MEMBER |
    Then I click on button "select2-results-1"
    Then I click on button "LodgePayrollAnswer_TypeMonthly"
    Then I select "May 2017" from "MonthlyObligationSelect"
    Then I click on "NextSection"
    Then I wait for "3000" millisecond
   	Then I check object with xpath "//*[contains(@id, 'Titlewages')]//div[3]" contents match regex "\(\d{2} \w+ \d{4} - \d{2} \w+ \d{4} / ([\w|\s|\W]+ / [\w|\s]+:\s\d+)\)"
   
   	Then I click on button with value "Discard"
   	Given I want to login to portal "<PortalName>"
   	Then I click on "Lodgements"
    Then I click on "Payroll Tax"
    Then I click on button with value "Discard"
    Then I click on button "select2-chosen-1"
   
   	#Independent employer (non-group) lodging for itself
   	Then I enter the details as
      | Fields               | Value  |
      | s2id_autogen1_search | DUSTER |
    Then I click on button "select2-results-1"
    Then I click on button "LodgePayrollAnswer_TypeMonthly"
    Then I select "May 2017" from "MonthlyObligationSelect"
    Then I click on "NextSection"
    Then I wait for "3000" millisecond
   	Then I check object with xpath "//*[contains(@id, 'Titlewages')]//div[3]" contents match regex "\(\d{2} \w+ \d{4} - \d{2} \w+ \d{4} / ([\w|\s|\W]+ / [\w|\s]+:\s\d+)|([\w|\s|\W]+)\)"
   
 		Then I click on button with value "Discard"
 		Given I want to login to portal "<PortalName>"
   	Then I click on "Lodgements"
    Then I click on "Payroll Tax"
    Then I click on button with value "Discard"
    Then I click on button "select2-chosen-1"
    
    #Independent employer (non-group) lodging for itself
   
   	Then I enter the details as
      | Fields               | Value  |
      | s2id_autogen1_search | JOINT	 |
    Then I click on button "select2-results-1"
    Then I click on button "LodgePayrollAnswer_TypeAnnual"
    Then I select "01 Jul 2016 - 30 Jun 2017" from "AnnualObligationSelect"
    Then I click on "NextSection"
    Then I wait for "3000" millisecond
   	Then I check object with xpath "//*[contains(@id, 'Titlewages')]//div[3]" contents match regex "\(\d{2} \w+ \d{4} - \d{2} \w+ \d{4} / ([\w|\s|\W]+ / [\w|\s]+:\s\d+)\)"
   
 		
   Examples: 
      | PortalName | CompanyName                  | ABN         | UserName | Password   |
      | TSS        | The Fire Company Pty Limited | 83117378917 | jbradley | Dbresults1 |
   
   @wip
   Scenario Outline: Group Management Create group with DGE bug
   	Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    
    Then I click on "Group Management"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value  |
      | s2id_autogen1_search | DESIGNATE	 |
    Then I click on button "select2-results-1"
    Then I click on button with value "Update Group"
    Then I wait for "2000" millisecond
    Then I select "2018" from "YearCombo"
    Then I select "Jan" from "MonthCombo"
    Then I click on button with value "Next"
    Then I check I am on "Payroll Tax Group Update Summary" page
   		
   	 Examples: 
      | PortalName | CompanyName                  | ABN         | UserName | Password   |
      | TSS        | The Fire Company Pty Limited | 83117378917 | jbradley | Dbresults1 |
   
   
   #@wip
   #Scenario Outline: Screenshot Test
   #Given I want to login to portal "GOOGLE"
   #Then I take a screenshot with name "Screenshot Test"
   #
      #Examples: 
      #| PortalName | UserNameField | PasswordField | UserName | Password   | CRN         | ABN         |
      #| TSS        | UserNameInput | PasswordInput | jbradley | Dbresults1 | 12121212121 | 21212121212 |
   #
   
   #@TEST
  #Scenario Outline: PDF DOWNLOAD TEST
    #Given I want to login to portal "<PortalName>"
    #And I enter the details as
      #| Fields        | Value      |
      #| UserNameInput | <UserName> |
      #| PasswordInput | <Password> |
    #And I hit Enter
    #Then I click on "Service Requests"
    #Then I click on "Exemption Request"
    #Then I click on button "select2-chosen-1"
    #Then I enter the details as
      #| Fields               | Value |
      #| s2id_autogen1_search | ABCAD |
    #Then I click on button "select2-results-1"
    #Then I click on button "ExemptionStartDateInput"
    #Then I click on "20170502"
    #Then I click on button "calTriggerOut"
    #Then I click on button "ExemptionEndDateInput"
    #Then I click on "20170529"
    #Then I enter the details as
      #| Fields             | Value |
      #| JustificationInput | TEST  |
    #Then I click on button with value "Next"
    #Then I check I am on "Exemption Request Summary" page
    #Then I click on button "CorrectInfoDeclared"
    #Then I click on button with value "Submit"
    #Then I wait for "5000" millisecond
    #Then I click on button with value "Download PDF"
#
    #Examples: 
      #| PortalName | UserNameField | PasswordField | UserName | Password   | CRN         | ABN         |
      #| TSS        | UserNameInput | PasswordInput | jbradley | Dbresults1 | 12121212121 | 21212121212 |
   #
