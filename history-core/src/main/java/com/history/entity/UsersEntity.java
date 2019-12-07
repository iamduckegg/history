package com.history.entity;

import java.io.Serializable;

import lombok.Data;

/**
 * 用户
 */
//@Data
public class UsersEntity implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private int id;/*主键*/
    private String username;/*用户名*/
    private String password;/*密码*/
    private String name;/*名字*/
    private String status;/*状态*/
    private String remark;/*备注*/
    
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}

}
