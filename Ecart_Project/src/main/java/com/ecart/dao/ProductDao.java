package com.ecart.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.ecart.entity.Product;

public class ProductDao {

	private SessionFactory factory;

	public ProductDao(SessionFactory factory) {
		super();
		this.factory = factory;
	}

	public boolean saveProduct(Product product) {

		boolean f = false;
		try {

			Session openSession = this.factory.openSession();
			Transaction beginTransaction = openSession.beginTransaction();
			openSession.save(product);

			beginTransaction.commit();
			openSession.close();
			f = true;

		} catch (Exception e) {
			e.printStackTrace();
			f = false;
		}
		return f;

	}

	public List<Product> getAllProduct() {

		
		Session openSession = this.factory.openSession();
		Query createQuery = openSession.createQuery("from Product");
		List<Product> list = createQuery.list();

		return list;

	}

	public List<Product> getAllProductByCategoryId(int cId) {

		Session openSession = this.factory.openSession();
		Query createQuery = openSession.createQuery("from Product as p where p.category.categoryId =: cId");
		createQuery.setParameter("cId", cId);
		List<Product> list = createQuery.list();

		return list;

	}

}