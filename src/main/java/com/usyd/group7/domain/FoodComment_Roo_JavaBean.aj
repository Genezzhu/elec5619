// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.usyd.group7.domain;

import com.usyd.group7.domain.Client;
import com.usyd.group7.domain.Food;
import com.usyd.group7.domain.FoodComment;
import java.util.Date;

privileged aspect FoodComment_Roo_JavaBean {
    
    public String FoodComment.getContent() {
        return this.content;
    }
    
    public void FoodComment.setContent(String content) {
        this.content = content;
    }
    
    public Date FoodComment.getCreated() {
        return this.created;
    }
    
    public void FoodComment.setCreated(Date created) {
        this.created = created;
    }
    
    public Client FoodComment.getClient() {
        return this.client;
    }
    
    public void FoodComment.setClient(Client client) {
        this.client = client;
    }
    
    public Food FoodComment.getFood() {
        return this.food;
    }
    
    public void FoodComment.setFood(Food food) {
        this.food = food;
    }
    
}