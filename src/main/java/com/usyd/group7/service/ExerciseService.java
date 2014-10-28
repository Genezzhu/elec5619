package com.usyd.group7.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.roo.addon.layers.service.RooService;

import com.usyd.group7.domain.Client;
import com.usyd.group7.domain.Exercise;

@RooService(domainTypes = { com.usyd.group7.domain.Exercise.class })
public interface ExerciseService {

	/**
	 * search exercises for a client, need to fit the time requirement
	 * 
	 * @param client
	 * @return
	 */
	public List<Exercise> searchExercisesInDateRange(Client client,
			Date startDate, Date endDate);

	/**
	 * auto calculate calorie burned by the exercise type will only be applied
	 * when exercise's calorie is empty
	 */
	public void autoCalculateCalorie(Exercise exercise);

	/**
	 * get how many calorie client has burned for today
	 * 
	 * @param client
	 */
	public double getCalorieBurnedToday(Client client);

	/**
	 * get how many calorie client need for today
	 * 
	 * @param client
	 */
	public double getCalorieNeedToday(Client client);

	/**
	 * generate chart for exercise_records page
	 * 
	 * @param exercises
	 * @return
	 */
	public Map<String, Double> generateCalorieChartData(List<Exercise> exercises);

	/**
	 * generate chart for exercise_records page
	 * 
	 * @param exercises
	 * @return
	 */
	public Map<String, Double> generateDurationChartData(
			List<Exercise> exercises);

}
