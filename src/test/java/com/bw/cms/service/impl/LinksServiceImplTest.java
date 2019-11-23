package com.bw.cms.service.impl;

import static org.junit.Assert.*;

import javax.annotation.Resource;

import org.junit.Test;

import com.bw.cms.domain.Links;
import com.bw.cms.service.LinksService;

public class LinksServiceImplTest  extends JunitParent{

	@Resource
	private LinksService linksService;
	@Test
	public void testInsert() {
		Links links = new Links();
		links.setUrl("https://www.toutiao.com/");
		links.setText("头条");
		linksService.insert(links);
		
		
		/*
		 * Links links = new Links(); links.setUrl("bushi/"); links.setText("头条");
		 * linksService.insert(links);
		 */
	}

	@Test
	public void testSelects() {
	}

}
