package com.github.kwang2003.hrm.party.service.impl;

import static com.google.common.base.Preconditions.checkArgument;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.github.kwang2003.hrm.framework.common.Result;
import com.github.kwang2003.hrm.party.dao.SecurityGroupDao;
import com.github.kwang2003.hrm.party.entity.SecurityGroup;
import com.github.kwang2003.hrm.party.service.SecurityGroupService;
import com.google.common.base.Strings;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class SecurityGroupServiceImpl implements SecurityGroupService {
	@Autowired
	private SecurityGroupDao securityGroupDao;

	@Override
	public Result<SecurityGroup> get(String id) {
		log.info("{}", id);
		try {
			checkArgument(!Strings.isNullOrEmpty(id),"ID不能为空");
		} catch (IllegalArgumentException e) {
			return Result.failResult(e.getMessage());
		}
		SecurityGroup securityGroup = securityGroupDao.get(id);
		return Result.successResult(securityGroup);
	}

	@Override
	public Result<Page<SecurityGroup>> find(Pageable pageable, String criteria) {
		log.info("pageNumber={},pageSize={},criteria=", pageable.getPageNumber(), pageable.getPageSize(), criteria);
		Page<SecurityGroup> page = securityGroupDao.find(pageable, criteria);
		return Result.successResult(page);
	}
}
