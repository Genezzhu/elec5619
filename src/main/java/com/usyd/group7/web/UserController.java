package com.usyd.group7.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.usyd.group7.base.ResultInfo;
import com.usyd.group7.domain.User;
import com.usyd.group7.service.UserService;

@Controller
@RequestMapping(value="/user/")
public class UserController {

	@Autowired
	private UserService userService;
	
	@RequestMapping(value="register", method = RequestMethod.POST)
	@ResponseBody
	public ResultInfo addUser(User user){
		return userService.addUser(user);
	}
	
	@RequestMapping(value="update", method = RequestMethod.POST)
	@ResponseBody
	public ResultInfo updateUser(User user, HttpServletRequest request){
		return userService.updateUser(user, request);
	}
	
	@RequestMapping(value="login", method = RequestMethod.POST)
	@ResponseBody
	public ResultInfo login(String userName, String passwd, HttpServletRequest request){
		return userService.logIn(userName, passwd, request);
	}
	
	@RequestMapping(value="getuserinfo", method = RequestMethod.POST)
	@ResponseBody
	public ResultInfo getUserInfo(String userName, HttpServletRequest request){
		return userService.getUserInfo(userName, request);
	}

    @RequestMapping(value="logout", method = RequestMethod.POST)
    @ResponseBody
    public ResultInfo logOut(HttpServletRequest request){
        return userService.logOut(request);
    }
}
