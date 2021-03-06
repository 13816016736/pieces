package com.pieces.boss.controller;

import com.github.pagehelper.PageInfo;
import com.pieces.boss.commons.LogConstant;
import com.pieces.dao.model.Article;
import com.pieces.dao.model.ArticleCategory;
import com.pieces.dao.model.Member;
import com.pieces.dao.vo.ArticleVo;
import com.pieces.service.ArticleService;
import com.pieces.service.constant.bean.Result;
import com.pieces.service.enums.ModelEnum;
import com.pieces.service.enums.RedisEnum;
import com.pieces.service.enums.StatusEnum;
import com.pieces.tools.annotation.SecurityToken;
import com.pieces.tools.log.annotation.BizLog;
import com.pieces.tools.utils.Reflection;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.List;

/**
 * Author: koabs
 * 8/5/16.
 * 帮助中心
 */
@Controller
@RequestMapping("cms/")
public class CMSController extends BaseController{

    @Autowired
    ArticleService articleService;

    @Autowired
    HttpSession httpSession;

    /**
     * 文章列表页面
     * model 1=help,2=news
     * @return
     */
    @RequiresPermissions(value = {"single:index","post:index"},logical = Logical.OR)
    @RequestMapping(value = "article/index", method = RequestMethod.GET)
    @BizLog(type = LogConstant.cms, desc = "文章列表页面")
    public String index(ArticleVo articleVo, Integer pageSize, Integer pageNum, ModelMap model){
        String url = "";

        pageNum=pageNum==null?1:pageNum;
        pageSize=pageSize==null?10:pageSize;
        PageInfo<ArticleVo> pageInfo = articleService.queryArticle(articleVo, pageNum, pageSize);

        List<ArticleCategory> categories = articleService.getCategoryByModelId(articleVo.getModel(), StatusEnum.enable.getValue());
        model.put("categorys",categories);
        model.put("pageNum", pageNum);
        model.put("pageSize", pageSize);
        model.put("pageInfo", pageInfo);
        model.put("vo", articleVo);
        model.put("param", Reflection.serialize(articleVo));

        if (articleVo.getModel().equals(ModelEnum.help.getValue())) {
            url = "help";
        } else {
            url = "news";
        }
        return url;
    }

    /**
     * 添加文章
     * @return
     */
    @RequiresPermissions(value = {"single:index","post:index"},logical = Logical.OR)
    @RequestMapping(value = "article/add", method = RequestMethod.GET)
    @BizLog(type = LogConstant.cms, desc = "添加文章")
    @SecurityToken(generateToken = true)
    public String add(Integer model, ModelMap modelMap){
        String url = "";

        List<ArticleCategory> categories = articleService.getCategoryByModelId(model, StatusEnum.enable.getValue());
        modelMap.put("categorys",categories);
        modelMap.put("model", model);

        return ModelEnum.getUrl("detail-add",model);
    }


    /**
     * 文章详情
     * @param id
     * @param modelMap
     * @return
     */
    @RequiresPermissions(value = {"single:index","post:index"},logical = Logical.OR)
    @RequestMapping(value = "article/detail/{id}", method = RequestMethod.GET)
    @BizLog(type = LogConstant.cms, desc = "文章详情")
    @SecurityToken(generateToken = true)
    public String detail(@PathVariable("id") Integer id, ModelMap modelMap){

        Article article = articleService.findArticleById(id);
        modelMap.put("article",article);
        List<ArticleCategory> categories = articleService.getCategoryByModelId(article.getModel(), StatusEnum.enable.getValue());
        modelMap.put("categorys",categories);

        return ModelEnum.getUrl("detail-editer", article.getModel());
    }


    /**
     * 删除文章
     * @param id
     * @return
     */
    @RequiresPermissions(value = {"single:index","post:index"},logical = Logical.OR)
    @RequestMapping(value = "article/delete/{id}", method = RequestMethod.POST)
    @ResponseBody
    @BizLog(type = LogConstant.cms, desc = "删除文章")
    public Result delete (@PathVariable("id") Integer id){
        articleService.deleteArticleById(id);
        return new Result(true).info("删除成功!");
    }

    /**
     * 保存文章
     * @param article
     * @return
     */
    @RequiresPermissions(value = {"single:index","post:index"},logical = Logical.OR)
    @RequestMapping(value = "article/save", method = RequestMethod.POST)
    @ResponseBody
    @BizLog(type = LogConstant.cms, desc = "保存文章")
    @SecurityToken(validateToken=true)
    public Result save (@Valid Article article){
        Member mem = (Member)httpSession.getAttribute(RedisEnum.MEMBER_SESSION_BOSS.getValue());
        articleService.saveOrUpdateArticle(article, mem.getId());
        return new Result(true).info("保存成功!");
    }

    /**
     * 类别列表页面
     * model 1=help,2=news
     * @return
     */
    @RequiresPermissions(value = {"single:category","post:category"},logical = Logical.OR)
    @RequestMapping(value = "category/index", method = RequestMethod.GET)
    @BizLog(type = LogConstant.cms, desc = "文章列表页面")
    public String categoryIndex(ArticleCategory category, Integer pageSize, Integer pageNum, ModelMap modelMap){

        pageNum=pageNum==null?1:pageNum;
        pageSize=pageSize==null?10:pageSize;
        PageInfo<ArticleCategory> pageInfo = articleService.queryCategory(category, pageNum, pageSize);
        modelMap.put("pageInfo", pageInfo);
        modelMap.put("vo", category);
        modelMap.put("param", Reflection.serialize(category));

        return ModelEnum.getUrl("category", category.getModel());
    }

    /**
     * 新增类别页面
     * @param model
     * @param modelMap
     * @return
     */
    @RequiresPermissions(value = {"single:category","post:category"},logical = Logical.OR)
    @RequestMapping(value = "category/add", method = RequestMethod.GET)
    @BizLog(type = LogConstant.cms, desc = "新增文章类别页面")
    @SecurityToken(generateToken = true)
    public String addCategory(Integer model, ModelMap modelMap) {
        modelMap.put("model", model);

        return ModelEnum.getUrl("category-add", model);
    }


    /**
     * 保存类别信息
     * @param category
     * @return
     */
    @RequiresPermissions(value = {"single:category","post:category"},logical = Logical.OR)
    @RequestMapping(value = "category/save", method = RequestMethod.POST)
    @ResponseBody
    @BizLog(type = LogConstant.cms, desc = "保存文章类别信息")
    @SecurityToken(validateToken=true)
    public Result saveCategory(@Valid ArticleCategory category) {
        Member mem = (Member)httpSession.getAttribute(RedisEnum.MEMBER_SESSION_BOSS.getValue());
        articleService.saveOrUpdateCategory(category, mem.getId());
        return new Result(true).info("保存成功");
    }

    /**
     * 修改类别页面
     * @return
     */
    @RequiresPermissions(value = {"single:category","post:category"},logical = Logical.OR)
    @RequestMapping(value = "category/detail/{id}", method = RequestMethod.GET)
    @BizLog(type = LogConstant.cms, desc = "修改文章类别")
    @SecurityToken(generateToken = true)
    public String categoryDetail(@PathVariable("id")Integer id, ModelMap modelMap){
        ArticleCategory category = articleService.getCategoryById(id);
        modelMap.put("category", category);
        return  ModelEnum.getUrl("category-editer", category.getModel());
    }


    /**
     * 删除类别
     * @param id
     * @return
     */
    @RequiresPermissions(value = {"single:category","post:category"},logical = Logical.OR)
    @RequestMapping(value = "category/delete/{id}", method = RequestMethod.POST)
    @ResponseBody
    @BizLog(type = LogConstant.cms, desc = "删除文章类别")
    public Result deleteCategory (@PathVariable("id") Integer id){
        Result result = null;
        if (articleService.getArticleByCategoryId(id).size() > 0) {
            result = new Result(false).info("请先删除该分类下的所有文章");
        } else {
            articleService.deleteCategory(id);
            result = new Result(true).info("删除成功!");
        }
        return result;
    }

}
