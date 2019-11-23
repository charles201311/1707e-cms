package com.bw.cms.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import com.bw.cms.domain.Collect;
import com.bw.cms.domain.User;
import com.bw.cms.service.ArticleService;
import com.bw.cms.service.CollectService;
import com.bw.cms.utils.ArticleEnum;
import com.bw.cms.utils.Result;
import com.bw.cms.utils.ResultUtil;
import com.bw.cms.vo.ArticleVO;
import com.github.pagehelper.PageInfo;
import com.google.gson.Gson;

/**
 * 
 * @ClassName: MyController
 * @Description: 注册用户的个人中心
 * @author: charles
 * @param <E>
 * @date: 2019年11月14日 上午11:06:11
 */
@RequestMapping("my")
@Controller
public class MyController {

	@Resource
	private ArticleService articleService;

	@Resource
	private CollectService collectService;// 我的收藏

	/**
	 * 
	 * @Title: index
	 * @Description: 去个人中心首页
	 * @return
	 * @return: String
	 */
	@RequestMapping(value = { "", "/", "index" })
	public String index() {

		return "my/index";

	}

	/**
	 * 
	 * @Title: collects
	 * @Description: 我的收藏
	 * @return
	 * @return: String
	 */
	@GetMapping("collects")
	public String collects(HttpServletRequest request, Model model, @RequestParam(defaultValue = "1") Integer page,
			@RequestParam(defaultValue = "3") Integer pageSize) {
		HttpSession session = request.getSession(false);

		User user = (User) session.getAttribute("user");

		PageInfo<Collect> info = collectService.selects(page, pageSize, user);

		model.addAttribute("info", info);
		return "/my/collect/collects";

	}
	
	/**
	 * 
	 * @Title: deleteCollect 
	 * @Description: 移除收藏
	 * @param id
	 * @return
	 * @return: Result<Collect>
	 */
	@ResponseBody
	@PostMapping("deleteCollect")
	public Result<Collect> deleteCollect(Integer id){
		collectService.deleteById(id);
		return ResultUtil.success();
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
	public String detail(Model model, Integer id) {
		ArticleWithBLOBs article = articleService.selectByPrimaryKey(id);
		model.addAttribute("article", article);
		return "/my/article/article";
	}

	/**
	 * 返回我的文章
	 * 
	 * @Title: selectByUser
	 * @Description: TODO
	 * @param model
	 * @param page
	 * @param pageSize
	 * @return
	 * @return: String
	 */
	@GetMapping("selectByUser")
	public String selectByUser(HttpServletRequest request, Model model, @RequestParam(defaultValue = "1") Integer page,
			@RequestParam(defaultValue = "3") Integer pageSize) {

		Article a = new Article();
		HttpSession session = request.getSession(false);
		if (session == null) {
			return "redirect:/passport/login";// session.可能过期
		}
		User user = (User) session.getAttribute("user");

		a.setUserId(user.getId());

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
	 * @Description: 去 发布图片集
	 * @return
	 * @return: String
	 */
	@GetMapping("publishpic")
	public String publishpic() {

		return "my/article/publishpic";

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
	public boolean publish(HttpServletRequest request, ArticleWithBLOBs article, MultipartFile file) {

		if (!file.isEmpty()) {
			// 文件上传路径.把文件放入项目的 /resource/pic 下
			String path = request.getSession().getServletContext().getRealPath("/resource/pic/");
			// 为了防止文件重名.使用UUID 的方式重命名上传的文件
			String oldFilename = file.getOriginalFilename();
			// a.jpg
			String newFilename = UUID.randomUUID() + oldFilename.substring(oldFilename.lastIndexOf("."));
			File f = new File(path, newFilename);
			// 写入硬盘
			try {
				file.transferTo(f);

				article.setPicture(newFilename);// 标题图片
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}

		}
		// 初始化设置
		article.setStatus(0);// 待审核
		HttpSession session = request.getSession(false);
		if (session == null) {
			return false;
		}
		User user = (User) session.getAttribute("user");
		article.setUserId(user.getId());// 发布人
		article.setHits(0);
		article.setHot(0);
		article.setDeleted(0);
		article.setCreated(new Date());
		article.setUpdated(new Date());

		return articleService.insertSelective(article);

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
	@PostMapping("publishpic")
	public boolean publishpic(HttpServletRequest request, ArticleWithBLOBs article, MultipartFile[] files,
			String[] descr) {

		String newFilename = null;
		List<ArticleVO> list = new ArrayList<ArticleVO>();// 用来存放图片的地址和描述
		int i = 0;
		for (MultipartFile file : files) {
			ArticleVO vo = new ArticleVO();
			if (!file.isEmpty()) {
				// 文件上传路径.把文件放入项目的 /resource/pic 下
				String path = request.getSession().getServletContext().getRealPath("/resource/pic/");
				// 为了防止文件重名.使用UUID 的方式重命名上传的文件
				String oldFilename = file.getOriginalFilename();
				// a.jpg
				newFilename = UUID.randomUUID() + oldFilename.substring(oldFilename.lastIndexOf("."));
				File f = new File(path, newFilename);
				vo.setUrl(newFilename);
				vo.setDescr(descr[i]);
				i++;
				list.add(vo);

				// 写入硬盘
				try {
					file.transferTo(f);
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}

			}
		}
		article.setPicture(newFilename);// 标题图片
		Gson gson = new Gson();
		// 使用gson,把java对象转为json
		article.setContent(gson.toJson(list));
		// 初始化设置
		article.setStatus(0);// 待审核
		HttpSession session = request.getSession(false);
		if (session == null) {
			return false;
		}
		User user = (User) session.getAttribute("user");
		article.setUserId(user.getId());// 发布人
		article.setHits(0);
		article.setHot(0);
		article.setDeleted(0);
		article.setCreated(new Date());
		article.setUpdated(new Date());
		// 图片集标识
		article.setContentType(ArticleEnum.IMAGE.getCode());

		return articleService.insertSelective(article);

	}

}
