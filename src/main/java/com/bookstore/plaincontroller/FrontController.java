package com.bookstore.plaincontroller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.bookstore.entity.Book;
import com.bookstore.exception.ServiceException;
import com.bookstore.service.BookStoreService;

/**
 * Servlet implementation class FrontController
 */
@Component
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	@Autowired
	private BookStoreService bookStoreService;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FrontController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		Book book = null;
		RequestDispatcher rd = null;
		String uri = request.getRequestURI();
		if(uri.endsWith("addPurchase.do")){
			book = (Book) request.getAttribute("book");
			try {
				bookStoreService.addPurchase(book);
				request.setAttribute("message","Purchase details have been added successfully");
				rd = request.getRequestDispatcher("/home.jsp");
			} catch (ServiceException e) {
				request.setAttribute("error","Error Occurred while saving the purchase details");
				e.printStackTrace();
			}
		}
		else if(uri.endsWith("viewPurchase.do")){
			Integer bookID = Integer.parseInt(request.getParameter("bookID"));
			Book bookDetails = null;
			try {
				bookDetails = bookStoreService.getBookByID(bookID);
				request.setAttribute("bookDetails",bookDetails);
				rd = request.getRequestDispatcher("/viewPurchase.jsp");
			} catch (ServiceException e) {
				request.setAttribute("error","Error Occurred while fetching purchase details");
				e.printStackTrace();
			}
		}
		
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
