package poly_vedio3;

public class Car {

	public static void main(String[] args) {


		 CarParent test = new CarChild();
		 test.Method1();
		 test.Method2();
		 
		 //type casting is done
		 
		 CarChild xx = (CarChild)test;
		 xx.Method5();
		 xx.Method6();
		 
		 
}  
 

}