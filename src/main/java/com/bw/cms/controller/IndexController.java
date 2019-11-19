package com.bw.cms.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bw.cms.domain.Article;
import com.bw.cms.domain.ArticleWithBLOBs;
import com.bw.cms.domain.Category;
import com.bw.cms.domain.Channel;
import com.bw.cms.service.ArticleService;
import com.bw.cms.service.CategoryService;
import com.bw.cms.service.ChannelService;
import com.github.pagehelper.PageInfo;

@Controller
public class IndexController {
	@Resource
	private ChannelService channelService;//栏目

	@Resource
	private ArticleService articleService;//文章
	
	@Resource
	private CategoryService categoryService;//分类

	@RequestMapping(value = { "", "/", "index" })
	public String index(Article article, Model model, @RequestParam(defaultValue = "1") Integer page,
			@RequestParam(defaultValue = "5") Integer pageSize) {
		
		article.setStatus(1);// 显示审审核过的文章
		
		// 查询出左侧栏目

		List<Channel> channels = channelService.selects();
		model.addAttribute("channels", channels);
		//如果栏目为空则默认显示热点
		if (article.getChannelId() == null) {
			// 查询热点文章的列表
			Article hot = new Article();
			hot.setStatus(1);// 审核过的
			hot.setHot(1);// 热点文章
			PageInfo<Article> info = articleService.selects(hot, page, pageSize);
			model.addAttribute("info", info);
		}
		//显示分类文章
		if(article.getChannelId()!=null) {
			//1查询出来栏目下分类
			List<Category> categorys = categoryService.selectsByChannelId(article.getChannelId());
			model.addAttribute("categorys", categorys);
			//2.显示分类下的文章
			PageInfo<Article> info = articleService.selects(article, page, pageSize);
			model.addAttribute("info", info);
		}
		
		//右侧边栏显示最新的5遍文章
		
		PageInfo<Article> lastInfo = articleService.selects(article, 1, 5);
		model.addAttribute("lastInfo", lastInfo);
		
		//封装查询条件
		model.addAttribute("article", article);
		return "index/index";
	}
	/**
	 * 
	 * @Title: article 
	 * @Description: 文章详情
	 * @param model
	 * @return
	 * @return: String
	 */
	@RequestMapping("article")
	public String article(Model model, Integer id) {
		ArticleWithBLOBs article = articleService.selectByPrimaryKey(id);
		model.addAttribute("article", article);
		return "index/article";
	}

}
