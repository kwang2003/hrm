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
import com.github.kwang2003.hrm.party.entity.SecurityPermission;
import com.github.kwang2003.hrm.party.service.SecurityPermissionService;
import com.github.kwang2003.hrm.web.helper.DatatablesView;

@Controller
@RequestMapping("/party/security_permission/")
public class SecurityPermissionController extends BaseController{
	@Autowired
	private SecurityPermissionService securityPermissionService;
	@RequestMapping(value="list",method=RequestMethod.GET)
	public String listView(Model model) {
		return "party/security_permission/list";
	}

	@ResponseBody
	@RequestMapping(value="list",method=RequestMethod.POST)
	public DatatablesView<SecurityPermission> doList(HttpServletRequest request,Model model) {
		Pageable pageable = createPageable(request);
		String criteria = request.getParameter("criteria");
		Result<Page<SecurityPermission>> result = securityPermissionService.find(pageable, criteria);
		return this.convert2DatatablesView(result.getPayload());
	}
	
	@ResponseBody
	@RequestMapping(value="assigned_permissions",method=RequestMethod.POST)
	public DatatablesView<SecurityPermission> assignedPermissions(HttpServletRequest request,@RequestParam(name="groupId",required=true)String groupId) {
		Pageable pageable = createPageable(request);
		Result<Page<SecurityPermission>> result = securityPermissionService.findGroupPermission(pageable, groupId);
		return this.convert2DatatablesView(result.getPayload());
	}
	
	@ResponseBody
	@RequestMapping(value="candidate_permissions",method=RequestMethod.POST)
	public DatatablesView<SecurityPermission> candidatePermissions(HttpServletRequest request,@RequestParam(name="groupId",required=true)String groupId) {
		Pageable pageable = createPageable(request);
		Result<Page<SecurityPermission>> result = securityPermissionService.findCandidateGroupPermissionPageable(pageable, groupId);
		return this.convert2DatatablesView(result.getPayload());
	}
}
