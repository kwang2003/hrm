package com.github.kwang2003.hrm.party.entity;

import java.io.Serializable;
import java.util.Date;

import lombok.Data;

@Data
public class PartyTypeAttr implements Serializable{
	private static final long serialVersionUID = -3612614607879967712L;
	private String partyTypeId;
	private String attrName;
	private String descripton;
	private Date createdAt;
	private Date updatedAt;
}
