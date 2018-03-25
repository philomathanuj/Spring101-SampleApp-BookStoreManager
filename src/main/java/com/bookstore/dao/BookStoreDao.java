package com.bookstore.dao;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.bookstore.entity.Book;
import com.bookstore.exception.DaoException;

@Component
public class BookStoreDao {

	@Autowired
	private SessionFactory sessionFactory;
	
	public void addPurchase(Book book) throws DaoException{
		Session session = null;
		Transaction tx = null;
		try {
			session = sessionFactory.openSession();
			tx = session.beginTransaction();
			session.persist(book);
			tx.commit();
		} catch (HibernateException e) {
			tx.rollback();
			throw new DaoException("Exception Occurred while saving book to the database",e);
		}finally{
			session.close();
		}
	}

}
