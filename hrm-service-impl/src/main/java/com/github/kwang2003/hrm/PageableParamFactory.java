package com.github.kwang2003.hrm;

import java.util.Map;

import org.springframework.data.domain.Pageable;

import com.google.common.collect.Maps;

public class PageableParamFactory {
	public static Map<String, Object> params(Pageable pageable){
		Map<String, Object> params = Maps.newHashMap();
		params.put("pageable", pageable);
		return params;
	}
}
