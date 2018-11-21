package com.github.kwang2003.hrm.party.entity;

import com.github.kwang2003.hrm.framework.entity.BaseEntity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString(callSuper=true)
public class PartyType extends BaseEntity<String>{
	private static final long serialVersionUID = -4733254329055832884L;
	private String description;
	private String parentId;
}
