package com.jiang.util;

public class WebException extends RuntimeException {
	private static final long serialVersionUID = 1L;

	public WebException(String message) {
		super(message);
	}

	public WebException(String message, Throwable e) {
		super(message, e);
	}

}
