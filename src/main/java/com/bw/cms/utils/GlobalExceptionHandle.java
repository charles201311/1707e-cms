package com.bw.cms.utils;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import aj.org.objectweb.asm.Handle;
/**
 * 
 * @ClassName: GlobalExceptionHandle 
 * @Description: 全局异常处理器
 * @author: charles
 * @date: 2019年11月20日 下午3:15:13
 */
@ControllerAdvice
public class GlobalExceptionHandle {
	
	/**
	 * 
	 * @Title: handleJson 
	 * @Description: 处理ajax请求的异常
	 * @param cmsJsonException
	 * @return
	 * @return: Result
	 */
	@ResponseBody
	@ExceptionHandler(CMSAjaxException.class)
	public Result handleJson(CMSAjaxException cmsJsonException) {
		return ResultUtil.error(cmsJsonException.getCode(), cmsJsonException.getMessage());
		
	}
	/**
	 * 
	 * @Title: handle 
	 * @Description: 处理普通请求的异常
	 * @param CMSException
	 * @param request
	 * @return
	 * @return: ModelAndView
	 */
	@ExceptionHandler(CMSException.class)
	public ModelAndView handle(CMSException exception,HttpServletRequest request) {
		ModelAndView mv  = new ModelAndView();
	  //则获取错误消息,进行封装
		mv.addObject("message",exception.getMessage());
		//获取当前请求的url
		 String url = request.getRequestURI();
		// System.out.println(url+"=================");
		mv.setViewName(url);//
		return mv;
		
	}
	/**
	 * 
	 * @Title: handle 
	 * @Description: 处理系统异常
	 * @param exception
	 * @return
	 * @return: ModelAndView
	 */
	@ExceptionHandler(Exception.class)
	public String handle(Exception exception) {
		
		return "common/error";
		
	}
	
	

}
