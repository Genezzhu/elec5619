// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.usyd.group7.domain;

import com.usyd.group7.domain.BlogType;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect BlogType_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager BlogType.entityManager;
    
    public static final List<String> BlogType.fieldNames4OrderClauseFilter = java.util.Arrays.asList("name", "blogs");
    
    public static final EntityManager BlogType.entityManager() {
        EntityManager em = new BlogType().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long BlogType.countBlogTypes() {
        return entityManager().createQuery("SELECT COUNT(o) FROM BlogType o", Long.class).getSingleResult();
    }
    
    public static List<BlogType> BlogType.findAllBlogTypes() {
        return entityManager().createQuery("SELECT o FROM BlogType o", BlogType.class).getResultList();
    }
    
    public static List<BlogType> BlogType.findAllBlogTypes(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM BlogType o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, BlogType.class).getResultList();
    }
    
    public static BlogType BlogType.findBlogType(Long id) {
        if (id == null) return null;
        return entityManager().find(BlogType.class, id);
    }
    
    public static List<BlogType> BlogType.findBlogTypeEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM BlogType o", BlogType.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    public static List<BlogType> BlogType.findBlogTypeEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM BlogType o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, BlogType.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void BlogType.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void BlogType.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            BlogType attached = BlogType.findBlogType(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void BlogType.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void BlogType.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public BlogType BlogType.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        BlogType merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}