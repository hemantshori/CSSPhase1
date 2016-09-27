package databasae;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectCCB {

	
	public void testDB() throws ClassNotFoundException, SQLException, InstantiationException, IllegalAccessException
	{
		 Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
		 System.out.println(" driver loaded");
	Connection connect=	 DriverManager.getConnection("jdbc:mysql//10.0.11.10:1521/CCB240","CISADM","cisadm");

	System.out.println(" Connected to CCB");
	}
}
 