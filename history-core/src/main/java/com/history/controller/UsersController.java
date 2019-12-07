package com.history.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.history.service.UsersService;

//@Controller
@RequestMapping(value="users")
public class UsersController {
	
	@Autowired
	private UsersService usersService;
	
	@RequestMapping(value = "getUser"/* ,method=RequestMethod.POST */)
	public @ResponseBody
	Map<String, Object> queryUsersList() {
		Map<String, Object> users = usersService.getUsersByUsername("zx");
		
		return users;
	}

}
