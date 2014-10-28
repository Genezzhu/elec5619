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
public class ExerciseType {

    /**
     */
    @NotNull
    @Column(unique = true)
    private String name;

    /**
     */
    private double calorieRate;

    /**
     */
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "exerciseType")
    private Set<Exercise> exercises = new HashSet<Exercise>();
}
