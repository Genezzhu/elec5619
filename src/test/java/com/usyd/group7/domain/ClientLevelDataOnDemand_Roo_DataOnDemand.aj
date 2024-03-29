// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.usyd.group7.domain;

import com.usyd.group7.domain.ClientLevel;
import com.usyd.group7.domain.ClientLevelDataOnDemand;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.stereotype.Component;

privileged aspect ClientLevelDataOnDemand_Roo_DataOnDemand {
    
    declare @type: ClientLevelDataOnDemand: @Component;
    
    private Random ClientLevelDataOnDemand.rnd = new SecureRandom();
    
    private List<ClientLevel> ClientLevelDataOnDemand.data;
    
    public ClientLevel ClientLevelDataOnDemand.getNewTransientClientLevel(int index) {
        ClientLevel obj = new ClientLevel();
        setBadge(obj, index);
        setClientLevel(obj, index);
        setExpRequired(obj, index);
        setName(obj, index);
        return obj;
    }
    
    public void ClientLevelDataOnDemand.setBadge(ClientLevel obj, int index) {
        String badge = "badge_" + index;
        obj.setBadge(badge);
    }
    
    public void ClientLevelDataOnDemand.setClientLevel(ClientLevel obj, int index) {
        int clientLevel = index;
        obj.setClientLevel(clientLevel);
    }
    
    public void ClientLevelDataOnDemand.setExpRequired(ClientLevel obj, int index) {
        int expRequired = index;
        obj.setExpRequired(expRequired);
    }
    
    public void ClientLevelDataOnDemand.setName(ClientLevel obj, int index) {
        String name = "name_" + index;
        obj.setName(name);
    }
    
    public ClientLevel ClientLevelDataOnDemand.getSpecificClientLevel(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        ClientLevel obj = data.get(index);
        Long id = obj.getId();
        return ClientLevel.findClientLevel(id);
    }
    
    public ClientLevel ClientLevelDataOnDemand.getRandomClientLevel() {
        init();
        ClientLevel obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return ClientLevel.findClientLevel(id);
    }
    
    public boolean ClientLevelDataOnDemand.modifyClientLevel(ClientLevel obj) {
        return false;
    }
    
    public void ClientLevelDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = ClientLevel.findClientLevelEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'ClientLevel' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<ClientLevel>();
        for (int i = 0; i < 10; i++) {
            ClientLevel obj = getNewTransientClientLevel(i);
            try {
                obj.persist();
            } catch (final ConstraintViolationException e) {
                final StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    final ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
                }
                throw new IllegalStateException(msg.toString(), e);
            }
            obj.flush();
            data.add(obj);
        }
    }
    
}
