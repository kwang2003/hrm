package com.github.kwang2003.hrm.party.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.github.kwang2003.hrm.framework.common.Result;
import com.github.kwang2003.hrm.party.dao.PartyTypeDao;
import com.github.kwang2003.hrm.party.entity.PartyType;
import com.github.kwang2003.hrm.party.service.PartyTypeService;

import lombok.Setter;

@Service
public class PartyTypeServiceImpl implements PartyTypeService {
	@Setter
	@Autowired
	private PartyTypeDao partyTypeDao;
	@Override
	public Result<PartyType> get(String id) {
		PartyType partyType = partyTypeDao.get(id);
		return Result.successResult(partyType);
	}
	@Override
	public Result<List<PartyType>> getAll() {
		List<PartyType> list = partyTypeDao.getAll();
		return Result.successResult(list);
	}
	@Override
	public Result<Page<PartyType>> find(Pageable pageable,String criteria){
		Page<PartyType> page = partyTypeDao.find(pageable, criteria);
		return Result.successResult(page);
	}

}
