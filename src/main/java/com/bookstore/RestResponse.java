package com.bookstore;

import java.util.Date;

import javax.ws.rs.core.Response;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonObject;

@Service
public class RestResponse {

private static final  Gson gson = new GsonBuilder().registerTypeAdapter(Date.class,new DateTypeAdapter()).registerTypeAdapter(long.class, new LongTypeAdapter()).
registerTypeAdapter(Long.class, new LongTypeAdapter()).registerTypeAdapter(String.class, new StringTypeAdapter())
.enableComplexMapKeySerialization().serializeNulls().setPrettyPrinting().disableHtmlEscaping().registerTypeAdapter(java.sql.Date.class, new SqlDateTypeAdapter()).create();

public static Response ok(String message){
	JsonObject jObj = new JsonObject();
	jObj.addProperty("success",true);
	jObj.addProperty("message",message);
	jObj.addProperty("total",0);
	return Response.ok(Response.Status.OK).entity(gson.toJson(jObj)).build();
}

public static Response ok(String message, int count){
	JsonObject jObj = new JsonObject();
	jObj.addProperty("success",true);
	jObj.addProperty("message",message);
	jObj.addProperty("total",count);
	return Response.ok(Response.Status.OK).entity(gson.toJson(jObj)).build();
}

public static Response notOk(String message, String error){
	JsonObject jObj = new JsonObject();
	jObj.addProperty("success",true);
	jObj.addProperty("message",message);
	jObj.addProperty("error",error);
	return Response.ok(Response.Status.INTERNAL_SERVER_ERROR).entity(gson.toJson(jObj)).build();
}

public static Response ok(String resultProperty, Object result, int count){
	JsonObject jObj = new JsonObject();
	jObj.addProperty("success",true);
	jObj.addProperty("total",count);
	jObj.add(resultProperty,gson.toJsonTree(result));
	return Response.ok(Response.Status.OK).entity(gson.toJson(jObj)).build();
}

public static JsonObject jsonObject(ResponseEntity<String> entity){
	String response = entity.getBody();
	return jsonObject(response);
}

public static JsonObject jsonObject(String response){
	JsonObject json = gson.fromJson(response,JsonObject.class);
	return json;
}

}
