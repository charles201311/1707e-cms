package com.bw.cms.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.bobo.common.utils.StringUtil;
import com.bw.cms.dao.LinksMapper;
import com.bw.cms.domain.Links;
import com.bw.cms.service.LinksService;
import com.bw.cms.utils.CMSAjaxException;
import com.bw.cms.utils.PageUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class LinksServiceImpl implements LinksService {

	@Resource
	private LinksMapper linksMapper;

	@Override
	public boolean insert(Links links) {
		// 调用工具类判断是否是有效URL
		if (!StringUtil.isHttpUrl(links.getUrl()))
			throw new CMSAjaxException(1, "不是有效的url");
		links.setCreated(new Date());
		linksMapper.insert(links);

		return true;

	}

	@Override
	public PageInfo<Links> selects(Integer page, Integer pageSize) {
		PageHelper.startPage(page, pageSize);
		List<Links> list = linksMapper.selects();
		return new PageInfo<Links>(list);
	}

}
