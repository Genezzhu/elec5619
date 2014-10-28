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
import javax.persistence.ManyToOne;
import javax.persistence.OrderBy;
import javax.persistence.ManyToMany;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Client {

    /**
     */
    @NotNull
    @Column(unique = true)
    private String username;

    /**
     */
    private String password;

    /**
     */
    private String email;

    /**
     */
    private Boolean emailVerified;

    /**
     */
    private int exp;

    /**
     */
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "client")
    @OrderBy("created DESC")
    private Set<Exercise> exercises = new HashSet<Exercise>();

    /**
     */
    @ManyToOne
    private ClientLevel clientLevel;

    /**
     * test
     */
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "client")
    @OrderBy("created DESC")
    private Set<ActionHistory> actionHistorys = new HashSet<ActionHistory>();

    /**
     */
    @ManyToMany(cascade = CascadeType.ALL)
    @OrderBy("created DESC")
    private Set<Blog> blogs = new HashSet<Blog>();

    /**
     */
    private double height;

    /**
     */
    private double weight;

    /**
     */
    private int credit;

    /**
     * useless, dont remove it
     */
    private int point;

    /**
     */
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "client")
    private Set<ProductOrder> orders = new HashSet<ProductOrder>();
}
