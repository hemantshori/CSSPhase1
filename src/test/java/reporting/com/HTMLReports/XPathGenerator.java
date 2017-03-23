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
		System.out.println("xpath ::*** " +xpath);
		 return xpath;
	    }

	 public String xpathMakerByExactId(String buttonName)
	    {
		String xpath = "//*[@id='"+buttonName+"']";
		System.out.println("xpath ::*** " +xpath);
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
	 public String xpathMakerByLabelAndId(String buttonName) {
			String xpath = "//label[contains(@id, '"+buttonName+"')]";
			System.out.println("xpath ::*** " +xpath);
			return xpath;
	 }
	 public String xpathMakerBySpanAndId(String buttonName) {
			String xpath = "//span[contains(@id, '"+buttonName+"')]";
			System.out.println("xpath ::*** " +xpath);
			return xpath;
	 } 
	 
	 
	 public String xpathMakerContainsText(String buttonName)
	    {
		//String xpath = "//*[contains(text(),"\"+buttonName+"")]";
		String xpath = String.format("//*[contains(text(), \"%s\")]", buttonName);
		 return xpath;
	    }
	//span[@class='nav-selection']
	 public String xpathMakerBySpanAndClass(String buttonName) {
			String xpath = "//span[contains(@class, '"+buttonName+"')]";
			System.out.println("xpath ::*** " +xpath);
			return xpath;
	 } 
	 
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
	 public String xpathMakerByTextAreaId(String arg1)
	    {
		  String xpath = "//textarea[contains(@id, '"+arg1+"')]";
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
	 public String xpathMakerContainsCustomField(String arg1, String arg2){
		 String xpath = "//*[contains(@" + arg1 + ", '"+arg2+"')]";
		 System.out.println(" its " +xpath);
		 return xpath;
	 }
	 
	 public String xpathMakerByValue(String arg1){
		 String xpath = "//*[@value ='"+arg1+"']";
		 System.out.println(" xpath " +xpath);
		 return xpath;
	 }
	
	 
	 public String combine2Xpaths (String arg1, String arg2)
	 {
		 System.out.println(arg1);
		 System.out.println(arg2);
		 String truncatedXpath2 = arg2.substring(3);
		 System.out.println(truncatedXpath2);
		 
		return arg1+truncatedXpath2;
		 
	 }
	 
	 
	 
}
