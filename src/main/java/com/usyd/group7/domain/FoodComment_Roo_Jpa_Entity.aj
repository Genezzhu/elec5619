// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.usyd.group7.domain;

import com.usyd.group7.domain.FoodComment;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;

privileged aspect FoodComment_Roo_Jpa_Entity {
    
    declare @type: FoodComment: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long FoodComment.id;
    
    @Version
    @Column(name = "version")
    private Integer FoodComment.version;
    
    public Long FoodComment.getId() {
        return this.id;
    }
    
    public void FoodComment.setId(Long id) {
        this.id = id;
    }
    
    public Integer FoodComment.getVersion() {
        return this.version;
    }
    
    public void FoodComment.setVersion(Integer version) {
        this.version = version;
    }
    
}
