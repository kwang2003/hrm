package com.github.kwang2003.hrm.party.dao;

import java.util.List;
import java.util.Map;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Repository;

import com.github.kwang2003.hrm.PageableParamFactory;
import com.github.kwang2003.hrm.framework.dao.AbstractDao;
import com.github.kwang2003.hrm.party.entity.SecurityPermission;

@Repository
public class SecurityPermissionDao extends AbstractDao {
	public Page<SecurityPermission> find(Pageable pageable,String criteria){
		Map<String, Object> params = PageableParamFactory.params(pageable);
		params.put("criteria", criteria);
		long total = this.getSqlSession().selectOne(getNamespacePrefix()+"findPageableCount",params);
		List<SecurityPermission> content = this.getSqlSession().selectList(getNamespacePrefix()+"findPageable",params);
		PageImpl<SecurityPermission> page = new PageImpl<SecurityPermission>(content, pageable, total);
		return page;
	}

	public Page<SecurityPermission> findGroupPermission(Pageable pageable, String groupId) {
		Map<String, Object> params = PageableParamFactory.params(pageable);
		params.put("groupId", groupId);
		long total = this.getSqlSession().selectOne(getNamespacePrefix() + "findGroupPermissionPageableCount", params);
		List<SecurityPermission> content = this.getSqlSession().selectList(getNamespacePrefix() + "findGroupPermissionPageable", params);
		PageImpl<SecurityPermission> page = new PageImpl<SecurityPermission>(content, pageable, total);
		return page;
	}
	
	public Page<SecurityPermission> findCandidateGroupPermission(Pageable pageable, String groupId) {
		Map<String, Object> params = PageableParamFactory.params(pageable);
		params.put("groupId", groupId);
		long total = this.getSqlSession().selectOne(getNamespacePrefix() + "findCandidateGroupPermissionPageableCount", params);
		List<SecurityPermission> content = this.getSqlSession().selectList(getNamespacePrefix() + "findCandidateGroupPermissionPageable", params);
		PageImpl<SecurityPermission> page = new PageImpl<SecurityPermission>(content, pageable, total);
		return page;
	}
}
