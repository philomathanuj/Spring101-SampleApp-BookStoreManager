package com.bookstore.service;

import java.util.List;

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
	
	public Book getBookByID(Integer bookID) throws ServiceException{
		Book book = null;
		try {
			book=bookStoreDao.getBookByID(bookID);
		} catch (DaoException e) {
			throw new ServiceException("Exception Occurred while saving to database",e);
		}
		return book;
	}
	
	public List<Book> getAllBooks() throws ServiceException{
		List<Book> books = null;
		try {
			books=bookStoreDao.getAllBooks();
		} catch (DaoException e) {
			throw new ServiceException("Exception Occurred while saving to database",e);
		}
		return books;
	}
	
	

}
