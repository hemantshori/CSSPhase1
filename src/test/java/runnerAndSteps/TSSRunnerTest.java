package runnerAndSteps;


import org.junit.runner.RunWith;

import cucumber.api.CucumberOptions;
import cucumber.api.junit.Cucumber;

// This is Runner and the tests will be run from here......Right click and Run as Junit tests
@RunWith(Cucumber.class)
@CucumberOptions

// ************************************** CSS Portal as on 17/10/2016
// OCT***********************************

(format = { "pretty", "html:target/html/result.html" },  tags = {"@TSSRegression"},
    //*********************for SHAKE	OUT*************************************
	//	 features = "src/test/resource/com/CSS/SanityTestScript.feature") 
		
//****************for wip****************************
 //features = "src/test/resource/com/TSS/wip.feature")
    //****************for Regression****************************
	 features = "src/test/resource/com/TSS/Regression_TSS.feature")

//****************for TSS Regression****************************
   //features = "src/test/resource/com/TSS/TANG_TSSPhase2.feature") 


//****************for PRODUCTION Regression****************************
//features = "src/test/resource/com/TSS/Production_Regression_TSS.feature") 
		
  

public class TSSRunnerTest {
	
}
