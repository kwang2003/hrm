package com.github.kwang2003.hrm.party.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.github.kwang2003.hrm.framework.common.Result;
import com.github.kwang2003.hrm.party.dao.SecurityPermissionDao;
import com.github.kwang2003.hrm.party.entity.SecurityPermission;
import com.github.kwang2003.hrm.party.service.SecurityPermissionService;

@Service
public class SecurityPermissionServiceImpl implements SecurityPermissionService {
	@Autowired
	private SecurityPermissionDao securityPermissionDao;

	@Override
	public Result<Page<SecurityPermission>> find(Pageable pageable,String criteria){
		Page<SecurityPermission> page = securityPermissionDao.find(pageable, criteria);
		return Result.successResult(page);
	}
	@Override
	public Result<Page<SecurityPermission>> findGroupPermission(Pageable pageable, String groupId) {
		Page<SecurityPermission> page = securityPermissionDao.findGroupPermission(pageable, groupId);
		return Result.successResult(page);
	}
	@Override
	public Result<Page<SecurityPermission>> findCandidateGroupPermissionPageable(Pageable pageable, String groupId) {
		Page<SecurityPermission> page = securityPermissionDao.findCandidateGroupPermission(pageable, groupId);
		return Result.successResult(page);
	}
	
}
