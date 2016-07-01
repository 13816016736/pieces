package com.pieces.biz.shiro;

import org.apache.shiro.authc.UsernamePasswordToken;

/**
 *  BizToken
 */
public class BizToken extends UsernamePasswordToken {
	
	private String validationCode;

	public String getValidationCode() {
		return validationCode;
	}

	public void setValidationCode(String validationCode) {
		this.validationCode = validationCode;
	}

	
	public BizToken(String username, String password, boolean rememberMe,
			String host, String validationCode) {
		super(username, password, rememberMe, host);
		this.validationCode = validationCode;
	}
}
