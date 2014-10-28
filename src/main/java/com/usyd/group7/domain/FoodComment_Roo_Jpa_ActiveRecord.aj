// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.usyd.group7.domain;

import com.usyd.group7.domain.FoodComment;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect FoodComment_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager FoodComment.entityManager;
    
    public static final List<String> FoodComment.fieldNames4OrderClauseFilter = java.util.Arrays.asList("content", "created", "client", "food");
    
    public static final EntityManager FoodComment.entityManager() {
        EntityManager em = new FoodComment().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long FoodComment.countFoodComments() {
        return entityManager().createQuery("SELECT COUNT(o) FROM FoodComment o", Long.class).getSingleResult();
    }
    
    public static List<FoodComment> FoodComment.findAllFoodComments() {
        return entityManager().createQuery("SELECT o FROM FoodComment o", FoodComment.class).getResultList();
    }
    
    public static List<FoodComment> FoodComment.findAllFoodComments(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM FoodComment o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, FoodComment.class).getResultList();
    }
    
    public static FoodComment FoodComment.findFoodComment(Long id) {
        if (id == null) return null;
        return entityManager().find(FoodComment.class, id);
    }
    
    public static List<FoodComment> FoodComment.findFoodCommentEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM FoodComment o", FoodComment.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    public static List<FoodComment> FoodComment.findFoodCommentEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM FoodComment o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, FoodComment.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void FoodComment.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void FoodComment.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            FoodComment attached = FoodComment.findFoodComment(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void FoodComment.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void FoodComment.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public FoodComment FoodComment.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        FoodComment merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}