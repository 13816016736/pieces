package com.pieces.boss.shiro;

import com.pieces.dao.model.Member;
import org.apache.shiro.authc.UsernamePasswordToken;

/**
 *  BossToken
 */
public class BossToken extends UsernamePasswordToken {

	private Member member;

	private String validationCode;

	public String getValidationCode() {
		return validationCode;
	}

	public void setValidationCode(String validationCode) {
		this.validationCode = validationCode;
	}

	
	public BossToken(String username, String password, boolean rememberMe,
			String host, String validationCode) {
		super(username, password, rememberMe, host);
		this.validationCode = validationCode;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}
}
