package reporting.com.HTMLReports;

import org.openqa.selenium.WebDriver;

public class XPathGenerator {

	 WebDriver driver = null;

	//constructor
	 public XPathGenerator (WebDriver dr){
			this.driver = dr;
			}
	 
	 // generic xpath creator for multiple identifiers. Currently only supports id, class and text
	 public String multipleConditionXpath(String[] specifiers, String[] arguments) throws Exception{
		StringBuilder strb = new StringBuilder();
		
		if (specifiers.length != arguments.length){
			throw new Exception();
		}
		
		for (int i = 0; i< specifiers.length; i++){
			String addition;
			System.out.println(specifiers[i]);
			if (specifiers[i].equals("id")){
				addition = xpathMakerById(arguments[i]);
			}
			else if (specifiers[i].equals("class")){
				addition = xpathMakerByClass(arguments[i]);
			}
			else {
				addition = xpathMakerContainsText(arguments[i]);
			}
			
			if (i != 0){
				
				// to remove the preceeding characters for identifiers after the first one
				// change this if the standard for the other xpath creator functions change
				addition = addition.substring(3);
				
			}
			
			strb.append(addition);
			
		}
		System.out.println(strb.toString());
		return strb.toString();
		 
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

	 
	 //xpath creation by ClassName
	 public String xpathMakerByTextInClass(String text)
	    {
		String xpath = "//*[contains(@class, '"+text+"')]";
		
		 return xpath;
	    }
	 
	 public String xpathMakerById1AndId2(String arg1,String arg2)
	    {
		String xpath = "//*[contains(@id, '"+arg1+"')][contains(@id, '"+arg2+"')]";
		
		System.out.println(" its " +xpath);
		 return xpath;
	    }
	 
	 public String xpathMakerByValue(String arg1)
	    {
		String xpath = "//*[contains(@value, '"+arg1+"')]";
		 return xpath;
	    }
	
}
