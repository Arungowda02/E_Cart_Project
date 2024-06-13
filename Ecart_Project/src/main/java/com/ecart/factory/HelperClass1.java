package com.ecart.factory;

import java.util.HashMap;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

public class HelperClass1 {
	
	public static String get10Words(String desc)
	{
		String[] str = desc.split(" ");
		
		if(str.length > 10)
		{
			String res = "";
			for(int i=0; i<10; i++)
			{
				res+=str[i]+" ";
			}
			return (res+"...");
		}
		else
		{
			return (desc+"...");
		}
	}
	
	public static  HashMap<String, Long> getCount(SessionFactory factory) {
		
		Session openSession = factory.openSession();
		 String query1 = "select count(*) from User";
		 String query2 = "select count(*) from Product";
		 
		 Query createQuery1 = openSession.createQuery(query1);
		 Query createQuery2 = openSession.createQuery(query2);
		 
		 Long userCount = (Long) createQuery1.list().get(0);
		 Long productCount = (Long) createQuery2.list().get(0);
		 
		 HashMap<String, Long> hashMap = new HashMap<String, Long>();
		 hashMap.put("userCount", userCount);
		 hashMap.put("productCount", productCount);
		
		
		openSession.close();
		
		return hashMap;
		
		
	}

}
