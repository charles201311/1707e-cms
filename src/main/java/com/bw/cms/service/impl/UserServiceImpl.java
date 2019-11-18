package com.bw.cms.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.bobo.common.utils.StringUtil;
import com.bw.cms.dao.UserMapper;
import com.bw.cms.domain.User;
import com.bw.cms.service.UserService;
import com.bw.cms.utils.CMSException;
import com.bw.cms.utils.Md5Util;
import com.bw.cms.vo.UserVO;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class UserServiceImpl implements UserService {
	@Resource
	private UserMapper userMapper ;

	@Override
	public PageInfo<User> selects(User user,Integer page,Integer pageSize) {
		
		PageHelper.startPage(page, pageSize);
		List<User> users = userMapper.selects(user);
		return new PageInfo<User>(users);
	}

	@Override
	public boolean update(User user) {
		try {
			 return userMapper.updateByPrimaryKeySelective(user)>0;
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("操作失败");
		}
	}

	@Override
	public boolean insertSelective(UserVO userVO) {
		
			//判断注册信息是否满足要求
			if(!StringUtil.hasText(userVO.getUsername()))
			 throw new CMSException("用户名不能为空");	
			if(!StringUtil.hasText(userVO.getPassword()))
			 throw new CMSException("密码不能为空");	
			if(!StringUtil.hasText(userVO.getRepassword()))
				 throw new CMSException("确认密码不能为空");
			if(!userVO.getPassword().equals(userVO.getRepassword()))
				 throw new CMSException("两次密码不一致");
			//用户名不能重复注册
			User u = userMapper.selectByName(userVO.getUsername());
			if(null!=u)
				 throw new CMSException("用户名不能重复注册");
			//执行注册
			//对密码进行加密保存
			userVO.setPassword(Md5Util.md5Encoding(userVO.getPassword()));
			return userMapper.insertSelective(userVO)>0;
		
	}

	@Override
	public User login(User user) {
		
		//判断登录注册信息是否满足要求
		if(!StringUtil.hasText(user.getUsername()))
		 throw new CMSException("用户名不能为空");	
		if(!StringUtil.hasText(user.getPassword()))
		 throw new CMSException("密码不能为空");	
		//查询用户名是否存在
		User u = userMapper.selectByName(user.getUsername());
		if(null==u)
			 throw new CMSException("用户名不存在");
		else {
			//对密码进行加密比较
			if(!Md5Util.md5Encoding(user.getPassword()).equals(u.getPassword()))
				throw new CMSException("密码错误!");	
		}
		
		return u;
	}

}
