/**
 * 
 */
package com.bookstore.springrestcontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.bookstore.entity.Book;
import com.bookstore.exception.ServiceException;
import com.bookstore.service.BookStoreService;


@RestController
public class BookRestController {

	@Autowired
	private BookStoreService bookService;

	@RequestMapping(value = "/getBookByID/{id}", method = RequestMethod.GET)
	public Book getRecordSalePage(@PathVariable ("id") Integer bookID) {
		System.out.println("Got at record sale page");
		Book book = null;
		try {
			book = this.bookService.getBookByID(bookID);
		} catch (ServiceException e) {
			e.printStackTrace();
		}
		return book;

	}

	@RequestMapping(value = "/saveRest", method = RequestMethod.POST)
	public String processRecordSale(@RequestBody Book book) {
		System.out.println("Got at save method");
		try {
			bookService.addPurchase(book);
		} catch (ServiceException e) {
			e.printStackTrace();
		}
		return "record added successfully";
	}
}
