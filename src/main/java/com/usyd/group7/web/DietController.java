package com.usyd.group7.web;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.usyd.group7.domain.Client;
import com.usyd.group7.domain.Food;
import com.usyd.group7.domain.FoodComment;
import com.usyd.group7.service.ClientService;
import com.usyd.group7.service.ExerciseService;
import com.usyd.group7.service.FoodService;

@RequestMapping("diet")
@Controller
public class DietController extends BaseController {

	// declare service classes, Spring will use dependency injection to
	// initialize them
	@Autowired
	public ClientService clientService;
	@Autowired
	public FoodService foodService;

	/**
	 * food page
	 */
	@RequestMapping(value = "food/{id}", method = RequestMethod.GET)
	public String food(ModelMap model, HttpServletRequest request,
			HttpSession session, @PathVariable(value = "id") String id) {
		// require user login. redirect to login page if not login
		Client client = clientService.getLoginClient(session);
		if (client == null) {
			return this.redirectToLoginPage(request);
		}

		Food food = Food.findFood(Long.parseLong(id));
		// get all products
		model.addAttribute("food", food);
		model.addAttribute("client", client);
		return "diet.food";
	}

	@RequestMapping(value = "on_save_comment", method = { RequestMethod.POST })
	public String on_save_comment(ModelMap model, HttpServletRequest request,
			HttpSession session, RedirectAttributes redirectAttr,
			@RequestParam(value = "food_id", required = false) String food_id,
			@RequestParam(value = "content", required = false) String content) {
		// require user login. redirect to login page if not login
		Client client = clientService.getLoginClient(session);
		if (client == null) {
			return this.redirectToLoginPage(request);
		}

		Food food = Food.findFood(Long.parseLong(food_id));
		FoodComment foodComment = new FoodComment();
		foodComment.setFood(food);
		foodComment.setClient(client);
		foodComment.setContent(content);
		foodComment.persist();
		return "redirect:/diet/food/" + food.getId();
	}

	/**
	 * food_combination page
	 */
	@RequestMapping(value = "food_combination", method = RequestMethod.GET)
	public String food_combination(ModelMap model, HttpServletRequest request,
			HttpSession session) {
		// require user login. redirect to login page if not login
		Client client = clientService.getLoginClient(session);
		if (client == null) {
			return this.redirectToLoginPage(request);
		}

		Map<Food, Double> map = foodService.getFoodCombination(client);

		model.addAttribute("client", client);
		model.addAttribute("map", map);
		return "diet.food_combination";
	}

}
