package com.usyd.group7.domain;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

import javax.persistence.Column;
import javax.validation.constraints.NotNull;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.OneToMany;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class ClientAction {

	/**
	 * Define some default client action, so that other class won't hard code it
	 * everytime.
	 */
	public static final String LOGIN = "login";

	public static final String REGISTER = "register";

	public static final String NEW_EXERCISE_RECORD = "new_exercise_record";

	public static final String NEW_BLOG = "new_blog";

	public static final String NEW_ORDER = "new_order";

	/**
     */
	@NotNull
	@Column(unique = true)
	private String name;

	/**
     */
	private String actionCategory;

	/**
     */
	private int exp;

	/**
     */
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "clientAction")
	private Set<ActionHistory> actionHistorys = new HashSet<ActionHistory>();

	/**
     */
	private String descr;

	/**
     */
	private int credit;
}
