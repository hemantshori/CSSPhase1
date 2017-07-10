#Sample Feature Definition Template
#DONE: 89, 108, 574, 685, 689, 690, 703, 704, 712, 733, 770, 779
#MANUAL: 702, 734, 740, 757, 780, 809
@all
Feature: TSS Phase 1.1 Iteration 2

  @review
  Scenario Outline: DTSP-89: As an end user, I want to be able to view my Activity History so that I can track my previous activities
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    #Scenario 1: Left navigation menu item
    Then I see text "Activity History" displayed
    Then I click on "Activity History"
    #Scenario 2: Activity History page
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName          |
      | item2 | ACTIVITY DATE     |
      | item3 | ACTIVITY TYPE     |
      | item4 | ABN               |
      | item5 | ORGANISATION NAME |
      | item6 | DESCRIPTION       |
    #Scenario 3: More than 10 activity history
    Then I check "ListNavigation_PageNumber" exists
    Then I click on "Sign Out"
    #Scenario 4: No Activity History
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | testman1   |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Activity History"
    Then I see text "You do not have any activity history available." displayed

    Examples: 
      | PortalName | UserName | Password   |
      | TSS        | jbradley | Dbresults1 |

  @review
  Scenario Outline: DTSP-108: As an end user, I want to raise a Generic Request so that I don't need to contact customer service.
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Service Requests"
    Then I click on "Generic Request"
    #Scenario 1: Display "Generic Request" Form
    Then I check "OrganizationalName" is readonly
    Then I check "PayrollAnswer_ABN" is readonly
    Then I check "PayrollAnswer_CRN" is readonly
    Then I check "GenericRequest_CommunicateWith" is readonly
    Then I check "GenericRequest_RequestType" is readonly
    Then I check "GenericRequest_RequestComments" is readonly
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value |
      | s2id_autogen1_search | Aqua  |
    Then I click on button "select2-results-1"
    #Scenario 2: "Request Details" section displayed on the "Generic Request" Form
    Then I check "OrganizationalName" is readonly
    Then I check "PayrollAnswer_ABN" is readonly
    Then I check "PayrollAnswer_CRN" is readonly
    Then I check "GenericRequest_CommunicateWith" is not readonly
    Then I check "GenericRequest_RequestType" is not readonly
    Then I check "GenericRequest_RequestComments" is not readonly
    #Scenario 4: Does not trigger.
    #Scenario 6: requires manual testing
    #Scenario 3: Request details pass PSRM validation
    Then I select "Requestor" from "GenericRequest_CommunicateWith"
    Then I select "General Enquiry" from "GenericRequest_RequestType"
    Then I enter the details as
      | Fields                         | Value |
      | GenericRequest_RequestComments | TEST  |
    Then I click on button with value "Next"
    Then I check I am on "Generic Request Summary" page
    Then I click on button with value "Submit"
    Then I check I am on "Generic Request Confirmation" page
    Then I see text "Your Generic Request has been successfully submitted. An email has been sent to you for your reference." displayed
    Then I see text "To download the details you have submitted, please click the button below." displayed

    Examples: 
      | PortalName | UserName | Password   |
      | TSS        | jbradley | Dbresults1 |

  @review
  Scenario Outline: DTSP-574: As an end user I want to be able to see a summary of my payroll tax details on the dashboard so that I know if my information is up-to-date
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I check I am on "Home" page
    Then I see text "Home" displayed
    #Scenario 2: Edit Contact Person
    Then I click on button "ContactPerson_Edit"
    Then I check I am on "Update Contact Details" page
    #Scenario 3: Edit Employer Status
    Then I click on "Home"
    Then I click on button "Home_GroupManagement_Edit"
    Then I check I am on "Group Management" page
    #Scenario 4: Edit Mailing Address
    Then I click on "Home"
    Then I click on button "PostalAddress_Edit"
    Then I check I am on "Update Contact Details" page
    #Scenario 5: Update Net Amount Due section
    Then I click on "Home"
    Then I see text "Account Balance" displayed
    Then I check "NetAmountDueContainer" has CSS property "font-size" with value "14.6667px"
    #Scenario 6: Next Payment Due box
    Then I see text "Next Payment Due" not displayed
    # #Scenario 7: 'Transactions History'
    Then I check "MonthlyTable" exists
    Then I check "YearlyTable" exists
    #Scenario 8: Credit payments
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value |
      | s2id_autogen1_search | Navy  |
    Then I click on button "select2-results-1"
    Then I wait for "1000" millisecond
    Then I see text "$497.74" displayed

    Examples: 
      | PortalName | UserName | Password   |
      | TSS        | jbradley | Dbresults1 |

  @review
  Scenario Outline: DTSP-685: As an end user, I want all pre populated and non editable fields on the portal to be greyed out
    #Scenario 1: Portal Registration
    Given I want to login to portal "<PortalName>"
    Then I click on "Create Account"
    Then I click on "Register as a Business"
    Then I enter the details as
      | Fields                  | Value       |
      | InputABNNumber_Business | 91098629095 |
      | InputCRNNumber_Business |      400004 |
    Then I click on button "TermsandConditionsCheckBox2"
    Then I click on button "RegistrationSubmit"
    Then I check "Column2_wtABN" is readonly
    Then I check "Column2_wtCRN" is readonly
    Then I check "Column2_wtBusinessName" is readonly
    #Scenario 2: All forms
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Service Requests"
    Then I click on "Annual Lodgement Request"
    Then I check "OrganizationalName" is readonly
    Then I check "PayrollAnswer_ABN" is readonly
    Then I check "PayrollAnswer_CRN" is readonly
    Then I check "YearCombo" is readonly
    Then I check "MonthCombo" is readonly
    Then I click on "Exemption Request"
    Then I check "OrganizationalName" is readonly
    Then I check "PayrollAnswer_ABN" is readonly
    Then I check "PayrollAnswer_CRN" is readonly
    Then I check "ExemptionStartDateInput" is readonly
    Then I check "ExemptionEndDateInput" is readonly
    Then I check "JustificationInput" is readonly
    Then I click on "Liquidation Advice"
    Then I check "OrganizationalName" is readonly
    Then I check "PayrollAnswer_ABN" is readonly
    Then I check "PayrollAnswer_CRN" is readonly
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
    Then I click on "Generic Request"
    Then I check "OrganizationalName" is readonly
    Then I check "PayrollAnswer_ABN" is readonly
    Then I check "PayrollAnswer_CRN" is readonly
    Then I check "GenericRequest_CommunicateWith" is readonly
    Then I check "GenericRequest_RequestType" is readonly
    Then I check "GenericRequest_RequestComments" is readonly
    Then I click on "Objection Request"
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
    Then I click on "Payroll Tax Cancellation"
    Then I check "OrganizationalName" is readonly
    Then I check "PayrollAnswer_ABN" is readonly
    Then I check "PayrollAnswer_CRN" is readonly
    Then I check "CancellationStartDate" is readonly
    Then I check "CancellationEndDate" is readonly
    Then I check "ReasonDescription" is readonly
    Then I click on "Tax Registration Update"
    Then I click on "Update Business Address"
    Then I check "OrganizationalName" is readonly
    Then I check "PayrollAnswer_ABN" is readonly
    Then I check "PayrollAnswer_CRN" is readonly
    Then I check "Address_CountryCode" is readonly
    Then I check "Address_AddressLine" is readonly
    Then I check "Address_City" is readonly
    Then I check "Address_State" is readonly
    Then I check "Address_PostCode" is readonly
    Then I click on "Update Business Trading Name"
    Then I check "OrganizationalName" is readonly
    Then I check "PayrollAnswer_ABN" is readonly
    Then I check "PayrollAnswer_CRN" is readonly
    Then I check "BusinessTradingName" is readonly
    Then I click on "Update Payroll Contact Details"
    Then I check "OrganizationalName" is readonly
    Then I check "PayrollAnswer_ABN" is readonly
    Then I check "PayrollAnswer_CRN" is readonly
    Then I check "ContactPerson_FirstName" is readonly
    Then I check "ContactPerson_LastName" is readonly
    Then I check "ContactPerson_PhoneNumber" is readonly
    Then I check "ContactPerson_Email" is readonly
    Then I check "Address_AddressLine7" is readonly
    Then I check "Address_City4" is readonly
    Then I check "Address_PostCode4" is readonly
    Then I click on "Update Payroll Refund Details"
    Then I check "OrganizationalName" is readonly
    Then I check "PayrollAnswer_ABN" is readonly
    Then I check "PayrollAnswer_CRN" is readonly
    Then I check "Refunds_YES" is readonly
    Then I check "Refunds_NO" is readonly
    Then I click on "Payroll Tax Lodgement"
    Then I check "OrganizationalName" is readonly
    Then I check "PayrollAnswer_ABN" is readonly
    Then I check "PayrollAnswer_CRN" is readonly
    Then I check "LodgePayrollAnswer_TypeMonthly" is readonly
    #Then I check "MonthlyObligationSelect" is readonly
    Then I check "LodgePayrollAnswer_TypeAnnual" is readonly

    Examples: 
      | PortalName | UserName | Password   |
      | TSS        | jbradley | Dbresults1 |

  @review
  Scenario Outline: DTSP-689: As a user I want to update the order of menu items on the left navigation panel
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                 |
      #| item2 | Home                               |
      | item3 | Payroll Tax Lodgement    |
      | item4 | Return History           |
      | item5 | Service Requests         |
      | item6 | Group Management         |
      | item6 | Payroll Tax Registration |
      | item6 | Tax Registration Update  |
      | item6 | Manage Account Details   |
      | item6 | Activity History         |
      | item6 | User Profile             |
      | item6 | Sign Out                 |
    Then I click on "Service Requests"
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                 |
      | item2 | Annual Lodgement Request |
      | item3 | Exemption Request        |
      | item4 | Generic Request          |
      | item5 | Liquidation Advice       |
      | item6 | Objection Request        |
      | item6 | Payroll Tax Cancellation |
    Then I click on "Tax Registration Update"
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                       |
      | item2 | Update Business Address        |
      | item3 | Update Business Trading Name   |
      | item4 | Update Payroll Contact Details |
      | item5 | Update Payroll Refund Details  |

    Examples: 
      | PortalName | UserName | Password   |
      | TSS        | jbradley | Dbresults1 |

  @review
  Scenario Outline: DTSP-690: As an end user, I want to be able to update my Business Trading Name on my Tax Registration so that I can keep my Tax Registration information up-to-date
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Tax Registration Update"
    Then I click on "Update Business Trading Name"
    #Scenario 1: Display "Update Business Trading Name" Form
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName                         |
      | item2 | Choose a Taxpayer                |
      | item3 | Organisation Name                |
      | item4 | Australian Business Number (ABN) |
      | item5 | Client Reference Number (CRN)    |
      | item5 | Business Trading Name            |
      | item5 | Request Details                  |
      | item5 | Taxpayer Details                 |
    Then I check "OrganizationalName" is readonly
    Then I check "PayrollAnswer_ABN" is readonly
    Then I check "PayrollAnswer_CRN" is readonly
    Then I check "BusinessTradingName" is readonly
    #Scenario 2: Business Trading Name section displayed on the "Update Business Trading Name" Form
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value |
      | s2id_autogen1_search | Aqua  |
    Then I click on button "select2-results-1"
    Then I check "OrganizationalName" is readonly
    Then I check "PayrollAnswer_ABN" is readonly
    Then I check "PayrollAnswer_CRN" is readonly
    Then I check "BusinessTradingName" is not readonly
    #Scenario 3: "Update Business Trading Name" Summary page
    Then I click on button with value "Next"
    Then I see text "Update Business Trading Name Summary" displayed
    #Scenario 5: Update Business Trading Name Submission
    Then I click on button "CorrectInfoDeclared"
    Then I click on button with value "Submit"
    Then I see text "Update Business Trading Name Complete!" displayed
    Then I see text "Your Update Business Trading Name Request has been successfully submitted. An email has been sent to you for your reference." displayed
    Then I see text "To download the details you have submitted, please click the button below." displayed

    Examples: 
      | PortalName | UserName | Password   |
      | TSS        | jbradley | Dbresults1 |

  @review
  Scenario Outline: DTSP-692: As an end user, I want to see an updated version of the Return History page, so that it is more user-friendly
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    #Scenario 1: Left Navigation Menu
    Then I see text "Return History" displayed
    Then I click on "Return History"
    #Scenario 2: Return History page
    Then I see text "Monthly Return History" displayed
    Then I see text "Annual Return History" displayed
    #Scenario 3: Payment Details
    Then I click on "PAYMENT DETAILS"
    Then I switch to frame "0"
    Then I see text "Payment cannot be made directly through the Self-Serve portal. Please use the details below to make payment through your financial institution." displayed
    Then I see text "Amount" displayed
    Then I see text "Due Date" displayed
    Then I see text "Biller Code" displayed
    Then I see text "Reference Number" displayed

    Examples: 
      | PortalName | UserName | Password   |
      | TSS        | jbradley | Dbresults1 |

  @ignore_until_fixed
  Scenario Outline: DTSP-702: Check if a Taxpayer has already registered for other tax types at Payroll Tax Registration
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Payroll Tax Registration"
    #Scenario 1: Registration form layout changes
    Then I check "EmployerName" is readonly
    Then I check "BusinessTradingName" is readonly
    Then I check "AddressLine1" is readonly
    Then I check "Address_City" is readonly
    Then I check "ContactPerson_FirstName" is readonly
    Then I check "ContactPerson_LastName" is readonly
    Then I check "ContactPerson_Email" is readonly
    Then I check "RegistrationAnswer_ACN" is readonly
    Then I check "PostCode" is readonly
    Then I check "ContactPerson_PhoneNumber" is readonly
    Then I check "SelectBusinessTypeCode" is readonly
    Then I check "Address_CountryCode" is readonly
    Then I check "Address_State" is readonly
    Then I check "CheckBusinessAdress" is readonly
    Then I check "CheckSameAsJurisdiction" is readonly
    Then I check "ContactPerson_PostalAddressId" is readonly
    Then I check "ContactPerson_CommunicationMethodId" is readonly
    #Scenario 3: User already registered for Payroll tax
    And I enter the details as
      | Fields                 | Value       |
      | RegistrationAnswer_ABN | 13058370433 |
    Then I click on button with value "Verify"
    Then I see text "This ABN is already registered for Payroll Tax" displayed
    #Scenario 4: User has not registered for any tax
    And I enter the details as
      | Fields                 | Value       |
      | RegistrationAnswer_ABN | 97686467464 |
    Then I click on button with value "Verify"
    Then I see text "Invalid ABN" displayed

    #Bugged...?
    Examples: 
      | PortalName | UserName | Password   |
      | TSS        | jbradley | Dbresults1 |

  @review
  Scenario Outline: DTSP-704: To update the ABN Lookup Rule on the Payroll Tax Registration Form and Tax Agent Portal Registration
    #Scenario 3: Correct Tax Agent Portal Registration
    Given I want to login to portal "<PortalName>"
    Then I click on "Create Account"
    Then I check I am on "Registration" page
    Then I click on "Register as a Tax Agent"
    Then I enter the details as
      | Fields                    | Value               |
      | InputTaxAgentABN          |         21006819692 |
      | InputTaxAgentBusinessName | toyota SUPER pty LT |
      | BusinessAddress_Address   | TEST                |
      | BusinessAddress_Suburb    | TEST                |
      | BusinessAddress_Postcode  |                3333 |
    Then I click on button "BusinessAddress_StateId"
    Then I click on "Victoria"
    Then I click on button "TermsandConditionsCheckBox2"
    Then I click on button "RegistrationSubmit"
    Then I see text "Your Registered Business Name doesn’t match with your ABN. Please try again" displayed
    #Scenario 4: Incorrect Tax Agent Portal Registration
    Then I enter the details as
      | Fields                    | Value                |
      | InputTaxAgentBusinessName | toyota SUPER pty LTd |
    Then I click on button "RegistrationSubmit"
    Then I check I am on "Complete Registration" page
    #Scenario 2: Incorrect Employer Name on the Payroll Tax Registration
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Payroll Tax Registration"
    And I enter the details as
      | Fields                 | Value       |
      | RegistrationAnswer_ABN | 97110187767 |
    Then I click on button with value "Verify"
    Then I select "Partnership" from "SelectBusinessTypeCode"
    Then I select "Direct Post" from "CommunicationMethodId"
    Then I enter the details as
      | Fields                    | Value             |
      | EmployerName              | db REsULtS pty lt |
      | BusinessTradingName       | db REsuLtS pty lt |
      | AddressLine               | TEST              |
      | Address_City              | TEST              |
      | PostCode                  |              3333 |
      | ContactPerson_FirstName   | TEST              |
      | ContactPerson_LastName    | TEST              |
      | ContactPerson_PhoneNumber |       33333333333 |
      | ContactPerson_Email       | TEST@TEST.com     |
    Then I click on button with value "Next"
    Then I see text "Your Employer Name or ACN doesn't match with your ABN. Please try again." displayed
    #Scenario 1: Correct Employer Name on the Payroll Tax Registration
    Then I enter the details as
      | Fields              | Value              |
      | EmployerName        | db REsULtS pty ltd |
      | BusinessTradingName | db REsuLtS pty ltd |
    Then I click on button with value "Next"
    Then I see text "Business Activity Elsewhere in Australia" displayed

    Examples: 
      | PortalName | UserName | Password   |
      | TSS        | jbradley | Dbresults1 |

  @review
  Scenario Outline: DTSP-712: To update all wording on the portal from "Tax Payer" to the single word "Taxpayer"
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Payroll Tax Lodgement"
    Then I see text "Taxpayer" displayed
    Then I see text "Tax Payer" not displayed
    Then I click on "Service Requests"
    Then I click on "Annual Lodgement Request"
    Then I see text "Taxpayer" displayed
    Then I see text "Tax Payer" not displayed
    Then I click on "Exemption Request"
    Then I see text "Taxpayer" displayed
    Then I see text "Tax Payer" not displayed
    Then I click on "Generic Request"
    Then I see text "Taxpayer" displayed
    Then I see text "Tax Payer" not displayed
    Then I click on "Liquidation Advice"
    Then I see text "Taxpayer" displayed
    Then I see text "Tax Payer" not displayed
    Then I click on "Objection Request"
    Then I see text "Taxpayer" displayed
    Then I see text "Tax Payer" not displayed
    Then I click on "Payroll Tax Cancellation"
    Then I see text "Taxpayer" displayed
    Then I see text "Tax Payer" not displayed
    Then I click on "Group Management"
    Then I see text "Taxpayer" displayed
    Then I see text "Tax Payer" not displayed
    Then I click on "Payroll Tax Registration"
    Then I see text "Taxpayer" displayed
    Then I see text "Tax Payer" not displayed
    Then I click on "Tax Registration Update"
    Then I click on "Update Business Address"
    Then I see text "Taxpayer" displayed
    Then I see text "Tax Payer" not displayed
    Then I click on "Update Business Trading Name"
    Then I see text "Taxpayer" displayed
    Then I see text "Tax Payer" not displayed
    Then I click on "Update Payroll Contact Details"
    Then I see text "Taxpayer" displayed
    Then I see text "Tax Payer" not displayed
    Then I click on "Update Payroll Refund Details"
    Then I see text "Taxpayer" displayed
    Then I see text "Tax Payer" not displayed
    Then I click on "Sign Out"

    Examples: 
      | PortalName | UserName | Password   |
      | TSS        | jbradley | Dbresults1 |

  @review
  Scenario Outline: DTSP-703: As an user, I want to fill in a declaration section when I fill in an Objection Request, so that I can verify that I have submitted this request
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Service Requests"
    Then I click on "Objection Request"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value         |
      | s2id_autogen1_search | Active Bottle |
    Then I click on button "select2-results-1"
    #Scenario 3: "Objection Request" Summary page
    Then I click on button "ObjectionOutOfTimeYES"
    Then I enter the details as
      | Fields             | Value |
      | Objection_Comments | TEST  |
      | LodgeFailureReason | TEST  |
    Then I click on button "CheckPenalty"
    Then I click on button with value "Next"
    Then I check I am on "Objection Request Summary" page
    #Scenario 1:
    Then I check "DeclarationData" exists
    #Scenario 2: Submit button
    Then I click on button "CorrectInfoDeclared"
    Then I check "SummarySubmitBT" is not readonly
    #Scenario 3: Confirmation page
    Then I click on button "SummarySubmitBT"
    Then I check I am on "Objection Request Confirmation" page

    Examples: 
      | PortalName | UserName | Password   |
      | TSS        | jbradley | Dbresults1 |

  @review
  Scenario Outline: DTSP-733: As a user I should see front end validations for Exemption Request Form
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
      | s2id_autogen1_search | Aqua  |
    Then I click on button "select2-results-1"
    #Scenario 1: Start date doesn't equal present/future date
    Then I click on button "ExemptionStartDateInput"
    Then I click on "20170501"
    #Then I click on button "calTriggerOut"
    Then I enter the details as
      | Fields             | Value |
      | JustificationInput | TEST  |
    Then I click on button with value "Next"
    Then I see text "Please enter valid dates for your Exemption Request." displayed
    #Scenario 2: End date < start date
    Then I click on button "ExemptionStartDateInput"
    Then I click on "20170530"
    Then I click on button "ExemptionEndDateInput"
    Then I click on "20170528"
    #Then I click on button "calTriggerOut"
    Then I click on button with value "Next"
    Then I see text "Please enter valid dates for your Exemption Request." displayed

    Examples: 
      | PortalName | UserName | Password   |
      | TSS        | jbradley | Dbresults1 |

  @redo
  Scenario Outline: DTSP-770: To update the information sent to PSRM in the declaration section
  
  	#Scenario 1: Declaration on Summary Page of all forms 
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Payroll Tax Lodgement"
    And I check I am on "Payroll Lodgement Form" page
    Then I click on button "Discard"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value         |
      | s2id_autogen1_search | Green Pty Ltd |
    Then I click on button "select2-results-1"
    Then I click on "Monthly Return"
    Then I select "Aug 2016" from "MonthlyObligationSelect"
    Then I click on button "NextSection"
    Then I wait for "1000" millisecond
    #Then I click on button "TaxPayerDetailsNext"
    Then I enter the details as
      | Fields                                         | Value   |
      | SalariesAndWages                               | 1000000 |
      | BonusesAndCommissions                          |       1 |
      | LodgePayrollAnswer_Commissions                 |       1 |
      | LodgePayrollAnswer_Allowances                  |       1 |
      | LodgePayrollAnswer_DirectorsFees               |       1 |
      | LodgePayrollAnswer_EligibleTerminationPayments |       1 |
      | LodgePayrollAnswer_ValueOfBenefits             |       1 |
      | LodgePayrollAnswer_ShareValue                  |       1 |
      | LodgePayrollAnswer_ServiceContracts            |       1 |
      | LodgePayrollAnswer_Superannuation              |       1 |
      | LodgePayrollAnswer_OtherTaxablePayment         |       1 |
      | LodgePayrollAnswer_ExemptWages                 |       1 |
    Then I click on button "SalariesAndWages"
    Then I click on button "wtSubmitBT"
    Then I wait for "1000" millisecond
    Then I check I am on "Lodgement Summary" page
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName         |
      | item2 | First Name       |
      | item3 | Last Name        |
      | item4 | Organisation     |
      | item5 | Position         |
      | item5 | Contact Phone    |
      | item5 | Email Address    |
      | item5 | Taxpayer Details |
    Then I click on "Tax Registration Update"
    Then I click on "Update Business Address"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value         |
      | s2id_autogen1_search | ACTIVE BOTTLE |
    Then I click on button "select2-results-1"
    Then I wait for "1000" millisecond
    Then I click on button with value "Next"
    Then I wait for "1000" millisecond
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName         |
      | item2 | First Name       |
      | item3 | Last Name        |
      | item4 | Organisation     |
      | item5 | Position         |
      | item5 | Contact Phone    |
      | item5 | Email Address    |
      | item5 | Taxpayer Details |
    Then I click on "Update Payroll Contact Details"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value         |
      | s2id_autogen1_search | ACTIVE BOTTLE |
    Then I click on button "select2-results-1"
    Then I wait for "1000" millisecond
    Then I click on button with value "Next"
    Then I wait for "1000" millisecond
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName         |
      | item2 | First Name       |
      | item3 | Last Name        |
      | item4 | Organisation     |
      | item5 | Position         |
      | item5 | Contact Phone    |
      | item5 | Email Address    |
      | item5 | Taxpayer Details |
    Then I click on "Update Payroll Refund Details"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value         |
      | s2id_autogen1_search | ACTIVE BOTTLE |
    Then I click on button "select2-results-1"
    Then I wait for "1000" millisecond
    Then I click on button with value "Next"
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName         |
      | item2 | First Name       |
      | item3 | Last Name        |
      | item4 | Organisation     |
      | item5 | Position         |
      | item5 | Contact Phone    |
      | item5 | Email Address    |
      | item5 | Taxpayer Details |
    Then I click on "Update Business Trading Name"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value         |
      | s2id_autogen1_search | ACTIVE BOTTLE |
    Then I click on button "select2-results-1"
    Then I wait for "1000" millisecond
    Then I click on button with value "Next"
    Then I wait for "1000" millisecond
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName         |
      | item2 | First Name       |
      | item3 | Last Name        |
      | item4 | Organisation     |
      | item5 | Position         |
      | item5 | Contact Phone    |
      | item5 | Email Address    |
      | item5 | Taxpayer Details |
    Then I click on "Service Requests"
    Then I click on "Exemption Request"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value         |
      | s2id_autogen1_search | ACTIVE BOTTLE |
    Then I click on button "select2-results-1"
    Then I wait for "1000" millisecond
    Then I click on button "ExemptionStartDateInput"
    Then I click on "20170527"
    Then I enter the details as
      | Fields             | Value |
      | JustificationInput | TEST  |
    Then I click on button "calTriggerOut"
    Then I click on button with value "Next"
    Then I wait for "1000" millisecond
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName         |
      | item2 | First Name       |
      | item3 | Last Name        |
      | item4 | Organisation     |
      | item5 | Position         |
      | item5 | Contact Phone    |
      | item5 | Email Address    |
      | item5 | Taxpayer Details |
    Then I click on "Objection Request"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value         |
      | s2id_autogen1_search | ACTIVE BOTTLE |
    Then I click on button "select2-results-1"
    Then I click on button "CheckInterest"
    Then I enter the details as
      | Fields             | Value |
      | Objection_Comments | TEST  |
    Then I click on button with value "Next"
    Then I wait for "1000" millisecond
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName         |
      | item2 | First Name       |
      | item3 | Last Name        |
      | item4 | Organisation     |
      | item5 | Position         |
      | item5 | Contact Phone    |
      | item5 | Email Address    |
      | item5 | Taxpayer Details |
    Then I click on "Payroll Tax Cancellation"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value        |
      | s2id_autogen1_search | AQUA PTY LTD |
    Then I click on button "select2-results-1"
    Then I click on button "CancellationStartDate"
    Then I click on "20170527"
    Then I click on button "calTriggerOut"
    Then I click on button "CancellationEndDate"
    Then I click on button "20170528"
    Then I click on button "calTriggerOut"
    Then I enter the details as
      | Fields            | Value |
      | ReasonDescription | TEST  |
    
    Then I click on button "ReasonDescription"
    Then I click on button with value "Next"
    Then I wait for "1000" millisecond
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName         |
      | item2 | First Name       |
      | item3 | Last Name        |
      | item4 | Organisation     |
      | item5 | Position         |
      | item5 | Contact Phone    |
      | item5 | Email Address    |
      | item5 | Taxpayer Details |
    Then I click on "Annual Lodgement Request"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value        |
      | s2id_autogen1_search | AQUA PTY LTD |
    Then I click on button "select2-results-1"
    Then I select "2018" from "YearCombo"
    Then I click on button "MonthCombo"
    Then I click on "Jan"
    Then I enter the details as
      | Fields                              | Value |
      | AnnualLodgementRequestJustification | TEST  |
    Then I click on button with value "Next"
    Then I wait for "1000" millisecond
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName         |
      | item2 | First Name       |
      | item3 | Last Name        |
      | item4 | Organisation     |
      | item5 | Position         |
      | item5 | Contact Phone    |
      | item5 | Email Address    |
      | item5 | Taxpayer Details |
    Then I click on "Group Management"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value    |
      | s2id_autogen1_search | LONG LOG |
    Then I click on button "select2-results-1"
    Then I wait for "1000" millisecond
    Then I click on button with value "Update Group"
    Then I select "2018" from "YearCombo"
    Then I click on button "MonthCombo"
    Then I click on "Jan"
    Then I click on button with value "Next"
    Then I wait for "1000" millisecond
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName         |
      | item2 | First Name       |
      | item3 | Last Name        |
      | item4 | Organisation     |
      | item5 | Position         |
      | item5 | Contact Phone    |
      | item5 | Email Address    |
      | item5 | Taxpayer Details |
    #Then I click on "Service Requests"
    #Then I click on "Generic Request"
    #Then I click on button "select2-chosen-1"
    #Then I enter the details as
      #| Fields               | Value    |
      #| s2id_autogen1_search | LONG LOG |
    #Then I click on button "select2-results-1"
    #	 Then I click on button "CommuciateWith"
    #	 Then I click on "Requestor"
    #	 Then I click on button "RequestType"
    #	 Then I click on "Objection"
    #Then I select "Requestor" from "CommunicateWith"
    #Then I select "General Enquiry" from "RequestType"
    #And I enter the details as
      #| Fields          | Value |
      #| RequestComments | TEST  |
    #Then I click on button with value "Next"
    #Then I wait for "1000" millisecond
    #Then "<Item>" is displayed as "<ItemName>"
      #| Item  | ItemName         |
      #| item2 | First Name       |
      #| item3 | Last Name        |
      #| item4 | Organisation     |
      #| item5 | Position         |
      #| item5 | Contact Phone    |
      #| item5 | Email Address    |
      #| item5 | Taxpayer Details |
      
      
    #Scenario 3: View User Profile 
    Then I click on "User Profile"
    Then I see text "Position" displayed
    
    #Scenario 4: Edit User Profile 
    Then I click on button "EditBT"
    Then I see text "Position" displayed
    Then I check "Input_LastName2" exists
    
    
    
    

    Examples: 
      | PortalName | UserName | Password   |
      | TSS        | jbradley | Dbresults1 |
    
    
   @review
   Scenario Outline: DTSP-779: To update the Payroll Tax Registration Form to remove the autopopulated declaration section
   	Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Payroll Tax Registration"
    And I enter the details as
      | Fields                 | Value       |
      | RegistrationAnswer_ABN | 97110187767 |
    Then I click on button with value "Verify"
   	Then I enter the details as
      | Fields                    | Value       |
      | EmployerName              | DB RESULTS PTY LTD |
      | BusinessTradingName       | DB RESULTS PTY LTD |
      | AddressLine		            | TEST        |
      | Address_City              | TEST        |
      | PostCode                  |        3333 |
      | ContactPerson_FirstName   | TEST        |
      | ContactPerson_LastName    | TEST        |
      | ContactPerson_PhoneNumber | 33333333333 |
      | ContactPerson_Email       | TEST@TEST.com      |
    Then I select "Other" from "SelectBusinessTypeCode"
    Then I select "Direct Post" from "CommunicationMethodId"
    Then I click on button "TaxPayerDetailsNext"
    Then I check "ContactPerson_PhoneNumber" contents match regex "\d\d \d\d\d\d \d\d\d\d"
    Then I wait for "2000" millisecond
    Then I check "ACTWagesPaidNextBt" is readonly
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value        |
      | s2id_autogen1_search | Turf Growing |
    Then I click on button "select2-results-1"
    Then I click on button "ACTWagesPaidNextBt"
    Then I check "PayrollNext" is readonly
    Then I enter the details as
      | Fields                   | Value |
      | NumberOfEmployees        | 33    |
    Then I click on "DateBusinessStart"
    Then I click on "20170501"
    Then I click on "DateBusinessLiable"
    Then I click on "20170502"
    Then I click on "PayrollNext"
    Then I click on button "Refunds_NO"
    Then I click on button "RefundDetailsBT"
    #Then "<Item>" is displayed as "<ItemName>"
      #| Item  | ItemName         |
      #| item2 | First Name       |
      #| item3 | Last Name        |
      #| item4 | Organisation Name    |
      #| item5 | Position         |
      #| item5 | Contact Phone Number         |
      #| item5 | Email Address         |
    Then I check "Declarer_FirstName" exists
    Then I check "Declarer_LastName" exists
    Then I check "Declarer_Organisation" exists
    Then I check "Declarer_Position" exists
    Then I check "Declarer_PhoneNumber" exists
    Then I check "Declarer_Email" exists
    
    #Scenarios 2-5 should be done manually
    
     Examples: 
      | PortalName | UserName | Password   |
      | TSS        | jbradley | Dbresults1 |
   
   @manual
   Scenario Outline: As an end user I want to see the Industry codes before Industry name in the Business Activity Category Drop down on Payroll Tax registration form
   	Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
     Then I click on "Payroll Tax Registration"
    And I enter the details as
      | Fields                 | Value       |
      | RegistrationAnswer_ABN | 97110187767 |
    Then I click on button with value "Verify"
   	Then I enter the details as
      | Fields                    | Value       |
      | EmployerName              | DB RESULTS PTY LTD |
      | BusinessTradingName       | DB RESULTS PTY LTD |
      | AddressLine		            | TEST        |
      | Address_City              | TEST        |
      | PostCode                  |        3333 |
      | ContactPerson_FirstName   | TEST        |
      | ContactPerson_LastName    | TEST        |
      | ContactPerson_PhoneNumber | 3333333333333 |
      | ContactPerson_Email       | TEST@TEST.com      |
    Then I select "Other" from "SelectBusinessTypeCode"
    Then I select "Direct Post" from "CommunicationMethodId"
    Then I click on button "TaxPayerDetailsNext"
    Then I wait for "2000" millisecond
    Then I check "ACTWagesPaidNextBt" is readonly
    Then I click on button "select2-chosen-1"
    Then I check "select2-match" contents match regex "\d\d\d\d .*"
    
    #maybe this should be done manually...
    
    Examples: 
      | PortalName | UserName | Password   |
      | TSS        | jbradley | Dbresults1 |
      

