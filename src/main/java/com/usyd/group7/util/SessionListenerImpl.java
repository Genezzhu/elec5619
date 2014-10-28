package com.usyd.group7.util;

import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class SessionListenerImpl implements HttpSessionAttributeListener, HttpSessionListener{

	@Override
	public void sessionCreated(HttpSessionEvent arg0) {
		System.out.println("Session Createed");
		
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent arg0) {
		System.out.println("Session Destroyed");		
	}

	@Override
	public void attributeAdded(HttpSessionBindingEvent arg0) {
		System.out.println("Session Added");
		System.out.println("Name: " + arg0.getName() + "; Value: " + arg0.getValue());
	}

	@Override
	public void attributeRemoved(HttpSessionBindingEvent arg0) {
		System.out.println("Session removed");
		System.out.println("Name: " + arg0.getName() + "; Value: " + arg0.getValue());
	}

	@Override
	public void attributeReplaced(HttpSessionBindingEvent arg0) {
		System.out.println("Session replaced");
		System.out.println("Name: " + arg0.getName() + "; Value: " + arg0.getValue());
	}
	
}
