// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.usyd.group7.domain;

import com.usyd.group7.domain.ClientLevel;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;

privileged aspect ClientLevel_Roo_Jpa_Entity {
    
    declare @type: ClientLevel: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long ClientLevel.id;
    
    @Version
    @Column(name = "version")
    private Integer ClientLevel.version;
    
    public Long ClientLevel.getId() {
        return this.id;
    }
    
    public void ClientLevel.setId(Long id) {
        this.id = id;
    }
    
    public Integer ClientLevel.getVersion() {
        return this.version;
    }
    
    public void ClientLevel.setVersion(Integer version) {
        this.version = version;
    }
    
}
