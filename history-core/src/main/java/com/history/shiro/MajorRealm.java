package com.history.shiro;

import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;

import com.history.service.UsersService;

/**
 * 	主要的Major
 * @author 周放放
 *
 */
public class MajorRealm extends AuthorizingRealm {

	@Autowired
	private UsersService usersService;
	
    /**
     * AuthorizingRealm继承AuthenticatingRealm,所以认证只需继承AuthorizingRealm
     * 	用户认证
     * @param authenticationToken
     * @return
     * @throws AuthenticationException
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
    	//把AuthenticationToken转换成UsernamePasswordToken;
    	UsernamePasswordToken usernamePasswordToken =  (UsernamePasswordToken) authenticationToken;
    	//从UsernamePasswordToken获取username
    	String username = usernamePasswordToken.getUsername();
    	//校验用户名
    	Map<String, Object> usersMap = usersService.getUsersByUsername(username);
    	Object principal = null;
    	if (null != usersMap) {
    		principal = username;
    	}else {
    		
    		throw new UnknownAccountException("用户不存在");
    	}
    	//校验密码
    	Object credentials = usersMap.get("password");
    	//把用户名作为盐值,保证密码的唯一性
    	ByteSource salt = ByteSource.Util.bytes(username);
    	//返回的认证对象
    	//principal 认证主体
    	//credentials 密码
    	//salt  盐值
    	//realmName 名称
    	String realmName = getName();
    	SimpleAuthenticationInfo simpleAuthenticationInfo = new SimpleAuthenticationInfo(principal, credentials, salt, realmName);
    	
        return simpleAuthenticationInfo;
    }

    
    /**
     * 用户授权
     */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		//获取登录用户信息
		Object principal = principals.getPrimaryPrincipal();
		Set<String> roles = new  HashSet<String>();
		/* 给用户添加角色信息
		 * eg:
		 * roles.add("admin")
		 */
		//授权对象
		SimpleAuthorizationInfo simpleAuthorizationInfo = new SimpleAuthorizationInfo(roles);
		
		return simpleAuthorizationInfo;
	}

}
