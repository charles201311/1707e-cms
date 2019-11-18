package com.bw.cms.dao;

import java.util.List;

import com.bw.cms.domain.User;

public interface UserMapper {
	/**
	 * 
	 * @Title: selects 
	 * @Description: 用户列表
	 * @param user
	 * @return
	 * @return: List<User>
	 */
	List<User> selects(User user);
	/**
	 * 
	 * @Title: selectByName 
	 * @Description: 按照用户名精确查找
	 * @param username
	 * @return
	 * @return: User
	 */
	User selectByName(String username);
	
    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
}