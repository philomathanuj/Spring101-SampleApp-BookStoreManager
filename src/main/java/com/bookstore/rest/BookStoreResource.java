package com.bookstore.rest;

import javax.inject.Inject;
import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Response;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestBody;

import com.bookstore.RestResponse;
import com.bookstore.exception.ServiceException;
import com.bookstore.service.BookStoreService;

@Service
@Path("/expense")
public class BookStoreResource{
	
	@Inject
	private BookStoreService bookStoreService;
	
	@POST
	@Path("/item/save")
	@Produces("application/json")
    @Consumes("application/json")
	public Response saveItemDetails(@RequestBody Object lineItem){
		try {
			//this.bookStoreService.addItem(lineItem);
			System.out.println("helo");
			throw new ServiceException();
		} catch (ServiceException e) {
			return RestResponse.notOk("Failure to save item",e.getMessage());
		}
		finally{
			return RestResponse.ok("Item has been added successfully",1);	
		}
				
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
