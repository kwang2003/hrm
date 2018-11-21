package com.github.kwang2003.hrm.party.service.impl;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;

import com.github.kwang2003.hrm.AbstractTestCase;
import com.github.kwang2003.hrm.framework.common.Result;
import com.github.kwang2003.hrm.party.entity.SecurityPermission;
import com.github.kwang2003.hrm.party.service.SecurityPermissionService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
class SecurityPermissionServiceImplTest extends AbstractTestCase {
	@Autowired
	private SecurityPermissionService securityPermissionService;
	@Test
	void testFind() {
		PageRequest pageable = PageRequest.of(1, 20);
		String criteria = null;
		Result<Page<SecurityPermission>> result = securityPermissionService.find(pageable, criteria);
		Page<SecurityPermission> page = result.getPayload();
		log.info("{}",page);
		page.get().forEach(securityPermission -> log.info(securityPermission.getId()));
	}

}
