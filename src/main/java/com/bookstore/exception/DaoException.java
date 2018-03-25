package com.bookstore.exception;

public class DaoException extends Exception {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public DaoException() {
	}

	public DaoException(String message) {
		super(message);
	}

	public DaoException(Throwable message) {
		super(message);
	}

	public DaoException(String message, Throwable cause) {
		super(message, cause);
	}

}
