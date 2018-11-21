package com.github.kwang2003.hrm.party.dao;

import java.util.List;
import java.util.Map;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Repository;

import com.github.kwang2003.hrm.PageableParamFactory;
import com.github.kwang2003.hrm.framework.dao.AbstractDao;
import com.github.kwang2003.hrm.party.entity.SecurityGroup;

@Repository
public class SecurityGroupDao extends AbstractDao {
	public Page<SecurityGroup> find(Pageable pageable, String criteria) {
		Map<String, Object> params = PageableParamFactory.params(pageable);
		params.put("criteria", criteria);
		long total = this.getSqlSession().selectOne(getNamespacePrefix() + "findPageableCount", params);
		List<SecurityGroup> content = this.getSqlSession().selectList(getNamespacePrefix() + "findPageable", params);
		PageImpl<SecurityGroup> page = new PageImpl<SecurityGroup>(content, pageable, total);
		return page;
	}
	
	public SecurityGroup get(String id) {
		return this.getSqlSession().selectOne(getNamespacePrefix() + "selectByPrimaryKey", id);
	}
}
