package com.usyd.group7.service;

import javax.servlet.http.HttpSession;

import org.springframework.roo.addon.layers.service.RooService;

import com.usyd.group7.domain.Client;

@RooService(domainTypes = { com.usyd.group7.domain.Client.class })
public interface ClientService {
	/**
	 * get current login client from session
	 */
	public Client getLoginClient(HttpSession session);

	/**
	 * store a client in the session, as the login user
	 */
	public void setLoginClient(HttpSession session, Client client);

	/**
	 * use username and password to do login.
	 * 
	 * if success then return the client dto else return null
	 */
	public Client tryLogin(String username, String password);

	/**
	 * check whether username is unique
	 * @param username
	 * @return
	 */
	public boolean isUsernameExist(String username);

}
