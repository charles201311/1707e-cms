package com.bw.cms.controller;

import javax.annotation.Resource;

import org.apache.poi.ss.formula.functions.T;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bw.cms.domain.Article;
import com.bw.cms.domain.ArticleWithBLOBs;
import com.bw.cms.domain.User;
import com.bw.cms.service.ArticleService;
import com.bw.cms.service.UserService;
import com.bw.cms.utils.Result;
import com.bw.cms.utils.ResultUtil;
import com.github.pagehelper.PageInfo;

@RequestMapping("admin")
@Controller
public class AdminController {

	@Resource
	private ArticleService articleService;

	@Resource
	private UserService userService;

	@RequestMapping("user/users")
	public String users(Model model, User user, @RequestParam(defaultValue = "1") Integer page,
			@RequestParam(defaultValue = "3") Integer pageSize) {

		PageInfo<User> info = userService.selects(user, page, pageSize);

		model.addAttribute("users", info.getList());
		model.addAttribute("user", user);
		model.addAttribute("info", info);
		/*
		 * String url="/users"; if(user.getUsername()!=null) {
		 * url+="?username="+user.getUsername(); }
		 */
		// String pages = PageUtil.page(page, info.getPages(), url, pageSize);

		// model.addAttribute("pages", pages);
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
	@RequestMapping("user/update")
	@ResponseBody
	public Result<User> update(User user) {
		userService.update(user);//执行修改
		return ResultUtil.success();

	}

	/**
	 * 
	 * 
	 * @Title: detail
	 * @Description: 查询文章详情
	 * @param id
	 * @return
	 * @return: String
	 */
	@RequestMapping("article/article")
	public String detail(Model model, Integer id) {
		ArticleWithBLOBs article = articleService.selectByPrimaryKey(id);
		model.addAttribute("article", article);
		return "/admin/article/article";
	}

	/**
	 * 文章列表
	 * 
	 * @Title: articles
	 * @Description: TODO
	 * @param model
	 * @param article
	 * @param page
	 * @param pageSize
	 * @return
	 * @return: String
	 */
	@RequestMapping("article/articles")
	public String articles(Model model, Article article, @RequestParam(defaultValue = "1") Integer page,
			@RequestParam(defaultValue = "3") Integer pageSize) {
		PageInfo<Article> info = articleService.selects(article, page, pageSize);
		model.addAttribute("info", info);// 封装的查询结国
		model.addAttribute("article", article);// 封装的查询

		return "admin/article/articles";
	}

	/**
	 * 修改文章
	 * 
	 * @Title: update
	 * @Description: TODO
	 * @param article
	 * @return
	 * @return: boolean
	 */
	@ResponseBody
	@RequestMapping("article/update")
	public Result<Article> update(ArticleWithBLOBs article) {
		articleService.update(article);
		return  ResultUtil.success();
	}

	/**
	 * 
	 * @Title: index
	 * @Description: 后台首页
	 * @return
	 * @return: String
	 */
	@RequestMapping(value = { "", "/", "index" })
	public String index() {

		return "admin/index";

	}

}
