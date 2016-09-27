package reporting.com.HTMLReports;

import java.util.List;

import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;

import cucumber.api.DataTable;

public class BillingHistoryPage extends DBUtilities {



	
	
	public BillingHistoryPage(WebDriver dr) {
		super(dr);
		
	}


	
	
	public void checkElementPresentOnScreen(DataTable table) throws InterruptedException
	{
		List<List<String>> data = table.raw();
		System.out.println(" value is ++" +data);
		for (int i = 1; i <data.size(); i++){
			Thread.sleep(1000);
			String name = data.get(i).get(1);
			System.out.println(" and the name is+++++" +name);
			if(name.equals("CurrBill")||name.equals("Pay")){
				Thread.sleep(3000);
				DBUtilities createXpath = new DBUtilities(driver);
				String myxpath = createXpath.xpathMakerById(name);
				System.out.println(" and the name is++++++++++++++++" +myxpath);
				Assert.assertTrue(driver.findElement(By.xpath(myxpath)).isDisplayed());
			
			}else {
			DBUtilities createXpath = new DBUtilities(driver);
			String myxpath = createXpath.xpathMaker(name);
			System.out.println("**" +myxpath);
			Assert.assertTrue(driver.findElement(By.xpath(myxpath)).isDisplayed());
		
			if(driver.findElements(By.xpath(myxpath)).size() != 0){
				System.out.println("Element is Present");
				}else{
				System.out.println("Element is Absent");
				}
			}
		}
	
	}

      public void checkUIElementIsDisplayed (String arg1) throws InterruptedException
    	  {
    	  DBUtilities checkElementDisplayed = new DBUtilities(driver);
    	  String myxpath=checkElementDisplayed.xpathMakerBySpanID(arg1);
    	  System.out.println("**" +myxpath);
		  Assert.assertTrue(driver.findElement(By.xpath(myxpath)).isDisplayed());
		
    	  if(driver.findElements(By.xpath(myxpath)).size() != 0){
				System.out.println("Element is Present");
				}else{
				System.out.println("Element is Absent");
				}
		}
      
      public void checkUIElementTEXTIsDisplayed (String arg1) throws InterruptedException
	  {
	  DBUtilities checkElementDisplayed = new DBUtilities(driver);
	  String myxpath=checkElementDisplayed.xpathMaker(arg1);
	  System.out.println("**" +myxpath);
	  Assert.assertTrue(driver.findElement(By.xpath(myxpath)).isDisplayed());

	  if(driver.findElements(By.xpath(myxpath)).size() != 0){
			System.out.println("Element is Present");
			}else{
			System.out.println("Element is Absent");
			}
	}
      	
	
}
