package com.bw.cms.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bw.cms.domain.Article;
import com.bw.cms.domain.ArticleWithBLOBs;
import com.bw.cms.service.ArticleService;
import com.github.pagehelper.PageInfo;

@RequestMapping("article")
@Controller
public class ArticleController {
	
	@Resource
	private ArticleService articleService;
	/**
	 * 
	 * @Title: detail 
	 * @Description: 查询文章详情
	 * @param id
	 * @return
	 * @return: String
	 */
	@RequestMapping("article")
	public  String detail(Model model,Integer id) {
		ArticleWithBLOBs article = articleService.selectByPrimaryKey(id);	
		model.addAttribute("article", article);
		return "/admin/article/article";
	}
	
	/**
	 * 文章列表
	 * @Title: articles 
	 * @Description: TODO
	 * @param model
	 * @param article
	 * @param page
	 * @param pageSize
	 * @return
	 * @return: String
	 */
	@RequestMapping("articles")
	public String articles(Model model ,Article article,@RequestParam(defaultValue = "1")Integer page,@RequestParam(defaultValue = "3")Integer pageSize ) {
		PageInfo<Article> info = articleService.selects(article, page, pageSize);
		model.addAttribute("info", info);//封装的查询结国
		model.addAttribute("article", article);//封装的查询
		
		return "admin/article/articles";
	}
	/**
	 * 修改文章
	 * @Title: update 
	 * @Description: TODO
	 * @param article
	 * @return
	 * @return: boolean
	 */
	@ResponseBody
	@RequestMapping("update")
	public boolean update(ArticleWithBLOBs article) {
		return articleService.update(article);
	}

}
