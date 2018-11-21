package com.github.kwang2003.hrm.framework.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;

import com.github.kwang2003.hrm.web.helper.DatatablesView;
import com.google.common.base.Strings;

public class BaseController {
	protected Pageable createPageable(HttpServletRequest request) {
		String page = request.getParameter("start");
		String size = request.getParameter("length");
		if(Strings.isNullOrEmpty(page)) {
			page = "0";
		}
		if(Strings.isNullOrEmpty(size)) {
			size = "20";
		}
		PageRequest pageRequest = PageRequest.of((int)(Integer.valueOf(page)/Integer.valueOf(size)), Integer.valueOf(size));
		return pageRequest;
	}
	
	protected <T> DatatablesView<T> convert2DatatablesView(Page<T> page){
		DatatablesView<T> view = new DatatablesView<>();
		view.setData(page.getContent());
		view.setRecordsTotal(page.getTotalElements());
//		view.setDraw(draw);
		return view;
	}
}
