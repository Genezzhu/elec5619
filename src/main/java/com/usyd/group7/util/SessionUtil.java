package com.usyd.group7.util;

import com.usyd.group7.domain.User;

import javax.servlet.http.HttpServletRequest;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class SessionUtil {

    public static final String USER = "user";
    public static final String CART = "cart";

    public static User getUser(HttpServletRequest request){
    	System.out.println(request.getSession());
        return getAttribute(User.class, USER, request);
    }

    public static void putUser(User user, HttpServletRequest request){
        putAttribute(USER, user, request);
    }

    public static void addToCart(HttpServletRequest request, List<String> productIDList){
        Set<String> productList = getAttribute(Set.class, CART, request);
        if(productList == null){
            productList = new HashSet<String>();
        }

        productList.addAll(productIDList);
        putAttribute(CART, productList, request);
    }

    public static Set<String> getCart(HttpServletRequest request){
        Set<String> productList = getAttribute(Set.class, CART, request);
        if(productList == null){
            productList = new HashSet<String>();
        }

        return productList;
    }

	@SuppressWarnings("unchecked")
	public static <T> T getAttribute(Class<T> clazz, String key, HttpServletRequest request){
		return (T)(request.getSession().getAttribute(key));
	}

	public static void putAttribute(String key, Object value, HttpServletRequest request){
		System.out.println("Put into key:" + key + "; value :" + value);
		request.getSession().setAttribute(key, value);
		System.out.println("Retrieve at once: " + request.getSession().getAttribute(key));
	}

	public static void removeAttribute(String key, HttpServletRequest request){
		request.getSession().removeAttribute(key);
	}

}
