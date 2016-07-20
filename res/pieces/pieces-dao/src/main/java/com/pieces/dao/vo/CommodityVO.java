package com.pieces.dao.vo;

import java.io.Serializable;
import java.util.Date;


public class CommodityVO implements Serializable {

	private static final long serialVersionUID = 1L;

	private Integer id;

	//商品名称
	private String name;

	//切制规格
	private Integer spec;

	private String specName;
	
	private String specNameStr;

	//原药产地
	private Integer originOf;

	private String originOfName;
	
	private String originOfNameStr;

	//执行标准
	private String executiveStandard;

	private String executiveStandardName;
	
	private String executiveStandardNameStr;

	// 商品等级
	private Integer level;

	private String levelName;

	//生产厂家
	private String factory;
	
	private String factoryStr;

	//外观描述
	private String exterior;

	//商品图片地址
	private String pictureUrl;

	//详细信息
	private String details;

	private Integer status;

	//与商品相关联的二级品种ID
	private Integer categoryId;

	private String categoryName;

	private Date createTime;
	
	//设置商品列表页面该code是否选中
	private boolean checked;

	public CommodityVO(){}
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public Integer getSpec() {
		return spec;
	}

	public void setSpec(Integer spec) {
		this.spec = spec;
	}
	
	public Integer getOriginOf() {
		return originOf;
	}

	public void setOriginOf(Integer originOf) {
		this.originOf = originOf;
	}
	
	public String getExecutiveStandard() {
		return executiveStandard;
	}

	public void setExecutiveStandard(String executiveStandard) {
		this.executiveStandard = executiveStandard;
	}
	
	public String getFactory() {
		return factory;
	}

	public void setFactory(String factory) {
		this.factory = factory;
	}
	
	public String getExterior() {
		return exterior;
	}

	public void setExterior(String exterior) {
		this.exterior = exterior;
	}
	
	public String getPictureUrl() {
		return pictureUrl;
	}

	public void setPictureUrl(String pictureUrl) {
		this.pictureUrl = pictureUrl;
	}
	
	public String getDetails() {
		return details;
	}

	public void setDetails(String details) {
		this.details = details;
	}
	
	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}
	
	public Integer getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}
	
	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getSpecName() {
		return specName;
	}

	public void setSpecName(String specName) {
		this.specName = specName;
	}

	public String getOriginOfName() {
		return originOfName;
	}

	public void setOriginOfName(String originOfName) {
		this.originOfName = originOfName;
	}

	public Integer getLevel() {
		return level;
	}

	public void setLevel(Integer level) {
		this.level = level;
	}

	public String getLevelName() {
		return levelName;
	}

	public void setLevelName(String levelName) {
		this.levelName = levelName;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public String getSpecNameStr() {
		return specNameStr;
	}

	public void setSpecNameStr(String specNameStr) {
		this.specNameStr = specNameStr;
	}

	public String getOriginOfNameStr() {
		return originOfNameStr;
	}

	public void setOriginOfNameStr(String originOfNameStr) {
		this.originOfNameStr = originOfNameStr;
	}

	public String getExecutiveStandardNameStr() {
		return executiveStandardNameStr;
	}

	public void setExecutiveStandardNameStr(String executiveStandardNameStr) {
		this.executiveStandardNameStr = executiveStandardNameStr;
	}

	public String getFactoryStr() {
		return factoryStr;
	}

	public void setFactoryStr(String factoryStr) {
		this.factoryStr = factoryStr;
	}

	public boolean isChecked() {
		return checked;
	}

	public void setChecked(boolean checked) {
		this.checked = checked;
	}
	
	
}