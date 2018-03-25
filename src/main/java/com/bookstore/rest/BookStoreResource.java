package com.bookstore.rest;

import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Response;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestBody;

import com.bookstore.RestResponse;
import com.bookstore.entity.Book;
import com.bookstore.exception.ServiceException;
import com.bookstore.service.BookStoreService;

@Service
@Path("/bookstore")
public class BookStoreResource{
	
	@Autowired
	private BookStoreService bookStoreService;
	
	@POST
	@Path("/add")
	@Produces("application/json")
    @Consumes("application/json")
	public Response addPurchase(@RequestBody Book book){
		try {
			this.bookStoreService.addPurchase(book);
		} catch (ServiceException e) {
			return RestResponse.notOk("Failure to save purchase details",e.getMessage());
		}
		return RestResponse.ok("Purchase details added successfully",1);	
	}
	
	
/*	@GET
	@Path("/item/{id}")
	@Produces("application/json")
	public Response getItemDetails(@PathParam(value = "2") int id){
		try {
			this.smartPAService.viewItems(id);
		} catch (ServiceException e) {
			return RestResponse.notOk("Failure to save item",e.getMessage());
		}
		return RestResponse.ok("Item has been added successfully",1);
		
	}
*/
}
