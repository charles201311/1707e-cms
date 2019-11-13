package com.bw.cms.service.impl;

import javax.annotation.Resource;

import org.junit.Test;

import com.bw.cms.domain.User;
import com.bw.cms.service.UserService;
import com.github.pagehelper.PageInfo;


public class UserServiceImplTest extends JunitParent {
	
	@Resource
	private UserService userService; 

	@Test
	public void testSelects() {
		
		PageInfo<User> info = userService.selects(null, 1, 100);
		System.out.println(info);
	}
	
	

}
