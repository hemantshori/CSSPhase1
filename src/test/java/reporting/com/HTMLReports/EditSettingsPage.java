package reporting.com.HTMLReports;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.PageFactory;

import cucumber.api.DataTable;


public class EditSettingsPage extends DBUtilities{

	public final static String MONTH_FULL_REGEX = "January|February|March|April|May|June|July|August|September|October|November|December";
	public final static String MONTH_SMALL_REGEX = "Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec";
	public final static String MONTH_FULL_WORD = "MONTH";
	public final static String MONTH_SMALL_WORD = "MON";
	
	public EditSettingsPage(WebDriver dr) {
		super(dr);
	
	}

//
//	WebDriver driver = null;
	public void checkDatePattern(String arg1, String arg2) throws AssertionError{
		StringBuilder strb = new StringBuilder();
		String temp;
		String finalRegex;
		String patternPart;
		Pattern pattern = Pattern.compile("D{2,4}+|Y{2,4}+|M{2,4}+|MONTH|MON");
		Matcher matcher = pattern.matcher(arg2);
		System.out.println(arg1 + ", " + arg2);
		while (matcher.find()) {
			patternPart = matcher.group();
		
			// parse the initial pattern into something that can be understood by the java regex
			if (patternPart.equals(MONTH_FULL_WORD) || patternPart.equals(MONTH_FULL_WORD.toLowerCase())){
				temp = "(";
				temp += MONTH_FULL_REGEX;
				temp += ")";
			}
			else if (patternPart.equals(MONTH_SMALL_WORD) || patternPart.equals(MONTH_SMALL_WORD.toLowerCase())){
				temp = "(";
				temp += MONTH_SMALL_REGEX;
				temp += ")";
			}
			else {
				temp = "[0-9]{" + matcher.group().length() + "}"; 
			}
		    
		    strb.append(temp + " ");
		}
		
		// remove the last space
		strb.deleteCharAt(strb.length() - 1);
		
		finalRegex = strb.toString();
		//System.out.println(finalRegex);
		//System.out.println(arg1);
		Assert.assertTrue(arg1.matches(finalRegex));
		
		
	}

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
