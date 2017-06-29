#Sample Feature Definition Template
@wip
Feature: WORK IN PROGRESS

@wip
  Scenario Outline: DTSP-537
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | jbradley   |
      | PasswordInput | <Password> |
    And I hit Enter
    #Scenario 1: Annual Rec [Single Emp Status]
    Then I click on "Lodgements"
    Then I click on "Payroll Tax"
    Then I click on button "GeneralDiscardBt"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value |
      | s2id_autogen1_search | QUICK |
    Then I click on button "select2-results-1"
    Then I wait for "5000" millisecond
    Then I click on "Annual Reconciliation"
    Then I select "2016" from "AnnualObligationSelect"
    Then I click on button with value "Save and Next"
    Then I wait for "5000" millisecond
    Then I check object with xpath "//*[contains(@id, 'Titlewages')]//div[3]" contents match regex "\(\d{2} \w+ \d{4} - \d{2} \w+ \d{4} / [\w|\s|\W|\(|\)]+\)"
    Then I click on "Payroll Tax"
    Then I click on button with value "Discard"
    #Scenario 2: Annual Rec [Multi Emp Status]
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value |
      | s2id_autogen1_search | QUICK |
    Then I click on button "select2-results-1"
    Then I wait for "5000" millisecond
    Then I click on "Annual Reconciliation"
    Then I select "2016" from "AnnualObligationSelect"
    Then I click on button "NextSection"
    Then I wait for "3000" millisecond
    Then I see text "Annual Reconciliation Return" displayed
    #Scenario 5: Days paid wage group Australia-wide" field removed from Payroll Tax
    Then I see text "Days paid wage group Australia-wide" not displayed
    Then I wait for "5000" millisecond
    Then I check object with xpath "//*[contains(@id, 'Titlewages')]//div[3]" contents match regex "\(\d{2} \w+ \d{4} - \d{2} \w+ \d{4} / [\w|\s|\W|\(|\)]+\)"
    #Scenario 3: Monthly Return
    Then I click on "Payroll Tax"
    Then I click on button with value "Discard"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value     |
      | s2id_autogen1_search | DESIGNATE |
    Then I click on button "select2-results-1"
    Then I wait for "5000" millisecond
    Then I select "May 2017" from "MonthlyObligationSelect"
    Then I click on button "NextSection"
    Then I wait for "3000" millisecond
    #Scenario 4: Exempt wages question updated
    Then I see text "ACT wages not included on this return" displayed
    #Scenario 6: (Designated group employer for a group and lodging for itself’) Rename the field ‘Days where you paid or were liable to pay taxable or interstate wages’ to ‘Days where 1 group member paid or was liable to pay taxable or interstate wages’
    Then I click on "Payroll Tax"
    Then I click on button with value "Discard"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value     |
      | s2id_autogen1_search | DESIGNATE |
    Then I click on button "select2-results-1"
    Then I wait for "5000" millisecond
    Then I click on "Annual Reconciliation"
    Then I select "2016" from "AnnualObligationSelect"
    Then I click on button "NextSection"
    Then I wait for "3000" millisecond
    Then I click on button "ClaimingACTProportion_Yes"
    Then I enter the details as
      | Fields                                         | Value   |
      | SalariesAndWages                               | 1000000 |
      | BonusesAndCommissions                          |     100 |
      | LodgePayrollAnswer_Commissions                 |     100 |
      | LodgePayrollAnswer_Allowances                  |     100 |
      | LodgePayrollAnswer_DirectorsFees               |     100 |
      | LodgePayrollAnswer_EligibleTerminationPayments |     100 |
      | LodgePayrollAnswer_ValueOfBenefits             |     100 |
      | LodgePayrollAnswer_ShareValue                  |     100 |
      | LodgePayrollAnswer_ServiceContracts            |     100 |
      | LodgePayrollAnswer_Superannuation              |     100 |
      | LodgePayrollAnswer_OtherTaxablePayment         |     100 |
      | LodgePayrollAnswer_ExemptWages                 |     100 |
    Then I see text "Days where 1 group member paid or was liable to pay taxable or interstate wages" displayed
    #Scenario 7:  (Designated group employer and lodging a joint return for itself and other ACT group members) Rename the field ‘Days where you paid or were liable to pay taxable or interstate wages’ to ‘Days where 1 group member paid or was liable to pay taxable or interstate wages’
    #Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "OK"
    Then I click on "Home"
    Then I see "Are you sure you want to discard changes made?" displayed on popup and I click "OK"
    Then I click on "Lodgements"
    Then I click on "Payroll Tax"
    Then I click on button with value "Discard"
    Then I click on button "select2-chosen-1"
    Then I enter the details as
      | Fields               | Value     |
      | s2id_autogen1_search | DESIGNATE |
    Then I click on button "select2-results-1"
    Then I wait for "5000" millisecond
    Then I click on "Annual Reconciliation"
    Then I select "2016" from "AnnualObligationSelect"
    Then I click on button "NextSection"
    Then I click on button "ClaimingACTProportion_Yes"
    Then I see text "Days where 1 group member paid or was liable to pay taxable or interstate wages" displayed

    Examples: 
      | PortalName | UserNameField | PasswordField | Password   |
      | TSSAdmin        | UserNameInput | PasswordInput | Dbresults1 |
