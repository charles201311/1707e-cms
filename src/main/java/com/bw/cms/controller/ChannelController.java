package com.bw.cms.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bw.cms.domain.Channel;
import com.bw.cms.service.ChannelService;
/**
 * 
 * @ClassName: ChannelController 
 * @Description: 栏目
 * @author: charles
 * @date: 2019年11月14日 下午4:06:13
 */
@RequestMapping("channel")
@Controller
public class ChannelController {
	
	@Resource
	private ChannelService channelService;

	/**
	 * 
	 * @Title: channels 
	 * @Description: 所有栏目
	 * @return
	 * @return: List<Channel>
	 */
	@ResponseBody
	@RequestMapping("channels")
	public List <Channel> channels(){
		
		return channelService.selects();
		
	}
}
