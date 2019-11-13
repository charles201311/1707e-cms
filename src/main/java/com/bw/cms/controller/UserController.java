package com.bw.cms.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bw.cms.domain.User;
import com.bw.cms.service.UserService;
import com.github.pagehelper.PageInfo;

@Controller
public class UserController {
	
	@Resource
	private UserService userService;
	
	@RequestMapping("users")
	public String users(Model model ,User user,@RequestParam(defaultValue = "1")Integer page,@RequestParam(defaultValue = "3")Integer pageSize ) {
		
		PageInfo<User> info = userService.selects(user, page, pageSize);
		
		model.addAttribute("users", info.getList());
		model.addAttribute("user", user);
		
		return "admin/user/users";
		
	}

}
