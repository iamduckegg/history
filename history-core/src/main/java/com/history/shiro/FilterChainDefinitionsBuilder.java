package com.history.shiro;

import java.util.LinkedHashMap;
import java.util.Map;

/**
 * 	Shiro用到的构建过滤器规则
 * @author 周放放
 *
 */
public class FilterChainDefinitionsBuilder {
	
	/**
	 * 创建构建过滤器规则的Map
	 * @return
	 */
	public Map<String, String> createFilterChainDefinitionMap () {
		Map<String, String> map = new  LinkedHashMap<String, String>();
		
		/*	
		 * 将url验证信息按照顺序存入map
		 * 	作用是给页面设置访问权限
		 * eg:
		 * map.put( "/login" , "anon");
		 * map.put( "/login/doLogin" , "anon")
		 * map.put( "/**" , "authc")
		 */
		
		
		return map;
	}

}
