package com.itheima.core.web.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.itheima.core.po.User;
import com.itheima.core.service.UserService;

/**
 * 用户控制器类
 */
@Controller
public class UserController {
	// 依赖注入
	@Autowired
	private UserService userService;

	/**
	 * 用户登录
	 */
	@RequestMapping(value = "/login.action", method = RequestMethod.POST)
	public String login(User user, Model model, HttpSession session) {
		if ((session.getAttribute("goddess").toString()).equals("angelababy")) {
			return "login";
		}
		// 通过账号和密码查询用户
		User user1 = userService.findUser1(user);// manager
		User user2 = userService.findUser2(user);// leader
		User user3 = userService.findUser3(user);// student
		if ((user1 != null) && (user1.getRemark() == 3)) {
			Date date = new Date();
			String date1 = user1.getDate();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd HH:mm:ss");
			Date date2 = null;
			try {
				date2 = sdf.parse(date1);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			if ((date.getTime() - date2.getTime()) < 10 * 60 * 1000) {
				model.addAttribute("msg", "密码输入错误 3次！一天之内禁止登陆！");
				// 返回到登录页面
				return "login";
			} else {
				User user11 = new User();
				user11.setRemark(0);
				user11.setUser_code(user1.getUser_code());
				session.setAttribute("USER_SESSION", user1);
				userService.updateManagerByCode(user11);
				return "redirect:product/last.action";
			}
		}
		if ((user2 != null) && (user2.getRemark() == 3)) {
			Date date = new Date();
			String date1 = user2.getDate();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd HH:mm:ss");
			Date date2 = null;
			try {
				date2 = sdf.parse(date1);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			if ((date.getTime() - date2.getTime()) < 10 * 60 * 1000) {
				model.addAttribute("msg", "密码输入错误 3次！一天之内禁止登陆！");
				// 返回到登录页面
				return "login";
			} else {
				User user11 = new User();
				user11.setRemark(0);
				user11.setUser_code(user2.getUser_code());
				session.setAttribute("USER_SESSION", user1);
				userService.updateLeaderByCode(user11);
				return "redirect:customer/list.action";
			}
		}
		if ((user3 != null) && (user3.getRemark() == 3)) {
			Date date = new Date();
			String date1 = user3.getDate();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd HH:mm:ss");
			Date date2 = null;
			try {
				date2 = sdf.parse(date1);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			if ((date.getTime() - date2.getTime()) < 10 * 60 * 1000) {
				model.addAttribute("msg", "密码输入错误 3次！一天之内禁止登陆！");
				// 返回到登录页面
				return "login";
			} else {
				User user11 = new User();
				user11.setRemark(0);
				user11.setUser_code(user3.getUser_code());
				session.setAttribute("USER_SESSION", user1);
				userService.updateStudentByCode(user11);
				return "redirect:product/last.action";
			}
		}
		if (user1 != null) {
			User user11 = new User();
			user11.setRemark(0);
			user11.setUser_code(user1.getUser_code());
			userService.updateManagerByCode(user11);
			// 将用户对象添加到Session
			session.setAttribute("USER_SESSION", user1);
			// 跳转到主页面
			// return "customer"
			return "redirect:product/last.action";
		} else {
			if (user2 != null) {
				User user11 = new User();
				user11.setRemark(0);
				user11.setUser_code(user2.getUser_code());
				userService.updateLeaderByCode(user11);
				// 将用户对象添加到Session
				session.setAttribute("USER_SESSION", user2);
				// 跳转到主页面
				return "redirect:product/last.action";
			} else if (user3 != null) {
				User user11 = new User();
				user11.setRemark(0);
				user11.setUser_code(user3.getUser_code());
				// 将用户对象添加到Session
				session.setAttribute("USER_SESSION", user3);
				// 跳转到主页面
				return "redirect:customer/list.action";
			} else {
				String user_code = user.getUser_code();
				User user11 = new User();
				user11.setUser_code(user_code);
				User user_1 = userService.findUser1(user11);// manager
				User user_2 = userService.findUser2(user11);// leader
				User user_3 = userService.findUser3(user11);// student
				if (user_1 != null) {
					int remark = user_1.getRemark();
					if (remark == 3) {
						Date date = new Date();
						String date1 = user_1.getDate();
						SimpleDateFormat sdf = new SimpleDateFormat(
								"yyyyMMdd HH:mm:ss");
						Date date2 = null;
						try {
							date2 = sdf.parse(date1);
						} catch (ParseException e) {
							e.printStackTrace();
						}
						if ((date.getTime() - date2.getTime()) < 10 * 60 * 1000) {
							model.addAttribute("msg", "密码输入错误 3次！一天之内禁止登陆！");
							// 返回到登录页面
							return "login";
						} else {
							User user111 = new User();
							user111.setRemark(1);
							user111.setUser_code(user_1.getUser_code());
							userService.updateManagerByCode(user111);
							model.addAttribute("msg", "密码输入错误1次");
							return "login";
						}
					}
					if (remark == 2) {
						remark = remark + 1;
						Date date = new Date();
						SimpleDateFormat sdf = new SimpleDateFormat(
								"yyyyMMdd HH:mm:ss");
						String date1 = sdf.format(date);
						User user111 = new User();
						user111.setDate(date1);
						user111.setRemark(remark);
						user111.setUser_code(user_1.getUser_code());
						userService.updateManagerByCode(user111);
						model.addAttribute("msg", "密码输入错误" + remark + "次");
						// 返回到登录页面
						return "login";
					} else {
						remark = remark + 1;
						String usercode1 = user_1.getUser_code();
						User user111 = new User();
						user111.setUser_code(usercode1);
						user111.setRemark(remark);
						int row = userService.updateManagerByCode(user111);
						model.addAttribute("msg", "密码输入错误" + remark + "次！");
						// 返回到登录页面
						return "login";
					}
				} else if (user_2 != null) {
					int remark = user_2.getRemark();
					if (remark == 3) {
						Date date = new Date();
						String date1 = user_2.getDate();
						SimpleDateFormat sdf = new SimpleDateFormat(
								"yyyyMMdd HH:mm:ss");
						Date date2 = null;
						try {
							date2 = sdf.parse(date1);
						} catch (ParseException e) {
							e.printStackTrace();
						}
						if ((date.getTime() - date2.getTime()) < 10 * 60 * 1000) {
							model.addAttribute("msg", "密码输入错误 3次！一天之内禁止登陆！");
							// 返回到登录页面
							return "login";
						} else {
							User user111 = new User();
							user111.setRemark(1);
							user111.setUser_code(user_2.getUser_code());
							userService.updateLeaderByCode(user111);
							model.addAttribute("msg", "密码输入错误1次");
							return "login";
						}
					}
					if (remark == 2) {
						remark = remark + 1;
						Date date = new Date();
						SimpleDateFormat sdf = new SimpleDateFormat(
								"yyyyMMdd HH:mm:ss");
						String date1 = sdf.format(date);
						User user111 = new User();
						user111.setDate(date1);
						user111.setRemark(remark);
						user111.setUser_code(user_2.getUser_code());
						userService.updateLeaderByCode(user111);
						model.addAttribute("msg", "密码输入错误" + remark + "次");
						// 返回到登录页面
						return "login";
					} else {
						remark = remark + 1;
						String usercode1 = user_2.getUser_code();
						User user111 = new User();
						user111.setUser_code(usercode1);
						user111.setRemark(remark);
						int row = userService.updateLeaderByCode(user111);
						model.addAttribute("msg", "密码输入错误" + remark + "次！");
						// 返回到登录页面
						return "login";
					}

				} else if (user_3 != null) {
					int remark = user_3.getRemark();
					if (remark == 3) {
						Date date = new Date();
						String date1 = user_3.getDate();
						SimpleDateFormat sdf = new SimpleDateFormat(
								"yyyyMMdd HH:mm:ss");
						Date date2 = null;
						try {
							date2 = sdf.parse(date1);
						} catch (ParseException e) {
							e.printStackTrace();
						}
						if ((date.getTime() - date2.getTime()) < 10 * 60 * 1000) {
							model.addAttribute("msg", "密码输入错误 3次！一天之内禁止登陆！");
							// 返回到登录页面
							return "login";
						} else {
							User user111 = new User();
							user111.setRemark(1);
							user111.setUser_code(user_3.getUser_code());
							userService.updateStudentByCode(user111);
							model.addAttribute("msg", "密码输入错误1次");
							return "login";
						}
					}
					if (remark == 2) {
						remark = remark + 1;
						Date date = new Date();
						SimpleDateFormat sdf = new SimpleDateFormat(
								"yyyyMMdd HH:mm:ss");
						String date1 = sdf.format(date);
						User user111 = new User();
						user111.setDate(date1);
						user111.setRemark(remark);
						user111.setUser_code(user_3.getUser_code());
						userService.updateStudentByCode(user111);
						model.addAttribute("msg", "密码输入错误" + remark + "次");
						// 返回到登录页面
						return "login";
					} else {
						remark = remark + 1;
						String usercode1 = user_3.getUser_code();
						User user111 = new User();
						user111.setUser_code(usercode1);
						user111.setRemark(remark);
						int row = userService.updateStudentByCode(user111);
						model.addAttribute("msg", "密码输入错误" + remark + "次！");
						// 返回到登录页面
						return "login";
					}

				}
				model.addAttribute("msg", "您输入的用户不存在！");
				// 返回到登录页面
				return "login";
			}
		}
	}

	/**
	 * 模拟其他类中跳转到客户管理页面的方法
	 */
	@RequestMapping(value = "/toCustomer.action")
	public String toCustomer() {
		return "customer";
	}

	/**
	 * 退出登录
	 */
	@RequestMapping(value = "/logout.action")
	public String logout(HttpSession session) {
		// 清除Session
		session.invalidate();
		// 重定向到登录页面的跳转方法
		return "redirect:login.action";
	}

	/**
	 * 向用户登陆页面跳转
	 */
	@RequestMapping(value = "/login.action", method = RequestMethod.GET)
	public String toLogin() {
		return "login";
	}

}
