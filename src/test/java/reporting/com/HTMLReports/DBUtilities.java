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
	 	  
	// action performed on element(coming as arg)
	 	 public void actionPerformedClick (String arg1)
	 	 {
	 		System.out.println("Successfully displayed Link" +arg1 );
	 		 System.out.println("Clicking on " +arg1.toUpperCase());	 
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
			 Assert.assertEquals(arg1, newPageURL);
			 }
			 }
		 }
		 
	 
		 //********************* Check if on expected page***************************************
		 public void checkIfOnRightPage(String arg1)
			{
				System.out.println("****************Page Name*************************" +arg1);
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

			 
			 //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
			 //++++++++++++++++++++++++++++++++++ XPATH GENERATOR++++++++++++++++++++++++++++++++++++++++
			//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//			 
//			 public String xpathMaker(String buttonName)
//			    {
//				String xpath = "//*[text()='"+buttonName+"']";
//				 return xpath;
//			    }
//			 public String xpathMakerById(String buttonName)
//			    {
//				String xpath = "//*[contains(@id, '"+buttonName+"')]";
//				System.out.println("Button found*** " +xpath);
//				 return xpath;
//			    }
//			 public String xpathMakerForInputField(String fieldName)
//			    {
//				String xpath = "//*[@id='"+fieldName+"']";
//				System.out.println(" its " +xpath);
//				 return xpath;
//			    }
//			 public String xpathMakerBySpanID(String buttonName)
//			    {
//				String xpath = "//span[text()='"+buttonName+"']";
//				 //contains(text()
//						 //String xpath = "//span[contains(text()='"+buttonName+"']";
//				            
//				 return xpath;
//			    }
//			 public String xpathMakerContainsText(String buttonName)
//			    {
//				String xpath = "//*[contains(text(),'"+buttonName+"')]";
//				 return xpath;
//			    }
//			//span[@class='nav-selection']
//			 public String xpathMakerSpanClass(String buttonName)
//			    {
//				String xpath = "//span[@class='"+buttonName+"']";
//				 return xpath;
//			    }
//			 // for input fields with input id
//			 public String xpathMakerByInputId(String arg1)
//			    {
//				  String xpath = "//input[contains(@id, '"+arg1+"')]";
//				System.out.println("Element found*** " +xpath);
//				 return xpath;
//			    }
//			 public String xpathMakerByClass(String buttonName)
//			    {
//				//*[@class = 'InfoTooltip OSInline']
//				String xpath = "//*[@class ='"+buttonName+"']";
//				 return xpath;
//			    }
//			 
//			 //xpath creation by type
//			 public String xpathMakerByType(String name)
//			    {
//				String xpath = "//*[@type ='"+name+"']";
//				 return xpath;
//			    }
			 
			 
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
			 
			 public void enterCucumbertableValuesInUI (DataTable table) 
			 {

					
						List<List<String>> data = table.raw();
						
						for (int i = 1; i <data.size(); i++){
							String name = data.get(i).get(1);
							System.out.println(i);
							
						DBUtilities createXpath = new DBUtilities(driver);
					  String myXpath = createXpath.xpathMakerByInputId(data.get(i).get(0));
					  driver.findElement(By.xpath(myXpath)).clear();
					  
					  driver.findElement(By.xpath(myXpath)).sendKeys(data.get(i).get(1));
							  
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
				 Assert.assertTrue(arg1, popUpMessage.equals(arg1));
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
			 
		
			 
			 
			 
			 
			 
			 
			 
			 
			 
			 
			 
			 
			 
			 
			 
			 
			 
			 
			 
			 
			 
			 
}