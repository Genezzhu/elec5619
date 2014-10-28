package com.usyd.group7.service;

import javax.servlet.http.HttpServletRequest;

import com.usyd.group7.base.ResultInfo;
import com.usyd.group7.domain.User;

public interface UserService {
	public ResultInfo addUser(User user);
	
	public ResultInfo deleteUser(long userID, HttpServletRequest request);
	
	public ResultInfo updateUser(User user, HttpServletRequest request);
	
	public ResultInfo getUserInfo(String userName, HttpServletRequest request);
	
	public ResultInfo logIn(String userName, String passwd, HttpServletRequest request);

    public ResultInfo logOut(HttpServletRequest request);
}
