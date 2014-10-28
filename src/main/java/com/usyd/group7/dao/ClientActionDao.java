package com.usyd.group7.dao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.usyd.group7.domain.ClientAction;

/**
 * DAO file to query ClientAction table in the DB
 */
@Repository
@Transactional
public class ClientActionDao {
	@PersistenceContext
	EntityManager entityManager;

	@Transactional
	public ClientAction findClientActionByName(String name) {
		String sql = "select c from " + ClientAction.class.getName()
				+ " c where c.name = :name";
		Query query = entityManager.createQuery(sql, ClientAction.class);
		query.setParameter("name", name);
		try {
			return (ClientAction) query.getSingleResult();
		} catch (Exception e) {
			return null;
		}
	}
}
