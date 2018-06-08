package com.itheima.core.service.impl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.itheima.core.dao.UserDao;
import com.itheima.core.po.User;
import com.itheima.core.service.UserService;
/**
 * 用户Service接口实现类
 */
@Service("userService")
@Transactional
public class UserServiceImpl implements UserService {
	// 注入UserDao
	@Autowired
	private UserDao userDao;
	// 通过账号和密码查询用户
	public User findUser1(User user) {
		User user1 = this.userDao.findUser1(user);
		return user1;
	}
	public User findUser2(User user) {
		User user1 = this.userDao.findUser2(user);
		return user1;
	}
	public User findUser3(User user) {
		User user1 = this.userDao.findUser3(user);
		return user1;
	}
	public int updateManagerByCode(User user) {
        int row = this.userDao.updateManagerByCode(user);
		return row;
	}
	public int updateLeaderByCode(User user) {
		int row = this.userDao.updateLeaderByCode(user);
		return row;
	}
	
	public int updateStudentByCode(User user) {
		int row = this.userDao.updateStudentByCode(user);
		return row;
	}
	
	
	  
}
