package reporting.com.HTMLReports;

import java.awt.AWTException;
import java.awt.Robot;
import java.awt.Toolkit;
import java.awt.datatransfer.StringSelection;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.interactions.Actions;

import cucumber.api.DataTable;

public class DBUtilities extends XPathGenerator {
	
	//constructor
	 public DBUtilities (WebDriver dr){
			super(dr);
			}
	 
	 
	 // following will take 2 args  from cucumber and one from page and then compare both messages
	 public static  void checkElement(String arg1, String arg2) {
		 Assert.assertEquals(arg1, arg2);
	 System.out.println("Successfully displayed element" +arg2 );
	   
	 }
	 
	 // following will take 2 args both strings and then compare them, basically used for text on UI
	 public static  void checkMessage(String arg1, String arg2) {
		 Assert.assertEquals(arg1, arg2);
	 System.out.println("Successfully displayed message" +arg2 );
	 }
	   
	   // ***********************this is to hover over an element****************************
	 public void hoverOverElement(String arg1, String arg2) throws InterruptedException
	 {
		 DBUtilities createXpath = new DBUtilities(driver);
		 String myXpath = createXpath.xpathMakerByClass(arg1);
		 System.out.println("successfully dispays hint which was marked as infoicon before" +arg1);
		 //String myXpath2 = createXpath.xpathMakerContainsText(arg2);
		 Assert.assertTrue(driver.findElement(By.xpath(myXpath)).isDisplayed()); 
		 Actions action = new Actions(driver);
		 WebElement we = driver.findElement(By.xpath(myXpath));
		 action.moveToElement(we).click().build().perform();
		 // check for message to appear when icon is hovered on
		 Thread.sleep(1000);
		 if(driver.getPageSource().contains(arg2)){
			 System.out.println("Text is present" +arg2);
			 }else{
			 System.out.println("Text is absent" +arg2);
			 }
		
	 }
	 
	 // following will check if the element exist on the screen
	 	 public void checkElementPresentMessage(String arg1){
	 
		 System.out.println("***Page Element " + arg1.toUpperCase() +" is displayed successfully***");
	 }
	 	 // differnt from above this checks for webelement
	 	 
	 	public void isTextPresent(String arg1) throws InterruptedException{
	 		System.out.println(" ****" +arg1);
	 		Thread.sleep(4000);
	 		if(driver.getPageSource().contains(arg1)){
	 			System.out.println("Text " +arg1+ "is present");
	 		}else{
	 			System.out.println("Text " +arg1+ "NOT present");
	 		}
	 
	 	}
	 	  // Scroll down the page
	 	
	 	public void scrollDownThePage(String arg1) throws InterruptedException{
	 	
	 		
	 			JavascriptExecutor jse = (JavascriptExecutor)driver;
	 			jse.executeScript("window.scrollBy(0,5000)", "");
	 		}
	 	
	 	
	 
	 	
	// action performed on element(coming as arg)
	 	 public void actionPerformedClick (String arg1)
	 	 {
	 		System.out.println("Successfully displayed Link" +arg1 );
	 		 System.out.println("Clicking on " +arg1.toUpperCase());	 
	 	 }

	 	 
	 	 // check that element is read Only
	 	 
	 	 public void elementIsreadOnly(String arg1) throws InterruptedException
	 	 {
	 		 
	 		 DBUtilities createXpath = new DBUtilities(driver);
			 String myXpath = createXpath.xpathMakerById(arg1);
			 Thread.sleep(1000);
	 		 WebElement some_element = driver.findElement(By.xpath(myXpath));
	 		// some_element.click();

	 		 if
	 		(some_element.isEnabled()){ System.out.println("test failed " +some_element +"should be disabled");
	 		 }else {System.out.println("test Passed " +some_element +"is disabled as expected");}
	 		 
	 		 }
	 	 
	 	 
	 	 
	 	 
		 public void hitEnter() {
	    	
		 Actions action = new Actions(driver); 
		   action.sendKeys(Keys.ENTER).build().perform();
		   //action.sendKeys(Keys.RETURN);
	    }
		 
		 // move control to new window and check if the right url is opened
		 public void passControlToNewWindow(String arg1)
		 {
			// It will return the parent window name as a String
			 String parent=driver.getWindowHandle();
			  
			 // This will return the number of windows opened by Webdriver and will return Set of St//rings
			 Set<String>s1=driver.getWindowHandles();
			  
			 // Now we will iterate using Iterator
			 Iterator<String> I1= s1.iterator();
			  
			 while(I1.hasNext())
			 {
			  
			    String child_window=I1.next();
			  
			 // Here we will compare if parent window is not equal to child window then we            will close
			  
			 if(!parent.equals(child_window))
			 {
			 driver.switchTo().window(child_window);
			  
			 String newPageURL= driver.switchTo().window(child_window).getCurrentUrl();
			 System.out.println("++++++++++++++++++++++++++++++++++++++++++++++++" +newPageURL);
			 System.out.println(arg1);
			 Assert.assertEquals(arg1, newPageURL);
			 }
			 }
		 }
		 
	 
		 //********************* Check if on expected page***************************************
		 public void checkIfOnRightPage(String arg1) throws InterruptedException
			{
				System.out.println("****************Page Name*************************" +arg1);
				Thread.sleep(3000);
				String title = driver.getTitle();
				System.out.println("The page title is " +title);
				Assert.assertTrue(driver.getTitle().contains(arg1));
				
			}
			
	 // capture date and time

			 public String DNT(String[] args) {

				   DateFormat dateFormat = new SimpleDateFormat("ddMMYYYYHHmmss");
			   //get current date time with Calendar()
				   Calendar cal = Calendar.getInstance();
				   String datentime = dateFormat.format(cal.getTime());
				   return datentime;
			  }

			 //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
			 //++++++++++++++++++++++++++++++++++Read table Rows and compare to an expected number++++++++++++++++++++++++++++++++++++++++
			//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
			 
			 public void readAndCompareTableRows(String arg1, String arg2 ,int arg3)
			 {
				 
				  DBUtilities createXpath = new DBUtilities(driver);
					 String myXpath = createXpath.xpathMakerByTextInClass(arg1);
					
					 System.out.println("So the xpath for table is " +myXpath);
					// List<WebElement> rows = driver.findElements(By.xpath(myXpath));
					 List<WebElement> rows = driver.findElements(By.xpath(myXpath));
					 System.out.println("Balley balley ni taur ni punjabban di Total number of rows :"+ rows.size());
					 
			 }
			 
			 
			 //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
			 //++++++++++++++++++++++++++++++++++Read table Rows and compare to an expected number++++++++++++++++++++++++++++++++++++++++
			//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
			 
			 public void readTableAndCaptureInString(String arg1)
			 {
				 System.out.println("Balley balley ni taur ni punjabban di");
				  DBUtilities createXpath = new DBUtilities(driver);
					 String myXpath = createXpath.xpathMakerById(arg1);
					
					 System.out.println("So the xpath for table is " +myXpath);
					// List<WebElement> rows = driver.findElements(By.xpath(myXpath));
					 
					 List<WebElement> rows = driver.findElements(By.xpath(myXpath));
					 System.out.println("Balley balley ni taur ni punjabban di Total number of rows :"+ rows.size());
					
					 List<WebElement> rowElements = driver.findElements(By.tagName("tr"));
					 System.out.println(rowElements.size());
					 String Table_data = driver.findElement(By.xpath(myXpath)).getText();
					 System.out.println(" chakk bai"    +Table_data);
					
					 
					 
					 
			 }
			 
			 //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
			 //++++++++++++++++++++++++++++++++++Check Dropdown value displayed by default++++++++++++++++++++++++++++++++++++++++
			//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
		  public void checkDropDownDefaultValue(String arg2)
		  {

			DBUtilities createXpath = new DBUtilities(driver);
			String myXpath = createXpath.xpathMakerContainsText(arg2);
			WebElement dropdownValue = driver.findElement(By.xpath(myXpath));
		//	 assertTrue(isElementPresent(By.id(myXpath)));
			
//			dropdownValue.isDisplayed();
//			
//			String visibleValue = dropdownValue.getText();
//			System.out.println(visibleValue);
//			Assert.assertEquals(arg2, visibleValue);
		  }
	
			 
			 public static void uploadAnAttachmentFile() throws AWTException, InterruptedException
			 {
				 StringSelection ss = new StringSelection("C:\\Users\\HShori.DBRESULTS\\Desktop\\Jeetu Todos");
	                Toolkit.getDefaultToolkit().getSystemClipboard().setContents(ss, null);
	                // perform keystrokes
	                Robot robot = new Robot();
	                robot.keyPress(java.awt.event.KeyEvent.VK_ENTER);
	                Thread.sleep(500);
	                robot.keyRelease(java.awt.event.KeyEvent.VK_ENTER);
	                Thread.sleep(500);
	                robot.keyPress(java.awt.event.KeyEvent.VK_CONTROL);
	                Thread.sleep(500);
	                robot.keyPress(java.awt.event.KeyEvent.VK_V);
	                Thread.sleep(500);
	                robot.keyRelease(java.awt.event.KeyEvent.VK_V);
	                Thread.sleep(500);
	                robot.keyRelease(java.awt.event.KeyEvent.VK_CONTROL);
	                Thread.sleep(500);
	                robot.keyPress(java.awt.event.KeyEvent.VK_ENTER);
	                Thread.sleep(500);
	                robot.keyRelease(java.awt.event.KeyEvent.VK_ENTER);
			 }


			 
			 public void generateException(String arg1)
			 {
				 System.out.println("********************************************************");
				 System.out.println("***************Element not displayed" +arg1 + "*********");
				 System.out.println("********************************************************");	 
			 }
// ********************************this function is used for reporting*****************************
			 public void writeLog(String arg1) {
				 System.out.println(arg1+ " ** exist on screen");
			    	//String timeStamp = new SimpleDateFormat("[dd/MM/yyyy HH:mm:ss]").format(new Date(0));
			    	//System.out.println(timeStamp + " " + arg1+ " ** exist on screen");  	
			    }
			 
			 
			 //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
			 //++++++++++++++++++++++++++++++++++Enter Input Field++++++++++++++++++++++++++++++++++++++++
			//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
			 // the abopve will read the cucumber table and input values on screen as per provided in table
			 
			 public void enterCucumbertableValuesInUI (DataTable table) throws InterruptedException 
			 {
				 		String myXpath;
					
						List<List<String>> data = table.raw();
						
						for (int i = 1; i <data.size(); i++){
							String name = data.get(i).get(1);
							System.out.println("The table length is .." +data.size());
							
						DBUtilities createXpath = new DBUtilities(driver);
						try {
							  myXpath = createXpath.xpathMakerByInputId(data.get(i).get(0));
							  System.out.println(i);
							  System.out.println(myXpath);
							  System.out.println("Is " + myXpath + " Interactable? " + driver.findElement(By.xpath(myXpath)).isEnabled());
							  driver.findElement(By.xpath(myXpath)).clear();
						  }
						  catch (Exception e){
							  e.printStackTrace();
							  System.out.println("Cannot find an input field! Now trying to find a textarea field...");
							  myXpath = createXpath.xpathMakerByTextAreaId(data.get(i).get(0));
							  System.out.println(i);
							  System.out.println(myXpath);
							  driver.findElement(By.xpath(myXpath)).clear();
						  }
					 // driver.findElement(By.xpath(myXpath)).click();
						// disabled above as we have already clicked it before
					 
					  driver.findElement(By.xpath(myXpath)).sendKeys(data.get(i).get(1));
						System.out.println("Entering value in table " +myXpath +"as" +name);  
						}
					
			 }

			 //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
			 //++++++++++++++++++++++++++++++++++compare 2 dollar values++++++++++++++++++++++++++++++++++++++++
			//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
			 
			 public String compare2DollarValues(String value1,  String value2){
		    
		    	String result;
		    	System.out.println(""+value1);
		    	System.out.println(""+value1);
		    	
		    		String newValue1 = value1.replaceAll("[^\\d.]+", "");
		    		System.out.println(" its "+newValue1);
		    		double intnewValue1 = Double.parseDouble(newValue1);
		    		System.out.println(" its**************************** "+intnewValue1);
		    		String newValue2 = value2.replaceAll("[^\\d.]+", "");
		    		System.out.println(" its "+newValue2);
		    		double intnewValue2 = Double.parseDouble(newValue2);
		    		System.out.println(" its*********************** "+intnewValue2);
		    		
		    		if(intnewValue1<=intnewValue2){
		    			System.out.println("Service total is Less then account total");
		    			result  = "Service total is Less then account total";
		    		}else{
		    			System.out.println("Service total is ***********MORE******** then account total");
		    			 result = "Service total is ***********MORE******** then account total";
		    		}
					
		    		return result;
		      }
			 //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
			 //++++++++++++++++++++++++++++++++++PopUp handlers++++++++++++++++++++++++++++++++++++++++
			//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
			 
			 public void checkPopUpMessage(String arg1)
			 {
				 String popUpMessage = driver.switchTo().alert().getText();
				 System.out.println("the pop up message text is '" + popUpMessage + "'");
				 Assert.assertTrue(arg1, popUpMessage.equals(arg1));
			 }
			 
			 
			 public void tabOut()
			 {
				 Actions action = new Actions(driver); 
				   action.sendKeys(Keys.TAB).perform();
			 }
			 
			 
			 public void clickOnPopUP(String arg1) throws InterruptedException
			 {
				 if(arg1.equals("OK")){
					 Thread.sleep(5000);
						driver.switchTo().alert().accept();
						System.out.println("Clicking " +arg1 +" on PopUp");
					}
					else if(arg1.equals("Cancel")){
						 Thread.sleep(5000);
						driver.switchTo().alert().dismiss();
						System.out.println("Clicking " +arg1 +" on PopUp");
					}
			 }
			 
		
			 //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
			 //++++++++++++++++++++++++++++++++++copy and paste page html++++++++++++++++++++++++++++++++++++++++
			//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
			 
			 
			 public String getPageHTML()
			 {
				 String Capture2 = driver.getPageSource();
			
			
					return Capture2;

			 }
		
			 public void paste(String arg1)
			 {
			  

			 }
			 
			 
			 //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
			 //++++++++++++++++++++++++++++++++++PopUp handlers++++++++++++++++++++++++++++++++++++++++
			//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
			 
			 public void readAllPDFAndCheckTextPresent (String arg1)
			 {
//				 protected String getLastWindow() {
//					    return session().getEval("var windowId; for(var x in selenium.browserbot.openedWindows ){windowId=x;} ");
//					}

//					@Test
//					public void testTextInPDF() {
//					    session().click("link=View PDF");
//					    String popupName = getLastWindow();
//					    session().waitForPopUp(popupName, PAGE_LOAD_TIMEOUT);
//					    session().selectWindow(popupName);
//
//					    session().windowMaximize();
//					    session().windowFocus();
//					    Thread.sleep(3000);
//
//					    session().keyDownNative("17"); // Stands for CTRL key
//					    session().keyPressNative("65"); // Stands for A "ascii code for A"
//					    session().keyUpNative("17"); //Releases CTRL key
//					    Thread.sleep(1000);
//
//					    session().keyDownNative("17"); // Stands for CTRL key
//					    session().keyPressNative("67"); // Stands for C "ascii code for C"
//					    session().keyUpNative("17"); //Releases CTRL key
//
//					    TextTransfer textTransfer = new TextTransfer();
//					    assertTrue(textTransfer.getClipboardContents().contains("Some text in my pdf"));
//					}
				 
			 }
			 
			 
			 
			
			 
			 
			 
			 
			 
			 
			 
			 
			 
			 
			 
			 
			 
			 
			 
			 
			 
			 
			 
			 
}