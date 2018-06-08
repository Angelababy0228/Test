package com.itheima.core.dao;
import com.itheima.core.po.User;
/**
 * 用户DAO层接口
 */
public interface UserDao {
	/**
	 * 通过账号和密码查询用户
	 */
	public User findUser1(User user);
	public User findUser2(User user);
	public User findUser3(User user);
	public int updateManagerByCode(User user);
	public int updateLeaderByCode(User user);
	public int updateStudentByCode(User user);
}
