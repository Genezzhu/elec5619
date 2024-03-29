// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.usyd.group7.domain;

import com.usyd.group7.domain.Client;
import com.usyd.group7.domain.ClientDataOnDemand;
import com.usyd.group7.domain.ClientLevelDataOnDemand;
import com.usyd.group7.service.ClientService;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect ClientDataOnDemand_Roo_DataOnDemand {
    
    declare @type: ClientDataOnDemand: @Component;
    
    private Random ClientDataOnDemand.rnd = new SecureRandom();
    
    private List<Client> ClientDataOnDemand.data;
    
    @Autowired
    ClientLevelDataOnDemand ClientDataOnDemand.clientLevelDataOnDemand;
    
    @Autowired
    ClientService ClientDataOnDemand.clientService;
    
    public Client ClientDataOnDemand.getNewTransientClient(int index) {
        Client obj = new Client();
        setCredit(obj, index);
        setEmail(obj, index);
        setEmailVerified(obj, index);
        setExp(obj, index);
        setHeight(obj, index);
        setPassword(obj, index);
        setPoint(obj, index);
        setUsername(obj, index);
        setWeight(obj, index);
        return obj;
    }
    
    public void ClientDataOnDemand.setCredit(Client obj, int index) {
        int credit = index;
        obj.setCredit(credit);
    }
    
    public void ClientDataOnDemand.setEmail(Client obj, int index) {
        String email = "foo" + index + "@bar.com";
        obj.setEmail(email);
    }
    
    public void ClientDataOnDemand.setEmailVerified(Client obj, int index) {
        Boolean emailVerified = Boolean.TRUE;
        obj.setEmailVerified(emailVerified);
    }
    
    public void ClientDataOnDemand.setExp(Client obj, int index) {
        int exp = index;
        obj.setExp(exp);
    }
    
    public void ClientDataOnDemand.setHeight(Client obj, int index) {
        double height = new Integer(index).doubleValue();
        obj.setHeight(height);
    }
    
    public void ClientDataOnDemand.setPassword(Client obj, int index) {
        String password = "password_" + index;
        obj.setPassword(password);
    }
    
    public void ClientDataOnDemand.setPoint(Client obj, int index) {
        int point = index;
        obj.setPoint(point);
    }
    
    public void ClientDataOnDemand.setUsername(Client obj, int index) {
        String username = "username_" + index;
        obj.setUsername(username);
    }
    
    public void ClientDataOnDemand.setWeight(Client obj, int index) {
        double weight = new Integer(index).doubleValue();
        obj.setWeight(weight);
    }
    
    public Client ClientDataOnDemand.getSpecificClient(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Client obj = data.get(index);
        Long id = obj.getId();
        return clientService.findClient(id);
    }
    
    public Client ClientDataOnDemand.getRandomClient() {
        init();
        Client obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return clientService.findClient(id);
    }
    
    public boolean ClientDataOnDemand.modifyClient(Client obj) {
        return false;
    }
    
    public void ClientDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = clientService.findClientEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Client' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Client>();
        for (int i = 0; i < 10; i++) {
            Client obj = getNewTransientClient(i);
            try {
                clientService.saveClient(obj);
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
