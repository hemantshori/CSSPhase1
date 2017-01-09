package runnerAndSteps;


import org.junit.runner.RunWith;

import cucumber.api.CucumberOptions;
import cucumber.api.junit.Cucumber;

// This is Runner and the tests will be run from here......Right click and Run as Junit tests
@RunWith(Cucumber.class)
@CucumberOptions

// ************************************** CSS Portal as on 17/10/2016
// OCT***********************************

(format = { "pretty", "html:target/html/result.html" },  tags = {"@tss_test"},
    //*********************for SHAKE	OUT*************************************
	//	 features = "src/test/resource/com/CSS/SanityTestScript.feature") 
		
    //****************for Regression****************************
	// features = "src/test/resource/com/TSS/Regression_TSS.feature")

//****************for TSS Regression****************************
   features = "src/test/resource/com/TSS/wip.feature") 

		
  

public class TSSRunnerTest {

}
