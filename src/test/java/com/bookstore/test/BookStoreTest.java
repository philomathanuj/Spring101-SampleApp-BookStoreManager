package com.bookstore.test;

import javax.ws.rs.core.Response;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.bookstore.entity.Book;
import com.bookstore.rest.BookStoreResource;

@RunWith(SpringRunner.class)
@SpringBootTest
public class BookStoreTest {

@Autowired
private BookStoreResource bookStoreResouce;

@Test
public void testAddPurchase(){
	Book book = new Book();
	book.setAuthor("Khalid Hosseni");
	book.setCategory("Fiction");
	book.setCopiesSold(1);
	book.setCopiesLeft(10);
	book.setLanguage("English");
	book.setPrice(300);
	book.setTitle("The Kite Runner");
	bookStoreResouce.addPurchase(book);
}

@Test
public void testViewPurchase(){
	Book book = bookStoreResouce.viewPurchase(1);
	System.out.println(book.toString());
}

@Test
public void testViewAllPurchases(){
	Response response = bookStoreResouce.viewAllPurchases();
	System.out.println(response.getEntity().toString());
}

}
