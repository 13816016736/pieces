package com.ms.biz.shiro;

import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.authz.AuthorizationFilter;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import java.io.IOException;

/**
 * 用于验证身份信息
 *
 */
public class BizAuthorizationFilter extends AuthorizationFilter {

	@Override
	public boolean isAccessAllowed(ServletRequest request, ServletResponse response, Object mappedValue)
			throws IOException {
		Subject subject = getSubject(request, response);
		// 先判断是否需要重新登录
		if (subject.getPrincipal() == null) {
			return false;
		}
		return true;
	}

}
