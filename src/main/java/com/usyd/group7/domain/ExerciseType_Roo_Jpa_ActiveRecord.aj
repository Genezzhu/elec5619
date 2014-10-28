// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.usyd.group7.domain;

import com.usyd.group7.domain.ExerciseType;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ExerciseType_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager ExerciseType.entityManager;
    
    public static final List<String> ExerciseType.fieldNames4OrderClauseFilter = java.util.Arrays.asList("name", "calorieRate", "exercises");
    
    public static final EntityManager ExerciseType.entityManager() {
        EntityManager em = new ExerciseType().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long ExerciseType.countExerciseTypes() {
        return entityManager().createQuery("SELECT COUNT(o) FROM ExerciseType o", Long.class).getSingleResult();
    }
    
    public static List<ExerciseType> ExerciseType.findAllExerciseTypes() {
        return entityManager().createQuery("SELECT o FROM ExerciseType o", ExerciseType.class).getResultList();
    }
    
    public static List<ExerciseType> ExerciseType.findAllExerciseTypes(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM ExerciseType o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, ExerciseType.class).getResultList();
    }
    
    public static ExerciseType ExerciseType.findExerciseType(Long id) {
        if (id == null) return null;
        return entityManager().find(ExerciseType.class, id);
    }
    
    public static List<ExerciseType> ExerciseType.findExerciseTypeEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM ExerciseType o", ExerciseType.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    public static List<ExerciseType> ExerciseType.findExerciseTypeEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM ExerciseType o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, ExerciseType.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void ExerciseType.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void ExerciseType.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            ExerciseType attached = ExerciseType.findExerciseType(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void ExerciseType.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void ExerciseType.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public ExerciseType ExerciseType.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        ExerciseType merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}