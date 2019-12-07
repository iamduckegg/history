package com.history.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.history.entity.UsersEntity;
import com.history.mapper.UsersMapper;
import com.history.service.UsersService;

@Service
public class UsersServiceImpl implements UsersService{
	
	@Resource
	private UsersMapper usersMapper;

	@Override
	public List<UsersEntity> selcetUsersList() {
		return null;
	}

	@Override
	public Map<String, Object> getUsersByUsername(String username) {
		Map<String, Object> user = new HashMap<String, Object>();
		try {
			user =  usersMapper.selectUserByUsername(username);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return user;
	}

}
