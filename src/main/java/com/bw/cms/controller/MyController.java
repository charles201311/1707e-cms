package com.bw.cms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
/**
 * 
 * @ClassName: MyController 
 * @Description: 注册用户的个人中心
 * @author: charles
 * @date: 2019年11月14日 上午11:06:11
 */
@RequestMapping("my")
@Controller
public class MyController {
	/**
	 * 
	 * @Title: index 
	 * @Description: 去个人中心首页
	 * @return
	 * @return: String
	 */
	@RequestMapping("index")
	public String index() {
		
		return  "my/index";
		
	}
	/**
	 * 
	 * @Title: publish 
	 * @Description: 增加文章/发布文章
	 * @return
	 * @return: String
	 */
	@RequestMapping("publish")
	public String publish() {
		
		return "my/article/publish";
		
	}

}
