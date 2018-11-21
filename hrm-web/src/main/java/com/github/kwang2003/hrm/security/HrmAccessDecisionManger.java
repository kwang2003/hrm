package com.github.kwang2003.hrm.security;

import java.util.Collection;

import org.springframework.security.access.AccessDecisionManager;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.authentication.InsufficientAuthenticationException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.FilterInvocation;
import org.springframework.stereotype.Component;
import org.springframework.util.CollectionUtils;

import com.google.common.base.Strings;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class HrmAccessDecisionManger implements AccessDecisionManager {
	@Override
	public void decide(Authentication authentication, Object o, Collection<ConfigAttribute> configAttributes)
			throws AccessDeniedException, InsufficientAuthenticationException {
		FilterInvocation fi = (FilterInvocation) o;
		log.info("AccessDecisionManager decide url==" + fi.getRequestUrl());
		log.info("该请求所需权限:" + configAttributes);
		log.info("用户拥有权限:" + authentication.getAuthorities());
		if (!CollectionUtils.isEmpty(configAttributes) && !CollectionUtils.isEmpty(authentication.getAuthorities())) {
			for (ConfigAttribute ca : configAttributes) {
				if (Strings.isNullOrEmpty(ca.getAttribute())) {
					continue;
				}
				for (GrantedAuthority ga : authentication.getAuthorities()) {
					if (ca.getAttribute().equals(ga.getAuthority())) {
						return;
					}
				}
			}
		}
		log.info("AccessDecisionManager decide 结束");
		throw new AccessDeniedException("权限不足");
	}

	@Override
	public boolean supports(ConfigAttribute configAttribute) {
		return true;
	}

	@Override
	public boolean supports(Class<?> aClass) {
		return true;
	}
}