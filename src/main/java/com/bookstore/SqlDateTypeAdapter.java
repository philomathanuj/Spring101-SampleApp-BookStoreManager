package com.bookstore;

import java.io.IOException;
import java.sql.Date;

import org.joda.time.DateTime;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;

import com.google.gson.TypeAdapter;
import com.google.gson.stream.JsonReader;
import com.google.gson.stream.JsonToken;
import com.google.gson.stream.JsonWriter;

public class SqlDateTypeAdapter extends TypeAdapter<Date>{
	
	final private DateTimeFormatter SIMPLE_DATE_FORMAT = DateTimeFormat.forPattern("MM-dd-yyyy");
	@Override
	public Date read(JsonReader reader) throws IOException {
		if(reader.peek() == JsonToken.NULL){
			reader.nextNull();
			return null;
		}
		String dateAsString = reader.nextString();
		try{
			DateTime formattedDate = SIMPLE_DATE_FORMAT.parseDateTime(dateAsString);
			if(formattedDate != null){
				return new Date(formattedDate.toDate().getTime());
			}
		}catch(Exception e){
			throw new DateTypeParseException(dateAsString);
		}
		return null;
	}

	@Override
	public void write(JsonWriter out, Date value) throws IOException {
		if(value == null){
			out.nullValue();
		}
		else{
			DateTime dateTime = new DateTime(new java.util.Date(value.getTime()));
			out.value(SIMPLE_DATE_FORMAT.print(dateTime));
		}
	}
	
	private class DateTypeParseException extends RuntimeException {
		
		/**
		 * 
		 */
		private static final long serialVersionUID = 1L;

		public DateTypeParseException(String dateAsString){
			super("Unparsable date in json: "+ dateAsString + ". format must be in " + "MM-dd-yyyy"+ " format");
		}
	}

	

}
