package com.usyd.group7.web;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.TimeZone;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.usyd.group7.domain.ActionHistory;
import com.usyd.group7.domain.Client;
import com.usyd.group7.domain.ClientAction;
import com.usyd.group7.domain.Exercise;
import com.usyd.group7.service.ExerciseService;

import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 * This controller is for client detail page
 */
@RequestMapping("clients")
@Controller
public class ClientsController extends BaseController {

	@Autowired
	public ExerciseService exerciseService;

	// TODO: update this url, when someone do this part
	public String DEFAULT_LOGIN_REDIRECT_PAGE = "/blogs";

	/**
	 * define the welcome url for clients
	 */
	@Override
	public String get_default_welcome_url() {
		return "/clients/my_level";
	}

	/**
	 * login page
	 * 
	 * @redirectURL optional param
	 */
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String login(
			ModelMap model,
			@RequestParam(value = "redirectURL", required = false) String redirectURL) {
		model.addAttribute("redirectURL", redirectURL);
		return "clients.login";
	}

	/**
	 * handler login request
	 */
	@RequestMapping(value = "onLogin", method = { RequestMethod.POST })
	public String onLogin(ModelMap model, HttpSession session,
			HttpServletRequest request, RedirectAttributes redirectAttr) {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String redirectURL = request.getParameter("redirectURL");
		// if contains param redirectURL, then if login success, redirect to
		// that URL
		redirectURL = redirectURL != null && !redirectURL.isEmpty() ? redirectURL
				: DEFAULT_LOGIN_REDIRECT_PAGE;
		Client c = clientService.tryLogin(username, password);

		if (c == null) {
			// login fail, display error msg
			redirectAttr.addFlashAttribute("errorMsg", "Invalid Login");
			return this.redirectToLoginPage(null);
		} else {
			// login success
			clientService.setLoginClient(session, c);
			// point system, give EXP for login
			redirectAttr.addFlashAttribute("ah",
					pointService.takeAction(c, ClientAction.LOGIN));
			return "redirect:" + redirectURL;
		}
	}

	/**
	 * regitser page
	 */
	@RequestMapping(value = "register", method = RequestMethod.GET)
	public String register(ModelMap model) {
		return "clients.register";
	}

	/**
	 * handler register request
	 */
	@RequestMapping(value = "on_register", method = { RequestMethod.POST })
	public String on_register(
			ModelMap model,
			HttpSession session,
			HttpServletRequest request,
			RedirectAttributes redirectAttr,
			@RequestParam(value = "username", required = false) String username,
			@RequestParam(value = "password", required = false) String password,
			@RequestParam(value = "password2", required = false) String password2) {

		// check validate
		if (!password.equals(password2)) {
			redirectAttr.addFlashAttribute("errorMsg",
					"Password not consistent");
			return "redirect:/clients/register";

		} else if (clientService.isUsernameExist(username)) {
			redirectAttr.addFlashAttribute("errorMsg",
					"Username is already taken");
			return "redirect:/clients/register";
		}
		// create new client
		else {
			Client client = new Client();
			client.setUsername(username);
			client.setPassword(password);
			clientService.saveClient(client);

			// login success
			clientService.setLoginClient(session, client);
			// point system, give EXP for login
			redirectAttr.addFlashAttribute("ah",
					pointService.takeAction(client, ClientAction.REGISTER));
			return "redirect:/blogs";
		}
	}

	/**
	 * logout page
	 */
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(ModelMap model, HttpSession session) {
		// clear the session
		clientService.setLoginClient(session, null);
		// redirect to logout page
		return this.redirectToLoginPage(null);
	}

	/**
	 * edit user profile page
	 */
	@RequestMapping(value = "edit_profile", method = RequestMethod.GET)
	public String edit_profile(ModelMap model, HttpSession session,
			HttpServletRequest request) {

		// redirect to login page is not login yet
		Client client = clientService.getLoginClient(session);
		if (client == null) {
			return this.redirectToLoginPage(request);
		}

		// pass variables to jsp
		model.addAttribute("client", client);

		return "clients.edit_profile";
	}

	@RequestMapping(value = "on_edit_profile", method = RequestMethod.POST)
	public String on_edit_profile(ModelMap model, HttpSession session,
			HttpServletRequest request,
			@RequestParam(value = "height", required = false) String height,
			@RequestParam(value = "weight", required = false) String weight) {

		// redirect to login page is not login yet
		Client client = clientService.getLoginClient(session);
		if (client == null) {
			return this.redirectToLoginPage(request);
		}

		client.setHeight(Double.parseDouble(height));
		client.setWeight(Double.parseDouble(weight));
		client.merge();
		return "redirect:/clients/edit_profile";
	}

	/**
	 * diet page
	 */
	@RequestMapping(value = "diet", method = RequestMethod.GET)
	public String diet(ModelMap model, HttpSession session,
			HttpServletRequest request) {

		// redirect to login page is not login yet
		Client client = clientService.getLoginClient(session);
		if (client == null) {
			return this.redirectToLoginPage(request);
		}

		// pass variables to jsp
		model.addAttribute("client", client);
		model.addAttribute("calorie_needed",
				exerciseService.getCalorieNeedToday(client));

		return "clients.diet";
	}

	/**
	 * my_level page
	 */
	@RequestMapping(value = "my_level", method = RequestMethod.GET)
	public String my_level(ModelMap model, HttpSession session,
			HttpServletRequest request) {

		// redirect to login page is not login yet
		Client client = clientService.getLoginClient(session);
		if (client == null) {
			return this.redirectToLoginPage(request);
		}

		// use Hibernate to get all action histories
		Hibernate.initialize(client.getActionHistorys());
		// pass variables to jsp
		model.addAttribute("client", client);
		// get next level request
		model.addAttribute("nextLevel", pointService.getNextClientLevel(client));
		// get all action histories to display them in the jsps
		model.addAttribute("actionHistorys", client.getActionHistorys());
		return "clients.my_level";
	}

}
