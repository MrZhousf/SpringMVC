package com.zhousf.office.dto;

/**
 * 信息体
 * @author zhousf
 *
 */
public class Message {
	
	private int errCode;//错误码
	private String msg;//返回信息
	private boolean success;//是否成功
	
	
	public Message(boolean success, String msg) {
		super();
		this.success = success;
		this.msg = msg;
	}


	public Message(boolean success, String msg, int errCode) {
		super();
		this.success = success;
		this.msg = msg;
		this.errCode = errCode;
	}


	public boolean isSuccess() {
		return success;
	}


	public void setSuccess(boolean success) {
		this.success = success;
	}


	public String getMsg() {
		return msg;
	}


	public void setMsg(String msg) {
		this.msg = msg;
	}


	public int getErrCode() {
		return errCode;
	}


	public void setErrCode(int errCode) {
		this.errCode = errCode;
	}
	
	
	
	
	
	
	
	
	

}
