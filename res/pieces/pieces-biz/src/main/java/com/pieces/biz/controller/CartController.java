package com.pieces.biz.controller;

import com.pieces.service.CartsCommodityService;
import com.pieces.service.CommodityService;
import com.pieces.service.EnquiryBillsService;
import com.pieces.service.EnquiryCommoditysService;
import com.pieces.service.constant.bean.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

/**
 * Created by xiao on 2017/2/21.
 */

/**
 * 购物车操作以及页面
 */
@Controller
@RequestMapping("/cart")
public class CartController {



       private static final int COOKIE_EXPIRE = 3600;

       @Autowired
       HttpSession httpSession;

       @Autowired
       CartsCommodityService cartsCommodityService;

       @Autowired
       private EnquiryBillsService enquiryBillsService;

       @Autowired
       private CommodityService commodityService;

       @Autowired
       private EnquiryCommoditysService enquiryCommoditysService;


       /**
        * 购物车主页
        * @param modelMap
        * @return
        */
       @RequestMapping("/index")
       public String index(ModelMap modelMap){
              modelMap.put("cartHide",true);
              return "cart_index";
       }

       /**
        * 获取购物车列表
        * @param modelMap
        * @return
        */
       @RequestMapping(value = "/list",method = RequestMethod.POST)
       @ResponseBody
       public Result list(ModelMap modelMap){
              return new Result(true).info("list");
       }

       @RequestMapping(value = "/delete",method = RequestMethod.POST)
       @ResponseBody
       public Result delete(Integer commodityId){
              return new Result(true).info("删除成功");
       }


       @RequestMapping(value = "/submit",method = RequestMethod.POST)
       @ResponseBody
       public Result submit(Integer commodityId){
              return new Result(true).info("提交询价成功");
       }
















}
