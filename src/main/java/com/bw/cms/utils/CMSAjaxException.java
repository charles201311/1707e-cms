package com.bw.cms.utils;
/**
 * 
 * @ClassName: CMSException 
 * @Description: 自定义异常类2
 *        .如果controller返回值为json的则抛出该异常
 * @author: charles
 * @date: 2019年11月20日 下午3:15:26
 */
public class CMSAjaxException extends RuntimeException {

	/**
	 * @fieldName: serialVersionUID
	 * @fieldType: long
	 * @Description: TODO
	 */
	private static final long serialVersionUID = 1L;
	private String message;
	private Integer code;
	
	
	public Integer getCode() {
		return code;
	}
	public void setCode(Integer code) {
		this.code = code;
	}
	public CMSAjaxException() {
		
	}
	public CMSAjaxException(Integer code,String message) {
		super(message);
		this.code=code;
		this.message =message;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	
}
