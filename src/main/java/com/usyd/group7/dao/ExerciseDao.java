package com.usyd.group7.dao;

import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.hibernate.Hibernate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.usyd.group7.domain.Client;
import com.usyd.group7.domain.Exercise;

/**
 * DAO file for exercise record system
 */
@Repository
@Transactional
public class ExerciseDao {
	@PersistenceContext
	EntityManager entityManager;

	/**
	 * query db, get exercises within time period if asked
	 * @param client
	 * @param startDate
	 * @param endDate
	 * @return
	 */
	public List<Exercise> searchExercisesInDateRange(Client client,
			Date startDate, Date endDate) {
		Client c = client;
		Hibernate.initialize(c.getExercises());

		String sql = "select e from " + Exercise.class.getName()
				+ " e where e.client = :client ";
		if (startDate != null) {
			sql += "and e.created > :startDate ";
		}
		if (endDate != null) {
			sql += "and e.created < :endDate ";
		}
		sql += " order by e.created desc";


		Query query = entityManager.createQuery(sql, Exercise.class);
		query.setParameter("client", client);
		query.setParameter("startDate", startDate);
		query.setParameter("endDate", endDate);
				
		List<Exercise> resultList = (List<Exercise>) query.getResultList();
		return resultList;
	}
}
