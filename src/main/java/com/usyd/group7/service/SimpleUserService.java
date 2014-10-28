package com.usyd.group7.service;

import com.usyd.group7.base.ResultInfo;
import com.usyd.group7.dao.UserManager;
import com.usyd.group7.domain.User;
import com.usyd.group7.util.SessionUtil;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;

@Component
public class SimpleUserService implements UserService{
	private static final String SESSION_USER_KEY = "user";
	@Autowired
	private UserManager userManager;
	
	private static final Logger logger = LoggerFactory.getLogger(SimpleUserService.class);
	
	@Override
	public ResultInfo addUser(User user) {
		ResultInfo resultInfo = new ResultInfo();
		
		try{
			userManager.addUser(user);
			resultInfo.markSuccess();
		}catch(RuntimeException e){
			logger.error("Exception occurs when add user", e);
			resultInfo.setErrorMessage(e.getCause().getMessage());
		}
		
		return resultInfo;
	}
	
	@Override
	public ResultInfo deleteUser(long userID, HttpServletRequest request) {
		ResultInfo resultInfo = new ResultInfo();
		
		try{
			userManager.deleteUser(userID);
			SessionUtil.removeAttribute(SESSION_USER_KEY, request);
			resultInfo.markSuccess();
		}catch(RuntimeException e){
			logger.error("Exception occurs when delete user", e);
			resultInfo.setErrorMessage(e.getCause().getMessage());
		}
		
		return resultInfo;
	}
	
	@Override
	public ResultInfo getUserInfo(String userName, HttpServletRequest request) {
		ResultInfo resultInfo = new ResultInfo();
		User user = SessionUtil.getAttribute(User.class, SESSION_USER_KEY, request);
		
		if(user == null){
			try{
				user = userManager.getUser(userName);
				SessionUtil.putAttribute(SESSION_USER_KEY, user, request);
			}catch(RuntimeException e){
				logger.error("Exception occurs when get user", e);
				resultInfo.setErrorMessage(e.getCause().getMessage());
			}
		}else{
			resultInfo.addData(SESSION_USER_KEY, user);
			resultInfo.markSuccess();
		}
		
		return resultInfo;
	}
	
	@Override
	public ResultInfo logIn(String userName, String passwd,
			HttpServletRequest request) {
		ResultInfo resultInfo = new ResultInfo();
		User user = SessionUtil.getAttribute(User.class, SESSION_USER_KEY, request);
		
		if(user == null){
			try{
				user = userManager.login(userName, passwd);
				SessionUtil.putAttribute(SESSION_USER_KEY, user, request);
                resultInfo.markSuccess();
			}catch(RuntimeException e){
				logger.error("Exception occurs when login user", e);
				resultInfo.setErrorMessage(e.getCause().getMessage());
			}
		}else{
			resultInfo.markSuccess();
		}
		
		return resultInfo;
	}
	
	@Override
	public ResultInfo updateUser(User user, HttpServletRequest request) {
		ResultInfo resultInfo = new ResultInfo();
		
		try{
            user.setUserID(SessionUtil.getUser(request).getUserID());
			userManager.updateUser(user);
			SessionUtil.putAttribute(SESSION_USER_KEY, user, request);
			resultInfo.markSuccess();
		}catch(RuntimeException e){
			logger.error("Exception occur when update user", e);
			resultInfo.setErrorMessage(e.getCause().getMessage());
		}
		
		return resultInfo;
	}

    @Override
    public ResultInfo logOut(HttpServletRequest request){
        ResultInfo resultInfo = new ResultInfo();
        SessionUtil.removeAttribute(SessionUtil.USER, request);
        resultInfo.markSuccess();
        return resultInfo;
    }
}
