package runnerAndSteps;


import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.DriverManager;
import java.util.ArrayList;

import org.junit.AfterClass;
import org.junit.Assert;
import org.openqa.selenium.Alert;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.support.PageFactory;
import org.openqa.selenium.support.ui.Select;

import cucumber.api.DataTable;
import cucumber.api.java.After;
import cucumber.api.java.Before;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import reporting.com.HTMLReports.AccountFinancialHistorypage;
import reporting.com.HTMLReports.BillingHistoryPage;
import reporting.com.HTMLReports.DBUtilities;
import reporting.com.HTMLReports.EditSettingsPage;
import reporting.com.HTMLReports.ForgotYourPasswordPage;
import reporting.com.HTMLReports.GoalsAndTargetsPage;
import reporting.com.HTMLReports.HomePage;
import reporting.com.HTMLReports.LandingPage;
import reporting.com.HTMLReports.MakeAPaymentPage;

public class StepImpe {
 //********************************************** following is before and after *****************************************
	WebDriver driver;
	private String bolt;
	static String Capture;
	static String datePattern;
	ArrayList<String> patternArray;
	
	@Before()
	  public void startUp() {
//	    driver = new FirefoxDriver();
//	    driver.manage().window().maximize();

	    // the location of the driver is been changed to match with remote server setting.....  HS
		System.setProperty("webdriver.chrome.driver", "C:\\Users\\CTang\\git\\SSCP\\chromedriver.exe");
		driver = new ChromeDriver();
	    driver.manage().window().maximize();
	    FileInputStream in;
	    BufferedReader br;
	    patternArray = new ArrayList<String>();
	    
	    // get the pattern of dates for regular expression processing
	    try {
	    	in = new FileInputStream("list_of_date_patterns.txt");	 
	    	br = new BufferedReader(new InputStreamReader(in));
	    	String line = null;
			while ((line = br.readLine()) != null) {
				patternArray.add(line.trim());
			}
	    }
	    catch (IOException ie){
	    	ie.printStackTrace();
	    }
	    
	    
	}
		// **************disable to leave browser open***************************************

	@After()
		  public void tearDown() {	
		    driver.quit();
		   	  }
	//******************************************************************************   
	    
   
	    // for Chrome driver
//		System.setProperty("webdriver.chrome.driver", "C:\\Program Files\\Automation Tools\\Drivers\\chromedriver.exe");
//		driver = new ChromeDriver();
//	    driver.manage().window().maximize();
	
	    
	    // for IE
//		System.setProperty("webdriver.chrome.driver", "C:\\Program Files\\Automation Tools\\Drivers\\IEDriverServer.exe");
//		driver = new ChromeDriver();
//	    driver.manage().window().maximize();
	    
	 

	// *****************************************************following are steps******************************************
	

	// ********************************************************************************************************************************
	//**************************************** Capture element from Page************************************************************
	
	@Given("^I capture \"(.*?)\"$")
	public String i_capture(String arg1) throws Throwable {
		

			
			DBUtilities createXpath = new DBUtilities(driver);
			String myxpath = createXpath.xpathMakerById(arg1);
			System.out.println(myxpath);
			
			WebElement xyz = driver.findElement(By.xpath(myxpath));
			StepImpe.Capture= xyz.getText();
			System.out.println("the payment id is " +Capture);
			return Capture;
  
	}

	@Then("^I Check \"(.*?)\" contains \"(.*?)\"$")
	public void i_Check_contains(String arg1, String arg2) throws Throwable {
		DBUtilities createXpath = new DBUtilities(driver);
		String myxpath = createXpath.xpathMakerById(arg1);
		System.out.println(myxpath);
		String elementToBeSearched = StepImpe.Capture;
		System.out.println("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%" +elementToBeSearched);
	     DBUtilities t1 = new DBUtilities(driver);
	     t1.isTextPresent(elementToBeSearched);
		
		
		
	}

	
	
	
	
	//*************************************************************************************************************************
	
	
	@Given("^I want to login to portal \"(.*?)\"$")
	public void i_want_to_login_to_portal(String arg1) throws Throwable {
		HomePage home = PageFactory.initElements(driver, HomePage.class);
		home.navigateTo(arg1);	
	}


	@And("^I hit Enter$")
     public LandingPage I_hit_Enter() throws InterruptedException
	{
   PageFactory.initElements(driver, LandingPage.class).hitEnter();
		Thread.sleep(1000);
		
		 return PageFactory.initElements(driver, LandingPage.class);
	}
	


	
	@And("^I click on \"(.*?)\"$")
	public void i_click_on(String arg1) throws Throwable {
		// give time for page loading
		Thread.sleep(1000);
		
		if(arg1.equals("Current_Bill")
				||arg1.equals("InfoIcon")
				||arg1.equals("Pay")
				||arg1.equals("Current_Bill")
				||arg1.equals("ReSendEmailButton")
				||arg1.equals("PasswordSaveButton")
				||arg1.equals("ActivityHistoryButton")
				||arg1.equals("MakeAnotherPaymentButton")
				||arg1.equals("EditSettings")
				||arg1.equals("ButtonShowAll")
				||arg1.equals("AllTransactions")
				||arg1.equals("Reset")
				||arg1.equals("MenuIcon")
				||arg1.equals("PasswordInfoIcon")
				||arg1.equals("HintInfoIcon")
				||arg1.equals("SetGoal")		
				||arg1.equals("wtSubmitButton3")      // to do ask M lara to change thename ....this is for Reset Password
				||arg1.equals("Cancel")){
			Thread.sleep(3000);
			DBUtilities createXpath = new DBUtilities(driver);
			String myxpath2 = createXpath.xpathMakerById(arg1);
			driver.findElement(By.xpath(myxpath2)).click();
			
		}
		else if (arg1.equals("Submit")){
                  DBUtilities createXpath = new DBUtilities(driver);
			String myxpath2 = createXpath.xpathMakerById(arg1);
			driver.findElement(By.xpath(myxpath2)).click();
			Thread.sleep(5000);
		}
			
		else if (arg1.equals("Welcome")){
				DBUtilities createXpath2 = new DBUtilities(driver);
				String myxpath3 = createXpath2.xpathMakerContainsText(arg1);
				driver.findElement(By.xpath(myxpath3)).click();
			}
		else if (arg1.equals("Save")){
			DBUtilities createXpath3 = new DBUtilities(driver);
			String myxpath4 = createXpath3.xpathMakerByValue(arg1);
			driver.findElement(By.xpath(myxpath4)).click();
		}
		else {
			DBUtilities createXpath = new DBUtilities(driver);
			String myxpath = createXpath.xpathMaker(arg1);
			System.out.println("cliclking on " +myxpath);
			Assert.assertTrue(driver.findElement(By.xpath(myxpath)).isDisplayed());
			Thread.sleep(1000);
			driver.findElement(By.xpath(myxpath)).click();
			
		}
		
	}

	@Given("^I select \"(.*?)\" from \"(.*?)\"$")
	public void i_select_from(String arg1, String arg2) throws Throwable {
		
//		if (patternArray.contains(arg1)){
//			datePattern = arg1;
//		}
		
		if(arg1.equals("SetGoal")){
			String myxpath = PageFactory.initElements(driver, GoalsAndTargetsPage.class).xpathMakerById1AndId2(arg1, arg2);
			driver.findElement(By.xpath(myxpath)).click();
		}else{
			PageFactory.initElements(driver, LandingPage.class).selectDropdownValue(arg1, arg2);
		}
	}
	
	@Given("^I check element with \"(.*?)\" as \"(.*?)\" matches pattern \"(.*?)\"$")
	public void i_check_matches_pattern(String elementSpecifier, String arg1, String arg2) throws Throwable {
		DBUtilities createXpath = new DBUtilities(driver);
		String myxpath;
		String content;
		
		if (elementSpecifier.equals("id") ){
			myxpath = createXpath.xpathMakerById(arg1);
		}
		else if (elementSpecifier.equals("class")){
			myxpath = createXpath.xpathMakerByTextInClass(arg1);
		}
		else {
			myxpath = createXpath.xpathMakerContainsText(arg1);
		}
		
		content = driver.findElement(By.xpath(myxpath)).getText();
		//System.out.println("Found text: " + content );
		PageFactory.initElements(driver, EditSettingsPage.class).checkDatePattern(content, arg2);
			
	}
	
	// FOR ELEMENTS THAT NEED MULTIPLE XPATH IDENTIFIERS
	@Given("^I check that an element with \"(.*?)\" as \"(.*?)\" and \"(.*?)\" as \"(.*?)\" matches pattern \"(.*?)\"$")
	public void i_check_that_matches_pattern(String elementSpecifier1, String arg1, String elementSpecifier2,  String arg2, String pattern) throws Throwable {
		DBUtilities createXpath = new DBUtilities(driver);
		String myxpath;
		String content;
		myxpath =createXpath.multipleConditionXpath(new String[]{elementSpecifier1, elementSpecifier2}, new String[]{arg1, arg2});

		System.out.println(myxpath);
		content = driver.findElement(By.xpath(myxpath)).getText();
		PageFactory.initElements(driver, EditSettingsPage.class).checkDatePattern(content, pattern);
			
	}
	

	// ONLY USE AS LAST RESORT
	@Given("^I check element with xpath \"(.*?)\" matches pattern \"(.*?)\"$")
	public void i_check_that_an_element_with_xpath_matches(String myxpath, String pattern) throws Throwable {
		DBUtilities createXpath = new DBUtilities(driver);
		String content;
		System.out.println(myxpath);
		content = driver.findElement(By.xpath(myxpath)).getText();
		PageFactory.initElements(driver, EditSettingsPage.class).checkDatePattern(content, pattern);
			
	}
	
	@Given("^I print all values from dropdown \"(.*?)\"$")
	public void i_print_all_values_from_dropdown(String arg1) throws Throwable {
		PageFactory.initElements(driver, DBUtilities.class).ReadAndPrintAllDropdownValues(arg1);
		
	}
	
	// check for field text and text boxes
	@And("^I enter then details as$")
	public void I_enter_then_details_as(DataTable table) throws Throwable {

     PageFactory.initElements(driver, DBUtilities.class).enterCucumbertableValuesInUI(table);
		Thread.sleep(2000);
		
		}

	@And("^I enter then details as new$")
	public void enterCucumberTableValuesInUI(DataTable table) throws InterruptedException{
		PageFactory.initElements(driver, DBUtilities.class).enterCucumbertableValuesInUI(table);
		
	}
	
	@Then("^I hover on \"(.*?)\" to verify \"(.*?)\" is displayed$")
	public void i_hover_on_to_verify_is_displayed(String arg1, String arg2) throws Throwable {
    PageFactory.initElements(driver, MakeAPaymentPage.class).hoverOverElement(arg1, arg2);
 
	}

	
	// this is for checking checkbox
	@Given("^I click on \"(.*?)\" checkbox$")
	public void i_click_on_checkbox(String arg1) throws Throwable {
     PageFactory.initElements(driver, ForgotYourPasswordPage.class).checkBoxClick(arg1);
	}

	//*********************************************** read popup message********************************************
	@Then("^I see \"(.*?)\" displayed on popup and I click \"(.*?)\"$")
	public void i_see_displayed_on_popup_and_I_click(String arg1, String arg2) throws Throwable {
   Thread.sleep(2000);
		PageFactory.initElements(driver, DBUtilities.class).checkPopUpMessage(arg1);
		PageFactory.initElements(driver, DBUtilities.class).clickOnPopUP(arg2);

	}



	//***************************************************Landing Page********************************************************
	@Then("^\"(.*?)\" is displayed as \"(.*?)\"$")
	public void is_displayed_as(String arg1, String arg2, DataTable table) throws Throwable {
//		if(arg2.equals("Checkbox")
//				||arg2.equals("I'm not a robot")
//				||arg2.equals("recaptcha-anchor")){
//			PageFactory.initElements(driver, LandingPage.class).checkElementPresentOnScreen(table);
//		}else{
		PageFactory.initElements(driver, LandingPage.class).checkElementPresentOnScreen(table);
		}
//	}

	
	// Read All SAs
	@Then("^I read all \"(.*?)\" from the corousel$")
	public void i_read_all_from_the_corousel(String arg1) throws Throwable {
		PageFactory.initElements(driver, LandingPage.class).selectSAsFromCorousel(arg1);

	}
	
	// ******************************************************* new page is launched*********************************************
	@Then("^a new page \"(.*?)\" is launched$")                 
	public void a_new_page_is_launched(String arg1) throws Throwable {
    String URL = driver.getCurrentUrl();
     System.out.println(URL);
     new DBUtilities(driver).passControlToNewWindow(arg1);
    
  
		}

	
	
	@Then("^I will see message \"(.*?)\"$")    // this is just a workaround for the temp para coming in
	public void i_will_see_message(String arg1) throws Exception {
		
		Assert.assertTrue(driver.findElement(By.xpath("//*[contains(text(),arg1)]")).isDisplayed());
		System.out.println("Message sucessfully displayed as " +arg1);
		Thread.sleep(5000);
	}

	
	@When("^I view the left hand panel of screen$")
	public void i_view_the_left_hand_panel_of_screen() throws Throwable {
	System.out.println("Checking UI Elements on LHS of screen");
	Thread.sleep(10000);
	}

	@Then("^I see \"(.*?)\" displayed$")
	public void i_see_and_displayed(String arg1) throws Throwable {
    PageFactory.initElements(driver, LandingPage.class).checkUIElementIsDisplayed(arg1);

	}
	
	@Then("^I see text \"(.*?)\" displayed$")
	public void i_see_text_displayed(String arg1) throws Throwable {
      LandingPage AU = PageFactory.initElements(driver, LandingPage.class);
      Thread.sleep(1000);
      AU.checkUIElementTEXTIsDisplayed(arg1);
	}
	//check i am on right page
	@Given("^I check I am on \"(.*?)\" page$")
	public void i_check_I_am_on_page(String arg1) throws Throwable {
	PageFactory.initElements(driver, BillingHistoryPage.class).checkIfOnRightPage(arg1); 
		  
		  System.out.println(" on correct page " +arg1);
	}
	
	// check the dropdown displays expected
	@Then("^\"(.*?)\" displays \"(.*?)\" by default$")
	public void displays_by_default(String arg1, String arg2) throws Throwable {
		DBUtilities createXpath = new DBUtilities(driver);
		String myXpath = createXpath.xpathMakerContainsText(arg2);
		WebElement dropdownValue = driver.findElement(By.xpath(myXpath));
		System.out.println(dropdownValue.getText());
		PageFactory.initElements(driver, AccountFinancialHistorypage.class).isTextPresent(arg2);

	}


	//***************************************** GRAPH CHECKS *********************
	@Then("^the graph for \"(.*?)\" is displayed$")
	public void the_graph_for_is_displayed(String arg1) throws Throwable {
		DBUtilities createXpath = new DBUtilities(driver);
		String myxpath = createXpath.xpathMakerById(arg1);
		driver.findElement(By.xpath(myxpath)).click();
	}
	
	//******************************************Compare values on screen*************************
	@Then("^I compare \"(.*?)\" to \"(.*?)\"$")
	public void i_compare_to(String arg1, String arg2) throws Throwable {
		LandingPage compareValues = PageFactory.initElements(driver, LandingPage.class);
		compareValues.compareValueOneToValueTwo(arg1, arg2);
	}
	// compare 2 values
	@Then("^I verify \"(.*?)\" is \"(.*?)\" then \"(.*?)\"$")
	public void i_verify_is_then(String arg1, String arg2, String arg3) throws Throwable {
	   DBUtilities val1 = new DBUtilities(driver);
	  String a = val1.xpathMakerById(arg1);
	  String currentValue1 = driver.findElement(By.xpath(a)).getText();
	  System.out.println(currentValue1);
	  String b = val1.xpathMakerById(arg3);
	  String currentValue2 = driver.findElement(By.xpath(b)).getText();
	  System.out.println(currentValue2);

		DBUtilities compareAccountTotalToServiceTotal = new DBUtilities(driver);
		String result = compareAccountTotalToServiceTotal.compare2DollarValues(currentValue1, currentValue2);
		
		Assert.assertTrue(result.contains(arg2));
		
	}
	    
	@Then("^I compare \"(.*?)\" to \"(.*?)\" to check if variation is displayed correctly$")
	public void i_compare_to_to_check_if_variation_is_displayed_correctly(String arg1, String arg2) throws Throwable {
		LandingPage compareValues = PageFactory.initElements(driver, LandingPage.class);
		compareValues.compareValueOneToValueTwo(arg1, arg2);
	}
	//*****************************************************************************************
	//**********************************************PAYMENT WINDOW*****************************
	//*****************************************************************************************
	@Then("^a new \"(.*?)\" window is open$")
	public void a_new_window_is_open(String arg1) throws Throwable {
	 // to do... add test once bug is fixed.
	}
	
	
	//*****************************************************************************************
	//**********************************************DATA BASE CONNECTION***********************
	//*****************************************************************************************
	

	
	@Given("^I want to connect to Webservice$")
	public void i_want_to_connect_to_Webservice() throws Throwable {
	
	}


	//*****************************************************************************************
	//**********************************************PDF FILE ***********************
	//*****************************************************************************************
	
	
	@Then("^I see a pdf document with name \"(.*?)\" generated$")
	public void i_see_a_pdf_document_with_name_generated(String arg1) throws Throwable {
     System.out.println("Yes******************* pdf is open");
    // DBUtilities moveControlToNewWindow = new DBUtilities(driver);
     new DBUtilities(driver).passControlToNewWindow(arg1);
     
	}
	
	
	//*****************************************************************************************
	//**********************************************Verify Table Rows ***********************
	//*****************************************************************************************
	
	
	@Then("^I verify the \"(.*?)\" count is \"(.*?)\" to \"(.*?)\"$")
	public void i_verify_the_count_is_to(String arg1, String arg2, int arg3) throws Throwable {
		PageFactory.initElements(driver, AccountFinancialHistorypage.class).readAndCompareTableRows(arg1, arg2, arg3);
	 
	}

	//**************************************************************************************************************************
	//**************************************************************************************************************************
	//**************************************************************************************************************************
	//**************************************************************************************************************************
	//****************************************************UAP STEPS*************************************************************
	//**************************************************************************************************************************
	//**************************************************************************************************************************
	//**************************************************************************************************************************
	//**************************************************************************************************************************
	
	@Given("^I read the table on \"(.*?)\" page$")
	public void i_read_the_table_on_page(String arg1) throws Throwable {
		 new DBUtilities(driver).readTableAndCaptureInString(arg1);
	}
}