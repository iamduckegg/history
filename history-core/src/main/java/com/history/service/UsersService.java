package com.history.service;

import java.util.List;
import java.util.Map;

import com.history.entity.UsersEntity;

public interface UsersService {
	
	public List<UsersEntity> selcetUsersList();
	
	public Map<String, Object> getUsersByUsername(String username);
}
