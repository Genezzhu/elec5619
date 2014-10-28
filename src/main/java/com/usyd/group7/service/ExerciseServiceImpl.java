package com.usyd.group7.service;

import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;

import com.usyd.group7.dao.ExerciseDao;
import com.usyd.group7.domain.Client;
import com.usyd.group7.domain.Exercise;

public class ExerciseServiceImpl implements ExerciseService {

	@Autowired
	ExerciseDao exerciseDao;

	/**
	 * ask dao to query db
	 */
	public List<Exercise> searchExercisesInDateRange(Client client,
			Date startDate, Date endDate) {
		return exerciseDao.searchExercisesInDateRange(client, startDate,
				endDate);
	}

	public void autoCalculateCalorie(Exercise exercise) {
		// ask Hibernate to initialize it
		Hibernate.initialize(exercise.getExerciseType());
		if (exercise.getCalorie() == 0 && exercise.getDuration() != 0) {
			exercise.setCalorie(exercise.getDuration()
					* exercise.getExerciseType().getCalorieRate());
		}
	}

	public double getCalorieBurnedToday(Client client) {
		Calendar now = Calendar.getInstance();
		now.set(Calendar.HOUR_OF_DAY, 0);
		now.set(Calendar.MINUTE, 0);
		now.set(Calendar.SECOND, 0);
		now.set(Calendar.MILLISECOND, 0);
		Date startDate = now.getTime();
		Calendar now2 = Calendar.getInstance();
		now2.set(Calendar.HOUR_OF_DAY, 23);
		now2.set(Calendar.MINUTE, 59);
		now2.set(Calendar.SECOND, 59);
		now2.set(Calendar.MILLISECOND, 999);
		Date endDate = now2.getTime();

		// get all exercises for today
		List<Exercise> exercises = searchExercisesInDateRange(client,
				startDate, endDate);
		double caloried_burned_total = 0;
		for (Exercise exercise : exercises) {
			caloried_burned_total += exercise.getCalorie();
		}
		return caloried_burned_total;
	}

	public double getCalorieNeedToday(Client client) {
		// calculate daily needed
		// use simple formular
		double calorie_needed = client.getWeight() * 130;

		// get the total exercise amount for today
		double caloried_burned_total = getCalorieBurnedToday(client);

		// if did any exercise today, need to add some caloried to eat
		calorie_needed += caloried_burned_total / 5;
		return calorie_needed;
	}

	/**
	 * for left chart
	 */
	public Map<String, Double> generateCalorieChartData(List<Exercise> exercises) {
		Map<String, Double> hm = new HashMap<String, Double>();
		for (Exercise ex : exercises) {
			String key = ex.getExerciseType().getName();
			if (hm.containsKey(key)) {
				hm.put(key, hm.get(key) + ex.getCalorie());
			} else {
				hm.put(key, ex.getCalorie());
			}
		}
		return hm;
	}

	/**
	 * for right chart
	 */
	public Map<String, Double> generateDurationChartData(List<Exercise> exercises) {
		Map<String, Double> hm = new HashMap<String, Double>();
		for (Exercise ex : exercises) {
			String key = ex.getExerciseType().getName();
			if (hm.containsKey(key)) {
				hm.put(key, hm.get(key) + ex.getDuration());
			} else {
				hm.put(key, ex.getDuration());
			}
		}
		return hm;
	}
}
