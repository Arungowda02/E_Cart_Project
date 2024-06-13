package com.ecart.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.ecart.entity.User;

public class DAO {
	
	private SessionFactory factory;

	public DAO(SessionFactory factory) {
		super();
		this.factory = factory;
	}

	public User getUserByEmailAndPassword(String email, String password)
	{
		User user = null;
		
		try {
			
			String query = "from User where userEmail=: e and userpassword=: p";
		
			Session openSession = this.factory.openSession();
			Query createQuery = openSession.createQuery(query);
			createQuery.setParameter("e", email);
			createQuery.setParameter("p", password);
			user = (User) createQuery.uniqueResult();
			
			
			
			openSession.close();
		} catch (Exception e) {

		e.printStackTrace();
		}
		
		
		
		return user;
	}
}
