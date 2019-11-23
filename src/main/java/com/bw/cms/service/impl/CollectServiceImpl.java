package com.bw.cms.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.bobo.common.utils.StringUtil;
import com.bw.cms.dao.CollectMapper;
import com.bw.cms.domain.Collect;
import com.bw.cms.domain.User;
import com.bw.cms.service.CollectService;
import com.bw.cms.utils.CMSAjaxException;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class CollectServiceImpl implements CollectService {
	@Resource
	private CollectMapper collectMapper;

	@Override
	public boolean insert(Collect collect) {
		if(!StringUtil.isHttpUrl(collect.getUrl()))
			throw new CMSAjaxException(1, "不是有效的URL");
		collect.setCreated(new Date());
		collectMapper.insert(collect);
		return true;
	}

	@Override
	public PageInfo<Collect> selects(Integer page,Integer pageSize ,User user) {
		PageHelper.startPage(page, pageSize);
		List<Collect> list = collectMapper.selects( user);
		return new PageInfo<Collect>(list);
	}

	@Override
	public boolean deleteById(Integer id) {
		collectMapper.deleteById(id);
		return true;
	}

	@Override
	public int selectByText(String text, User user) {
		return collectMapper.selectByText(text, user);
	}

}
