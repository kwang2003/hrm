package com.github.kwang2003.hrm.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class HrmAuthenticationSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler {

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		log.info("用户ip" + getIpAddress(request));
		User customUserDetails = (User) authentication.getPrincipal();
		log.info("{}",customUserDetails);
//		request.getSession().setAttribute("user", customUserDetails.getUsername());
//		List<SecurityResource> securityResources = securityResourceService
//				.selectResourceByUserId(customUserDetails.getId());// 查询用户所有资源权限
////		log.info("所有权限" + JSON.toJSONString(securityResources));
//		HttpSession session = request.getSession();// 获取session服务
//		StringBuffer sb = new StringBuffer();
//		Map<String, Object> data = new HashMap<>();
//		if (securityResources != null) {
//			for (int i = 0; i < securityResources.size(); i++) {
//				data.put("" + securityResources.get(i).getId(), securityResources.get(i).getId());
//				sb.append("" + securityResources.get(i).getId() + ",");
//			}
//		}
//		session.setAttribute("userOperationsMap", data);
		super.onAuthenticationSuccess(request, response, authentication);
	}

	private String getIpAddress(HttpServletRequest request) {
		String ip = request.getHeader("x-forwarded-for");
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("HTTP_CLIENT_IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("HTTP_X_FORWARDED_FOR");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getRemoteAddr();
		}
		return ip;
	}
}
