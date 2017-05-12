package runnerAndSteps;


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
(format = { "pretty", "html:target/html/result.html" },  tags = {"@TSSRegression"},
//(format = { "pretty", "html:target/html/result.html" },  tags = {"@current"},
    //*********************for SHAKE	OUT*************************************
	//	 features = "src/test/resource/com/CSS/SanityTestScript.feature") 



		
//****************for wip****************************
 //features = "src/test/resource/com/TSS/wip.feature")
 //features = "src/test/resource/com/TSS/wip.feature")




    //****************for Regression****************************
	 //features = "src/test/resource/com/TSS/wip.feature")

// features = "src/test/resource/com/TSS/TSS_Phase1-1_Iteration2.feature")
//features = "src/test/resource/old/TSS_Phase1-1_Iteration1.feature")







//****************for TSS Regression****************************
features = "src/test/resource/com/TSS/Regression_TSS.feature")






//****************for PRODUCTION Regression****************************
//features = "src/test/resource/com/TSS/Production_Regression_TSS.feature") 
//features = "src/test/resource/com/TSS/Production_Regression_TSS_Phase1-1.feature") 	
//features = "src/test/resource/com/TSS/Production_Regression_temp.feature") 	

public class TSSRunnerTest {
	
}
