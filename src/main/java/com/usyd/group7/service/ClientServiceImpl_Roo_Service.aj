// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.usyd.group7.service;

import com.usyd.group7.domain.Client;
import com.usyd.group7.service.ClientServiceImpl;
import java.util.List;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ClientServiceImpl_Roo_Service {
    
    declare @type: ClientServiceImpl: @Service;
    
    declare @type: ClientServiceImpl: @Transactional;
    
    public long ClientServiceImpl.countAllClients() {
        return Client.countClients();
    }
    
    public void ClientServiceImpl.deleteClient(Client client) {
        client.remove();
    }
    
    public Client ClientServiceImpl.findClient(Long id) {
        return Client.findClient(id);
    }
    
    public List<Client> ClientServiceImpl.findAllClients() {
        return Client.findAllClients();
    }
    
    public List<Client> ClientServiceImpl.findClientEntries(int firstResult, int maxResults) {
        return Client.findClientEntries(firstResult, maxResults);
    }
    
    public void ClientServiceImpl.saveClient(Client client) {
        client.persist();
    }
    
    public Client ClientServiceImpl.updateClient(Client client) {
        return client.merge();
    }
    
}
