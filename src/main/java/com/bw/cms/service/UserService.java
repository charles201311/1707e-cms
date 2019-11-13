package com.bw.cms.service;

import com.bw.cms.domain.User;
import com.github.pagehelper.PageInfo;

public interface UserService {

	/**
	 * 
	 * @Title: selects 
	 * @Description: 用户列表
	 * @param user
	 * @return
	 * @return: List<User>
	 */
	 PageInfo<User> selects(User user,Integer page,Integer pageSize);
	
}
