package runnerAndSteps;

/* FOR LOCAL WORK ONLY */

import org.junit.runner.RunWith;

import cucumber.api.CucumberOptions;
import cucumber.api.junit.Cucumber;

// This is Runner and the tests will be run from here......Right click and Run as Junit tests
@RunWith(Cucumber.class)
@CucumberOptions

// ************************************** CSS Portal as on 17/10/2016
// OCT***********************************

//(format = { "pretty", "html:target/html/result.html" },  tags = {"@all"},
//(format = { "pretty", "html:target/html/result.html" },  tags = {"@runthrough"},
//(format = { "pretty", "html:target/html/result.html" },  tags = {"@TSS_Regression_Prod"},
//(format = { "pretty", "html:target/html/result.html" },  tags = {"@TSSRegression"},
//(format = { "pretty", "html:target/html/result.html" },  tags = {"@current"},
(format = { "pretty", "html:target/html/result.html" },  tags = {"@wip"},
//(format = { "pretty", "html:target/html/result.html" },  tags = {"@shakeout"},
    //*********************for SHAKE	OUT*************************************
	//	 featuresf = "src/test/resource/com/CSS/SanityTestScript.feature") 

//features = "src/test/resource/com/WCAG/WCAG.feature") 

		
//****************for wip****************************
features = "src/test/resource/com/TSS/wip.feature")
//features = "src/test/resource/com/TSS/ShakeoutTest.feature")


//****************for TSS Regression****************************
//features = "src/test/resource/com/TSS/Regression_TSS.feature")






//****************for PRODUCTION Regression****************************
//features = "src/test/resource/com/TSS/Production_Regression_TSS.feature") 
//features = "src/test/resource/com/TSS/Production_Regression_TSS_Phase1-1.feature") 	
//features = "src/test/resource/com/TSS/Production_Regression_temp.feature") 	


//features = "src/test/resource/com/TSS/MISSING_ACTRO.feature")

public class TSSRunnerLocal {
	
}
