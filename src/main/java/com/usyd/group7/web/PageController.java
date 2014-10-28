package com.usyd.group7.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by Zhengan Zhu.
 */
@RequestMapping("shop")
@Controller
public class PageController {
	
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String home1() {
		
		return "redirect:/shop/Product.htm";
	}
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		
		return "redirect:/shop/Product.htm";
	}

    @RequestMapping(value = "AboutUs",method = RequestMethod.GET)
    public ModelAndView getAboutUs(HttpServletRequest request){
        return new ModelAndView("AboutUs");
    }

    @RequestMapping(value = "HomePage",method = RequestMethod.GET)
    public ModelAndView getHomePage(HttpServletRequest request){
        return new ModelAndView("HomePage");
    }

    @RequestMapping(value = "pay",method = RequestMethod.GET)
    public ModelAndView getPay(HttpServletRequest request){
        return new ModelAndView("pay");
    }

    @RequestMapping(value = "Product", method = RequestMethod.GET)
    public ModelAndView getProduct(HttpServletRequest request){
        return new ModelAndView("Product");
    }

    @RequestMapping(value = "purchase",method = RequestMethod.GET)
    public ModelAndView getPurchase(HttpServletRequest request){
        return new ModelAndView("purchase");
    }

    @RequestMapping(value = "FeatureProduct",method = RequestMethod.GET)
    public ModelAndView getFeatureProduct(HttpServletRequest request){
        return new ModelAndView("FeatureProduct");
    }

    @RequestMapping(value = "ProductManage",method = RequestMethod.GET)
    public ModelAndView getProductManage(HttpServletRequest request){
        return new ModelAndView("ProductManage");
    }

    @RequestMapping(value = "orderManage",method = RequestMethod.GET)
    public ModelAndView getOrdegetProductrManage(HttpServletRequest request){
        return new ModelAndView("orderManage");
    }

}
