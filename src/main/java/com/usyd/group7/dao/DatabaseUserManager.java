package com.usyd.group7.dao;


import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import com.usyd.group7.domain.User;

import org.springframework.transaction.annotation.Transactional;

@Repository(value="userManager")
@Transactional
public class DatabaseUserManager implements UserManager{
	@PersistenceContext
	EntityManager entityManager;

	
	@Override
	public User getUser(String userName) {
		String sql = "select c from "+ User.class.getName() + " c where c.userName = :username";
		Query query = entityManager.createQuery(sql, User.class);
		query.setParameter("username", userName);
		try {
			return (User) query.getSingleResult();
		} catch (Exception e) {
			return null;
		}
	}
	
	@Override
	public User login(String userName, String passwd) {
		
		String sql = "select c from "+ User.class.getName() + " c where c.userName = :username and c.passwd = :password";
		Query query = entityManager.createQuery(sql, User.class);
		query.setParameter("username", userName);
		query.setParameter("password", passwd);
		
		List<User> userList = query.getResultList();
		if(userList == null || userList.isEmpty()){
			//throw new RuntimeException("No Result Found");
			return null;
		}else{
			return userList.get(0);
		}
		
	}
	
	@Override
	public boolean addUser(User user) {
		entityManager.persist(user);
		String sql = "select c from User c where c.userName = :username";
		Query query = entityManager.createQuery(sql, User.class);
		query.setParameter("username", user.getUserName());
		try {
			user = (User) query.getSingleResult();
			return true;
		} catch (Exception e) {
			return false;
		}
	}
	
	@Override
	public void deleteUser(long userID) {
		User user = new User();
		String sql = "select c from " + User.class.getName()
				+ " c where c.userID = :userID";
		Query query = entityManager.createQuery(sql, User.class);
		query.setParameter("userID", userID);
		user = (User) query.getSingleResult();
		
		entityManager.remove(user);
	}
	
	@Override
	public void updateUser(User user) {
		entityManager.merge(user);
	}
	
	
	
	
	
	
	
	
	
}
