package com.usyd.group7.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.usyd.group7.dao.ClientActionDao;
import com.usyd.group7.dao.ClientLevelDao;
import com.usyd.group7.domain.ActionHistory;
import com.usyd.group7.domain.Client;
import com.usyd.group7.domain.ClientAction;
import com.usyd.group7.domain.ClientLevel;

@Service
@Transactional
public class PointServiceImpl implements PointService {

	@Autowired
	public ClientActionDao clientActionDao;

	@Autowired
	public ClientLevelDao clientLevelDao;

	@Override
	public ActionHistory takeAction(Client client, String actionName) {
		if (client == null) {
			return null;
		}
		ClientAction clientAction = clientActionDao
				.findClientActionByName(actionName);
		if (clientAction == null) {
			return null;
		}

		// save to actionHistory
		ActionHistory actionHistory = new ActionHistory();
		actionHistory.setClient(client);
		actionHistory.setClientAction(clientAction);
		actionHistory.persist();

		// update client info
		// try to add EXP for the client
		client.setExp(client.getExp() + clientAction.getExp());
		client.setCredit(client.getCredit() + clientAction.getCredit());
		// update the client level
		ClientLevel clientLevel = clientLevelDao.findClientLevelByExp(client
				.getExp());
		if (clientLevel != null) {
			client.setClientLevel(clientLevel);
		}
		// save the client
		client.merge();
		
		return actionHistory;
	}

	/**
	 * get next level the client should be
	 */
	@Override
	public ClientLevel getNextClientLevel(Client client) {
		if (client != null) {
			return clientLevelDao.findNextClientLevel(client);
		} else {
			return null;
		}
	}
}
