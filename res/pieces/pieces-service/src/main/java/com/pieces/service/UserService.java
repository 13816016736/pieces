package com.pieces.service;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.github.pagehelper.PageInfo;
import com.pieces.dao.model.User;
import com.pieces.dao.vo.UserVo;
import com.pieces.service.dto.UserValidate;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;

/**
 * 前台用户service
 * @author feng
 *
 */
public interface UserService extends ICommonService<User>{
	List<User> findUserByCondition(User user);
	
	PageInfo<User> findUserByVagueCondition(User user,Integer pageNum, Integer pageSize);

	int addUser(User user);

	int updateUser(User user);
	
	User createPwdAndSaltMd5(User user);

	User getPwdAndSaltMd5(User user);
	
	int updateUserByCondition(User user);
	
	boolean ifExistMobile(String contactMobile);
	
	boolean checkUserName(String userName);

	User findByUserName(String userName);
	
	boolean checkMobileCode(String targetMobileCode);

	PageInfo<User> findByCondition(UserVo userVo, Integer pageNum, Integer pageSize);

	PageInfo<UserVo> findVoByCondition(UserVo userVo, Integer pageNum, Integer pageSize);

	/**
	 * 新建订单时选择客户来源
	 * @param userVo
	 * @param pageNum
	 * @param pageSize
     * @return
     */
	PageInfo<UserVo> findProxyUser(UserVo userVo, Integer pageNum, Integer pageSize);

	/**
	 * 根据代理商ID 查询代理的所有用户
	 * @param proxId
	 * @return
     */
	List<UserVo> findUserByProxy(Integer proxId);


	public void login(Subject subject, UsernamePasswordToken token);

	UserVo findVoById(Integer id);

	/**
	 * 根据时间查找更新的user
	 * @param updateTime
	 * @return
	 */
	List<UserVo> findUpdateUser(Date updateTime);

	/**
	 * 根据手机号或用户名查找user
	 * @param accountName
	 * @return
	 */
	User findByAccount(String accountName);


	/**
	 *姓名和手机后台自动生成一个新用户
	 */
	int generateUser(User user);

	/**
	 * 检查用户是否能下单
	 * @param user
	 * @return
     */
	UserValidate validateUser(User user);
}
