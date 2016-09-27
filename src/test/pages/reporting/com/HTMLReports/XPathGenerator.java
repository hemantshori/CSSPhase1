package reporting.com.HTMLReports;

import org.openqa.selenium.WebDriver;

public class XPathGenerator {

	 WebDriver driver = null;

	//constructor
	 public XPathGenerator (WebDriver dr){
			this.driver = dr;
			}
	 
	
	 public String xpathMaker(String buttonName)
	    {
		String xpath = "//*[text()='"+buttonName+"']";
		 return xpath;
	    }
	 public String xpathMakerById(String buttonName)
	    {
		String xpath = "//*[contains(@id, '"+buttonName+"')]";
		System.out.println("Button found*** " +xpath);
		 return xpath;
	    }
	 public String xpathMakerForInputField(String fieldName)
	    {
		String xpath = "//*[@id='"+fieldName+"']";
		System.out.println(" its " +xpath);
		 return xpath;
	    }
	 public String xpathMakerBySpanID(String buttonName)
	    {
		String xpath = "//span[text()='"+buttonName+"']";
		 //contains(text()
				 //String xpath = "//span[contains(text()='"+buttonName+"']";
		            
		 return xpath;
	    }
	 public String xpathMakerContainsText(String buttonName)
	    {
		String xpath = "//*[contains(text(),'"+buttonName+"')]";
		 return xpath;
	    }
	//span[@class='nav-selection']
	 public String xpathMakerSpanClass(String buttonName)
	    {
		String xpath = "//span[@class='"+buttonName+"']";
		 return xpath;
	    }
	 // for input fields with input id
	 public String xpathMakerByInputId(String arg1)
	    {
		  String xpath = "//input[contains(@id, '"+arg1+"')]";
		System.out.println("Element found*** " +xpath);
		 return xpath;
	    }
	 public String xpathMakerByClass(String buttonName)
	    {
		//*[@class = 'InfoTooltip OSInline']
		String xpath = "//*[@class ='"+buttonName+"']";
		 return xpath;
	    }
	 
	 //xpath creation by type
	 public String xpathMakerByType(String name)
	    {
		String xpath = "//*[@type ='"+name+"']";
		 return xpath;
	    }

	
	
}
