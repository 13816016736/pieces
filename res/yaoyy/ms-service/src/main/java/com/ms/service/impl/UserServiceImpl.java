package com.ms.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.google.common.base.Strings;
import com.ms.dao.ICommonDao;
import com.ms.dao.UserDao;
import com.ms.dao.enums.UserEnum;
import com.ms.dao.model.User;
import com.ms.dao.model.UserDetail;
import com.ms.dao.vo.UserVo;
import com.ms.service.UserDetailService;
import com.ms.service.UserService;
import com.ms.service.dto.Password;
import com.ms.service.enums.RedisEnum;
import com.ms.service.redis.RedisManager;
import com.ms.service.sms.SmsUtil;
import com.ms.service.utils.EncryptUtil;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Service
public class UserServiceImpl  extends AbsCommonService<User> implements UserService{

	@Autowired
	private UserDao userDao;
	@Autowired
	private UserDetailService userDetailService;


	@Autowired
	private SmsUtil smsUtil;

	@Autowired
	private RedisManager redisManager;


	@Override
	public PageInfo<UserVo> findByParams(UserVo userVo,Integer pageNum,Integer pageSize) {
		if (pageNum == null || pageSize == null) {
			pageNum = 1;
			pageSize = 10;
		}
		PageHelper.startPage(pageNum, pageSize);
		List<UserVo> list = userDao.findByParams(userVo);
		PageInfo page = new PageInfo(list);
		return page;
	}


	@Override
	public UserVo findByPhone(String phone) {
            return userDao.findByPhone(phone);
	}

	public UserVo findByOpenId(String openId){
		return userDao.findByOpenId(openId);
	}

	@Override
	public UserVo findById(Integer id) {
		UserVo vo = new UserVo();
		vo.setId(id);
		return userDao.findByParams(vo).get(0);
	}

	@Override
	@Transactional
	public void disable(Integer id) {
		User user =new User();
		user.setId(id);
		user.setType(UserEnum.disable.getType());
		userDao.update(user);
	}

	@Override
	@Transactional
	public void enable(Integer id) {
		User user =new User();
		user.setId(id);
		user.setType(UserEnum.enable.getType());
		userDao.update(user);
	}

	@Override
	public void login(Subject subject, UsernamePasswordToken token) {
		User user = findByPhone(token.getUsername());

		try{
			subject.login(token);
		}catch(Exception e){
			e.printStackTrace();
			throw new RuntimeException("登入失败!");
		}

		user.setPassword(null);
		user.setSalt(null);
		Session s = subject.getSession();
		s.setAttribute(RedisEnum.USER_SESSION_BIZ.getValue(), user);
	}

	@Override
	public void logout() {
		SecurityUtils.getSubject().logout();
	}

	@Override
	@Transactional
	public User loginSms(String phone, String code) {
		String rcode = redisManager.get(RedisEnum.KEY_MOBILE_CAPTCHA_LOGIN.getValue()+phone);
		if (!code.equalsIgnoreCase(rcode)) {
			throw new RuntimeException("验证码错误");
		}

		User user =  findByPhone(phone);

		if (user == null) {
			user = new User();
			user.setPhone(phone);
			user.setType(UserEnum.auto.getType());
			user.setCreateTime(new Date());
			user.setUpdateTime(new Date());
			create(user);
		}

		return user;
	}

	@Override
	@Transactional
	public void register(String phone, String code, String password) {

		if (findByPhone(phone) != null) {
			throw new RuntimeException("电话号码已经存在");
		}

		String rcode = redisManager.get(RedisEnum.KEY_MOBILE_CAPTCHA_REGISTER.getValue()+phone);

		if (!code.equalsIgnoreCase(rcode)) {
			throw new RuntimeException("验证码错误");
		}
		User user = new User();
		user.setPhone(phone);
		user.setType(UserEnum.enable.getType());
		user.setCreateTime(new Date());
		user.setUpdateTime(new Date());
		Password pass = EncryptUtil.PiecesEncode(password);
		user.setPassword(pass.getPassword());
		user.setSalt(pass.getSalt());
		create(user);
	}

	@Override
	@Transactional
	public User registerWechat(String phone, String openId, String nickname, String headImgUrl) {
		User user = findByPhone(phone);
		if(user!=null){
			user.setOpenid(openId);
			update(user);
		}else{
			user = new User();
			user.setPhone(phone);
			user.setOpenid(openId);
			user.setType(UserEnum.enable.getType());
			user.setCreateTime(new Date());
			user.setUpdateTime(new Date());
			create(user);
		}

		UserDetail userDetail  = userDetailService.findByUserId(user.getId());
		if(userDetail==null){
			userDetail = new UserDetail();
			userDetail.setType(0);
			userDetail.setUserId(user.getId());
			userDetail.setPhone(phone);
			userDetail.setNickname(nickname);
			userDetail.setHeadImgUrl(headImgUrl);
		}else {
			userDetail.setHeadImgUrl(headImgUrl);
		}
		userDetailService.save(userDetail);
		return user;
	}



	@Override
	public void sendRegistSms(String phone) {
		try {
			smsUtil.sendRegistCaptcha(phone);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void sendLoginSms(String phone) {
		try {
			smsUtil.sendLoginCaptcha(phone);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void sendResetPasswordSms(String phone) {
		try {
			smsUtil.sendResetPasswordSms(phone);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	@Transactional
	public void resetPassword(String phone, String code, String password) {
		String rcode = redisManager.get(RedisEnum.KEY_MOBILE_RESET_PASSWORD.getValue()+phone);

		if (!code.equalsIgnoreCase(rcode)) {
			throw new RuntimeException("验证码错误");
		}

		User user = findByPhone(phone);
		Password pass = EncryptUtil.PiecesEncode(password);
		user.setPassword(pass.getPassword());
		user.setSalt(pass.getSalt());
		user.setUpdateTime(new Date());
		userDao.update(user);
	}


	@Override
	public ICommonDao<User> getDao() {
		return userDao;
	}




}
