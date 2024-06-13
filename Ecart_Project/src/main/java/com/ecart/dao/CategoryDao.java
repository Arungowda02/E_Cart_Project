package com.ecart.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.ecart.entity.Category;

public class CategoryDao {

	private SessionFactory factory;

	public CategoryDao(SessionFactory factory) {
		super();
		this.factory = factory;
	}

	public int saveCategory(Category category) {
		Session openSession = this.factory.openSession();
		Transaction beginTransaction = openSession.beginTransaction();
		int categoryId = (int) openSession.save(category);

		beginTransaction.commit();

		openSession.close();

		return categoryId;

	}

	public List<Category> getCategories() {
		Session openSession = this.factory.openSession();
		Query query = openSession.createQuery("from Category");
		List<Category> list = query.list();

		return list;

	}

	public Category getCategoryById(int cId) {
		Category category = null;
		try {

			Session openSession = this.factory.openSession();
			category = openSession.get(Category.class, cId);
			openSession.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return category;

	}

}
