package com.github.kwang2003.hrm.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/")
public class LoginController {
	@RequestMapping(value="login",method= {RequestMethod.GET})
	public String login() {
		return "login";
	}
	
	@RequestMapping(value="index.html",method= {RequestMethod.GET})
	public String index() {
		return "index";
	}
	
	@RequestMapping(value="exception.html",method= {RequestMethod.GET})
	public String exception() {
		throw new RuntimeException("故意的");
	}
}
