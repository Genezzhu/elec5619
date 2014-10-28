package com.usyd.group7.domain;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Food {

    /**
     */
    private String name;

    /**
     */
    private String image;

    /**
     */
    private double calorie;

    /**
     */
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "food")
    @OrderBy("created DESC")
    private Set<FoodComment> foodComments = new HashSet<FoodComment>();

    /**
     */
    private String unit;
}
