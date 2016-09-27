package reporting.com.HTMLReports;

import java.util.List;

import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.PageFactory;

import cucumber.api.DataTable;


public class EditSettingsPage extends DBUtilities{

	public EditSettingsPage(WebDriver dr) {
		super(dr);
	
	}


	WebDriver driver = null;

	


//	public void enterFirstName(DataTable table) throws InterruptedException
//	{
//	
//		List<List<String>> data = table.raw();
//		//nameField.sendKeys(data.get(1).get(1));
//		DBUtilities createXpath = new DBUtilities(driver);
//	  String myXpath = createXpath.xpathMakerByInputId(data.get(1).get(0));
//	  driver.findElement(By.xpath(myXpath)).clear();
//	  driver.findElement(By.xpath(myXpath)).sendKeys(data.get(1).get(1));
//			  
//	 
//	 
//		
//	
//	}
//	
//	public void enterLastName (DataTable table) throws InterruptedException
//	{
//		List<List<String>> data = table.raw();
//		//nameField.sendKeys(data.get(1).get(1));
//		DBUtilities createXpath = new DBUtilities(driver);
//	  String myXpath = createXpath.xpathMakerByInputId(data.get(2).get(0));
//	  driver.findElement(By.xpath(myXpath)).clear();
//	  driver.findElement(By.xpath(myXpath)).sendKeys(data.get(2).get(1));
//	}
//	
//	public void enterEmail (DataTable table) throws InterruptedException
//	{
//		List<List<String>> data = table.raw();
//		//nameField.sendKeys(data.get(1).get(1));
//		DBUtilities createXpath = new DBUtilities(driver);
//	  String myXpath = createXpath.xpathMakerByInputId(data.get(3).get(0));
//	  driver.findElement(By.xpath(myXpath)).clear();
//	  driver.findElement(By.xpath(myXpath)).sendKeys(data.get(3).get(1));
//	}
}
