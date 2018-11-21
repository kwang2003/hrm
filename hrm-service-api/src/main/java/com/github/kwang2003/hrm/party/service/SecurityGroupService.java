package com.github.kwang2003.hrm.party.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.github.kwang2003.hrm.framework.common.Result;
import com.github.kwang2003.hrm.party.entity.SecurityGroup;

public interface SecurityGroupService {
	Result<Page<SecurityGroup>> find(Pageable pageable,String criteria);
	Result<SecurityGroup> get(String id);
}
