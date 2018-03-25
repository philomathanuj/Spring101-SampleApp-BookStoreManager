package com.bookstore;

import java.io.IOException;

import com.google.gson.TypeAdapter;
import com.google.gson.stream.JsonReader;
import com.google.gson.stream.JsonToken;
import com.google.gson.stream.JsonWriter;

public class LongTypeAdapter extends TypeAdapter<Number>{

	@Override
	public Number read(JsonReader reader) throws IOException {
		if(reader.peek() == JsonToken.NULL){
			reader.nextNull();
			return null;
		}
		String LongAsString = reader.nextString();
		try{
			if("".equals(LongAsString.trim())){
				return null;
			}
			return Long.parseLong(LongAsString);
		}catch(Exception e){
			throw new LongTypeParseException(LongAsString);
			
		}
	}

	@Override
	public void write(JsonWriter out, Number value) throws IOException {
		if( value == null){
			out.nullValue();
		}
		else{
			out.value(value);
		}
	}
	
	private class LongTypeParseException extends RuntimeException {
		
		/**
		 * 
		 */
		private static final long serialVersionUID = 1L;

		public LongTypeParseException(String LongAsString){
			super("Unparsable Number in json to Long data type: "+LongAsString);
		}
	}

}
