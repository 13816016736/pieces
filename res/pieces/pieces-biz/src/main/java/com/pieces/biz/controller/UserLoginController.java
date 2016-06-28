package com.pieces.biz.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pieces.biz.shiro.BizToken;
import com.pieces.dao.model.User;
import com.pieces.service.UserService;
import com.pieces.service.enums.RedisEnum;
import com.pieces.service.vo.TestUserVo;

@Controller(value = "userLoginController")
@RequestMapping
public class UserLoginController{
	
	@Autowired
	private UserService userService;
	
    public TestUserVo getUserInfo(HttpServletRequest request){

    	return null;
    }
    
	@RequestMapping(value = "/logout")
	public String logout(ModelMap model) {
		// 使用权限管理工具进行用户的退出，跳出登录，给出提示信息
		SecurityUtils.getSubject().logout();
		return "redirect:/login";
	}

	@RequestMapping(value = "/login")
	@ResponseBody
	public String login(Model model,String userName,String password,HttpServletRequest request) {
		// 页面数据验证逻辑
		try {
			// 登陆验证
			Subject subject = SecurityUtils.getSubject();
			BizToken token = new BizToken(userName, password, false, userService.getRemoteHost(request), "");
			subject.login(token);
			// 存入用户信息到session
			User tu = new User();
			tu.setUserName(token.getUsername());
			List<User> users = userService.findUserByCondition(tu);
			BeanUtils.copyProperties(users.get(0), tu);
			tu.setId(users.get(0).getId());
			tu.setPassword(null);
			tu.setSalt(null);
			Session s = subject.getSession();
			s.setAttribute(RedisEnum.USER_SESSION_BOSS.getValue(), tu);
			return "ok";
		} catch (Exception e) {
			e.printStackTrace();
			return "false";
		}
	}
	
	@RequestMapping(value = "/toLogin")
	public String toLogin(Model model,HttpServletRequest request) {
		return "login";
	}
	
	@RequestMapping(value = "/toFindPassword")
	public String toFindPassword(Model model,HttpServletRequest request) {
		return "find_password";
	}

	@RequestMapping(value = "/findPasswordOne")
	@ResponseBody
	public String findPasswordOne(Model model,String username,String mobile,String mobileCode) {
		User user = new User();
		user.setUserName(username);
		List<User> users = userService.findUserByCondition(user);
		if(user!=null&&users.size() != 0){
			if(users.get(0).getContactMobile().equals(mobile)){
				if(userService.checkMobileCode(mobileCode)){
					return "ok";
				}
			}
		}
		return "false";
	}
}
