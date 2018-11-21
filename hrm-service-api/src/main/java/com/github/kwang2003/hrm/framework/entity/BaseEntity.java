package com.github.kwang2003.hrm.framework.entity;

import java.io.Serializable;
import java.util.Date;

import lombok.Data;

@Data
public class BaseEntity<T> implements Serializable{
	private static final long serialVersionUID = 1050247497240889154L;
	private T id;
	private Date createdAt;
	private Date updatedAt;
}
