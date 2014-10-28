package com.usyd.group7.dao;

import com.usyd.group7.domain.Blog;
import com.usyd.group7.domain.Integral;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 * Created by Zhengan Zhu.
 */
@Repository(value = "integralManager")
@Transactional
public class DatabaseIntegralManager implements IntegralManager{
	@PersistenceContext
	EntityManager entityManager;


    @Override
    public boolean updateIntegral(long userID, long delta) {
    	
    	System.out.println("I am in DAO update Integral!!!");
    	System.out.println("User ID: " + userID + "\nDelta: " + delta);
    	
    	String sqlString = "select i from " + Integral.class.getName() + " i where i.userID = :iuserid";
    	Query query = entityManager.createQuery(sqlString, Integral.class);
    	query.setParameter("iuserid", userID);
    	
    	Integral integral;
    	
    	List<Integral> integralList = query.getResultList();
    	
    	if(integralList == null || integralList.isEmpty()){
    		integral = null;
    	}else{
    		integral = integralList.get(0);
    	}
        
        System.out.println("UserID: " + integral.getUserID() +"\nRemaining Points: "+integral.getRemainingIntegral());
    	
    	integral.setRemainingIntegral(integral.getRemainingIntegral() - delta);
    	System.out.println("UserID: " + integral.getUserID() +"\nRemaining Points: "+integral.getRemainingIntegral());
    	
    	entityManager.merge(integral);
    	
    	Query query1 = entityManager.createQuery(sqlString, Integral.class);
    	query1.setParameter("iuserid", userID);
    	
    	Integral nextintegral;
    	
    	List<Integral> nextintegrals = query1.getResultList();
    	
    	if(nextintegrals == null || nextintegrals.isEmpty()){
    		nextintegral = null;
    	}else{
    		nextintegral = nextintegrals.get(0);
    	}
    	
    	if(nextintegral.getRemainingIntegral() == integral.getRemainingIntegral()){
    		return true;
    	}else{
    		return false;
    	}
    	
        
    }

    @Override
    public Integral getIntegral(long userID) {
    	
    	System.out.println("-----------------"+userID);
    	
    	String sql = "select i from " + Integral.class.getName() + " i where i.userID = :userID";
    	
    	Query query = entityManager.createQuery(sql, Integral.class);
        
        query.setParameter("userID", userID);
        
        List<Integral> integralList = query.getResultList();

        if(integralList == null || integralList.isEmpty()){
            return null;
        }else{
            return integralList.get(0);
        }
    }
}
