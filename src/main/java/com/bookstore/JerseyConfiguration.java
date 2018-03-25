package com.bookstore;

import org.glassfish.jersey.server.ResourceConfig;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.filter.RequestContextFilter;

@Configuration
public class JerseyConfiguration extends ResourceConfig{
	
	public JerseyConfiguration(){
		register(RequestContextFilter.class);
		//register(ExpenseResource.class);
	}

}
