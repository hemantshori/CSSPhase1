Feature: Phase 1 Iteration 4 TSS Stuff

  @done
  Scenario Outline: DTSP-523
    # Part of this story is automatically tested by others...
  
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | jbradley   |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Payroll Tax Lodgement"
    
    #PAYROLL TAX FORM TESTING WITH ANNUAL RECONCILIATION IS BLOCKED BY BUG DTSP-603
    Then I click on button "Discard"
    Then I check "NextSection" is readonly
    Then I click on "Monthly Return"
    Then I select "Jan 2017" from "MonthlyObligationSelect"
    Then I click on button "NextSection"
    Then I click on button "TaxPayerDetailsNext"
    Then I check "SubmitBT" is readonly
    Then I click on button "ClaimingACTProportion_Yes"
    Then I enter the details as
      | Fields                                         | Value |
      | SalariesAndWages                               | NO    |
      | BonusesAndCommissions                          | NO    |
      | LodgePayrollAnswer_Commissions                 | NO    |
      | LodgePayrollAnswer_Allowances                  | NO    |
      | LodgePayrollAnswer_DirectorsFees               | NO    |
      | LodgePayrollAnswer_EligibleTerminationPayments | NO    |
      | LodgePayrollAnswer_ValueOfBenefits             | NO    |
      | LodgePayrollAnswer_ShareValue                  | NO    |
      | LodgePayrollAnswer_ServiceContracts            | NO    |
      | LodgePayrollAnswer_Superannuation              | NO    |
      | LodgePayrollAnswer_OtherTaxablePayment         | NO    |
      | LodgePayrollAnswer_ExemptWages                 | NO    |
      | PayrollAnswer_AustralianWide                   | NO    |
      | GroupActWages                                | NO    |
    Then I check "SalariesAndWages" is readonly
    Then I check "BonusesAndCommissions" is readonly
    Then I check "LodgePayrollAnswer_Commissions" is readonly
    Then I check "LodgePayrollAnswer_Allowances" is readonly
    Then I check "LodgePayrollAnswer_DirectorsFees" is readonly
    Then I check "LodgePayrollAnswer_EligibleTerminationPayments" is readonly
    Then I check "LodgePayrollAnswer_ValueOfBenefits" is readonly
    Then I check "LodgePayrollAnswer_ShareValue" is readonly
    Then I check "LodgePayrollAnswer_ServiceContracts" is readonly
    Then I check "LodgePayrollAnswer_Superannuation" is readonly
    Then I check "LodgePayrollAnswer_OtherTaxablePayment" is readonly
    Then I check "LodgePayrollAnswer_ExemptWages" is readonly
    Then I check "LodgePayrollAnswer_AustralianWide" is readonly
    Then I check "GroupActWages" is readonly
    Then I enter the details as
      | Fields                                         | Value |
      | SalariesAndWages                               |   100 |
      | BonusesAndCommissions                          |   100 |
      | LodgePayrollAnswer_Commissions                 |   100 |
      | LodgePayrollAnswer_Allowances                  |   100 |
      | LodgePayrollAnswer_DirectorsFees               |   100 |
      | LodgePayrollAnswer_EligibleTerminationPayments |   100 |
      | LodgePayrollAnswer_ValueOfBenefits             |   100 |
      | LodgePayrollAnswer_ShareValue                  |   100 |
      | LodgePayrollAnswer_ServiceContracts            |   100 |
      | LodgePayrollAnswer_Superannuation              |   100 |
      | LodgePayrollAnswer_OtherTaxablePayment         |   100 |
      | LodgePayrollAnswer_ExemptWages                 |   100 |
      | GroupActWages	                                 |     0 |
      | PayrollAnswer_AustralianWide              |     0 |
    Then I click on button "SubmitBT"
    Then I check "wtSummarySubmitBT" is readonly
    Then I click on button "CorrectInfoDeclared"
    Then I check "wtSummarySubmitBT" is not readonly
    Then I click on button "BackBt" 
    #Then I enter the details as
      #| Fields                 | Value |
      #| AnnualLessTotalTaxPaid | NO    |
    #Then I check "AnnualLessTotalTaxPaid" is readonly
    #Then I click on button "Discard"
    #Tax Registration Form
    Then I click on "Payroll Tax Registration"
    Then I check "TaxPayerDetailsNext" is readonly
    Then I select "Company" from "SelectBusinessTypeCode"
    Then I select "Mr" from "ContactPerson_Title"
    Then I select "Direct Post" from "CommunicationMethodId"
    Then I enter the details as
      | Fields                    | Value              |
      | EmployerName              | DB RESULTS PTY LTD |
      | BusinessTradingName       | DB RESULTS PTY LTD |
      | RegistrationAnswer_ABN    | NO                 |
      | RegistrationAnswer_ACN    | NO                 |
      | AddressLine1              | TEST               |
      | Address_City              | TEST               |
      | PostCode                  | NO                 |
      | ContactPerson_FirstName   | TEST               |
      | ContactPerson_LastName    | TEST               |
      | ContactPerson_PhoneNumber | NO                 |
      | ContactPerson_Email       | TEST@TEST.com      |
    Then I check "RegistrationAnswer_ABN" is readonly
    Then I check "RegistrationAnswer_ACN" is readonly
    Then I check "PostCode" is readonly
    Then I check "ContactPerson_PhoneNumber" is readonly
    #Then I select "AL" from "Address_State"
    Then I select "Other" from "SelectBusinessTypeCode"
    Then I enter the details as
      | Fields                    | Value       |
      | RegistrationAnswer_ABN    | 97110187767 |
      | RegistrationAnswer_ACN    |   110187767 |
      | AddressLine1              | TEST        |
      | Address_City              | TEST        |
      | PostCode                  |        3333 |
      | ContactPerson_FirstName   | TEST        |
      | ContactPerson_LastName    | TEST        |
      | ContactPerson_PhoneNumber |    33333333 |
    Then I click on button "AddressLine1"
    Then I click on button "TaxPayerDetailsNext"
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
      | TaxableACTWages          | NO    |
      | wtAusWideTaxableWages    | NO    |
      | GroupAusWideTaxableWages | NO    |
      | NumberOfEmployees        | NO    |
    Then I check "TaxableACTWages" is readonly
    Then I check "wtAusWideTaxableWages" is readonly
    Then I check "GroupAusWideTaxableWages" is readonly
    Then I check "NumberOfEmployees" is readonly
    Then I enter the details as
      | Fields                   | Value |
      | NumberOfEmployees          |    33 |
    Then I click on "DateBusinessStart"
    Then I click on "20170228"
    Then I click on "DateBusinessLiable"
    Then I click on "20170228"
    Then I click on "PayrollNext"
    Then I enter the details as
      | Fields                   | Value |
      | RegistrationAnswer_BSB          | NO    |
      | BankAccountNumber    | NO    |
      | BankAccountName | NO    |
    Then I check "RegistrationAnswer_BSB" is readonly
    Then I check "BankAccountNumber" is readonly
    Then I check "BankAccountName" is readonly
    Then I check "HiddenSubmitBT" is readonly
    
    

    Examples: 
      | PortalName | UserNameField | PasswordField | Password   |
      | TSS        | UserNameInput | PasswordInput | Dbresults1 |

  @wip
  Scenario Outline: DTSP-537
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | jbradley   |
      | PasswordInput | <Password> |
    And I hit Enter
    #Scenario 1: Annual Rec [Single Emp Status]
    Then I click on "Payroll Tax Lodgement"
    Then I click on button "Discard"
    Then I click on "Annual Reconciliation"
    Then I select "2014" from "AnnualObligationSelect"
    Then I click on button "NextSection"
    Then I click on button "TaxPayerDetailsNext"
    Then I see text "(01/07/2013 - 30/06/2014 / Independent employer (non-group) lodging for itself)" displayed
    #Scenario 2: Annual Rec [Multi Emp Status]
    Then I click on "Sign Out"
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | jscott     |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Payroll Tax Lodgement"
    Then I click on button "Discard"
    Then I click on "Annual Reconciliation"
    Then I select "2014" from "AnnualObligationSelect"
    Then I click on button "NextSection"
    Then I click on button "TaxPayerDetailsNext"
    Then I see text "Annual Reconciliation Return" displayed
    #Scenario 5: Days paid wage group Australia-wide" field removed from Payroll Tax
    Then I see text "Days paid wage group Australia-wide" not displayed
    Then I see text "(01/07/2013 - 30/06/2014 / Independent employer (non-group) lodging for itself)" displayed
    #Scenario 3: Monthly Return
    Then I click on "Sign Out"
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | camido     |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Payroll Tax Lodgement"
    Then I click on button "Discard"
    Then I check "LodgePayrollAnswer_TypeAnnual" is readonly
    Then I see text "No Annual Lodgements Available" displayed
    Then I select "Jan 2017" from "MonthlyObligationSelect"
    Then I click on button "NextSection"
    Then I click on button "TaxPayerDetailsNext"
    #Scenario 4: Exempt wages question updated
    Then I see text "ACT wages not included on this return" displayed
    Then I click on "Sign Out"

    #Scenario 6: (Designated group employer for a group and lodging for itself’) Rename the field ‘Days where you paid or were liable to pay taxable or interstate wages’ to ‘Days where 1 group member paid or was liable to pay taxable or interstate wages’
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | mbisping     |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Payroll Tax Lodgement"
    Then I click on button "Discard"
    Then I click on "Annual Reconciliation"
    Then I select "2013" from "AnnualObligationSelect"
    Then I click on button "NextSection"
    Then I click on button "TaxPayerDetailsNext"
     Then I enter the details as
      | Fields                                         | Value |
      | SalariesAndWages                               |   100 |
      | BonusesAndCommissions                          |   100 |
      | LodgePayrollAnswer_Commissions                 |   100 |
      | LodgePayrollAnswer_Allowances                  |   100 |
      | LodgePayrollAnswer_DirectorsFees               |   100 |
      | LodgePayrollAnswer_EligibleTerminationPayments |   100 |
      | LodgePayrollAnswer_ValueOfBenefits             |   100 |
      | LodgePayrollAnswer_ShareValue                  |   100 |
      | LodgePayrollAnswer_ServiceContracts            |   100 |
      | LodgePayrollAnswer_Superannuation              |   100 |
      | LodgePayrollAnswer_OtherTaxablePayment         |   100 |
      | LodgePayrollAnswer_ExemptWages                 |   100 |
    Then I click on button "wtSubmitBTAjaxRfrsh"
    
    Then I click on button "ClaimingACTProportion_Yes" 
    Then I see text "Days where 1 group member paid or was liable to pay taxable or interstate wages" displayed
    
    #Scenario 7:  (Designated group employer and lodging a joint return for itself and other ACT group members) Rename the field ‘Days where you paid or were liable to pay taxable or interstate wages’ to ‘Days where 1 group member paid or was liable to pay taxable or interstate wages’
    Then I click on "Sign Out"
    #Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "OK"
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | latz     |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Payroll Tax Lodgement"
    Then I click on button "Discard"
    Then I click on "Annual Reconciliation"
    Then I select "2012" from "AnnualObligationSelect"
    Then I click on button "NextSection"
    Then I click on button "TaxPayerDetailsNext"
    Then I click on button "ClaimingACTProportion_Yes" 
    Then I see text "Days where 1 group member paid or was liable to pay taxable or interstate wages" displayed
    
    Examples: 
      | PortalName | UserNameField | PasswordField | Password   |
      | TSS        | UserNameInput | PasswordInput | Dbresults1 |

  @done
  Scenario Outline: DTSP-444: As an end user, I want to know my Payroll Tax Obligations (including Month and Year) which have not been lodged so I can lodge my monthly payroll tax accordingly
    #Scenario 5: Gather Obligation List [Monthly and Annual] [Exception Path]
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | ccover     |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Payroll Tax Lodgement"
    Then I click on button "Discard"
    Then I check "LodgePayrollAnswer_TypeMonthly" is readonly
    Then I see text "No Monthly Lodgements Available" displayed
    Then I check "LodgePayrollAnswer_TypeAnnual" is readonly
    Then I see text "No Annual Lodgements Available" displayed
    Then I check "NextSection" is readonly
    Then I click on "Sign Out"
    #Scenario 4: Gather Obligation List [Annually] [Exception Path]
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | mbrown     |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Payroll Tax Lodgement"
    Then I click on button "Discard"
    Then I check "LodgePayrollAnswer_TypeMonthly" is readonly
    Then I see text "No Monthly Lodgements Available" displayed
    Then I select "2016" from "AnnualObligationSelect"
    Then I click on "Sign Out"
    #Scenario 3: Gather Obligation List [Monthly] [Exception Path]
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | camido     |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Payroll Tax Lodgement"
    Then I click on button "Discard"
    Then I check "LodgePayrollAnswer_TypeAnnual" is readonly
    Then I see text "No Annual Lodgements Available" displayed
    Then I select "Jan 2017" from "MonthlyObligationSelect"
    Then I click on "Sign Out"
    #Scenario 2: Gather Obligation List [Annually] [Happy Path]
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | jscott     |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Payroll Tax Lodgement"
    Then I click on button "Discard"
    Then I click on "Annual Reconciliation"
    Then I select "2014" from "AnnualObligationSelect"
    Then I click on button "NextSection"
    Then I click on button "TaxPayerDetailsNext"
    Then I see text "Annual Reconciliation Return" displayed
    Then I see text "(01/07/2013 - 30/06/2014 / Independent employer (non-group) lodging for itself)" displayed
    #Then I see text "(01/07/2015 - 30/06/2016 / Designated group employer for a group and lodging for itself / 5)" displayed
    #Scenario 1: Gather Obligation List [Monthly] [Happy Path]
    Then I click on "Payroll Tax Lodgement"
    #Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "OK"
    Then I click on button "Discard"
    Then I click on "Monthly Return"
    Then I select "Jan 2017" from "MonthlyObligationSelect"
    Then I click on button "NextSection"
    Then I click on button "TaxPayerDetailsNext"
    Then I see text "(01/01/2017 - 31/01/2017 / Designated group employer for a group and lodging for itself / 5)" displayed

    Examples: 
      | PortalName | UserNameField | PasswordField | Password   |
      | TSS        | UserNameInput | PasswordInput | Dbresults1 |

  @done
  Scenario Outline: DTSP-501: As an end user, I want the Payroll Tax Registration Form to be updated for Ease of Use
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    #Scenario 3: Rename the Tax Registration Form on the left navigation menu
    Then I see text "Payroll Tax Registration" displayed
    Then I click on "Payroll Tax Registration"
    #Scenario 4: Rename the Page Header of the Payroll Tax Registration Form
    Then I check I am on "Payroll Tax Registration" page
    Then I select "Company" from "SelectBusinessTypeCode"
    Then I select "Mr" from "ContactPerson_Title"
    Then I select "Direct Post" from "CommunicationMethodId"
    Then I enter the details as
      | Fields                    | Value              |
      | EmployerName              | DB RESULTS PTY LTD |
      | BusinessTradingName       | DB RESULTS PTY LTD |
      | RegistrationAnswer_ABN    |        97110187767 |
      | RegistrationAnswer_ACN    |          110187767 |
      | AddressLine1              | TEST               |
      | Address_City              | TEST               |
      | PostCode                  |               3333 |
      | ContactPerson_FirstName   | TEST               |
      | ContactPerson_LastName    | TEST               |
      | ContactPerson_PhoneNumber |           33333333 |
      | ContactPerson_Email       | TEST@TEST.com      |
    #Then I select "AL" from "Address_State"
    Then I select "Other" from "SelectBusinessTypeCode"
    Then I click on "TaxPayerDetailsNext"
    Then I wait for "2000" millisecond
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value        |
      | s2id_autogen1_search | Turf Growing |
    Then I click on button "select2-results-1"
    Then I click on button "ACTWagesPaidNextBt"
    Then I wait for "2000" millisecond
    #Scenario 1: Contact Person for Payroll Tax
    Then I see text "Same as Business Contact Person" displayed
    Then I click on "Same as Business Contact Person"
    #Scenario 2: User is a member of a group
    Then I click on button "GroupMember_YES"
    Then I see text "Provide group number" displayed
    And I enter the details as
      | Fields             | Value |
      | ProvideGroupNumber |  1111 |

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password   |
      | TSS        | UserNameInput | PasswordInput | jbradley | Dbresults1 |


    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password   |
      | TSS        | UserNameInput | PasswordInput | jbradley | Dbresults1 |

  @done
  Scenario Outline: DTSP-566: As an end user, I want the Payroll Tax Information accordion, sub section Total Taxable Wages) on the Payroll Tax Registration Form to accept calendar year input
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    And I click on "Payroll Tax Registration"
    Then I select "Company" from "SelectBusinessTypeCode"
    Then I select "Mr" from "ContactPerson_Title"
    Then I select "Direct Post" from "CommunicationMethodId"
    Then I check "TaxPayerDetailsNext" is readonly
    Then I enter the details as
      | Fields                    | Value              |
      | EmployerName              | DB RESULTS PTY LTD |
      | BusinessTradingName       | DB RESULTS PTY LTD |
      | RegistrationAnswer_ABN    |        97110187767 |
      | AddressLine1              | TEST               |
      | Address_City              | TEST               |
      | PostCode                  |               3333 |
      | ContactPerson_FirstName   | TEST               |
      | ContactPerson_LastName    | TEST               |
      | ContactPerson_PhoneNumber |          333333333 |
      | ContactPerson_Email       | test@test.com      |
    Then I select "Other" from "SelectBusinessTypeCode"
    Then I click on "TaxPayerDetailsNext"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value        |
      | s2id_autogen1_search | Turf Growing |
    Then I click on button "select2-results-1"
    Then I click on button "ACTWagesPaidNextBt"
    Then I click on button "YearComboBox"
    Then I see text "2012" displayed
    Then I see text "2013" displayed
    Then I see text "2014" displayed
    Then I see text "2015" displayed
    Then I see text "2016" displayed

    Examples: 
      | PortalName | UserName | Password   |
      | TSS        | jbradley | Dbresults1 |

  @done
  Scenario Outline: DTSP-553: As a user, I want to see a "Total Amounts" section on my Annual Payroll Tax return form so I can enter my "Less Total Tax Paid" amount
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    And I click on "Payroll Tax Lodgement"
    Then I click on button "Discard"
    Then I click on "Annual Reconciliation"
    Then I select "2014" from "AnnualObligationSelect"
    Then I click on button "NextSection"
    Then I click on button "TaxPayerDetailsNext"
    Then I enter the details as
      | Fields                                         | Value |
      | SalariesAndWages                               |   100 |
      | BonusesAndCommissions                          |   100 |
      | LodgePayrollAnswer_Commissions                 |   100 |
      | LodgePayrollAnswer_Allowances                  |   100 |
      | LodgePayrollAnswer_DirectorsFees               |   100 |
      | LodgePayrollAnswer_EligibleTerminationPayments |   100 |
      | LodgePayrollAnswer_ValueOfBenefits             |   100 |
      | LodgePayrollAnswer_ShareValue                  |   100 |
      | LodgePayrollAnswer_ServiceContracts            |   100 |
      | LodgePayrollAnswer_Superannuation              |   100 |
      | LodgePayrollAnswer_OtherTaxablePayment         |   100 |
      | LodgePayrollAnswer_ExemptWages                 |   100 |
    Then I click on button "SubmitBT"
    Then I see text "Total Tax Payable" displayed
    Then I see text "Less Total Tax Paid" displayed
    Then I see text "Total Amount Payable" displayed
    Then I enter the details as
      | Fields                 | Value |
      | AnnualLessTotalTaxPaid |    50 |
    Then I check "AnnualTotalTaxPayable" contains "$ 75.35"
    Then I check "AnnualTotalAmountPayable" contains "$ 25.35"

    Examples: 
      | PortalName | UserName | Password   |
      | TSS        | jbradley | Dbresults1 |

  @done
  Scenario Outline: DTSP-536: As a Business Tax Payer, I want my details pre populated on the Payroll Tax form when I select an outstanding obligation
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    And I click on "Payroll Tax Lodgement"
    #Scenario 1: User chooses outstanding monthly obligation
    Then I click on button "Discard"
    Then I click on "Monthly Return"
    Then I select "Jan 2017" from "MonthlyObligationSelect"
    Then I click on button "NextSection"
    Then I see text "50600468817" displayed
    Then I see text "400011" displayed
    Then I click on "Payroll Tax Lodgement"
    #Scenario 2: User chooses outstanding yearly obligation
    Then I click on button "Discard"
    Then I click on "Annual Reconciliation"
    Then I select "2014" from "AnnualObligationSelect"
    Then I click on button "NextSection"
    Then I see text "50600468817" displayed
    Then I see text "400011" displayed

    #Scenario 3: User chooses outstanding (Monthly or Yearly) obligation and no Payroll Tax Group Number is returned (user is an independent and is not part of a group)
    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password   |
      | TSS        | UserNameInput | PasswordInput | jbradley | Dbresults1 |

  @redo
  Scenario Outline: DTSP-526, 531: Update the ABN LookUp Rules for Payroll Tax Registration Form / Update the first page of the Portal Registration process
    Given I want to login to portal "<PortalName>"
    #This user has the ABN 12345678933, but since it's a tax agent user it isn't shown in the lodgement form
    And I enter the details as
      | Fields        | Value       |
      | UserNameInput | <UserName2> |
      | PasswordInput | <Password2> |
    And I hit Enter
    Then I click on "Payroll Tax Registration"
    Then I select "Company" from "SelectBusinessTypeCode"
    Then I select "Mr" from "ContactPerson_Title"
    Then I select "Direct Post" from "CommunicationMethodId"
    Then I select "Other" from "SelectBusinessTypeCode"
    Then I enter the details as
      | Fields                    | Value         |
      | Address_AddressLine1      | TEST          |
      | Address_City              | TEST          |
      | PostCode                  |          3333 |
      | ContactPerson_FirstName   | TEST          |
      | ContactPerson_LastName    | TEST          |
      | ContactPerson_PhoneNumber |     333333333 |
      | ContactPerson_Email       | test@test.com |
    #Scenario 7: ABN Lookup for Inactive ABN
    Then I enter the details as
      | Fields                 | Value                |
      | EmployerName           | CODAVALLI, AARADHANA |
      | BusinessTradingName    | CODAVALLI, AARADHANA |
      | RegistrationAnswer_ABN |          85613104316 |
    Then I click on button "EmployerName"
    Then I click on button "TaxPayerDetailsNext"
    Then I see text "Your ABN is not valid. Please enter a valid ABN." displayed
    #Scenario 8:ABN Lookup for Invalid ABN
    Then I enter the details as
      | Fields                 | Value       |
      | EmployerName           | TEST        |
      | BusinessTradingName    | TEST        |
      | RegistrationAnswer_ABN | 11111111111 |
    Then I click on button "EmployerName"
    Then I click on button "TaxPayerDetailsNext"
    Then I see text "Your ABN is not valid. Please enter a valid ABN." displayed
    #Scenario 6: ABN Lookup for Tax Agent with an active ABN, incorrect Registered Business Name, and Entity Type is not 'Individual'
    Then I enter the details as
      | Fields                 | Value             |
      | EmployerName           | DB RESULTS PTY LT |
      | BusinessTradingName    | DB RESULTS PTY LT |
      | RegistrationAnswer_ABN |       97110187767 |
    Then I click on button "EmployerName"
    Then I click on button "TaxPayerDetailsNext"
    Then I see text "Your Employer Name or ACN doesn't match with your ABN. Please try again." displayed
    #Scenario 4: ABN Lookup for Tax Agent with an active ABN, incorrect Registered Business Name, and Entity Type = Individual
    Then I enter the details as
      | Fields                 | Value          |
      | EmployerName           | PSALTIS, COSMA |
      | BusinessTradingName    | PSALTIS, COSMA |
      | RegistrationAnswer_ABN |    71583328324 |
    Then I click on button "EmployerName"
    Then I click on button "TaxPayerDetailsNext"
    Then I see text "Your Employer Name or ACN doesn't match with your ABN. Please try again." displayed
    #Scenario 3: ABN Lookup for Tax Agent with an active ABN, correct Registered Business Name, and Entity Type = Individual
    Then I enter the details as
      | Fields                 | Value           |
      | EmployerName           | PSALTIS, COSMAS |
      | BusinessTradingName    | PSALTIS, COSMAS |
      | RegistrationAnswer_ABN |     71583328324 |
    Then I click on button "EmployerName"
    Then I click on button "TaxPayerDetailsNext"
    Then I see text "Control and Financial Interest" displayed
    Then I click on button "ACTWagesPaidBackBt"
    #Scenario 5: ABN Lookup for Tax Agent with an active ABN, correct Registered Business Name, and Entity Type is not 'Individual'
    Then I enter the details as
      | Fields                 | Value              |
      | EmployerName           | DB RESULTS PTY LTD |
      | BusinessTradingName    | DB RESULTS PTY LTD |
      | RegistrationAnswer_ABN |        97110187767 |
    Then I click on button "EmployerName"
    Then I click on button "TaxPayerDetailsNext"
    Then I see text "Control and Financial Interest" displayed

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password   | UserName2 | Password2  |
      | TSS        | UserNameInput | PasswordInput | jbradley | Dbresults1 | toyota    | Dbresults1 |

  @done
  Scenario Outline: DTSP-527: Update the relationship between Business Taxpayer, Tax Agent Organisation and Users
    Given I want to login to portal "<PortalName>"
    Then I click on "Create Account"
    Then I check I am on "Registration" page
    #Scenario 1: User accesses the 'Capture User Details' page
    Then I enter the details as
      | Fields                  | Value       |
      | InputABNNumber_Business | 91098629095 |
      | InputCRNNumber_Business |      400004 |
    Then I click on button "TermsandConditionsCheckBox2"
    Then I click on button "RegistrationSubmit"
    Then I check I am on "Complete Registration" page
    #Scenario 2: A Tax Agent organisation can have multiple users
    Given I want to login to portal "<PortalName>"
    #This user has the ABN 12345678933, but since it's a tax agent user it isn't shown in the lodgement form
    And I enter the details as
      | Fields        | Value       |
      | UserNameInput | <UserName2> |
      | PasswordInput | <Password2> |
    And I hit Enter
    Then I click on "Payroll Tax Lodgement"
    Then I click on button "Discard"
    Then I click on "Sign Out"
    Given I want to login to portal "<PortalName>"
    Then I click on "Create Account"
    Then I check I am on "Registration" page
    Then I click on "Register as a Tax Agent"
    Then I enter the details as
      | Fields                    | Value                |
      | InputTaxAgentABN          |          21006819692 |
      | InputTaxAgentBusinessName | TOYOTA SUPER PTY LTD |
      | BusinessAddress_Address1  | TEST                 |
      | BusinessAddress_Address2  | TEST                 |
      | BusinessAddress_Suburb    | TEST                 |
      | BusinessAddress_Postcode  |                 3333 |
    Then I click on button "BusinessAddress_StateId"
    Then I click on "Victoria"
    Then I click on button "TermsandConditionsCheckBox2"
    Then I click on button "RegistrationSubmit"
    Then I check I am on "Complete Registration" page
    #Scenario 3: A Tax Agent Organisation can serve multiple Business Taxpayer
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value       |
      | UserNameInput | <UserName2> |
      | PasswordInput | <Password2> |
    And I hit Enter
    Then I click on "Payroll Tax Lodgement"
    Then I click on button "Discard"
    Then I see text "Choose a Client" displayed
    Then I click on button "BusinessEntityDropdown"
    Then I enter the details as
      | Fields               | Value         |
      | s2id_autogen1_search | Twitternation |
    # click on the first option available (standard dropdown step doesn't seem to work here)
    Then I click on button "select2-results-1"
    Then I click on button "BusinessEntityDropdown"
    Then I enter the details as
      | Fields               | Value                  |
      | s2id_autogen1_search | Zava (ABN:12345678995) |
    Then I click on button "select2-results-1"
    Then I click on button "ClientBT"
    Then I click on button "NextSection"
    Then I click on "Sign Out"
    #Scenario 4: A business Taxypayer can only nominate one Tax Agent Organisation at any point of time
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Then I click on "Settings"
    Then I click on button "Edit"
    Then I click on button "ChooseTaxAgent"
    Then I see text "71072405595" displayed
    Then I see text "SHORI PTY LTD" displayed
    Then I see text "TOYOTA SUPER PTY LTD" displayed
    Then I see text "21006819692" displayed

    Examples: 
      | PortalName | UserNameField | PasswordField | UserName | Password   | UserName2 | Password2  |
      | TSS        | UserNameInput | PasswordInput | jbradley | Dbresults1 | toyota    | Dbresults1 |

  @done
  Scenario Outline: DTSP-392:
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    And I click on "Payroll Tax Lodgement"
    Then I click on button "Discard"
    Then I click on "Annual Reconciliation"
    Then I select "2014" from "AnnualObligationSelect"
    Then I click on button "NextSection"
    Then I click on button "TaxPayerDetailsNext"
    Then I enter the details as
      | Fields                                         | Value |
      | SalariesAndWages                               |     0 |
      | BonusesAndCommissions                          |     0 |
      | LodgePayrollAnswer_Commissions                 |     0 |
      | LodgePayrollAnswer_Allowances                  |     0 |
      | LodgePayrollAnswer_DirectorsFees               |     0 |
      | LodgePayrollAnswer_EligibleTerminationPayments |     0 |
      | LodgePayrollAnswer_ValueOfBenefits             |     0 |
      | LodgePayrollAnswer_ShareValue                  |     0 |
      | LodgePayrollAnswer_ServiceContracts            |     0 |
      | LodgePayrollAnswer_Superannuation              |     0 |
      | LodgePayrollAnswer_OtherTaxablePayment         |     0 |
      | LodgePayrollAnswer_ExemptWages                 |     0 |
    Then I click on button "Submit"
    Then I enter the details as
      | Fields                 | Value |
      | AnnualLessTotalTaxPaid |     0 |
    Then I click on button "TotalAmountsNextBt"
    Then "<Item>" is displayed as "<ItemName>"
      | Item  | ItemName      |
      | item2 | Declaration   |
      | item3 | Declarer      |
      | item4 | Organisation  |
      | item5 | Phone Number  |
      | item6 | Email Address |

    Examples: 
      | PortalName | UserName | Password   |
      | TSS        | jbradley | Dbresults1 |

  @done
  Scenario Outline: DTSP-506: Update default answer to a question on the Payroll Tax Registration form
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    And I click on "Payroll Tax Registration"
    Then I select "Company" from "SelectBusinessTypeCode"
    Then I select "Mr" from "ContactPerson_Title"
    Then I select "Direct Post" from "CommunicationMethodId"
    Then I check "TaxPayerDetailsNext" is readonly
    Then I enter the details as
      | Fields                    | Value              |
      | EmployerName              | DB RESULTS PTY LTD |
      | BusinessTradingName       | DB RESULTS PTY LTD |
      | RegistrationAnswer_ABN    |        97110187767 |
      | AddressLine1              | TEST               |
      | Address_City              | TEST               |
      | PostCode                  |               3333 |
      | ContactPerson_FirstName   | TEST               |
      | ContactPerson_LastName    | TEST               |
      | ContactPerson_PhoneNumber |          333333333 |
      | ContactPerson_Email       | test@test.com      |
    Then I select "Other" from "SelectBusinessTypeCode"
    Then I click on "TaxPayerDetailsNext"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value        |
      | s2id_autogen1_search | Turf Growing |
    Then I click on button "select2-results-1"
    Then I click on button "ACTWagesPaidNextBt"
    Then I see checkbox "AnnualLodgementApproval_NO" as selected

    
    Examples: 
      | PortalName | UserName | Password   |
      | TSS        | jbradley | Dbresults1 |

  @done
  Scenario Outline: DTSP-508: As an end user, I want to see a reminder message on the top of the Payroll Tax Registration form so I know I cannot save an incomplete form
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    And I click on "Payroll Tax Registration"
    Then I see text "Because you are not logged in, you cannot save an incomplete form for later. Please complete your form and submit it before closing your session." displayed

    Examples: 
      | PortalName | UserName | Password   |
      | TSS        | jbradley | Dbresults1 |

  @done
  Scenario Outline: DTSP-524: As an organisation, I want to force the user to key in every 'dollar' field on the Payroll Tax Lodgement Form so that the user won't miss out any of these fields
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    And I click on "Payroll Tax Lodgement"
    Then I click on button "Discard"
    Then I click on "Annual Reconciliation"
    Then I select "2014" from "AnnualObligationSelect"
    Then I click on button "NextSection"
    Then I click on button "TaxPayerDetailsNext"
    Then I check "SalariesAndWages" contains "$"
    Then I check "BonusesAndCommissions" contains "$"
    Then I check "LodgePayrollAnswer_Commissions" contains "$"
    Then I check "LodgePayrollAnswer_Allowances" contains "$"
    Then I check "LodgePayrollAnswer_DirectorsFees" contains "$"
    Then I check "LodgePayrollAnswer_EligibleTerminationPayments" contains "$"
    Then I check "LodgePayrollAnswer_ValueOfBenefits" contains "$"
    Then I check "LodgePayrollAnswer_ShareValue" contains "$"
    Then I check "LodgePayrollAnswer_ServiceContracts" contains "$"
    Then I check "LodgePayrollAnswer_Superannuation" contains "$"
    Then I check "LodgePayrollAnswer_OtherTaxablePayment" contains "$"
    Then I check "LodgePayrollAnswer_ExemptWages" contains "$"
    Then I enter the details as
      | Fields                                         | Value |
      | SalariesAndWages                               |     0 |
      | BonusesAndCommissions                          |     0 |
      | LodgePayrollAnswer_Commissions                 |     0 |
      | LodgePayrollAnswer_Allowances                  |     0 |
      | LodgePayrollAnswer_DirectorsFees               |     0 |
      | LodgePayrollAnswer_EligibleTerminationPayments |     0 |
      | LodgePayrollAnswer_ValueOfBenefits             |     0 |
      | LodgePayrollAnswer_ShareValue                  |     0 |
      | LodgePayrollAnswer_ServiceContracts            |     0 |
      | LodgePayrollAnswer_Superannuation              |     0 |
      | LodgePayrollAnswer_OtherTaxablePayment         |     0 |
      | LodgePayrollAnswer_ExemptWages                 |     0 |
    Then I click on button "ClaimingACTProportion_Yes"
    Then I check "PayrollAnswer_AustralianWide" contains "$"

    Examples: 
      | PortalName | UserName | Password   |
      | TSS        | jbradley | Dbresults1 |
