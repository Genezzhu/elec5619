package com.usyd.group7.web;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.usyd.group7.domain.ActionHistory;
import com.usyd.group7.domain.Client;
import com.usyd.group7.domain.Exercise;
import com.usyd.group7.domain.ExerciseType;
import com.usyd.group7.service.ClientService;
import com.usyd.group7.service.ExerciseService;

import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.usyd.group7.domain.ClientAction;

@RequestMapping("exercise_records")
@Controller
public class ExerciseRecordController extends BaseController {

	// declare service classes, Spring will use dependency injection to
	// initialize them
	@Autowired
	public ExerciseService exerciseService;
	@Autowired
	public ClientService clientService;

	/**
	 * define the welcome URL for exercise records page, when access the URL
	 * "/exercise_records", redirect to "/exercise_records/all_records"
	 * 
	 * This function will be invoke in the super class function 'index'
	 */
	@Override
	public String get_default_welcome_url() {
		return "/exercise_records/all_records";
	}

	/**
	 * all_records page show all the records for current login user.
	 * 
	 * It also works as a search result page user can search a time period of
	 * time record,
	 * 
	 * user can also choose a how many records should be shown in the page
	 */
	@RequestMapping(value = "all_records", method = RequestMethod.GET)
	public String all_records(
			ModelMap model,
			HttpServletRequest request,
			HttpSession session,
			@RequestParam(value = "startDate", required = false) String startDateStr,
			@RequestParam(value = "endDate", required = false) String endDateStr,
			@RequestParam(value = "pageCap", required = false) String pageCapStr) {
		// require user login. redirect to login page if not login
		Client client = clientService.getLoginClient(session);
		if (client == null) {
			return this.redirectToLoginPage(request);
		}

		// set a default display record number '10'
		int pageCap = pageCapStr == null ? 10 : Integer.parseInt(pageCapStr);
		// these three params is for prefix search box data
		model.addAttribute("startDateStr", startDateStr);
		model.addAttribute("endDateStr", endDateStr);
		model.addAttribute("pageCap", pageCap);

		startDateStr = startDateStr == null ? "2000-01-01"
				: startDateStr != null && !startDateStr.isEmpty() ? startDateStr
						.trim() : "2000-01-01";
		endDateStr = endDateStr == null ? "2050-01-01" : endDateStr != null
				&& !endDateStr.isEmpty() ? endDateStr.trim() : "2050-01-01";
		Date startDate = null, endDate = null;
		try {
			startDate = new SimpleDateFormat("yyyy-MM-dd").parse(startDateStr);
			endDate = new SimpleDateFormat("yyyy-MM-dd").parse(endDateStr);
		} catch (Exception e) {
			System.out.println("startDate or endDate has wrong format");
		}

		// query the db to get the exercises wanted.
		List<Exercise> exercises = exerciseService.searchExercisesInDateRange(
				client, startDate, endDate);
		model.addAttribute("exercises", exercises);
		model.addAttribute("exerciseCalorieChartData", exerciseService.generateCalorieChartData(exercises));
		model.addAttribute("exerciseDurationChartData", exerciseService.generateDurationChartData(exercises));
		
		return "exercise_records.all_records";
	}

	/**
	 * edit record page, this one is used for both create new and edit record
	 * 
	 * @param id
	 *            if id is provided, then it's edit, otherwise it's create new
	 */
	@RequestMapping(value = "edit_record", method = RequestMethod.GET)
	public String edit_record(ModelMap model, HttpServletRequest request,
			HttpSession session,
			@RequestParam(value = "id", required = false) String id) {
		// require user login. redirect to login page if not login
		Client client = clientService.getLoginClient(session);
		if (client == null) {
			return this.redirectToLoginPage(request);
		}

		// if create a new record, then create a new empty object.
		// this way, the jsp can use the attribute "created " as current date
		Exercise exercise = null;
		if (id != null && !id.isEmpty()) {
			// if try to edit a record, get the detail from db
			exercise = Exercise.findExercise(Long.parseLong(id));
		}
		if (exercise == null) {
			exercise = new Exercise();
		}

		// pass attribute to jsp
		model.addAttribute("exercise", exercise);
		model.addAttribute("exerciseTypes", ExerciseType.findAllExerciseTypes());
		return "exercise_records.edit_record";
	}

	/**
	 * remove record page
	 */
	@RequestMapping(value = "remove_record", method = RequestMethod.GET)
	public String remove_record(ModelMap model, HttpServletRequest request,
			HttpSession session,
			@RequestParam(value = "id", required = false) String id) {
		// require user login. redirect to login page if not login
		Client client = clientService.getLoginClient(session);
		if (client == null) {
			return this.redirectToLoginPage(request);
		}

		if (id != null && !id.isEmpty()) {
			// get the exercise from db by id
			Exercise exercise = Exercise.findExercise(Long.parseLong(id));
			if (exercise != null) {
				// remove from db
				exercise.remove();
			}
		}

		// redirect to home page
		return "redirect:/exercise_records/all_records";
	}

	/**
	 * form submit handler, handle create/edit record pages http POST only
	 */
	@RequestMapping(value = "on_edit_record", method = RequestMethod.POST)
	public String on_edit_record(
			ModelMap model,
			HttpServletRequest request,
			HttpSession session,
			RedirectAttributes redirectAttr,
			@RequestParam(value = "id", required = false) String id,
			@RequestParam(value = "duration", required = false) String duration,
			@RequestParam(value = "location", required = false) String location,
			@RequestParam(value = "calorie", required = false) String calorie,
			@RequestParam(value = "description", required = false) String descr,
			@RequestParam(value = "created", required = false) String created,
			@RequestParam(value = "type", required = false) String type) {
		// require user login. redirect to login page if not login
		Client client = clientService.getLoginClient(session);
		if (client == null) {
			return this.redirectToLoginPage(request);
		}

		// by default, consider as create new exercise
		Exercise exercise = new Exercise();
		if (id != null && !id.isEmpty()) {
			// if provide attribute id, then it's editing, need to get
			// the existing attribuet from db.
			exercise = Exercise.findExercise(Long.parseLong(id));

			if (exercise == null
					|| exercise.getClient().getId() != client.getId()) {
				// wrong user
				// redirect to home page
				return "redirect:/exercise_records/all_records";
			}
		}

		// update exercise object's attribute value

		// convert String to int
		exercise.setDuration(Integer.parseInt(duration.replace(",", "")));

		// convert string to double
		if (calorie != null && !calorie.isEmpty()) {
			exercise.setCalorie(Double.parseDouble(calorie.replace(",", "")));
		} else {
			exercise.setCalorie(0);
		}
		exercise.setDescr(descr);
		exercise.setLocation(location);
		// update exercise object's foreign key for Client table
		exercise.setClient(client);

		// update exercise object's foreign key for ExerciseType table
		if (type != null && !type.isEmpty()) {
			// find existing ExerciseType first, and save it to the DB.
			exercise.setExerciseType(ExerciseType.findExerciseType(Long
					.parseLong(type)));
		}

		// try to update created time
		if (created != null && !created.isEmpty()) {
			// convert string into date
			try {
				exercise.setCreated(new SimpleDateFormat(
						"yyyy-MM-dd'T'HH:mm:ss").parse(created));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}

		// still, use the id to tell whether it's create or modify
		if (id != null && !id.isEmpty()) {
			exerciseService.autoCalculateCalorie(exercise);
			// when is edit exercise record, use service to update it
			exerciseService.updateExercise(exercise);
		} else {
			// when is new exercise record, first do a auto calculate calorie
			exerciseService.autoCalculateCalorie(exercise);
			// then save to the db
			exerciseService.saveExercise(exercise);
			// Point System code, also send to header
			redirectAttr.addFlashAttribute("ah", pointService.takeAction(
					client, ClientAction.NEW_EXERCISE_RECORD));
		}

		// redirect to home page
		return "redirect:/exercise_records/all_records";
	}
}
