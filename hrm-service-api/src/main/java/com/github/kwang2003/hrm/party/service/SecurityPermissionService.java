package com.github.kwang2003.hrm.party.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.github.kwang2003.hrm.framework.common.Result;
import com.github.kwang2003.hrm.party.entity.SecurityPermission;

public interface SecurityPermissionService {
	Result<Page<SecurityPermission>> find(Pageable pageable,String criteria);
	Result<Page<SecurityPermission>> findGroupPermission(Pageable pageable, String groupId);
	/**
	 * 获取某个权限组可以被分配的权限列表
	 * @param pageable
	 * @param groupId
	 * @return
	 */
	Result<Page<SecurityPermission>> findCandidateGroupPermissionPageable(Pageable pageable, String groupId);
}
