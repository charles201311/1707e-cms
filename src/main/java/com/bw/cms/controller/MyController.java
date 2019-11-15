package com.bw.cms.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.bw.cms.domain.Article;
import com.bw.cms.domain.ArticleWithBLOBs;
import com.bw.cms.service.ArticleService;
import com.github.pagehelper.PageInfo;
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
	
	
	@Resource
	private ArticleService articleService;
	/**
	 * 
	 * @Title: index 
	 * @Description: 去个人中心首页
	 * @return
	 * @return: String
	 */
	@RequestMapping(value = {"","/","index"})
	public String index() {
		
		return  "my/index";
		
	}
	
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
		return "/my/article/article";
	}
	
	
	/**
	 * 返回我的文章
	 * @Title: selectByUser 
	 * @Description: TODO
	 * @param model
	 * @param page
	 * @param pageSize
	 * @return
	 * @return: String
	 */
	@GetMapping("selectByUser")
	public String selectByUser(Model model,@RequestParam(defaultValue = "1")Integer page,@RequestParam(defaultValue = "3") Integer pageSize) {
		
		Article a = new Article();
		a.setUserId(160);//写死
		
		PageInfo<Article> info = articleService.selects(a, page, pageSize);
		model.addAttribute("info", info);
		return "my/article/articles";
	}
	/**
	 * 
	 * @Title: publish 
	 * @Description: 去 增加文章/发布文章
	 * @return
	 * @return: String
	 */
	@GetMapping("publish")
	public String publish() {
		
		return "my/article/publish";
		
	}
	/**
	 * 
	 * @Title: publish 
	 * @Description: 增加文章/发布文章
	 * @param article
	 * @return
	 * @return: boolean
	 */
	@ResponseBody
	@PostMapping("publish")
	public boolean  publish(HttpServletRequest request, ArticleWithBLOBs article,MultipartFile file) {
		
		  if(!file.isEmpty()) {
			 //文件上传路径.把文件放入项目的 /resource/pic  下
			  String path = request.getSession().getServletContext().getRealPath("/resource/pic/");
			  //为了防止文件重名.使用UUID 的方式重命名上传的文件
			  String oldFilename = file.getOriginalFilename();
			  //a.jpg
			  String newFilename =UUID.randomUUID()+oldFilename.substring(oldFilename.lastIndexOf("."));
			  System.out.println("=========================>"+path);
			  File f = new File(path,newFilename);
			  //写入硬盘
			  try {
				file.transferTo(f);
				
				article.setPicture(newFilename);//标题图片
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			  
		  }
		  //初始化设置
		  article.setStatus(0);//待审核
		  article.setUserId(160);//暂时写死...
		  article.setHits(0);
		  article.setHot(0);
		  article.setDeleted(0);
		  article.setCreated(new Date());
		  article.setUpdated(new Date());
		  
		  
		
		return articleService.insertSelective(article);
		
	}

}
