package com.usyd.group7.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import com.usyd.group7.dao.ClientDao;
import com.usyd.group7.domain.Client;

public class ClientServiceImpl implements ClientService {

	@Autowired
	ClientDao clientDao;

	public Client getLoginClient(HttpSession session) {
		Client c = (Client) session.getAttribute("loginClient");
		if (c != null) {
			return Client.findClient(c.getId());
		} else {
			return null;
		}
	}

	public void setLoginClient(HttpSession session, Client client) {
		session.setAttribute("loginClient", client);
	}

	public Client tryLogin(String username, String password) {
		return clientDao.tryLogin(username, password);
	}

	public boolean isUsernameExist(String username) {
		return clientDao.checkUsername(username);
	}

}
