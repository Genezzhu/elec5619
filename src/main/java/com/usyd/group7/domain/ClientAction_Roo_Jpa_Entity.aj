// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.usyd.group7.domain;

import com.usyd.group7.domain.ClientAction;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;

privileged aspect ClientAction_Roo_Jpa_Entity {
    
    declare @type: ClientAction: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long ClientAction.id;
    
    @Version
    @Column(name = "version")
    private Integer ClientAction.version;
    
    public Long ClientAction.getId() {
        return this.id;
    }
    
    public void ClientAction.setId(Long id) {
        this.id = id;
    }
    
    public Integer ClientAction.getVersion() {
        return this.version;
    }
    
    public void ClientAction.setVersion(Integer version) {
        this.version = version;
    }
    
}