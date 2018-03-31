/**
 * 
 */
package com.bookstore.springmvccontroller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bookstore.entity.Book;
import com.bookstore.exception.ServiceException;
import com.bookstore.service.BookStoreService;


@Controller
public class BookController {

	@Autowired
	private BookStoreService bookService;

	@RequestMapping(value = "/getBook.act", method = RequestMethod.GET)
	public String getRecordSalePage(Model model, HttpSession session) {
		System.out.println("getBook.act called in spring mvc controller");
		Book book = null;
		try {
			book = this.bookService.getBookByID(1);
		} catch (ServiceException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("book", book);
		return "springmvc";

	}

	@RequestMapping(value = "/saveBook.act", method = RequestMethod.POST)
	public String processRecordSale(@ModelAttribute("book") Book book,
			@RequestParam("partialTitle") String partialTitle, Model model,
			@ModelAttribute("recordVisibility") String recordVisibility,
			HttpSession session) {
		System.out.println("saveBook.act");
		try {

			bookService.addPurchase(book);
			model.addAttribute("recordVisibility", recordVisibility);
		} catch (ServiceException e) {
			e.printStackTrace();
		}
		return "springmvc";
	}

}
