package com.bw.cms.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bw.cms.domain.User;
import com.bw.cms.service.UserService;
import com.github.pagehelper.PageInfo;
@RequestMapping("user")
@Controller
public class UserController {
	
	@Resource
	private UserService userService;
	
	@RequestMapping("users")
	public String users(Model model ,User user,@RequestParam(defaultValue = "1")Integer page,@RequestParam(defaultValue = "3")Integer pageSize ) {
		
		PageInfo<User> info = userService.selects(user, page, pageSize);
		
		model.addAttribute("users", info.getList());
		model.addAttribute("user", user);
		model.addAttribute("info", info);
		/*
		 * String url="/users"; if(user.getUsername()!=null) {
		 * url+="?username="+user.getUsername(); }
		 */
		//String pages = PageUtil.page(page, info.getPages(), url, pageSize);
		
		//model.addAttribute("pages", pages);
		int[] nums = info.getNavigatepageNums();
		model.addAttribute("nums", nums);
		return "admin/user/users";
		
	}
  /**
   * 
   * @Title: update 
   * @Description: 修改改用
   * @return
   * @return: boolean
   */
	@RequestMapping("update")
	@ResponseBody
	public boolean update(User user ) {
	  return 	userService.update(user);
		
	}

}
