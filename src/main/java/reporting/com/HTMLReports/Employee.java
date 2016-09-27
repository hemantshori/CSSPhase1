package reporting.com.HTMLReports;

public class Employee {

	
	int e_id,e_age;
	String e_name;
	int noOfemployees = 0;
	Employee(int e_id, String e_name, int e_age){
		this.e_id = e_id;
		this.e_name = e_name;
		this.e_age = e_age;
		noOfemployees++;
	}
	
	public void enterEmployee()
	{
		System.out.println(e_id);
		System.out.println(e_name);
		System.out.println(e_age);
		System.out.println(noOfemployees);
	}
}
