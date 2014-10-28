package com.usyd.group7.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.usyd.group7.domain.ActionHistory;
import com.usyd.group7.domain.Client;
import com.usyd.group7.service.ClientService;
import com.usyd.group7.service.PointService;

/**
 * Super class for all controllers.
 * 
 * some common functions are defined here
 */
public class BaseController {

	public final String LoginPageURL = "/clients/login";

	@Autowired
	public ClientService clientService;
	@Autowired
	public PointService pointService;

	/**
	 * return redirect to login page url, also contains param 'redirectURL' if
	 * needed
	 */
	public String redirectToLoginPage(HttpServletRequest request) {
		String redirectUrl = request != null ? "?redirectURL="
				+ getCurrentRelatvieURL(request) : "";
		return "redirect:" + LoginPageURL + redirectUrl;
	}

	public String getCurrentRelatvieURL(HttpServletRequest request) {
		return request.getRequestURI().substring(
				request.getContextPath().length());
	}

	/**
	 * OVERRIDE ME to change the defualt welcome url
	 */
	public String get_default_welcome_url() {
		return "";
	}

	/**
	 * This method will redirect all unlogin users to login page.
	 * 
	 * You can override this method to change the behaviour
	 */
	@RequestMapping()
	public String index(ModelMap model, HttpServletRequest request,
			HttpSession session, RedirectAttributes redirectAttr) {

		// keep the action history
		ActionHistory ah = (ActionHistory) request.getAttribute("ah");
		redirectAttr.addFlashAttribute("ah", ah);

		Client client = clientService.getLoginClient(session);
		if (client == null) {
			return this.redirectToLoginPage(request);
		}
		return "redirect:" + get_default_welcome_url();
	}

}
