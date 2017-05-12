



//package runnerAndSteps;
//
//
////import java.awt.Toolkit;
////import java.awt.datatransfer.Clipboard;
////import java.awt.datatransfer.DataFlavor;
////import java.awt.datatransfer.StringSelection;
//import java.sql.DriverManager;
//import java.util.regex.Pattern;
//
//import org.junit.AfterClass;
//import org.junit.Assert;
//import org.openqa.selenium.Alert;
//import org.openqa.selenium.By;
//import org.openqa.selenium.JavascriptExecutor;
//import org.openqa.selenium.Keys;
//import org.openqa.selenium.WebDriver;
//import org.openqa.selenium.WebElement;
//import org.openqa.selenium.chrome.ChromeDriver;
//import org.openqa.selenium.firefox.FirefoxDriver;
//import org.openqa.selenium.interactions.Actions;
//import org.openqa.selenium.support.PageFactory;
//import org.openqa.selenium.support.ui.Select;
//
//import cucumber.api.DataTable;
//import cucumber.api.java.After;
//import cucumber.api.java.Before;
//import cucumber.api.java.en.And;
//import cucumber.api.java.en.Given;
//import cucumber.api.java.en.Then;
//import cucumber.api.java.en.When;
//import reporting.com.HTMLReports.AccountFinancialHistorypage;
//import reporting.com.HTMLReports.BillingHistoryPage;
//import reporting.com.HTMLReports.DBUtilities;
//import reporting.com.HTMLReports.ForgotYourPasswordPage;
//import reporting.com.HTMLReports.GoalsAndTargetsPage;
//import reporting.com.HTMLReports.HomePage;
//import reporting.com.HTMLReports.LandingPage;
//import reporting.com.HTMLReports.MakeAPaymentPage;
//
//public class StepImpe {
// //********************************************** following is before and after *****************************************
//	WebDriver driver;
//	private String bolt;
//	static String Capture;
//	
//	@Before()
//	  public void startUp() {
////	    driver = new FirefoxDriver();
////	    driver.manage().window().maximize();
//
//	    // the location of the driver is been changed to match with remote server setting.....  HS
//		System.setProperty("webdriver.chrome.driver", "C:\\Program Files\\Automation Tools\\Drivers\\chromedriver.exe");
//		
//		driver = new ChromeDriver();
//	    driver.manage().window().maximize();
//	    
//	}
//		// **************disable to leave browser open***************************************
//
//	@After()
//		  public void tearDown() {	
//		    driver.quit();
//		   	  }
//	//******************************************************************************   
//	    
//   
//	    // for Chrome driver
////		System.setProperty("webdriver.chrome.driver", "C:\\Program Files\\Automation Tools\\Drivers\\chromedriver.exe");
////		driver = new ChromeDriver();
////	    driver.manage().window().maximize();
//	
//	    
//	    // for IE
////		System.setProperty("webdriver.chrome.driver", "C:\\Program Files\\Automation Tools\\Drivers\\IEDriverServer.exe");
////		driver = new ChromeDriver();
////	    driver.manage().window().maximize();
//	    
//	 
//
//	// *****************************************************following are steps******************************************
//	
//
//	// ********************************************************************************************************************************
//	//**************************************** Capture element from Page************************************************************
//	
//	@Given("^I access URL \"(.*?)\"$")
//	public void i_access_url(String arg1) throws Throwable {
//		driver.get(arg1);
//	}
//	
	
//	
//	@Given("^I capture \"(.*?)\"$")
//	public String i_capture(String arg1) throws Throwable {
//		
//
//			if(arg1.equals("html")){
//				StepImpe.Capture = null;
//				StepImpe.Capture = driver.getPageSource();
////				System.out.println("*******************HTML SOURCE*******************\n");
////				System.out.println(StepImpe.Capture);
////				System.out.println("*******************END OF HTML SOURCE*******************\n");
//			}else{
//				
//				DBUtilities createXpath = new DBUtilities(driver);
//				String myxpath = createXpath.xpathMakerById(arg1);
//				System.out.println(myxpath);
//				
//				WebElement xyz = driver.findElement(By.xpath(myxpath));
//				StepImpe.Capture= xyz.getText();
//				System.out.println("object that is captured is *****************>>>>>>>>>>>>>>>>>>>>>>>> "   +Capture);
//				
//			}
//			return Capture;
//  
//	}
//	
//	@Given("^I paste \"(.*?)\"$")
//	public void i_paste(String arg1) throws Throwable {
////		System.out.println("*******************HTML SOURCE*******************\n");
////		System.out.println(StepImpe.Capture);
////		System.out.println("*******************END OF HTML SOURCE*******************\n");
////		System.out.println();
//		
//		
////		// prepare the clipboard for pasting
////		StringSelection selection = new StringSelection(StepImpe.Capture);
////		Clipboard clipboard = Toolkit.getDefaultToolkit().getSystemClipboard();
////		
////		// get the what was originally in the clipboard so that it can be restored later
////		String oldContent = (String) clipboard.getData(DataFlavor.stringFlavor);
////		
////		// set the clipboard contents as what was captured in the previous step(s)
////		clipboard.setContents(selection, selection);
//		
//		//String htmlToBePasted = StepImpe.Capture;
//		//System.out.println(htmlToBePasted);
//		
//		// find the element
//		WebElement inputField =  driver.findElement(By.xpath("//*[contains(@id, 'checkpaste')]"));
//		inputField.click();
//		
//		//paste the captured stuff
//		Actions actions = new Actions(driver);
//		actions.sendKeys(Keys.chord(Keys.LEFT_CONTROL, "v")).build().perform();
//		
////		inputField.clear();
////		inputField.sendKeys(StepImpe.Capture);
//		
////		// revert the clipboard contents to what was there before
////		StringSelection oldSelection = new StringSelection(oldContent);
////		clipboard.setContents(oldSelection, oldSelection);
////		
//	}
//
//
//	@Then("^I check \"(.*?)\" contains \"(.*?)\"$")
//	public void i_Check_contains(String arg1, String arg2) throws Throwable {
//		DBUtilities createXpath = new DBUtilities(driver);
//		String myxpath = createXpath.xpathMakerById(arg1);
//		Thread.sleep(3000);
////		System.out.println(myxpath);
////		String elementToBeSearched = StepImpe.Capture;
////		System.out.println("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%" +elementToBeSearched);
////	     DBUtilities t1 = new DBUtilities(driver);
////	     t1.isTextPresent(elementToBeSearched);
//		
//		WebElement inputBox = null;
//		inputBox = driver.findElement(By.xpath(myxpath));
//		String boxContents = null;
//		boxContents = inputBox.getAttribute("value");
//		
//		System.out.println("boxContents: " + boxContents);
//		System.out.println("arg2: " + arg2);
//		
//		try {
//			Assert.assertTrue(boxContents.equals(arg2));
//		}
//		catch (AssertionError e){
//			// for input fields that default to the placeholder value when empty (very specific ones)
//			e.printStackTrace();
//			System.out.println("Attempting to search for placeholder...");
//			boxContents = inputBox.getAttribute("placeholder");
//			System.out.println("boxContents: " + boxContents);
//			System.out.println("arg2: " + arg2);
//			Assert.assertTrue(boxContents.equals(arg2));
//		}
//		boxContents = null;
//		inputBox = null;
//		Thread.sleep(2000);
//
//	}
//	
//	@Then("^I check \"(.*?)\" is empty$")
//	public void i_check_is_empty(String arg1) throws Throwable {
//		DBUtilities createXpath = new DBUtilities(driver);
//		String myxpath = createXpath.xpathMakerById(arg1);
//		WebElement inputBox = driver.findElement(By.xpath(myxpath));
//		Assert.assertTrue(inputBox.isDisplayed());
//		String boxContents = inputBox.getAttribute("value");
//		try {
//			Assert.assertTrue(boxContents.isEmpty());
//		}
//		
//		// for those input fields that lack the 'value' attribute (needs a better way)
//		catch (AssertionError | Exception e){
//			if (boxContents == null){
//				Assert.assertTrue(true);
//			}
//		}
//	}
//	
////	@Then("^I check dropdown \"(.*?)\" is selected as \"(.*?)\"$")
////	public void i_check_dropdown_is_selected_as(String arg1, String arg2) throws Throwable {
////		DBUtilities createXpath = new DBUtilities(driver);
////		String myxpath = createXpath.xpathMakerById(arg1);
////		WebElement dropdown = driver.findElement(By.xpath(myxpath));
////		Select mySelect = new Select(dropdown);
////
////		String currentValue = mySelect.getFirstSelectedOption().getText();
////		Assert.assertTrue(currentValue.equals(arg2));
////	}
//	
//	
//	
//	//*************************************************************************************************************************
//	
//	
//	@Given("^I want to login to portal \"(.*?)\"$")
//	public void i_want_to_login_to_portal(String arg1) throws Throwable {
//		HomePage home = PageFactory.initElements(driver, HomePage.class);
//		home.navigateTo(arg1);	
//	}
//
//
//	@And("^I hit Enter$")
//     public LandingPage I_hit_Enter() throws InterruptedException
//	{
//   PageFactory.initElements(driver, LandingPage.class).hitEnter();
//		Thread.sleep(1000);
//		
//		 return PageFactory.initElements(driver, LandingPage.class);
//	}
//	
//// will be used to tab out to activate a button incase the button is not activated.
//	@Given("^I Tab Out$")
//	public void i_Tab_Out() throws Throwable {
//		new DBUtilities(driver).tabOut();
//	}
//	
//	@And("^I click on button \"(.*?)\"$")
//	public void i_click_on_button(String arg1) throws Throwable {
//		Thread.sleep(1000);
//		Pattern datePattern = Pattern.compile("\\d\\d\\d\\d\\d\\d\\d\\d"); // date pattern as used in the calendar popup
//		String myXpath = null;
//		DBUtilities createXpath = new DBUtilities(driver);
//		if (datePattern.matcher(arg1).matches()){
//			myXpath = createXpath.xpathMakerContainsCustomField("dyc-date", arg1);
//			try {
//				driver.findElement(By.xpath(myXpath)).click();
//			}
//			catch (Exception e){
//				for (int i = 0; i < 100; i++){
//					System.out.println("(" + myXpath + ")[" + i + "]");
//					try {
//						driver.findElement(By.xpath("(" + myXpath + ")[" + i + "]")).click();
//						break;
//					}
//					catch (Exception e2){
//						System.out.println();
//					}
//				}
//				
//			}
//		}
//		else {
//			myXpath = createXpath.xpathMakerById(arg1);
//			driver.findElement(By.xpath(myXpath)).click();
//		}
//		Thread.sleep(2500);
//
//	}
//	
//	@And("^I click on \"(.*?)\"$")
//	public void i_click_on(String arg1) throws Throwable {
//		// give time for page loading
//		Thread.sleep(1000);
//		Pattern datePattern = Pattern.compile("\\d\\d\\d\\d\\d\\d\\d\\d"); // date pattern as used in the calendar popup
//
//		if(arg1.equals("Current_Bill")
//				||arg1.equals("InfoIcon")
//				||arg1.equals("Pay")
//				||arg1.equals("Next")
//				||arg1.equals("Search")
//				||arg1.equals("Serch")
//				||arg1.equals("NextSection")
//				||arg1.equals("MessageEdit")
//				||arg1.equals("TaxPayerDetailsSave")
//				||arg1.equals("SaveAndExit")
//				||arg1.equals("Cancel")
//				||arg1.equals("AddNew")
//				||arg1.equals("Delete")
//				||arg1.equals("RemoveLine")
//				||arg1.equals("GroupMember_UNSURE")
//				||arg1.equals("ConfirmBack")
//				||arg1.equals("DeclarationBack")
//				||arg1.equals("AddTotalWages")
//				||arg1.equals("DateBusinessStart")
//				||arg1.equals("DateBusinessLiable")
//				||arg1.equals("TaxPayerDetailsNext")
//				||arg1.equals("MonthlyReturnBack")
//				||arg1.equals("PayrollNext")
//				||arg1.equals("RefundDetailsNext")
//				||arg1.equals("ClaimingACTProportion_Yes")
//				||arg1.equals("ClaimingACTProportion_No")
//				||arg1.equals("BackBt")
//				||arg1.equals("Refunds_NO")
//				||arg1.equals("DBResultsSG_Theme_wt6_block_wtActions_wt8")
//				||arg1.equals("LodgePayrollAnswer_EmployerStatus_Independent")
//				||arg1.equals("LodgePayrollAnswer_EmployerStatus_Opt2")
//				||arg1.equals("LodgePayrollAnswer_EmployerStatus_Opt3")
//				||arg1.equals("LodgePayrollAnswer_EmployerStatus_Opt4")
//				||arg1.equals("Answer_TypeAnnual")
//				||arg1.equals("Answer_TypeMonthly")
//				||arg1.equals("YearOfReturn")
//				||arg1.equals("CorrectInfoDeclared")
//				||arg1.equals("SummarySubmit")
//				||arg1.equals("PageText_TextCode")
//				||arg1.equals("TaxPayerDetailsNext")
//				||arg1.equals("Current_Bill")
//				||arg1.equals("DeclarationNext")
//				||arg1.equals("DeclarationConfirm")
//				||arg1.equals("MonthlyReturnNext")
//				||arg1.equals("ACTWagesPaidNext")
//				||arg1.equals("ReSendEmailButton")
//				||arg1.equals("PasswordSaveButton")
//				||arg1.equals("ActivityHistoryButton")
//				||arg1.equals("MakeAnotherPaymentButton")
//				||arg1.equals("ConfirmForSubmission")
//				||arg1.equals("EditSettings")
//				||arg1.equals("wtSubmitBT")
//				||arg1.equals("ButtonShowAll")
//				||arg1.equals("AllTransactions")
//				||arg1.equals("Reset")
//				||arg1.equals("MenuIcon")
//				||arg1.equals("PasswordInfoIcon")
//				||arg1.equals("HintInfoIcon")
//				||arg1.equals("SetGoal")		
//				||arg1.equals("wtSubmitButton3")      // to do ask M lara to change thename ....this is for Reset Password
//				){
//			Thread.sleep(3000);
//			DBUtilities createXpath = new DBUtilities(driver);
//			String myxpath2 = createXpath.xpathMakerById(arg1);
//			driver.findElement(By.xpath(myxpath2)).click();
//			
//		}
//
//		else if (arg1.equals("Welcome")){
//				DBUtilities createXpath2 = new DBUtilities(driver);
//				String myxpath3 = createXpath2.xpathMakerContainsText(arg1);
//				
//			}
//		// for calendar stuff found in the PAYROLL TAX INFORMATION part of the tax registration page
//		else if (datePattern.matcher(arg1).matches()){
//			DBUtilities createXpath = new DBUtilities(driver);
//			String myxpath4 = createXpath.xpathMakerContainsCustomField("dyc-date", arg1);
//			try {
//				driver.findElement(By.xpath(myxpath4)).click();
//			}
//			catch (Exception e){
//				for (int i = 0; i < 100; i++){
//					System.out.println("(" + myxpath4 + ")[" + i + "]");
//					try {
//						driver.findElement(By.xpath("(" + myxpath4 + ")[" + i + "]")).click();
//						break;
//					}
//					catch (Exception e2){
//						System.out.println();
//					}
//				}
//				
//			}
//		}
////		else if (arg1.equals("Submit")){
////			DBUtilities createXpath = new DBUtilities(driver);
////			String myxpath2 = createXpath.xpathMakerByExactId(arg1);
////			driver.findElement(By.xpath(myxpath2)).click();
////		}
//		else {
//			DBUtilities createXpath = new DBUtilities(driver);
//			String myxpath = createXpath.xpathMaker(arg1);
//			System.out.println("cliclking on " +myxpath);
//			Assert.assertTrue(driver.findElement(By.xpath(myxpath)).isDisplayed());
//			Thread.sleep(1000);
//			driver.findElement(By.xpath(myxpath)).click();
//			
//		}
//		Thread.sleep(2000);
//		
//	}
//
//	@Given("^I select \"(.*?)\" from \"(.*?)\"$")
//	public void i_select_from(String arg1, String arg2) throws Throwable {
//		if(arg1.equals("SetGoal")){
//			String myxpath = PageFactory.initElements(driver, GoalsAndTargetsPage.class).xpathMakerById1AndId2(arg1, arg2);
//			driver.findElement(By.xpath(myxpath)).click();
//		}
//		else{
//			PageFactory.initElements(driver, LandingPage.class).selectDropdownValue(arg1, arg2);
//		}
//	}
//	// check for field text and text boxes
//	@And("^I enter the details as$")
//	public void I_enter_then_details_as(DataTable table) throws Throwable {
//
//     PageFactory.initElements(driver, DBUtilities.class).enterCucumbertableValuesInUI(table);
//	//In test	
//     //Thread.sleep(2000);
//		
//		}
//	
//	// simple wait
//	@Then("^I wait for \"(.*?)\" millisecond$")
//	public void i_wait_for_millisecond(long arg1) throws Throwable {
//		Thread.sleep(arg1);
//	}
//
//
//	@And("^I enter then details as new$")
//	public void enterCucumberTableValuesInUI(DataTable table) throws InterruptedException{
//		PageFactory.initElements(driver, DBUtilities.class).enterCucumbertableValuesInUI(table);
//		
//	}
//	
//	@Then("^I hover on \"(.*?)\" to verify \"(.*?)\" is displayed$")
//	public void i_hover_on_to_verify_is_displayed(String arg1, String arg2) throws Throwable {
//    PageFactory.initElements(driver, MakeAPaymentPage.class).hoverOverElement(arg1, arg2);
// 
//	}
//
//	// CHECK ELEMENT IS READ ONLY
//	@Then("^I check \"(.*?)\" is readonly$")
//	public void i_check_is(String arg1) throws Throwable {
//		PageFactory.initElements(driver, DBUtilities.class).elementIsreadOnly(arg1);
//	}
//	
//	@Then("^I check \"(.*?)\" is not readonly$")
//	public void i_check_is_not_readonly(String arg1) throws Throwable {
//		DBUtilities createXpath = new DBUtilities(driver);
//		String myXpath = createXpath.xpathMakerById(arg1);
//		Thread.sleep(1000);
//		WebElement some_element = driver.findElement(By.xpath(myXpath));
//		// some_element.click();
//		Assert.assertTrue(some_element.isEnabled());
////			 if (some_element.isEnabled()) { 
////				 System.out.println("test failed " +some_element +"should be disabled");
////			 }
////			 else {
////				 System.out.println("test Passed " +some_element +"is disabled as expected");
////			 }
//	}
//	
//	
//	 
//	
//	// this is for checking checkbox
//	@Given("^I click on \"(.*?)\" checkbox$")
//	public void i_click_on_checkbox(String arg1) throws Throwable {
//     PageFactory.initElements(driver, ForgotYourPasswordPage.class).checkBoxClick(arg1);
//	}
//
//	//*********************************************** read popup message********************************************
//	@Then("^I see \"(.*?)\" displayed on popup and I click \"(.*?)\"$")
//	public void i_see_displayed_on_popup_and_I_click(String arg1, String arg2) throws Throwable {
//   Thread.sleep(2000);
//		PageFactory.initElements(driver, DBUtilities.class).checkPopUpMessage(arg1);
//		PageFactory.initElements(driver, DBUtilities.class).clickOnPopUP(arg2);
//
//	}
//
//
//
//	//***************************************************Landing Page********************************************************
//	@Then("^\"(.*?)\" is displayed as \"(.*?)\"$")
//	public void is_displayed_as(String arg1, String arg2, DataTable table) throws Throwable {
////		if(arg2.equals("Checkbox")
////				||arg2.equals("I'm not a robot")
////				||arg2.equals("recaptcha-anchor")){
////			PageFactory.initElements(driver, LandingPage.class).checkElementPresentOnScreen(table);
////		}else{
//		PageFactory.initElements(driver, LandingPage.class).checkElementPresentOnScreen(table);
//		}
////	}
//
//	
//	// Read All SAs
//	@Then("^I read all \"(.*?)\" from the corousel$")
//	public void i_read_all_from_the_corousel(String arg1) throws Throwable {
//		PageFactory.initElements(driver, LandingPage.class).selectSAsFromCorousel(arg1);
//
//	}
//	
//	// ******************************************************* new page is launched*********************************************
//	@Then("^a new page \"(.*?)\" is launched$")                 
//	public void a_new_page_is_launched(String arg1) throws Throwable {
//    String URL = driver.getCurrentUrl();
//     System.out.println(URL);
//     new DBUtilities(driver).passControlToNewWindow(arg1);
//    
//  
//		}
//
//	
//	
//	@Then("^I will see message \"(.*?)\"$")    // this is just a workaround for the temp para coming in
//	public void i_will_see_message(String arg1) throws Exception {
//		
//		Assert.assertTrue(driver.findElement(By.xpath("//*[contains(text(),arg1)]")).isDisplayed());
//		System.out.println("Message sucessfully displayed as " +arg1);
//		Thread.sleep(5000);
//	}
//
//	
//	@When("^I view the left hand panel of screen$")
//	public void i_view_the_left_hand_panel_of_screen() throws Throwable {
//	System.out.println("Checking UI Elements on LHS of screen");
//	Thread.sleep(10000);
//	}
//
//	@Then("^I see \"(.*?)\" displayed$")
//	public void i_see_and_displayed(String arg1) throws Throwable {
//    PageFactory.initElements(driver, LandingPage.class).checkUIElementIsDisplayed(arg1);
//
//	}
//	
//	@Then("^I see text \"(.*?)\" displayed$")
//	public void i_see_text_displayed(String arg1) throws Throwable {
//      LandingPage AU = PageFactory.initElements(driver, LandingPage.class);
//      Thread.sleep(1000);
//      AU.checkUIElementTEXTIsDisplayed(arg1);
//	}
//	//check i am on right page
//	@Given("^I check I am on \"(.*?)\" page$")
//	public void i_check_I_am_on_page(String arg1) throws Throwable {
//	PageFactory.initElements(driver, BillingHistoryPage.class).checkIfOnRightPage(arg1); 
//		  
//		  System.out.println(" on correct page " +arg1);
//	}
//	
//	// check that a checkbox is checked
//	@Then("^I see checkbox \"(.*?)\" as selected$")
//	public void i_see_checkbox_as_selected (String arg1) throws Throwable {
//		DBUtilities createXpath = new DBUtilities(driver);
//		String myxpath = createXpath.xpathMakerById(arg1);
//		System.out.println("Checking if checkbox " +myxpath + " has been selected.");
//		Assert.assertTrue(driver.findElement(By.xpath(myxpath)).isSelected());
//	}
//	
//	@Then("^I see checkbox \"(.*?)\" as not selected$")
//	public void i_see_checkbox_as_not_selected (String arg1) throws Throwable {
//		DBUtilities createXpath = new DBUtilities(driver);
//		String myxpath = createXpath.xpathMakerById(arg1);
//		System.out.println("Checking if checkbox " +myxpath + " has not been selected.");
//		Assert.assertFalse(driver.findElement(By.xpath(myxpath)).isSelected());
//	}
//	
//	// check the dropdown displays expected
//	@Then("^\"(.*?)\" displays \"(.*?)\" by default$")
//	public void displays_by_default(String arg1, String arg2) throws Throwable {
//		DBUtilities createXpath = new DBUtilities(driver);
//		String myXpath = createXpath.xpathMakerContainsText(arg2);
//		WebElement dropdownValue = driver.findElement(By.xpath(myXpath));
//		System.out.println(dropdownValue.getText());
//		PageFactory.initElements(driver, AccountFinancialHistorypage.class).isTextPresent(arg2);
//		
////		DBUtilities createXpath = new DBUtilities(driver);
////		String myxpath = createXpath.xpathMakerById(arg1);
////		WebElement dropdown = driver.findElement(By.xpath(myxpath));
////		Select mySelect = new Select(dropdown);
////
////		String currentValue = mySelect.getFirstSelectedOption().getText();
////		Assert.assertTrue(currentValue.equals(arg2));
//
//	}
//
//
//	//***************************************** GRAPH CHECKS *********************
//	@Then("^the graph for \"(.*?)\" is displayed$")
//	public void the_graph_for_is_displayed(String arg1) throws Throwable {
//		DBUtilities createXpath = new DBUtilities(driver);
//		String myxpath = createXpath.xpathMakerById(arg1);
//		driver.findElement(By.xpath(myxpath)).click();
//	}
//	
//	//******************************************Compare values on screen*************************
//	@Then("^I compare \"(.*?)\" to \"(.*?)\"$")
//	public void i_compare_to(String arg1, String arg2) throws Throwable {
//		LandingPage compareValues = PageFactory.initElements(driver, LandingPage.class);
//		compareValues.compareValueOneToValueTwo(arg1, arg2);
//	}
//	// compare 2 values
//	@Then("^I verify \"(.*?)\" is \"(.*?)\" then \"(.*?)\"$")
//	public void i_verify_is_then(String arg1, String arg2, String arg3) throws Throwable {
//	  DBUtilities val1 = new DBUtilities(driver);
//	  String a = val1.xpathMakerById(arg1);
//	  String currentValue1 = driver.findElement(By.xpath(a)).getText();
//	  System.out.println(currentValue1);
//	  String b = val1.xpathMakerById(arg3);
//	  String currentValue2 = driver.findElement(By.xpath(b)).getText();
//	  System.out.println(currentValue2);
//
//		DBUtilities compareAccountTotalToServiceTotal = new DBUtilities(driver);
//		String result = compareAccountTotalToServiceTotal.compare2DollarValues(currentValue1, currentValue2);
//		
//		Assert.assertTrue(result.contains(arg2));
//		
//	}
//	    
//	@Then("^I compare \"(.*?)\" to \"(.*?)\" to check if variation is displayed correctly$")
//	public void i_compare_to_to_check_if_variation_is_displayed_correctly(String arg1, String arg2) throws Throwable {
//		LandingPage compareValues = PageFactory.initElements(driver, LandingPage.class);
//		compareValues.compareValueOneToValueTwo(arg1, arg2);
//	}
//	//*****************************************************************************************
//	//**********************************************PAYMENT WINDOW*****************************
//	//*****************************************************************************************
//	@Then("^a new \"(.*?)\" window is open$")
//	public void a_new_window_is_open(String arg1) throws Throwable {
//	 // to do... add test once bug is fixed.
//	}
//	
//	
//	//*****************************************************************************************
//	//**********************************************DATA BASE CONNECTION***********************
//	//*****************************************************************************************
//	
//
//	
//	@Given("^I want to connect to Webservice$")
//	public void i_want_to_connect_to_Webservice() throws Throwable {
//	
//	}
//
//
//	//*****************************************************************************************
//	//**********************************************PDF FILE ***********************
//	//*****************************************************************************************
//	
//	
//	@Then("^I see a pdf document with name \"(.*?)\" generated$")
//	public void i_see_a_pdf_document_with_name_generated(String arg1) throws Throwable {
//     System.out.println("Yes******************* pdf is open");
//    // DBUtilities moveControlToNewWindow = new DBUtilities(driver);
//     new DBUtilities(driver).passControlToNewWindow(arg1);
//     
//	}
//	
//	
//	//*****************************************************************************************
//	//**********************************************Verify Table Rows ***********************
//	//*****************************************************************************************
//	
//	
//	@Then("^I verify the \"(.*?)\" count is \"(.*?)\" to \"(.*?)\"$")
//	public void i_verify_the_count_is_to(String arg1, String arg2, int arg3) throws Throwable {
//		PageFactory.initElements(driver, AccountFinancialHistorypage.class).readAndCompareTableRows(arg1, arg2, arg3);
//	 
//	}
//
//	//**************************************************************************************************************************
//	//**************************************************************************************************************************
//	//**************************************************************************************************************************
//	//**************************************************************************************************************************
//	//****************************************************UAP STEPS*************************************************************
//	//**************************************************************************************************************************
//	//**************************************************************************************************************************
//	//**************************************************************************************************************************
//	//**************************************************************************************************************************
//	
//	@Given("^I read the table on \"(.*?)\" page$")
//	public void i_read_the_table_on_page(String arg1) throws Throwable {
//		 new DBUtilities(driver).readTableAndCaptureInString(arg1);
//	}
////	
////	@Then("^I check \"(.*?)\" has a CSS property \"(.*?)\" with value \"(.*?)\"$")
////	public void i_check_has_a_css_property_with_value (String arg1, String arg2, String arg3) throws Throwable{
////		DBUtilities dbutil = new DBUtilities(driver);
////		String xpath1 = dbutil.xpathMakerById(arg1);
////		String property = arg2;
////		String cssVal = arg3;
////		String currentCssVal = null;
////		try {
////			currentCssVal = driver.findElement(By.xpath(xpath1)).getCssValue(arg2);
////			System.out.println("Comparing '" + cssVal + "' against the property value found: '" + currentCssVal + "'.");
////			Assert.assertTrue(cssVal.equals(currentCssVal));
////		}
////		// specifically for finding CSS values of labels with ::after psuedo selector
////		catch (AssertionError | Exception e){
////			try {
////				xpath1 = dbutil.xpathMakerByLabelAndId(arg1);
////				WebElement currentElement = driver.findElement(By.xpath(xpath1));
////				currentCssVal = ((JavascriptExecutor) driver).executeScript("return window.getComputedStyle(arguments[0], '::after').getPropertyValue('" + property + "');",currentElement).toString();
////				System.out.println("Comparing '" + cssVal + "' against the property value found: '" + currentCssVal + "'.");
////				Assert.assertTrue(cssVal.equals(currentCssVal));
////			}
////			catch (AssertionError | Exception ae2) {
////				xpath1 = dbutil.xpathMakerBySpanAndId(arg1);
////				WebElement currentElement = driver.findElement(By.xpath(xpath1));
////				currentCssVal = ((JavascriptExecutor) driver).executeScript("return window.getComputedStyle(arguments[0], '::after').getPropertyValue('" + property + "');",currentElement).toString();
////				System.out.println("Comparing '" + cssVal + "' against the property value found: '" + currentCssVal + "'.");
////				Assert.assertTrue(cssVal.equals(currentCssVal));
////			}
////			
////		}
////	}
//}
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^