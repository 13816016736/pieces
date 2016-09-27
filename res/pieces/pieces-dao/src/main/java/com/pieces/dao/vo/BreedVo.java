package com.pieces.dao.vo;

import org.hibernate.validator.constraints.NotEmpty;

import javax.validation.constraints.Pattern;

public class BreedVo {
	private Integer id;
	//类别id
	@NotEmpty
	private Integer classifyId;
	//类别中文
	private String classifyName;
	//名称
	@NotEmpty
	private String name;
	//别名
	@NotEmpty
	@Pattern(regexp = "^[,，\\u4E00-\\u9FA5]+$")
	private String aliases;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getClassifyId() {
		return classifyId;
	}

	public void setClassifyId(Integer classifyId) {
		this.classifyId = classifyId;
	}

	public String getClassifyName() {
		return classifyName;
	}

	public void setClassifyName(String classifyName) {
		this.classifyName = classifyName;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAliases() {
		return aliases;
	}

	public void setAliases(String aliases) {
		this.aliases = aliases;
	}
	
	
	
}
