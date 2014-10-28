package com.usyd.group7.dao;

import com.usyd.group7.domain.User;

public interface UserManager {
	public boolean addUser(User user);
	
	public void updateUser(User user);
	
	public void deleteUser(long userID);
	
	public User login(String userName, String passwd);
	
	public User getUser(String userName);
}
