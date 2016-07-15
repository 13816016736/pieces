package com.pieces.boss.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.pieces.dao.model.Category;
import com.pieces.dao.vo.BreedVo;
import com.pieces.dao.vo.CategoryVo;
import com.pieces.service.CategoryService;
import com.pieces.service.constant.bean.Result;
import com.pieces.tools.utils.GsonUtil;
import com.pieces.tools.utils.WebUtil;

@Controller
public class CategoryController {
	
	@Autowired
	private CategoryService categoryService;
	
	/**
	 * 分类列表
	 * @param request
	 * @param response
	 * @param pageNum
	 * @param pageSize
	 * @param categoryName
	 * @param status
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/category/list" ,method = RequestMethod.GET)
	public String getCategory(HttpServletRequest request,
							  HttpServletResponse response,
							  Integer pageNum,
							  Integer pageSize,
							  String name,
							  String status,
							  ModelMap model){
		
		pageNum = pageNum==null?1:pageNum;
		pageSize = pageSize==null?10:pageSize;
		CategoryVo t = new CategoryVo();
		t.setName(name);
		t.setStatus(status);
		PageInfo<Category> categoryPage = categoryService.findClassify(t, pageNum, pageSize);
		model.put("categoryPage", categoryPage);
		model.put("categoryParams", t.toString());
		model.put("category", t);
		return "category";
	}
	
	/**
	 * 分类列表
	 * @param request
	 * @param response
	 * @param pageNum
	 * @param pageSize
	 * @param categoryName
	 * @param status
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/category/list" ,method = RequestMethod.POST)
	public void getAllCategory(HttpServletRequest request,
							  HttpServletResponse response,
							  ModelMap model){
		
		CategoryVo t = new CategoryVo();
		t.setStatus("1");
		List<Category> categorys = categoryService.findClassify(t);
        String result = GsonUtil.toJsonInclude(categorys, "id", "name");
        WebUtil.printJson(response, result);
	}
	
	/**
	 * 添加分类
	 * @param request
	 * @param response
	 * @param categoryName
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/category/add")
	public String addCategory(HttpServletRequest request,
							  HttpServletResponse response){
		return "category_add";
	}
	
	/**
	 * 修改分类
	 * @param request
	 * @param response
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/category/edit/{id}")
	public String editCategory(HttpServletRequest request,
							  HttpServletResponse response,
							  @PathVariable("id") Integer id,
							  ModelMap model){
		Category category = categoryService.findById(id);
		model.put("category", category);
		return "category_edit";
	}
	
	/**
	 * 删除分类
	 * @param request
	 * @param response
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/category/delete/{id}")
	public void deleteCategory(HttpServletRequest request,
							  HttpServletResponse response,
							  @PathVariable("id") Integer id,
							  ModelMap model){
		Category category = new Category();
		category.setId(id);
		category.setStatus(0);
		categoryService.update(category);
		Result result = new Result(true);
        WebUtil.printJson(response, result);
	}
	
	/**
	 * 保存分类，id为空新增，id不为空修改
	 * @param request
	 * @param response
	 * @param id
	 * @param categoryName
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/category/save")
	public void saveCategory(HttpServletRequest request,
							  HttpServletResponse response,
							  String id,
							  String name,
							  ModelMap model){
		if(StringUtils.isNotBlank(name)){
			if(StringUtils.isNotBlank(id)){
				categoryService.updateClassify(name, Integer.parseInt(id));
			}else{
				categoryService.addClassify(name);
			}
		}
		Result result = new Result(true);
        WebUtil.printJson(response, result);
	}
	
	/**
	 * 品种列表
	 * @param request
	 * @param response
	 * @param pageNum
	 * @param pageSize
	 * @param categoryName
	 * @param status
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/breed/list")
	public String getBreed(HttpServletRequest request,
							  HttpServletResponse response,
							  Integer pageNum,
							  Integer pageSize,
							  CategoryVo vo,
							  ModelMap model){
		
		pageNum = pageNum==null?1:pageNum;
		pageSize = pageSize==null?10:pageSize;
		PageInfo<CategoryVo> categoryPage = categoryService.findBreed(vo, pageNum, pageSize);
		model.put("categoryPage", categoryPage);
		model.put("categoryParams", vo.toString());
		model.put("category", vo);
		return "breed";
		
	}
	
	/**
	 * 添加品种
	 * @param request
	 * @param response
	 * @param categoryName
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/breed/add")
	public String addBreed(HttpServletRequest request,
							  HttpServletResponse response){
		return "breed_add";
	}
	
	/**
	 * 修改品种
	 * @param request
	 * @param response
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/breed/edit/{id}")
	public String addBreed(HttpServletRequest request,
							  HttpServletResponse response,
							  @PathVariable("id") Integer id,
							  ModelMap model){
		BreedVo breed = categoryService.getBreedById(id);
		model.put("breed", breed);
		return "breed_edit";
	}
	
	/**
	 * 保存品种，id为空新增，id不为空修改
	 * @param request
	 * @param response
	 * @param id
	 * @param categoryName
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/breed/save")
	public String saveBreed(HttpServletRequest request,
							  HttpServletResponse response,
							  BreedVo bvo,
							  ModelMap model){
		if(StringUtils.isNotBlank(bvo.getId())){
			categoryService.updateBreed(bvo);
		}else{
			categoryService.addBreed(bvo);
		}
		return "redirect:/breed/list";
	}
	
	/**
	 * 删除品种
	 * @param request
	 * @param response
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/breed/delete/{id}")
	public String deleteBreed(HttpServletRequest request,
							  HttpServletResponse response,
							  @PathVariable("id") Integer id,
							  ModelMap model){
		Category category = new Category();
		category.setId(id);
		category.setStatus(0);
		categoryService.update(category);
		return "redirect:/breed/list";
	}
}
