package com.usyd.group7.web;

import com.usyd.group7.base.ResultInfo;
import com.usyd.group7.service.SimpleCartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * Created by Zhengan Zhu.
 */
@Controller
@RequestMapping(value = "/cart")
public class CartController {
    @Autowired
    private SimpleCartService cartService;

    @RequestMapping(value = "addToCart")
    @ResponseBody
    public ResultInfo addToCart(String products, HttpServletRequest request){
        List<String> productList = Arrays.asList(products.split(","));
        return cartService.addToCart(productList, request);
    }

    @RequestMapping(value = "getCartInfo")
    @ResponseBody
    public ResultInfo getCartInfo(HttpServletRequest request){
        return cartService.getCart(request);
    }
}
