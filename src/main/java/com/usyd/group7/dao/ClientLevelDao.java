package com.usyd.group7.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.usyd.group7.domain.Client;
import com.usyd.group7.domain.ClientLevel;

/**
 * DAO file to query ClientLevel table in the DB
 */
@Repository
@Transactional
public class ClientLevelDao {
	@PersistenceContext
	EntityManager entityManager;

	/**
	 * find the current level detail by a clientLevel
	 */
	public ClientLevel findClientLevelByClientLevel(int clientLevel) {
		String sql = "select c from " + ClientLevel.class.getName()
				+ " c where c.clientLevel = :clientLevel";
		Query query = entityManager.createQuery(sql, ClientLevel.class);
		query.setParameter("clientLevel", clientLevel);
		try {
			return (ClientLevel) query.getSingleResult();
		} catch (Exception e) {
			return null;
		}
	}

	/**
	 * find the current level by a given exp
	 */
	public ClientLevel findClientLevelByExp(int exp) {
		String sql = "select c from " + ClientLevel.class.getName()
				+ " c where c.expRequired <= :exp order by c.clientLevel desc";
		Query query = entityManager.createQuery(sql, ClientLevel.class);
		query.setParameter("exp", exp);
		try {
			List<ClientLevel> list = query.getResultList();
			if (list.size() > 0) {
				return list.get(0);
			} else {
				return null;
			}
		} catch (Exception e) {
			return null;
		}
	}
	
	/**
	 * find the next level by a given exp
	 */
	public ClientLevel findNextClientLevel(Client client) {
		String sql = "select c from " + ClientLevel.class.getName()
				+ " c where c.expRequired > :exp order by c.clientLevel";
		Query query = entityManager.createQuery(sql, ClientLevel.class);
		query.setParameter("exp", client.getExp());
		try {
			List<ClientLevel> list = query.getResultList();
			if (list.size() > 0) {
				return list.get(0);
			} else {
				return null;
			}
		} catch (Exception e) {
			return null;
		}
	}

}
