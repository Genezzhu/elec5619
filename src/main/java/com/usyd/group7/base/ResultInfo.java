
package com.usyd.group7.base;

import java.util.Map;

public class ResultInfo {
	private boolean isSuccess;
	private String errorMessage;
	private Map<String, Object> data;
	
	public boolean isSuccess() {
		return isSuccess;
	}
	public void markSuccess(){
		isSuccess = true;
	}
	public String getErrorMessage() {
		return errorMessage;
	}
	public void setErrorMessage(String errorMessage) {
		this.errorMessage = errorMessage;
	}
    public void setErrorMessage(RuntimeException e){
        errorMessage = e.getCause().getLocalizedMessage();
    }
	public Map<String, Object> getData() {
		return data;
	}
	public void addData(String dataKey, Object value){
		this.data.put(dataKey, value);
	}
	
}
