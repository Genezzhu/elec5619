// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.usyd.group7.domain;

import com.usyd.group7.domain.ActionHistory;
import com.usyd.group7.domain.Client;
import com.usyd.group7.domain.ClientAction;
import java.util.Date;

privileged aspect ActionHistory_Roo_JavaBean {
    
    public Date ActionHistory.getCreated() {
        return this.created;
    }
    
    public void ActionHistory.setCreated(Date created) {
        this.created = created;
    }
    
    public ClientAction ActionHistory.getClientAction() {
        return this.clientAction;
    }
    
    public void ActionHistory.setClientAction(ClientAction clientAction) {
        this.clientAction = clientAction;
    }
    
    public Client ActionHistory.getClient() {
        return this.client;
    }
    
    public void ActionHistory.setClient(Client client) {
        this.client = client;
    }
    
}