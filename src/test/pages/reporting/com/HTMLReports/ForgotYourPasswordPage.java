package reporting.com.HTMLReports;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;

public class ForgotYourPasswordPage extends DBUtilities {
	public ForgotYourPasswordPage(WebDriver dr) {
		super(dr);
		
	}

	public void checkBoxClick(String arg1){
	 DBUtilities createXpath = new DBUtilities(driver);
	String myxpath =  createXpath.xpathMakerByType(arg1);
     driver.findElement(By.xpath(myxpath)).click();
	 
	}
}
