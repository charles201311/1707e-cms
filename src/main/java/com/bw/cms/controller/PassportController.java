package com.bw.cms.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bw.cms.domain.User;
import com.bw.cms.service.UserService;
import com.bw.cms.utils.CMSException;
import com.bw.cms.vo.UserVO;
/**
 * 
 * @ClassName: PassportController 
 * @Description: 登录注册
 * @author: charles
 * @date: 2019年11月18日 下午1:16:56
 */
@RequestMapping("passport")
@Controller
public class PassportController {
	@Resource
	private UserService userService;
	
	
	@GetMapping("logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if(null!=session)
		session.invalidate();
		return "redirect:/passport/login";
	}

	/**
	 * 
	 * @Title: login 
	 * @Description: 去登录
	 * @return
	 * @return: String
	 */
	
	@GetMapping("login")
	public String login() {
		return "passport/login";
	}
	
	
	/**
	 * 
	 * @Title: login 
	 * @Description: 登录
	 * @param user
	 * @return
	 * @return: String
	 */
	@PostMapping("login")
	public String login(Model model,User user,HttpSession session) {
		try {
			User u = userService.login(user);
			
			if(u.getRole().equals("1")) {//1:管理员 0:普通用户
				session.setAttribute("admin", u);
				return "redirect:/admin";//管理员进入管理员后台
			}else {
				session.setAttribute("user", u);
				return "redirect:/my";//普通注册进入个人中心
			}
			
		} catch (CMSException e) {
			e.printStackTrace();
			//封装到model,用于提示用户
			model.addAttribute("message", e.getMessage());
		}catch (Exception e) {
			model.addAttribute("message", "系统异常.请联系管理员");
		}
		
		
		return "passport/login";
	}
	
	
	/**
	 * 
	 * @Title: reg 
	 * @Description: 去注册
	 * @return
	 * @return: String
	 */
	
	@GetMapping("reg")
	public String reg() {
		return "passport/reg";
	}
	@PostMapping("reg")
	public String reg(Model model ,UserVO userVO,RedirectAttributes redirectAttributes) {
		
			try {
			boolean b =userService.insertSelective(userVO);	
			if(b) {
				redirectAttributes.addFlashAttribute("username", userVO.getUsername());
				redirectAttributes.addFlashAttribute("message", "恭喜,注册成功");
				
				return "redirect:/passport/login";//注册成功,重定向到登录页面
			}
		}catch (CMSException e) {
			e.printStackTrace();
			//封装到model,用于提示用户
			model.addAttribute("message", e.getMessage());
		}catch (Exception e) {
			model.addAttribute("message", "系统异常.请联系管理员");
		}
		
		return "passport/reg";//注册失败
	}
	}
