package com.usyd.group7.service;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.usyd.group7.domain.Client;
import com.usyd.group7.domain.Food;

public class FoodServiceImpl implements FoodService {

	@Autowired
	public ExerciseService exerciseService;

	public static double STEP = 0.3;

	public Map<Food, Double> getFoodCombination(Client client) {
		double calorieNeed = exerciseService.getCalorieNeedToday(client);
		List<Food> foods = Food.findAllFoods();
		Map<Food, Double> hm = new LinkedHashMap<Food, Double>();
		// init
		for (Food food : foods) {
			hm.put(food, 0.0);
		}

		int i = 0;
		if (foods.size() > 0) {
			// keep looping
			for (i = 0; getSum(hm) < calorieNeed; i = (i + 1) % foods.size()) {
				Food food = foods.get(i);
				hm.put(food, hm.get(food) + STEP);
			}
		}

		return hm;
	}

	private double getSum(Map<Food, Double> map) {
		double sum = 0;
		for (Food food : map.keySet()) {
			sum += food.getCalorie() * map.get(food);
		}
		return sum;
	}
}
