package com.pieces.boss.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pieces.boss.commons.LogConstant;
import com.pieces.boss.shiro.BossToken;
import com.pieces.dao.model.AccountBill;
import com.pieces.dao.model.Member;
import com.pieces.service.*;
import com.pieces.service.constant.bean.Result;
import com.pieces.service.enums.RedisEnum;
import com.pieces.tools.utils.CommonUtils;
import com.pieces.tools.log.annotation.BizLog;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.util.WebUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.ParseException;

/**
 * BOSS系统首页和登录
 * Created by wangbin on 2016/6/28.
 */
@Controller
public class HomeController extends BaseController{


    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private MemberService memberService;

    @Autowired
    private UserService userService;

    @Autowired
    private EnquiryBillsService enquiryBillsService;

    @Autowired
    private OrderFormService orderFormService;

    @Autowired
    private AccountBillService accountBillService;

    @Autowired
    private PayRecordService payRecordService;

    @Autowired
    private RecruitAgentService recruitAgentService;

    @Autowired
    CertifyRecordService certifyRecordService;

    @RequestMapping(value = "/")
    public String index(ModelMap model) throws ParseException {
        //1.今日注册用户
        model.put("newUser",userService.countNewUser());
        //2.今日新增询价
        model.put("newEnquiry",enquiryBillsService.countNewEnquiryBill());
        //3.今日新增订单
        model.put("newOrder",orderFormService.countOrderNew());
        //4.最新询价 enquiryBillsService
        model.put("enquiryList",enquiryBillsService.findByParam(null,1,10));
        //5.最新订单 orderFormService
        model.put("orderList",orderFormService.findByParams(null,1,10));
        //6.最新支付 paymentService
        model.put("paymentList",payRecordService.findByParams(null,1,10));
        //7.最新账期申请 accountBillService
        model.put("billList",accountBillService.findByParams(null,1,10));
        //8.最新认证申请 certifyRecordService
        model.put("certifyList",certifyRecordService.findByParams(null,1,10));
        //9.最新合作伙伴申请 recruitAgentService
        model.put("recruitList",recruitAgentService.findByParams(null,1,10));

        return "home";
    }

    /**
     * 登录页面
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/login",method = RequestMethod.GET)
    public String login(HttpServletRequest request,
                        HttpServletResponse response) {
        return "login";
    }


    /**
     *
     * @param request
     * @param response
     * @param username
     * @param password
     */
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    @BizLog(type = LogConstant.user, desc = "用户登入")
    @ResponseBody
    public Result loginSubmit(HttpServletRequest request,
                            HttpServletResponse response,
                            @RequestParam(required = true) String username,
                            @RequestParam(required = true) String password) {

        Subject subject = SecurityUtils.getSubject();
        BossToken token = new BossToken(username, password, false, CommonUtils.getRemoteHost(request), "");
        try {
            subject.login(token);
        } catch (Exception e) {
            logger.info("subject.login Exception {} ",e.getMessage());
            return  new Result(false).info("用户名密码错误!");
        }

        // 存入用户信息到session
        Member mem = memberService.findByUsername(token.getUsername());
		Session s = subject.getSession();
		s.setAttribute(RedisEnum.MEMBER_SESSION_BOSS.getValue(), mem);
		Result result = new Result(true);
        String url="/";
        if ( WebUtils.getSavedRequest(request) != null) {
            url =  WebUtils.getSavedRequest(request).getRequestUrl();
            if(url.equals("/favicon.ico")){
                url="/";
            }
        }
		return result.data(url);
    }

}
