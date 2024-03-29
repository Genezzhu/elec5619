// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.usyd.group7.domain;

import com.usyd.group7.domain.ActionHistory;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ActionHistory_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager ActionHistory.entityManager;
    
    public static final List<String> ActionHistory.fieldNames4OrderClauseFilter = java.util.Arrays.asList("created", "clientAction", "client");
    
    public static final EntityManager ActionHistory.entityManager() {
        EntityManager em = new ActionHistory().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long ActionHistory.countActionHistorys() {
        return entityManager().createQuery("SELECT COUNT(o) FROM ActionHistory o", Long.class).getSingleResult();
    }
    
    public static List<ActionHistory> ActionHistory.findAllActionHistorys() {
        return entityManager().createQuery("SELECT o FROM ActionHistory o", ActionHistory.class).getResultList();
    }
    
    public static List<ActionHistory> ActionHistory.findAllActionHistorys(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM ActionHistory o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, ActionHistory.class).getResultList();
    }
    
    public static ActionHistory ActionHistory.findActionHistory(Long id) {
        if (id == null) return null;
        return entityManager().find(ActionHistory.class, id);
    }
    
    public static List<ActionHistory> ActionHistory.findActionHistoryEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM ActionHistory o", ActionHistory.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    public static List<ActionHistory> ActionHistory.findActionHistoryEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM ActionHistory o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, ActionHistory.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void ActionHistory.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void ActionHistory.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            ActionHistory attached = ActionHistory.findActionHistory(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void ActionHistory.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void ActionHistory.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public ActionHistory ActionHistory.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        ActionHistory merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
