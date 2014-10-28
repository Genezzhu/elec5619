package com.usyd.group7.service;

import java.util.Map;

import org.springframework.roo.addon.layers.service.RooService;

import com.usyd.group7.domain.Client;
import com.usyd.group7.domain.Food;

@RooService(domainTypes = { com.usyd.group7.domain.Food.class })
public interface FoodService {

	/**
	 * get food recommendation based on calorie needed for today
	 * 
	 * @param client
	 * @return
	 */
	public Map<Food, Double> getFoodCombination(Client client);

}
