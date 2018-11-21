package com.github.kwang2003.hrm.party.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.github.kwang2003.hrm.framework.common.Result;
import com.github.kwang2003.hrm.party.entity.PartyType;

public interface PartyTypeService {
	Result<PartyType> get(String id);
	
	Result<List<PartyType>> getAll();
	
	Result<Page<PartyType>> find(Pageable pageable,String criteria);
}
