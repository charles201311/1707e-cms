package com.bw.cms.controller;

import java.util.ArrayList;
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
import com.bw.cms.utils.ArticleEnum;
import com.bw.cms.vo.ArticleVO;
import com.github.pagehelper.PageInfo;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

@Controller
public class IndexController {
	@Resource
	private ChannelService channelService;// 栏目

	@Resource
	private ArticleService articleService;// 文章

	@Resource
	private CategoryService categoryService;// 分类

	/**
	 * 
	 * @Title: index
	 * @Description: 首页
	 * @param article
	 * @param model
	 * @param page
	 * @param pageSize
	 * @return
	 * @return: String
	 */
	@RequestMapping(value = { "", "/", "index" })
	public String index(Article article, Model model, @RequestParam(defaultValue = "1") Integer page,
			@RequestParam(defaultValue = "5") Integer pageSize) {
		// 访问方法开始时间
		long s1 = System.currentTimeMillis();

		article.setStatus(1);// 显示审审核过的文章
		article.setDeleted(0);// 查询未删除的
		article.setContentType(ArticleEnum.HTML.getCode());
		Thread t1 = null;
		Thread t2 = null;
		Thread t3 = null;
		Thread t4 = null;
		Thread t5 = null;

		// 查询出左侧栏目
		t1 = new Thread(new Runnable() {
			@Override
			public void run() {
				List<Channel> channels = channelService.selects();
				model.addAttribute("channels", channels);

			}
		});

		t2 = new Thread(new Runnable() {

			@Override
			public void run() {

				// 如果栏目为空则默认显示热点
				if (article.getChannelId() == null) {
					// 查询热点文章的列表
					Article hot = new Article();
					hot.setStatus(1);// 审核过的
					hot.setHot(1);// 热点文章
					hot.setDeleted(0);//
					hot.setContentType(ArticleEnum.HTML.getCode());
					PageInfo<Article> info = articleService.selects(hot, page, pageSize);
					model.addAttribute("info", info);
				}
			}
		});

		t3 = new Thread(new Runnable() {

			@Override
			public void run() {
				// 显示分类文章
				if (article.getChannelId() != null) {
					// 1查询出来栏目下分类
					List<Category> categorys = categoryService.selectsByChannelId(article.getChannelId());
					model.addAttribute("categorys", categorys);
					// 2.显示分类下的文章
					PageInfo<Article> info = articleService.selects(article, page, pageSize);
					model.addAttribute("info", info);
				}
			}
		});
		t4 = new Thread(new Runnable() {

			@Override
			public void run() {
				
				// 右侧边栏显示最新的5遍文章

				Article lastArticle = new Article();
				lastArticle.setStatus(1);// 审核通过的
				lastArticle.setDeleted(0);
				lastArticle.setContentType(ArticleEnum.HTML.getCode());
				;//
				PageInfo<Article> lastInfo = articleService.selects(lastArticle, 1, 5);
				model.addAttribute("lastInfo", lastInfo);

			}
		});
		
		t5 =new Thread(new Runnable() {
			
			@Override
			public void run() {
				// 右侧边栏显示最新的5遍文章

				Article picArticle = new Article();
				picArticle.setStatus(1);// 审核通过的
				picArticle.setDeleted(0);
				picArticle.setContentType(ArticleEnum.IMAGE.getCode());
				PageInfo<Article> picInfo = articleService.selects(picArticle, 1, 5);
				model.addAttribute("picInfo", picInfo);
				
			}
		});
		
		// 封装查询条件
		model.addAttribute("article", article);
		//开启线程
		t1.start();
		t2.start();
		t3.start();
		t4.start();
		t5.start();
		try {
			//让子线程先运行.主线程最后运行.返回首页
			t1.join();
			t2.join();
			t3.join();
			t4.join();
			t5.join();
			
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		
		//long s2 = System.currentTimeMillis();
	//	System.out.println("首页用时:=============================>" + (s2 - s1));
		
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

	
	/**
	 * 
	 * @Title: article
	 * @Description: 文章详情
	 * @param model
	 * @return
	 * @return: String
	 */
	@RequestMapping("articlepic")
	public String articlepic(Model model, Integer id) {

		ArticleWithBLOBs article = articleService.selectByPrimaryKey(id);

		String string = article.getContent();

		
		
		ArrayList<ArticleVO> list = new ArrayList<ArticleVO>();
		
		Gson gson = new Gson();
		JsonArray array = new JsonParser().parse(string).getAsJsonArray();
		for (JsonElement jsonElement : array) {
			//把json转为java
			ArticleVO vo = gson.fromJson(jsonElement, ArticleVO.class);
			list.add(vo);
		}
		model.addAttribute("title", article.getTitle());// 标题
		model.addAttribute("list", list);// 标题包含的 图片的地址和描述
		return "index/articlepic";
	}

}
