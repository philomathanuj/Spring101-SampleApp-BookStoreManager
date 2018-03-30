package com.bookstore;

import javax.ws.rs.ApplicationPath;

import org.glassfish.jersey.server.ResourceConfig;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.filter.RequestContextFilter;

import com.bookstore.rest.BookStoreResource;

@Configuration
@ApplicationPath("rest")
public class JerseyConfiguration extends ResourceConfig{
	
	public JerseyConfiguration(){
		register(RequestContextFilter.class);
		register(BookStoreResource.class);
	}

}
