package com.pieces.biz.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pieces.dao.model.User;
import com.pieces.service.enums.RedisEnum;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.github.pagehelper.PageInfo;
import com.pieces.dao.elasticsearch.document.CommodityDoc;
import com.pieces.dao.model.Category;
import com.pieces.dao.model.Code;
import com.pieces.dao.vo.CategoryVo;
import com.pieces.dao.vo.CommodityVo;
import com.pieces.service.CategoryService;
import com.pieces.service.CommoditySearchService;
import com.pieces.service.CommodityService;
import com.pieces.service.utils.ValidUtils;
import com.pieces.tools.utils.WebUtil;

/**
 * Author: ff 7/19/16. 商品信息
 */
@Controller
@RequestMapping("/commodity")
public class CommodityController extends BaseController {

	@Autowired
	private CommoditySearchService commoditySearchService;

	@Autowired
	CommodityService commodityService;

	@Autowired
	private CategoryService categoryService;

	@Autowired
	private HttpSession session;

	/**
	 * 获取商品列表分页
	 *
	 * @param pageSize
	 * @param pageNum
	 * @param commodityVO
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/index")
	public String index(Integer pageSize, Integer pageNum, CommodityVo commodityVO, ModelMap model) {
		pageNum = pageNum == null ? 1 : pageNum;
		pageSize = pageSize == null ? 10 : pageSize;

		commodityVO.setExecutiveStandardNameStr(formatString(commodityVO.getExecutiveStandardNameStr()));
		commodityVO.setFactoryStr(formatString(commodityVO.getFactoryStr()));

		PageInfo<CommodityVo> pageInfo = null;
		CommodityVo indexParameter = new CommodityVo();
		
		if(commodityVO.getBreedId() != null){
			pageInfo = indexBreed(pageSize, pageNum, commodityVO, indexParameter, model);
		}else{
			pageInfo = indexCategory(pageSize, pageNum, commodityVO, indexParameter, model);
		}
		
		model.put("pageNum", pageNum);
		model.put("pageSize", pageSize);
		model.put("pageInfo", pageInfo);
		if(pageInfo == null){
			model.put("commodity", commodityVO);
			model.put("commodityParam", commodityVO.toString());
			return "product_list";
		}
		
		indexParameter(commodityVO, indexParameter, model);
		
		model.put("commodity", commodityVO);
		model.put("commodityParam", commodityVO.toString());
		return "product_list";
	}
	
	/**
	 * 查询品种列表，及需要参数
	 * @param pageSize
	 * @param pageNum
	 * @param commodityVO
	 * @param indexParameter 封装参数
	 * @param pageInfo
	 * @param model
	 */
	private PageInfo<CommodityVo> indexBreed(Integer pageSize, Integer pageNum, CommodityVo commodityVO, CommodityVo indexParameter, ModelMap model) {
		Category category = categoryService.findById(commodityVO.getBreedId());
		if(category == null){
			return null;
		}
		model.put("category", category);
		Category parent = categoryService.findById(category.getParentId());
		model.put("parent", parent);
		indexParameter.setSpecNameStr(category.getSpecs());
		indexParameter.setOriginOfNameStr(category.getSpecs());
		indexParameter.setLevelNameStr(category.getLevels());
		indexParameter.setBreedIds(category.getId().toString());
		Integer cid = commodityVO.getCategoryId();
		commodityVO.setCategoryId(commodityVO.getBreedId());
		PageInfo<CommodityVo> pageInfo = commodityService.query(commodityVO, pageNum, pageSize);
		commodityVO.setCategoryId(cid);
		return pageInfo;
	}
	
	/**
	 * 查询分类列表及参数
	 * @param pageSize
	 * @param pageNum
	 * @param commodityVO
	 * @param indexParameter
	 * @param pageInfo
	 * @param model
	 * @return
	 */
	private PageInfo<CommodityVo> indexCategory(Integer pageSize, Integer pageNum, CommodityVo commodityVO, CommodityVo indexParameter, ModelMap model) {
		List<CategoryVo> breedList = null;
		String specs = "";
		String origins = "";
		String level = "";
		String breedIds = "";
		if (commodityVO.getCategoryId() != null) {
			Category category = categoryService.findById(commodityVO.getCategoryId());
			breedList = categoryService.findBreedByParentId(commodityVO.getCategoryId());
			model.put("parent", category);
		} else {
			breedList = categoryService.findBreedNoPage(new CategoryVo());
		}
		if (!ValidUtils.listNotBlank(breedList)) {
			return null;
		}
		for (CategoryVo vo : breedList) {
			if (StringUtils.isNotBlank(vo.getSpecs())) {
				specs = specs + vo.getSpecs() + ",";
			}
			if (StringUtils.isNotBlank(vo.getLevels())) {
				level = level + vo.getLevels() + ",";
			}
			if (StringUtils.isNotBlank(vo.getSpecs())) {
				origins = origins + vo.getOrigins() + ",";
			}
			if (StringUtils.isNotBlank(vo.getId().toString())) {
				breedIds = breedIds + vo.getId() + ",";
			}
		}
		specs = specs.substring(0, specs.length() - 1);
		level = level.substring(0, level.length() - 1);
		origins = origins.substring(0, origins.length() - 1);
		breedIds = breedIds.substring(0, breedIds.length() - 1);
		commodityVO.setCategoryIds(breedIds);// 查询分页数据
		Integer cid = commodityVO.getCategoryId();
		commodityVO.setCategoryId(null);
		PageInfo<CommodityVo> pageInfo = new PageInfo<CommodityVo>(commodityService.query(commodityVO, pageNum, pageSize).getList());
		commodityVO.setCategoryId(cid);
		indexParameter.setSpecNameStr(specs);
		indexParameter.setOriginOfNameStr(origins);
		indexParameter.setLevelNameStr(level);
		indexParameter.setBreedIds(breedIds);
		return pageInfo;
	}
	
	/**
	 * 根据参数获取参数数据
	 * @param commodityVO
	 * @param indexParameter
	 * @param model
	 */
	private void indexParameter(CommodityVo commodityVO, CommodityVo indexParameter, ModelMap model) {
		List<String> screens = new ArrayList<String>();
		List<Code> specifications = categoryService.findCodeByString(indexParameter.getSpecNameStr());// 获取品种属性
		List<Code> place = categoryService.findCodeByString(indexParameter.getOriginOfNameStr());
		List<Code> levels = categoryService.findCodeByString(indexParameter.getLevelNameStr());
		setCodeCheck(specifications, commodityVO.getSpecNameStr(), screens);
		setCodeCheck(place, commodityVO.getOriginOfNameStr(), screens);
		setCodeCheck(levels, commodityVO.getLevelNameStr(), screens);
		model.put("specifications", specifications);
		model.put("place", place);
		model.put("levels", levels);

		List<CommodityVo> standards = commodityService.findStandardByBreedId(indexParameter.getBreedIds());// 获取执行标准
		for (CommodityVo vo : standards) {// 设置执行标准是否选中
			if (StringUtils.isNotBlank(commodityVO.getExecutiveStandardNameStr())
					&& commodityVO.getExecutiveStandardNameStr().contains(vo.getExecutiveStandard())) {
				vo.setChecked(true);
				screens.add(vo.getExecutiveStandard());
			} else {
				vo.setChecked(false);
			}
		}

		List<CommodityVo> factorys = commodityService.findFactoryByBreedId(indexParameter.getBreedIds());// 获取生产厂家
		for (CommodityVo vo : factorys) {// 设置生产厂家是否选中
			if (StringUtils.isNotBlank(commodityVO.getFactoryStr())
					&& commodityVO.getFactoryStr().contains(vo.getFactory())) {
				vo.setChecked(true);
				screens.add(vo.getFactory());
			} else {
				vo.setChecked(false);
			}
		}
		model.put("standards", standards);
		model.put("factorys", factorys);
		model.put("screens", screens);
	}

	/**
	 * 处理中文字符串，加单引号
	 *
	 * @param str
	 * @return
	 */
	private String formatString(String str) {
		if (StringUtils.isBlank(str)) {
			return str;
		}

		if (str.indexOf(",") > 0) {
			String[] strs = str.split(",");
			String newStr = "";
			for (int i = 0; i < strs.length; i++) {
				newStr = newStr + "'" + strs[i] + "'" + ",";
			}
			newStr = newStr.substring(0, newStr.length() - 1);
			return newStr;
		} else {
			return "'" + str + "'";
		}

	}

	/**
	 * 设置code是否选中
	 *
	 * @param source
	 *            所有code
	 * @param target
	 *            已选code
	 * @param screens
	 *            页面已筛选
	 */
	private void setCodeCheck(List<Code> source, String target, List<String> screens) {
		if (!ValidUtils.listNotBlank(source) || !StringUtils.isNotBlank(target)) {
			return;
		}

		for (Code code : source) {
			if (target.contains(code.getId().toString())) {
				code.setChecked(true);
				screens.add(code.getName());
			} else {
				code.setChecked(false);
			}
		}
	}

	/**
	 * 搜索并跳转到搜索结果页面
	 *
	 * @param request
	 * @param response
	 * @param pageNum
	 * @param pageSize
	 * @param model
	 * @param keyword
	 * @return
	 */
	@RequestMapping(value = "search")
	public String proResult(HttpServletRequest request, HttpServletResponse response, Integer pageNum, Integer pageSize,
			ModelMap model, String keyword) {
		pageNum = pageNum == null ? 1 : pageNum;
		pageSize = pageSize == null ? 10 : pageSize;
		Page<CommodityDoc> commodityDocPage = commoditySearchService.findByNameOrCategoryName(pageNum, pageSize,
				keyword);
		model.put("commodityDocPage", commodityDocPage);
		model.put("keyword", keyword);
		return "product_search_result";
	}

	/**
	 * 自动补全搜索关键字
	 *
	 * @param request
	 * @param response
	 * @param keyword
	 */
	@RequestMapping(value = "search/auto")
	public void autoComplete(HttpServletRequest request, HttpServletResponse response, String keyword) {
		if (StringUtils.isBlank(keyword)) {
			return;
		}
		List<Map<String, String>> result = commoditySearchService.findByName(keyword);
		WebUtil.print(response, result);
	}

	@RequestMapping(value = "/{id}")
	public String detail(@PathVariable("id") Integer id, ModelMap model) {
		CommodityVo commodity = commodityService.findVoById(id);
		if (commodity == null) {

			// TODO: 商品不存在

			return "redirect:error/404";
		}
		Category category = categoryService.findById(commodity.getCategoryId());
		Category category1 = categoryService.findById(category.getParentId());
		User user = (User) session.getAttribute(RedisEnum.USER_SESSION_BIZ.getValue());
		List<CommodityVo> featured = commodityService.featured(user, category.getId(), category1.getId());
		model.put("category", category1.getName());
		model.put("categoryId", category1.getId());
		model.put("commodity", commodity);
		model.put("featured", featured);

		return "product_detail";
	}

}
