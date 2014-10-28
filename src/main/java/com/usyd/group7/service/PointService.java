package com.usyd.group7.service;

import com.usyd.group7.domain.ActionHistory;
import com.usyd.group7.domain.Client;
import com.usyd.group7.domain.ClientLevel;

public interface PointService {

	/**
	 * How to use this one to get point for a user
	 * 
	 * Please go to admin panel, check the ClientAction list, and use the
	 * action's name as parameter to use this function.
	 * 
	 * if the actionName is not defined in the database, nothing will do
	 * 
	 */
	public ActionHistory takeAction(Client client, String actionName);

	/**
	 * get current next level detail
	 */
	public ClientLevel getNextClientLevel(Client client);

}
