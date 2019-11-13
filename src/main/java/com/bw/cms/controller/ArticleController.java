package com.bw.cms.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bw.cms.domain.Article;
import com.bw.cms.service.ArticleService;
import com.github.pagehelper.PageInfo;

@Controller
public class ArticleController {
	
	@Resource
	private ArticleService articleService;
	
	@RequestMapping("articles")
	public String articles(Model model ,Article article,@RequestParam(defaultValue = "1")Integer page,@RequestParam(defaultValue = "3")Integer pageSize ) {
		PageInfo<Article> info = articleService.selects(article, page, pageSize);
		model.addAttribute("articles", info.getList());//封装集合
		model.addAttribute("info", info);//封装的查询结国
		model.addAttribute("article", article);//封装的查询结国
		model.addAttribute("nums", info.getNavigatepageNums());
		
		return "admin/article/articles";

		
		
	}

}
