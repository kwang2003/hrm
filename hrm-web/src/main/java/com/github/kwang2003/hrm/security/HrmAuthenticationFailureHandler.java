package com.github.kwang2003.hrm.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class HrmAuthenticationFailureHandler extends SimpleUrlAuthenticationFailureHandler implements InitializingBean{
	private String defaultFailureUrl = "/login?error";
	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		log.error(exception.getMessage());
		super.onAuthenticationFailure(request, response, exception);
	}
	@Override
	public void afterPropertiesSet() throws Exception {
		setDefaultFailureUrl(defaultFailureUrl);
	}

}
