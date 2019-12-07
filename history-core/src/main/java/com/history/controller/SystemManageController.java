package com.history.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="system")
public class SystemManageController {
	
	@RequestMapping(value="manage")
	public String toSystemManege () {
		
		return "system/manage";
	}
	
}
