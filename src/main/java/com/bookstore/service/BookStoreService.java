package com.bookstore.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookstore.dao.BookStoreDao;
import com.bookstore.entity.Book;
import com.bookstore.exception.DaoException;
import com.bookstore.exception.ServiceException;

@Service
public class BookStoreService {

	@Autowired
	private BookStoreDao bookStoreDao;
	
	public void addPurchase(Book book) throws ServiceException{
		try {
			bookStoreDao.addPurchase(book);
		} catch (DaoException e) {
			throw new ServiceException("Exception Occurred while saving to database",e);
		}
	}

}
