// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.usyd.group7.domain;

import com.usyd.group7.domain.Exercise;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;

privileged aspect Exercise_Roo_Jpa_Entity {
    
    declare @type: Exercise: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long Exercise.id;
    
    @Version
    @Column(name = "version")
    private Integer Exercise.version;
    
    public Long Exercise.getId() {
        return this.id;
    }
    
    public void Exercise.setId(Long id) {
        this.id = id;
    }
    
    public Integer Exercise.getVersion() {
        return this.version;
    }
    
    public void Exercise.setVersion(Integer version) {
        this.version = version;
    }
    
}
