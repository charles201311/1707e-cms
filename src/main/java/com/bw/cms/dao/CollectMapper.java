package com.bw.cms.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bw.cms.domain.Collect;
import com.bw.cms.domain.User;
/**
 * 
 * @ClassName: CollectMapper 
 * @Description: 收藏
 * @author: charles
 * @date: 2019年11月23日 上午9:23:16
 */
public interface CollectMapper {
	/**
	 * 
	 * @Title: insert 
	 * @Description: 增加
	 * @param links
	 * @return
	 * @return: int
	 */
	int insert(Collect Collect);
	/**
	 * 
	 * @Title: selects 
	 * @Description: 列表
	 * @return
	 * @return: List<Links>
	 */
    List<Collect> selects(User user);
    
    /**
     * 
     * @Title: selectByText 
     * @Description: 根据登录人和文章标题查询是否收藏
     * @param text
     * @return
     * @return: int
     */
    int selectByText(@Param("text")String text ,@Param("user")User user);
    /**
     * 
     * @Title: deleteById 
     * @Description: 删除收藏
     * @param id
     * @return
     * @return: int
     */
    int deleteById(Integer id);
    
}
