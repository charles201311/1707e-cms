package com.bw.cms.dao;

import java.util.List;

import com.bw.cms.domain.Links;

public interface LinksMapper {
	/**
	 * 
	 * @Title: insert 
	 * @Description: 增加
	 * @param links
	 * @return
	 * @return: int
	 */
	int insert(Links links);
	/**
	 * 
	 * @Title: selects 
	 * @Description: 列表
	 * @return
	 * @return: List<Links>
	 */
    List<Links> selects();
}
