package com.ecart.factory;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class FactoryProvider {
	
	private static SessionFactory buildSessionFactory;
	
	public static SessionFactory getFactory()
	{
		try {
			
			if(buildSessionFactory == null)
			{
				buildSessionFactory = new Configuration()
						.configure("hibernate.cfg.xml")
						.buildSessionFactory();
			}
			
		} catch (Exception e) {

		e.printStackTrace();}
		
		
		
		return buildSessionFactory;
	}
	
	public static void closeFactory() {
        if (buildSessionFactory != null) {
        	buildSessionFactory.close();
        }

}
}
