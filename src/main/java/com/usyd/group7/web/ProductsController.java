package com.usyd.group7.web;

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
import com.usyd.group7.domain.ClientAction;
import com.usyd.group7.domain.Product;
import com.usyd.group7.domain.ProductOrder;
import com.usyd.group7.service.ClientService;
import com.usyd.group7.service.OrderService;

@RequestMapping("products")
@Controller
public class ProductsController extends BaseController {

	// declare service classes, Spring will use dependency injection to
	// initialize them
	@Autowired
	public ClientService clientService;
	@Autowired
	public OrderService orderService;

	/**
	 * all products page
	 */
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String index(ModelMap model, HttpServletRequest request,
			HttpSession session) {

		// get all products
		model.addAttribute("products", Product.findAllProducts());
		return "products.all_product";
	}

	/**
	 * shopping cart page
	 */
	@RequestMapping(value = "cart", method = RequestMethod.GET)
	public String cart(ModelMap model, HttpServletRequest request,
			HttpSession session) {
		// require user login. redirect to login page if not login
		Client client = clientService.getLoginClient(session);
		if (client == null) {
			return this.redirectToLoginPage(request);
		}

		// get all order items from session
		model.addAttribute("orderItems", orderService.getSessionCart(request));
		model.addAttribute("creditSum",
				orderService.getSessionCartSumCredit(request));
		model.addAttribute("client", client);
		return "products.cart";
	}

	/**
	 * shopping cart page
	 */
	@RequestMapping(value = "history", method = RequestMethod.GET)
	public String history(ModelMap model, HttpServletRequest request,
			HttpSession session) {
		// require user login. redirect to login page if not login
		Client client = clientService.getLoginClient(session);
		if (client == null) {
			return this.redirectToLoginPage(request);
		}

		// get all order history
		model.addAttribute("orders", orderService.getOrderHistory(client));
		model.addAttribute("client", client);
		return "products.history";
	}

	@RequestMapping(value = "on_save_order", method = { RequestMethod.POST })
	public String on_save_order(ModelMap model, HttpServletRequest request,
			HttpSession session, RedirectAttributes redirectAttr,
			@RequestParam(value = "contact", required = false) String contact,
			@RequestParam(value = "address", required = false) String address,
			@RequestParam(value = "number", required = false) String number) {
		// require user login. redirect to login page if not login
		Client client = clientService.getLoginClient(session);
		if (client == null) {
			return this.redirectToLoginPage(request);
		}

		// check validation
		double creditSum = orderService.getSessionCartSumCredit(request);
		if ((double) client.getCredit() < creditSum) {
			redirectAttr.addFlashAttribute("error_msg", "Not enough Credit");
			return "redirect:/products/cart";
		}

		// continue buying
		ProductOrder order = new ProductOrder();
		order.setClient(client);
		order.setShippingAddress(address);
		order.setShippingReceiver(contact);
		order.setShippingContactNumber(number);
		order = orderService.makeOrder(request, order);
		order.persist();
		// minus the credit from client
		client.setCredit((int) (client.getCredit() - creditSum));
		client.merge();
		orderService.clearSessionCart(request);

		// point system code
		redirectAttr.addFlashAttribute("ah", pointService.takeAction(
				client, ClientAction.NEW_ORDER));
		return "redirect:/products/history";
	}

	/**
	 * save product to session
	 */
	@RequestMapping(value = "on_save_to_cart/{id}/{amount}", method = { RequestMethod.GET })
	public String on_save_to_cart(ModelMap model, HttpServletRequest request,
			HttpSession session, RedirectAttributes redirectAttr,
			@PathVariable(value = "id") String id,
			@PathVariable(value = "amount") String amount) {
		// require user login. redirect to login page if not login
		Client client = clientService.getLoginClient(session);
		if (client == null) {
			return this.redirectToLoginPage(request);
		}

		Product product = Product.findProduct(Long.parseLong(id));
		orderService.putProductToSessionCart(request, product,
				Integer.parseInt(amount));

		// redirect to cart
		return "redirect:/products/cart";
	}
}
