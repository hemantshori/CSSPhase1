package reporting.com.HTMLReports;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;


public class HomePage extends DBUtilities {


	public HomePage(WebDriver dr) {
		super(dr);
		
	}

	public void navigateTo(String arg1)  {
		if(arg1.equals("CSS")){
			
			//************************************** SET  TEST Environment ***********************************************
			
		//driver.get("https://dbresults.outsystemsenterprise.com/CSSPortal/");
		//following is for SIT

			driver.get("https://test-ssc.dbresults.com.au/CSSPortal/");
		// for dev
		//driver.get("https://dev-ssc.dbresults.com.au/CSSPortal/");
        
        //****************************************************************************************************************
		}else if(arg1.equals("CSS2")){driver.get("https://dbresults-tst.outsystemsenterprise.com/CSSPortal/LoginPage.aspx");
		}else if(arg1.equals("UAP")){
			
				//driver.get("https://dbresults.outsystemsenterprise.com/UtilityAdminPortal/Home.aspx");
				//following is for SIT
		        driver.get("https://dbresults-tst.outsystemsenterprise.com/UtilityAdminPortal/Home.aspx");
				// for dev
				//driver.get("https://dbresults-dev.outsystemsenterprise.com/UtilityAdminPortal/Home.aspx");
				}
	     else if(arg1.equals("copyFromMail")){
        //following is for SIT
   driver.get("https://dbresults-tst.outsystemsenterprise.com/AccountMgmt/ResetPassword.aspx?Token=8d47cdf4-c3cd-4901-b4c8-fda94a1e59e0");
 }

		if(arg1.equals("Change Password Page")){
			driver.get("https://dbresults-tst.outsystemsenterprise.com/AccountMgmt/ResetPassword.aspx?Token=bf138cb5-7b10-43ac-9610-5775e29e5fe1");
		}
			
		
	}
	
	
}
