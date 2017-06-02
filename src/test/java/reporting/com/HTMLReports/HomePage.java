package reporting.com.HTMLReports;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;


public class HomePage extends DBUtilities {


	public HomePage(WebDriver dr) {
		super(dr);
		
	}

	public void navigateTo(String arg1)  {
		if(arg1.equals("USS")){
			
			//************************************** SET  TEST Environment ***********************************************
			//for production
		//driver.get("https://ssc.dbresults.com.au/USSPortal");
		//following is for SIT
			driver.get("https://dev2-ssc.dbresults.com.au/USSPortal/");
		// for dev
		//driver.get("https://dev-ssc.dbresults.com.au/USSPortal/");
			// for p10
		//driver.get("https://dbresults-p10-dev.outsystemscloud.com/USSPortal");
        
        //****************************************************************************************************************
		}
		else if(arg1.equals("USS2")){
			driver.get("https://dev2-ssc.dbresults.com.au/USSPortal/Login.aspx");
		}
		else if(arg1.equals("TSS")){
			//driver.get("https://dev2-ssc.dbresults.com.au/TSSPortal/Homepage.aspx");
			driver.get("http://dev2-ssc.dbresults.com.au/TSSPortal/Homepage.aspx");
		}
		 
		else if(arg1.equals("TSSUAP")){
			driver.get("https://dev2-ssc.dbresults.com.au/TSSAdminPortal");
		}

		else if(arg1.equals("TSS_Tooltips")){
			driver.get("https://dev2-ssc.dbresults.com.au/SS_Admin/Tooltips.aspx");
		}
		

		else if(arg1.equals("Production")){
			driver.get("https://ssc.dbresults.com.au/TSSPortal/");
		}
		else if (arg1.equals("Production_Tooltips")){
			driver.get("https://ssc.dbresults.com.au/SS_Admin/Tooltips.aspx");
		}
		else if(arg1.equals("TSSDev")){
			driver.get("https://dev-ssc.dbresults.com.au/TSSPortal/Homepage.aspx");
		}
		else if(arg1.equals("Tax_Registration")){
			driver.get("https://dev2-ssc.dbresults.com.au/Registration/TaxRegistration_Step1_Form.aspx");
		}
		
		else if(arg1.equals("Production_Tax_Registration")){
			driver.get("https://ssc.dbresults.com.au/Registration/TaxRegistration_Step1_Form.aspx");
		}
		else if(arg1.equals("Tax_Registration_Delete")){
			driver.get("https://dev2-ssc.dbresults.com.au/RegistrationCore/DeleteRegistrationData.aspx");
		}
		else if(arg1.equals("MessageEdit")){
			driver.get("https://dev2-ssc.dbresults.com.au/SS_Admin/FeedbackMsgTexts.aspx");
		}
		else if(arg1.equals("Production_MessageEdit")){
			driver.get("https://ssc.dbresults.com.au/SS_Admin/FeedbackMsgTexts.aspx");
		}
		else if(arg1.equals("PageTexts")){
			driver.get("https://dev2-ssc.dbresults.com.au/SS_Admin/PageTexts.aspx");
		}
		else if(arg1.equals("Production_PageTexts")){
			driver.get("https://ssc.dbresults.com.au/SS_Admin/PageTexts.aspx");
		}
		else if(arg1.equals("ExpiredPassword")){
			driver.get("https://dev2-ssc.dbresults.com.au/SSAccountMgmt/ChangePassword.aspx?Token=3b787893-fc4e-43e7-a2d3-deba8fd3fe00");
		}
		else if(arg1.equals("InvalidPasswordLink")){
			driver.get("https://dev2-ssc.dbresults.com.au/TSSAdmin/PageTextasdfafdss.aspx");
		}
		else if(arg1.equals("ExpiredActivation")){
			driver.get("https://dev2-ssc.dbresults.com.au/SS_AccountMgmtCommon/ActivateAccount.aspx?Token=aff21ece-9f23-43c9-818f-7964436791ef");
		}
		else if(arg1.equals("InvalidActivation")){
			driver.get("https://dev2-ssc.dbresults.com.au/SS_AccountMgmtCommon/ActivateAccountasdfasdf.aspx?Token=aff21ece-9f23-43c9-818f-7964436791ef");

		}
		else if(arg1.equals("UAP")){
			driver.get("https://dev2-ssc.dbresults.com.au/USSAdminPortal/");
		}
	    else if(arg1.equals("copyFromMail")){           // this is for semi-automated tests as the link will be coming from the received mail
        //following is for SIT
	    	driver.get("https://dbresults-tst.outsystemsenterprise.com/AccountMgmt/ResetPassword.aspx?Token=8d47cdf4-c3cd-4901-b4c8-fda94a1e59e0");
	    }
	    else if (arg1.equals("Change Password Page")){
	    	driver.get("https://dbresults-tst.outsystemsenterprise.com/AccountMgmt/ResetPassword.aspx?Token=bf138cb5-7b10-43ac-9610-5775e29e5fe1");
	    }
	    else if (arg1.equals("StyleGuideConfig")){
	    	driver.get("https://dev2-ssc.dbresults.com.au/SS_Admin/StyleGuideConfigs.aspx");
	    }
	    else if (arg1.equals("Production_StyleGuideConfig")){
	    	driver.get("https://ssc.dbresults.com.au/SS_Admin/StyleGuideConfigs.aspx");
	    }
	    else if (arg1.equals("AccountManagement")){
			driver.get("https://dev2-ssc.dbresults.com.au/TSSAccountMgmt/Settings.aspx");
	    }
		else if(arg1.equals("AC CHECKER")){
			driver.get("http://achecker.ca/checker/index.php");
		}
		else if (arg1.equals("RegistrationLinkTable")){
			driver.get("https://dev2-ssc.dbresults.com.au/TSSAccountMgmtCore/ActivationLinks.aspx");
		}
		else {
	    	driver.get("http://stackoverflow.com/questions/3422262/take-a-screenshot-with-selenium-webdriver");
	    }
		

		System.out.println("********************************************************************"
		+ "************************TESTING "+arg1+"*****************************************************");
	}
	
	
	
	
}










































//package reporting.com.HTMLReports;
//
//import org.openqa.selenium.By;
//import org.openqa.selenium.WebDriver;
//
//
//public class HomePage extends DBUtilities {
//
//
//	public HomePage(WebDriver dr) {
//		super(dr);
//		
//	}
//
//	public void navigateTo(String arg1)  {
//		if(arg1.equals("USS")){
//			
//			//************************************** SET  TEST Environment ***********************************************
//			//for production
//		//driver.get("https://ssc.dbresults.com.au/USSPortal");
//		//following is for SIT
//			driver.get("https://dev2-ssc.dbresults.com.au/USSPortal/");
//		// for dev
//		//driver.get("https://dev-ssc.dbresults.com.au/USSPortal/");
//			// for p10
//		//driver.get("https://dbresults-p10-dev.outsystemscloud.com/USSPortal");
//        
//        //****************************************************************************************************************
//		}else if(arg1.equals("USS2")){driver.get("https://dev2-ssc.dbresults.com.au/USSPortal/Login.aspx");
//		}else if(arg1.equals("TSS")){driver.get("https://dev2-ssc.dbresults.com.au/TSSPortal/Home.aspx");
//		}else if(arg1.equals("TSSDev")){driver.get("https://dev-ssc.dbresults.com.au/TSSPortal/Home.aspx");
//		}else if(arg1.equals("Tax_Registration")){driver.get("https://dev2-ssc.dbresults.com.au/Registration/TaxRegistration_Step1_Form.aspx");
//		}else if(arg1.equals("Tax_Registration_Delete")){driver.get("https://dev2-ssc.dbresults.com.au/RegistrationCore/DeleteRegistrationData.aspx");
//		}else if(arg1.equals("MessageEdit")){driver.get("https://dev2-ssc.dbresults.com.au/SS_Admin_Core/FeedbackMsgTexts.aspx");
//		}else if(arg1.equals("PageTexts")){driver.get("https://dev2-ssc.dbresults.com.au/TSSAdmin/PageTexts.aspx");
//		}else if(arg1.equals("AC CHECKER")){driver.get("http://achecker.ca/checker/index.php");
//		}else if(arg1.equals("UAP")){
//			
//				driver.get("https://dev2-ssc.dbresults.com.au/utilityadminportal/");
//				//following is for SIT
//		      //  driver.get("https://dbresults-tst.outsystemsenterprise.com/UtilityAdminPortal/Home.aspx");
//				// for dev
//				//driver.get("https://dbresults-dev.outsystemsenterprise.com/UtilityAdminPortal/Home.aspx");
//				}
//	     else if(arg1.equals("copyFromMail")){           // this is for semi-automated tests as the link will be coming from the received mail
//        //following is for SIT
//   driver.get("https://dbresults-tst.outsystemsenterprise.com/AccountMgmt/ResetPassword.aspx?Token=8d47cdf4-c3cd-4901-b4c8-fda94a1e59e0");
// }
//
//		if(arg1.equals("Change Password Page")){
//			driver.get("https://dbresults-tst.outsystemsenterprise.com/AccountMgmt/ResetPassword.aspx?Token=bf138cb5-7b10-43ac-9610-5775e29e5fe1");
//		}
//			
//		System.out.println("********************************************************************"
//			
//				+ "************************TESTING "+arg1+"*****************************************************");
//	}
//	
//	
//	
//	
//}
