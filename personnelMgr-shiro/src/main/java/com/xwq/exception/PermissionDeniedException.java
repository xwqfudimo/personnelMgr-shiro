package com.xwq.exception;

public class PermissionDeniedException extends Exception {
	private static final long serialVersionUID = 3402926425252150132L;

	public PermissionDeniedException(String msg) {
		super(msg);
	}
}
