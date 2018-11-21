package com.github.kwang2003.hrm.party.dao;

import java.util.List;
import java.util.Map;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Repository;

import com.github.kwang2003.hrm.PageableParamFactory;
import com.github.kwang2003.hrm.framework.dao.AbstractDao;
import com.github.kwang2003.hrm.party.entity.PartyType;

@Repository
public class PartyTypeDao extends AbstractDao{
	public PartyType get(String id) {
		return this.getSqlSession().selectOne(getNamespacePrefix()+"selectByPrimaryKey",id);
	}
	
	public List<PartyType> getAll(){
		return this.getSqlSession().selectList(getNamespacePrefix()+"getAll");
	}
	
	public Page<PartyType> find(Pageable pageable,String criteria){
		Map<String, Object> params = PageableParamFactory.params(pageable);
		params.put("criteria", criteria);
		long total = this.getSqlSession().selectOne(getNamespacePrefix()+"findPageableCount",params);
		List<PartyType> content = this.getSqlSession().selectList(getNamespacePrefix()+"findPageable",params);
		PageImpl<PartyType> page = new PageImpl<PartyType>(content, pageable, total);
		return page;
	}
}
