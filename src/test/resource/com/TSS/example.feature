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
@tag
Feature: Title of your feature
  I want to use this template for my feature file

  @tag1
  Scenario Outline: Title of your scenario
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    And some other precondition
    When I complete action
    And some other action
    When I check for the <value> on page
    And yet another action
    Then I validate the outcomes
    Then I verify the <status> in step
    And check more outcomes

    Examples: 
      | PortalName | UserName | value | Password | status    |
      | TSSAdmin   | name1    |     5 | success  | something |

  @tag2
  Scenario Outline: Title of your scenario outline
    #This is a comment
    #This is another comment
    #The above steps are yellow because they haven't been given a proper step definition in StepImpe.java
    #The following three have been given proper step definitions and thus aren't yellow
    Then I click on "Annual Reconciliation"
    Then I select "2016" from "AnnualObligationSelect"
    Then I wait for "<value>" millisecond
