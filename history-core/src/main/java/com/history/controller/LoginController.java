package com.history.controller;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.history.shiro.FilterChainDefinitionsBuilder;

@Controller
@RequestMapping(value="")
public class LoginController {
	
    /**
     * 跳转登录页面
     * @return
     */
    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String toIndex(){
        return "index";
    }/**
     * 跳转登录页面
     * @return
     */
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String toLogin(){
        return "login";
    }
    
	/*
	 * @RequestMapping(value = "/login/doLogout", method = RequestMethod.GET) public
	 * String logout(){ return "redirect:/login"; }
	 */
    /**
     * 登录操作
     * @param username
     * @param password
     * @return
     */
    @RequestMapping(value = "/login/doLogin", method = RequestMethod.GET)
    public String login(@RequestParam String username,
                        @RequestParam String password)
    {
        //获取subject
        Subject subject = SecurityUtils.getSubject();

        if (!subject.isAuthenticated()) {
        	//把用户密码转封装成UsernamePasswordToken对象
        	UsernamePasswordToken token = new UsernamePasswordToken(username, password);
        	//RememberMe
        	token.setRememberMe(true);
        	
        	
        	try {
        		//执行登录
        		subject.login(token);
        	}catch (AuthenticationException e){
        		//登录异常验证
        		e.printStackTrace();
        	}
        }
       
        return "redirect:/index";
    }
    
    public static void main(String[] args) {
		
	}

}
