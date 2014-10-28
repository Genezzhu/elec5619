package com.usyd.group7.domain;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.persistence.Column;
import javax.validation.constraints.NotNull;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class ClientLevel {

    /**
     */
    @NotNull
    @Column(unique = true)
    private int clientLevel;

    /**
     */
    @NotNull
    private int expRequired;

    /**
     */
    private String name;

    /**
     */
    private String badge;
}
