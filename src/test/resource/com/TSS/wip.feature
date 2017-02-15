Feature: WIP

  @wip
 @done
  

 @done
  Scenario Outline: DTSP-430:
    Given I want to login to portal "<PortalName>"
    And I enter the details as
      | Fields        | Value      |
      | UserNameInput | <UserName> |
      | PasswordInput | <Password> |
    And I hit Enter
    Given I access URL "https://test-ssc.dbresults.com.au/SS_Admin/StyleGuideConfigs.aspx"
    #Given I want to login to portal "StyleGuideConfig"
    Then "<Item>" is displayed as "<ItemName>"
      #Scenario 1: User accesses the 'Registration Verification' page
      | Item  | ItemName            |
      | item2 | Style Guide Configs |
    Then I click on button "StyleGuideConfigTable_ctl03_wt12"
    Then I enter the details as
      | Fields       | Value   |
      | PrimaryColor | #000000 |
    Then I click on button "wt45"
    Given I want to login to portal "<PortalName>"
    #for some reason selenium reads CSS colors in the rgba format...
    Then I check "Header_title" has a CSS property "background-color" with value "rgba(0, 0, 0, 1)"
    Given I access URL "https://test-ssc.dbresults.com.au/SS_Admin/StyleGuideConfigs.aspx"
    Then I click on button "StyleGuideConfigTable_ctl03_wt12"
    Then I enter the details as
      | Fields         | Value   |
      | PrimaryColor   | #662D91 |
      | SecondaryColor | #000000 |
    Then I click on button "wt45"
    Given I want to login to portal "<PortalName>"
    Then I check "wtMenuWebBlock_block_wtMenuItem_wtMenuButtonLink" has a CSS property "border-bottom-color" with value "rgba(0, 0, 0, 1)"
    Given I access URL "https://test-ssc.dbresults.com.au/SS_Admin/StyleGuideConfigs.aspx"
    Then I click on button "StyleGuideConfigTable_ctl03_wt12"
    Then I enter the details as
      | Fields         | Value   |
      | SecondaryColor | #662D91 |
      | TertiaryColor  | #000000 |
    Then I click on button "wt45"
    Given I want to login to portal "<PortalName>"
    Then I click on "Payroll Tax Lodgement"
    Then I check "NextSection" has a CSS property "background-color" with value "rgba(0, 0, 0, 1)"
    Given I access URL "https://test-ssc.dbresults.com.au/SS_Admin/StyleGuideConfigs.aspx"
    Then I click on button "StyleGuideConfigTable_ctl03_wt12"
    Then I enter the details as
      | Fields        | Value   |
      | TertiaryColor | #D5D07E |
      | InactiveColor | #ff00d4 |
    Then I click on button "wt45"
    Given I want to login to portal "<PortalName>"
    Then I click on "Payroll Tax Lodgement"
    Then I click on "NextSection"
    Then I check "fa fa-fw fa-angle-down" has a CSS property "color" with value "rgba(255, 0, 212, 1)"
    Given I access URL "https://test-ssc.dbresults.com.au/SS_Admin/StyleGuideConfigs.aspx"
    Then I click on button "StyleGuideConfigTable_ctl03_wt12"
    Then I enter the details as
      | Fields        | Value   |
      | InactiveColor | #9e9e9e |
      | TextColor     | #000000 |
    Then I click on button "wt45"
    Given I want to login to portal "<PortalName>"
    Then I click on "Payroll Tax Lodgement"
    Then I check "GeneralDiscard" has a CSS property "color" with value "rgba(0, 0, 0, 1)"
    
    		Given I access URL "https://test-ssc.dbresults.com.au/SS_Admin/StyleGuideConfigs.aspx"
    Then I click on button "StyleGuideConfigTable_ctl03_wt12"
    Then I enter the details as
    | Fields       | Value    |
    | TextColor | #010c19	|
    | ButtonOneActiveColor | #000000 |
    Then I click on button "wt45"
    Given I want to login to portal "<PortalName>"
    Then I click on "Payroll Tax Lodgement"
    Then I hover over "NextSection" and check for CSS property "background-color" with value "rgba(0, 0, 0, 1)"
    
    Given I access URL "https://test-ssc.dbresults.com.au/SS_Admin/StyleGuideConfigs.aspx"
    Then I click on button "StyleGuideConfigTable_ctl03_wt12"
    Then I enter the details as
    | Fields       | Value    |
    | ButtonOneActiveColor | #F7990B	|
    | ButtonFourIsActiveColor | #000000 |
    Then I click on button "wt45"
    Given I want to login to portal "<PortalName>"
    Then I click on "Payroll Tax Lodgement"
    Then I hover over "GeneralDiscard" and check for CSS property "background-color" with value "rgba(0, 0, 0, 1)"
    
    Given I access URL "https://test-ssc.dbresults.com.au/SS_Admin/StyleGuideConfigs.aspx"
    Then I click on button "StyleGuideConfigTable_ctl03_wt12"
    Then I enter the details as
      | Fields                  | Value   |
      | ButtonFourIsActiveColor | #dfdfdf |
      | ButtonFourColor         | #000000 |
    Then I click on button "wt45"
    Given I want to login to portal "<PortalName>"
    Then I click on "Payroll Tax Lodgement"
    Then I check "GeneralDiscard" has a CSS property "background-color" with value "rgba(0, 0, 0, 1)"
    Given I access URL "https://test-ssc.dbresults.com.au/SS_Admin/StyleGuideConfigs.aspx"
    Then I click on button "StyleGuideConfigTable_ctl03_wt12"
    Then I enter the details as
      | Fields                | Value   |
      | ButtonFourColor       | #f1f1f1 |
      | ButtonFourBorderColor | #000000 |
    Then I click on button "wt45"
    Given I want to login to portal "<PortalName>"
    Then I click on "Payroll Tax Lodgement"
    Then I check "GeneralDiscard" has a CSS property "border-bottom-color" with value "rgba(0, 0, 0, 1)"
    Given I access URL "https://test-ssc.dbresults.com.au/SS_Admin/StyleGuideConfigs.aspx"
    Then I click on button "StyleGuideConfigTable_ctl03_wt12"
    Then I enter the details as
      | Fields                | Value   |
      | ButtonFourBorderColor | #ccc    |
      | Footer                | #000000 |
    Then I click on button "wt45"
    Given I want to login to portal "<PortalName>"
    Then I click on "Payroll Tax Lodgement"
    Then I check "Footer" has a CSS property "background-color" with value "rgba(0, 0, 0, 1)"
    Given I access URL "https://test-ssc.dbresults.com.au/SS_Admin/StyleGuideConfigs.aspx"
    Then I click on button "StyleGuideConfigTable_ctl03_wt12"
    Then I enter the details as
      | Fields           | Value   |
      | Footer           | #fff    |
      | SidebarTextColor | #000000 |
    Then I click on button "wt45"
    Given I want to login to portal "<PortalName>"
    Then I click on "Payroll Tax Lodgement"
    Then I check "MenuButtonLink" has a CSS property "color" with value "rgba(0, 0, 0, 1)"
    Given I access URL "https://test-ssc.dbresults.com.au/SS_Admin/StyleGuideConfigs.aspx"
    Then I click on button "StyleGuideConfigTable_ctl03_wt12"
    Then I enter the details as
      | Fields                 | Value   |
      | SidebarTextColor       | #fff    |
      | SidebarBackgroundColor | #000000 |
    Then I click on button "wt45"
    Given I want to login to portal "<PortalName>"
    Then I click on "Payroll Tax Lodgement"
    Then I check "wtMenu" has a CSS property "background-color" with value "rgba(0, 0, 0, 1)"
    Given I access URL "https://test-ssc.dbresults.com.au/SS_Admin/StyleGuideConfigs.aspx"
    Then I click on button "StyleGuideConfigTable_ctl03_wt12"
    Then I enter the details as
      | Fields                 | Value   |
      | SidebarBackgroundColor | #051629 |
      | SidebarTextActiveColor | #000000 |
    Then I click on button "wt45"
    Given I want to login to portal "<PortalName>"
    Then I click on "Payroll Tax Lodgement"
    Then I check "ctl20_RichWidgets_wtMenuWebBlock_block_wtMenuItem_wtMenuButtonLink" has a CSS property "color" with value "rgba(0, 0, 0, 1)"
    Given I access URL "https://test-ssc.dbresults.com.au/SS_Admin/StyleGuideConfigs.aspx"
    Then I click on button "StyleGuideConfigTable_ctl03_wt12"
    Then I enter the details as
      | Fields        | Value |
      | ButtonCorners | 4px   |
      | HeadingSize   | 40px  |
    Then I click on button "wt45"
    Given I want to login to portal "<PortalName>"
    Then I click on "Payroll Tax Lodgement"
    Then I check "Title_wtErrorMessageBox2" has a CSS property "font-size" with value "40px"
    Given I access URL "https://test-ssc.dbresults.com.au/SS_Admin/StyleGuideConfigs.aspx"
    Then I click on button "StyleGuideConfigTable_ctl03_wt12"
    Then I enter the details as
      | Fields          | Value |
      | HeadingSize     | 22pt  |
      | SubHeadingsSize | 40px  |
    Then I click on button "wt45"
    Given I want to login to portal "<PortalName>"
    Then I click on "Payroll Tax Lodgement"
    Then I check "ReturnTypeHeading" has a CSS property "font-size" with value "40px"
    Given I access URL "https://test-ssc.dbresults.com.au/SS_Admin/StyleGuideConfigs.aspx"
    Then I click on button "StyleGuideConfigTable_ctl03_wt12"
    Then I enter the details as
      | Fields          | Value   |
      | SubHeadingsSize | 14pt    |
      | HeadingsColor   | #000000 |
    Then I click on button "wt45"
    Given I want to login to portal "<PortalName>"
    Then I click on "Payroll Tax Lodgement"
    Then I check "Title_wtErrorMessageBox2" has a CSS property "color" with value "rgba(0, 0, 0, 1)"
    Given I access URL "https://test-ssc.dbresults.com.au/SS_Admin/StyleGuideConfigs.aspx"
    Then I click on button "StyleGuideConfigTable_ctl03_wt12"
    Then I enter the details as
      | Fields           | Value   |
      | HeadingsColor    | #000000 |
      | SubHeadingsColor | #000000 |
    Then I click on button "wt45"
    Given I want to login to portal "<PortalName>"
    Then I click on "Payroll Tax Lodgement"
    Then I check "ReturnTypeHeading" has a CSS property "color" with value "rgba(0, 0, 0, 1)"
    Given I access URL "https://test-ssc.dbresults.com.au/SS_Admin/StyleGuideConfigs.aspx"
    Then I click on button "StyleGuideConfigTable_ctl03_wt12"
    Then I enter the details as
      | Fields           | Value                                |
      | SubHeadingsColor | #000000                              |
      | FontFamily       | 'Comic Sans MS', cursive, sans-serif |
    Then I click on button "wt45"
    Given I want to login to portal "<PortalName>"
    Then I click on "Payroll Tax Lodgement"
    Then I check "ReturnTypeHeading" has a CSS property "font-family" with value ""Comic Sans MS", cursive, sans-serif"
    Given I access URL "https://test-ssc.dbresults.com.au/SS_Admin/StyleGuideConfigs.aspx"
    Then I click on button "StyleGuideConfigTable_ctl03_wt12"
    Then I enter the details as
      | Fields       | Value                              |
      | FontFamily   | 'Helvetica', 'Arial', 'sans-serif' |
      | BodyCopySize | 20px                               |
    Then I click on button "wt45"
    Given I want to login to portal "<PortalName>"
    Then I click on "Payroll Tax Lodgement"
    Then I check "ReturnTypeHeading" has a CSS property "font-size" with value "18.6667px"
    Given I access URL "https://test-ssc.dbresults.com.au/SS_Admin/StyleGuideConfigs.aspx"
    Then I click on button "StyleGuideConfigTable_ctl03_wt12"
    Then I enter the details as
      | Fields       | Value |
      | BodyCopySize | 10pt  |
    Then I click on button "wt45"

    Examples: 
      | PortalName | UserName | Password   |
      | TSS        | jscott   | Dbresults1 |

