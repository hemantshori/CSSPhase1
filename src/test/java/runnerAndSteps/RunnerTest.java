package runnerAndSteps;

import org.junit.runner.RunWith;

import cucumber.api.CucumberOptions;
import cucumber.api.junit.Cucumber;

// This is Runner and the tests will be run from here......Right click and Run as Junit tests
@RunWith(Cucumber.class)
@CucumberOptions

// ************************************** CSS Portal as on 17/10/2016
// OCT***********************************

(format = { "pretty", "html:target/html/result.html" },  tags = {"@Regression"},
    //*********************for SHAKEOUT*************************************
		// features = "src/test/resource/SanityTestScript.feature") 
		
    //****************for Regression****************************
		 features = "src/test/resource/RegressionTests.feature") 
		
    //********************for wip********************************
	//	features = "src/test/resource/wip.feature") /// wip

// ************************************** Admin
// Portal***********************************
// features = "src/test/resource/UAP.feature")

// ****************************************************************************************

public class RunnerTest {

}
