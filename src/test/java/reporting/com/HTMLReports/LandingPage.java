package reporting.com.HTMLReports;

import java.util.List;

import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.Select;

import cucumber.api.DataTable;

public class LandingPage extends DBUtilities {


	public LandingPage(WebDriver dr) {
		super(dr);
	
	}



/* following need to be used carefully as we are calling xpaths based on ......HS(i know its getting complex)
  how they are designed in code
	they could be by id, by name, or by span id.
*/
	public void checkElementPresentOnScreen(DataTable table) throws InterruptedException
	{
		
		List<List<String>> data = table.raw();
		System.out.println(" value is ++" +data);
		for (int i = 1; i <data.size(); i++) {
			Thread.sleep(3000);
			String name = data.get(i).get(1);
			System.out.println(" and the name is+++++" +name);
			if(name.equals("Current_Bill")
					||name.equals("Pay")
					||name.equals("Submit")
					||name.equals("Cancel")
					||name.equals("Date")
					||name.equals("Activity")
					||name.equals("Description")
					||name.equals("Counter")
					||name.equals("Type")
					||name.equals("SaveAndExit")
					||name.equals("Next")
					||name.equals("Save")
					||name.equals("Amount")
					||name.equals("wtACTWagesPaidBackBt")
					){
				Thread.sleep(3000);
				//DBUtilities createXpath = new DBUtilities(driver);
				//String myxpath = createXpath.xpathMakerById(name);
				String myxpath =	new DBUtilities(driver).xpathMakerById(name);
				System.out.println(" and element............" +myxpath + "is displayed successfully");
				Assert.assertTrue(" Varification failede as " +myxpath +"NOT FOUND",driver.findElement(By.xpath(myxpath)).isDisplayed());
				
			} 
			else if(name.equals("Logo")||name.equals("Logo on main page")){
				// verify image on home screen
				Assert.assertTrue(driver.findElement(By.xpath("//img[contains(@src, 'png')]")).isDisplayed());
				//Assert.assertTrue(driver.findElement(By.xpath("//img[contains(@src, 'Logo_Large.png')]")).isDisplayed());
			} 
			else if(name.equals("Due Date")||name.equals("Account Total")){
				String myxpath = new DBUtilities(driver).xpathMakerBySpanID(name);
				System.out.println(" and the name is++++++++++++++++" +myxpath);
				Assert.assertTrue(" Varification failede as " +myxpath +"NOT FOUND",driver.findElement(By.xpath(myxpath)).isDisplayed());
				
			}
			else {	
//			DBUtilities createXpath = new DBUtilities(driver);
//			String myxpath = createXpath.xpathMaker(name);
				String myxpath = new DBUtilities(driver).xpathMakerContainsText(name);
				System.out.println("*checking for*  " +myxpath); 
//				if(driver.findElements(By.xpath(myxpath)).size() != 0){
//					System.out.println("Element is Present");
//				}	
//				else {
//					System.out.println("Element is Absent");
//				}
				Thread.sleep(2000);
				Assert.assertTrue(" Varification failede as " +myxpath +"NOT FOUND",driver.findElement(By.xpath(myxpath)).isDisplayed());
				
			}
		}
	
	}

   public void checkUIElementIsDisplayed (String arg1) throws InterruptedException {
    	//  if (arg1.equals("Please wait while we retrieve your account...")|| arg1.equals("Please contact Simply Energy on 13 88 08 to set up your Direct Debit")){
	   String myxpath = "";
	   if (arg1.equals("highcharts-tracker")){
		   DBUtilities checkElementDisplayed = new DBUtilities(driver);
		   myxpath=checkElementDisplayed.xpathMakerByClass(arg1);
		   Assert.assertTrue(driver.findElement(By.xpath(myxpath)).isDisplayed());    
		   System.out.println("Element " +arg1 +" is displayed as expected");
    	  }
	   else{
		   DBUtilities checkElementDisplayed = new DBUtilities(driver);
		   myxpath=checkElementDisplayed.xpathMakerBySpanID(arg1);
		   System.out.println("**" +myxpath);
		   Thread.sleep(2000);
		   try {
			   Assert.assertTrue(" Varification failed as " +myxpath +"NOT FOUND",driver.findElement(By.xpath(myxpath)).isDisplayed());
		   }
		   catch (AssertionError | Exception e){
			    myxpath=checkElementDisplayed.xpathMakerById(arg1);
				for (int i = 0; i < 10; i++){
					System.out.println("(" + myxpath + ")[" + i + "]");
					try {
						 Assert.assertTrue(" Varification failed as " +"(" + myxpath + ")[" + i + "]" +"NOT FOUND",driver.findElement(By.xpath(myxpath)).isDisplayed());
						break;
					}
					catch (Exception e2){
						System.out.println();
					}
				}
				
			}
	   }
	   
	   if(driver.findElements(By.xpath(myxpath)).size() != 0){
			System.out.println("Element is Present"); 
	   }
	   else {
			System.out.println("Element is Absent");
	   }
}
    	
   	
      
      public void checkUIElementTEXTIsDisplayed (String arg1) throws InterruptedException {
		  DBUtilities checkElementDisplayed = new DBUtilities(driver);
		 //String myxpath=checkElementDisplayed.xpathMaker(arg1);
		  String myxpath = checkElementDisplayed.xpathMakerContainsText(arg1);                                // keep an eye...changed because of 520
		  System.out.println("checking for text " +myxpath);
	
	      driver.getPageSource().contains(arg1);
	      Assert.assertTrue(" Varification failed as " +arg1 +"NOT FOUND",driver.getPageSource().contains(arg1));
		//Assert.assertTrue(" Varification failed as " +myxpath +"NOT FOUND",driver.findElement(By.xpath(myxpath)).isDisplayed());
	
		if(driver.findElements(By.xpath(myxpath)).size() != 0){
			System.out.println("Element is Present");
		}
		else {
			System.out.println("Element is Absent");
		}
	}
      
      // following are for RHS colouns......
      
      public void selectDropdownValue(String arg1, String arg2) throws InterruptedException
      {
    	  try {
	    	  String myxpath= new DBUtilities(driver).xpathMakerContainsText(arg1);
	    	  driver.findElement(By.xpath(myxpath)).click();
	    	  
	    	  String myxpath2= new DBUtilities(driver).xpathMakerById(arg2);
	    	  myxpath2 = myxpath2.replace("*", "select");
	    	  System.out.println(myxpath2);
	    	  driver.findElement(By.xpath(myxpath2)).click();
    	  }
    	  catch (Exception e){
    		  String myxpath2= new DBUtilities(driver).xpathMakerById(arg2);
	    	  myxpath2 = myxpath2.replace("*", "select");
	    	  System.out.println(myxpath2);
	    	  driver.findElement(By.xpath(myxpath2)).click();
	    	  
	    	  String myxpath= new DBUtilities(driver).xpathMakerContainsText(arg1);
	    	  driver.findElement(By.xpath(myxpath)).click();
	    	  
    	  }
    	  
    	  
//    	  DBUtilities createXpath = new DBUtilities(driver);
//    		String myxpath = createXpath.xpathMakerById(arg1);     // disabled
//    	  //String myxpath = createXpath.xpathMakerContainsText(arg1);
//    		driver.findElement(By.xpath(myxpath)).click();     // to click dropdown box
//    		//String myxpath2 = createXpath.xpathMakerById(arg1);
//    		//String myxpath2 = createXpath.xpathMaker(arg1);
//    		String myxpath2 = createXpath.xpathMakerContainsText(arg2);
//    		driver.findElement(By.xpath(myxpath2)).click();  
//    		driver.findElement(By.xpath(myxpath2)).click(); // to select dropdown value
//    		Thread.sleep(1000);
      }
      
      
      // checks high and lower values and verify that the correct result is displayed in correct format
      public void compareValueOneToValueTwo(String arg1, String arg2){
    	  
    	  
    	  DBUtilities createXpath = new DBUtilities(driver);
    		String myxpath = createXpath.xpathMakerById(arg1);
    		String currentBill = driver.findElement(By.xpath(myxpath)).getText();
    	
    		
    		String myxpath2 = createXpath.xpathMakerById(arg2);
    		String lastBill = driver.findElement(By.xpath(myxpath2)).getText();
    		System.out.println(lastBill);
    		
    	
    		String newCurrentBill = currentBill.replaceAll("[^\\d.]+", "");
    		//System.out.println(" its "+newCurrentBill);
    		double intnewCurrentBill = Double.parseDouble(newCurrentBill);
    		System.out.println(" its**************************** "+intnewCurrentBill);
    		String newLastBill = lastBill.replaceAll("[^\\d.]+", "");
    		//System.out.println(" its "+newLastBill);
    		double intnewLastBill = Double.parseDouble(newLastBill);
    		System.out.println(" its*********************** "+intnewLastBill);
    		
    		
    		
    		
    		//if val1<val2
    		if (intnewCurrentBill<intnewLastBill){
    			DBUtilities createXpath3 = new DBUtilities(driver);
        		String myxpath3 = createXpath3.xpathMakerSpanClass("fa fa-fw fa-caret-down");
        	 //driver.findElement(By.xpath(myxpath3)).getText();
        	 Assert.assertTrue(driver.findElement(By.xpath(myxpath3)).isDisplayed());
        	 
    			System.out.println("*******************it should be greeen and arrow is pointing down**************");
    		}else if(intnewCurrentBill>intnewLastBill){
    			System.out.println("*****************it should be red and arrow is pointing up*****************");
    			DBUtilities createXpath4 = new DBUtilities(driver);
        		String myxpath4 = createXpath4.xpathMakerSpanClass("fa fa-fw fa-caret-up");
        		Assert.assertTrue(driver.findElement(By.xpath(myxpath4)).isDisplayed());
	
    		}
	
      }



	public void selectSAsFromCorousel(String arg1) {
		
		String myxpath = new DBUtilities(driver).xpathMakerById(arg1);
		//String howManySAsInCorousel = myxpath
		//Select listSAa = new Select(driver.findElement(By.xpath(myxpath)));
		System.out.println(myxpath);
	  List<WebElement> mylist =   driver.findElements(By.xpath(myxpath));
			  for(int i=0; i<mylist.size(); i++)
			  {
			          System.out.println(i + mylist.get(i).getText());
			          
			  } 
		
	
	}



	
}
		
		

	
	
