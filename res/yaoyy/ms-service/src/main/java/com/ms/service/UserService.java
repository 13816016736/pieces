package com.ms.service;

import com.github.pagehelper.PageInfo;
import com.ms.dao.model.User;
import com.ms.dao.vo.UserVo;

public interface UserService extends ICommonService<User>{

    public PageInfo<UserVo> findByParams(UserVo userVo,Integer pageNum,Integer pageSize);

    public UserVo findByPhone(String phone);

    public UserVo findById(Integer id);

    public void disable(Integer id);

    public void login(String phone, String password);

    public void logout();

    public void loginSms(String phone, String code);

    public void register(String phone, String code, String password);
}
