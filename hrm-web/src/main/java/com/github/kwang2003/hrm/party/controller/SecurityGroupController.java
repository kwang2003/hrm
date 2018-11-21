package com.github.kwang2003.hrm.party.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.kwang2003.hrm.framework.common.Result;
import com.github.kwang2003.hrm.framework.controller.BaseController;
import com.github.kwang2003.hrm.party.entity.SecurityGroup;
import com.github.kwang2003.hrm.party.service.SecurityGroupService;
import com.github.kwang2003.hrm.web.helper.DatatablesView;

@Controller
@RequestMapping("/party/security_group/")
public class SecurityGroupController extends BaseController{
	@Autowired
	private SecurityGroupService securityGroupService;
	@RequestMapping(value="list",method=RequestMethod.GET)
	public String listView(Model model) {
		return "party/security_group/list";
	}

	@ResponseBody
	@RequestMapping(value="list",method=RequestMethod.POST)
	public DatatablesView<SecurityGroup> doList(HttpServletRequest request,Model model) {
		Pageable pageable = createPageable(request);
		String criteria = request.getParameter("criteria");
		Result<Page<SecurityGroup>> result = securityGroupService.find(pageable, criteria);
		return this.convert2DatatablesView(result.getPayload());
	}
	
	@RequestMapping(value="assign_permission",method=RequestMethod.GET)
	public String assignPermissionView(@RequestParam(name="id",required=true)String id, Model model) {
		Result<SecurityGroup> result = securityGroupService.get(id);
		model.addAttribute("id",id);
		model.addAttribute("securityGroup", result.getPayload());
		return "party/security_group/assign_permission";
	}
	
	@ResponseBody
	@RequestMapping(value="assign_permission",method=RequestMethod.POST)
	public DatatablesView<SecurityGroup> doAssignPermission(HttpServletRequest request,Model model) {
		Pageable pageable = createPageable(request);
		String criteria = request.getParameter("criteria");
		Result<Page<SecurityGroup>> result = securityGroupService.find(pageable, criteria);
		return this.convert2DatatablesView(result.getPayload());
	}
}
