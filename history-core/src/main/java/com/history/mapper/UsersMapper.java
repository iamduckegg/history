package com.history.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UsersMapper {

	/**
	 * 分页查询
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> selectUsersList() throws Exception;
	
	
	public Map<String, Object> selectUserByUsername(String username) throws Exception;
}
