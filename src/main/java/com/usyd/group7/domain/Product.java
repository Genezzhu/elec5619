package com.usyd.group7.domain;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Product {

    /**
     */
    @NotNull
    @Size(min = 2)
    private String name;

    /**
     */
    private double credit;

    /**
     */
    private double price;

    /**
     */
    private String image;

    /**
     */
    private String descr;
}
