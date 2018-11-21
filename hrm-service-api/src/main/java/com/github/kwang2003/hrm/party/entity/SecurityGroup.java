package com.github.kwang2003.hrm.party.entity;

import com.github.kwang2003.hrm.framework.entity.BaseEntity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString(callSuper=true)
public class SecurityGroup extends BaseEntity<String> {
	private static final long serialVersionUID = -3492223157867345470L;
	private String description;
}
