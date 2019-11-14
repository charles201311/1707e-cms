package com.bw.cms.service;

import java.util.List;

import com.bw.cms.domain.Category;

public interface CategoryService {

	/**
	 * 
	 * @Title: selectsByChannelId 
	 * @Description: 根据栏目查询分类
	 * @param channelId
	 * @return
	 * @return: List<Category>
	 */
	List<Category> selectsByChannelId(Integer channelId);
}
