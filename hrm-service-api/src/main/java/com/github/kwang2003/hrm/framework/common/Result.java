package com.github.kwang2003.hrm.framework.common;

import lombok.Data;

@Data
public class Result<T> {
	private T payload;
	private boolean success;
	private String errorMessage;
	
	public static <T> Result<T> successResult(T result){
		Result<T> rs = new Result<>();
		rs.setPayload(result);
		rs.setSuccess(true);
		return rs;
	}
	
	public static <T> Result<T> failResult(String error){
		Result<T> rs = new Result<>();
		rs.setSuccess(false);
		rs.setErrorMessage(error);
		return rs;
	}
}
