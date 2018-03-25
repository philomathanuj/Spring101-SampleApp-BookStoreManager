package com.bookstore;

import java.io.IOException;

import com.google.gson.TypeAdapter;
import com.google.gson.stream.JsonReader;
import com.google.gson.stream.JsonToken;
import com.google.gson.stream.JsonWriter;

public class StringTypeAdapter extends TypeAdapter<String>{

	@Override
	public String read(JsonReader reader) throws IOException {
		if(reader.peek() == JsonToken.NULL){
			reader.nextNull();
			return null;
		}
		String string = reader.nextString();
		try{
			if("".equals(string.trim())){
				return null;
			}
			return string;
		}catch(Exception e){
			throw new StringTypeParseException(string);
			
		}
	}

	@Override
	public void write(JsonWriter out, String value) throws IOException {
		if( value == null){
			out.nullValue();
		}
		else{
			out.value(value);
		}
	}
	
	private class StringTypeParseException extends RuntimeException {
		
		/**
		 * 
		 */
		private static final long serialVersionUID = 1L;

		public StringTypeParseException(String string){
			super("Unparsable String in json: "+string);
		}
	}

}
