package com.usyd.group7.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.hibernate.Hibernate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.usyd.group7.domain.Blog;
import com.usyd.group7.domain.BlogType;
import com.usyd.group7.domain.Client;

@Repository
@Transactional
public class BlogDao {
	@PersistenceContext
	EntityManager entityManager;

	/**
	 * query db, get exercises within time period if asked
	 * 
	 * @param client
	 * @return
	 */
	public List<Blog> getBlogsForClient(Client client) {
		Client c = client;

		String sql = "select b from " + Blog.class.getName()
				+ " b where b.author = :client ";
		sql += " order by b.created desc";

		Query query = entityManager.createQuery(sql, Blog.class);
		query.setParameter("client", client);

		List<Blog> resultList = (List<Blog>) query.getResultList();
		return resultList;
	}

	public List<Blog> getAllBlogs(BlogType blogType) {

		String sql = "select b from " + Blog.class.getName() + " b ";
		if (blogType != null) {
			sql += " where b.blogType = :blogType";
		}
		sql += " order by b.created desc";
		Query query = entityManager.createQuery(sql, Blog.class);
		if (blogType != null) {
			query.setParameter("blogType", blogType);
		}
		List<Blog> resultList = (List<Blog>) query.getResultList();
		return resultList;
	}
}
