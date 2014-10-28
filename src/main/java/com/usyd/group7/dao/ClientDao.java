package com.usyd.group7.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.usyd.group7.domain.Client;

/**
 * DAO file to query Client table in the DB
 */
@Repository
@Transactional
public class ClientDao {
	@PersistenceContext
	EntityManager entityManager;

	public Client tryLogin(String username, String password) {
		String sql = "select c from " + Client.class.getName()
				+ " c where c.username = :username and c.password = :password";
		Query query = entityManager.createQuery(sql, Client.class);
		query.setParameter("username", username);
		query.setParameter("password", password);
		try {
			return (Client) query.getSingleResult();
		} catch (Exception e) {
			return null;
		}
	}

	public boolean checkUsername(String username) {
		String sql = "select c from " + Client.class.getName()
				+ " c where c.username = :username";
		Query query = entityManager.createQuery(sql, Client.class);
		query.setParameter("username", username);
		List result = query.getResultList();
		return result.size() > 0;
	}
}
