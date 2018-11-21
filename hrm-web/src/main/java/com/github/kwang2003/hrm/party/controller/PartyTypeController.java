package com.github.kwang2003.hrm.party.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.kwang2003.hrm.framework.common.Result;
import com.github.kwang2003.hrm.framework.controller.BaseController;
import com.github.kwang2003.hrm.party.entity.PartyType;
import com.github.kwang2003.hrm.party.service.PartyTypeService;
import com.github.kwang2003.hrm.web.helper.DatatablesView;

@Controller
@RequestMapping("/party/party_type/")
public class PartyTypeController extends BaseController{
	@Autowired
	private PartyTypeService partyTypeService;
	@RequestMapping(value="list",method=RequestMethod.GET)
	public String list(Model model) {
		return "party/party_type/list";
	}
	
	@ResponseBody
	@RequestMapping(value="list",method=RequestMethod.POST)
	public DatatablesView<PartyType> doList(HttpServletRequest request,Model model) {
		Pageable pageable = createPageable(request);
		String criteria = request.getParameter("criteria");
		Result<Page<PartyType>> result = partyTypeService.find(pageable, criteria);
		return this.convert2DatatablesView(result.getPayload());
	}
}
