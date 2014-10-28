package com.usyd.group7.dao;

import com.usyd.group7.domain.Order;
import com.usyd.group7.web.PayController;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 * Created by Zhengan Zhu.
 */
@Repository(value = "orderManager")
@Transactional
public class DatabaseOrderManager implements OrderManager {
	@PersistenceContext
	EntityManager entityManager;

    @Override
    public boolean addOrder(Order order) {
         entityManager.persist(order);
         
         String sql = "select o from " + Order.class.getName() + " o where o.userID = :userID and o.orderTime = :orderTime";
         Query query = entityManager.createQuery(sql, Order.class);
         query.setParameter("userID", order.getUserID());
         query.setParameter("orderTime", order.getOrderTime());
         List<Order> list = query.getResultList();
         
         if(list == null || list.isEmpty()){
        	 return false;
         }else{
        	 return true;
         }
    }

    @Override
    public void deleteOrder(long orderID) {
    	System.out.println("-------------"+orderID);
    	String sql = "select o from " + Order.class.getName() + " o where o.orderID = :orderID";
    	Query query = entityManager.createQuery(sql, Order.class);
    	query.setParameter("orderID", orderID);
    	
        Order order= (Order) query.getResultList();

        entityManager.remove(order);
    }

    @SuppressWarnings("unchecked")
	@Override
    public List<Order> getAllOrderList(long userID) {
    	
    	String sql = "select o from " + Order.class.getName() + " o where o.userID = :userID";
    	Query query = entityManager.createQuery(sql, Order.class);
    	query.setParameter("userID", userID);
    	
        return  query.getResultList();
    }

    @SuppressWarnings("unchecked")
	@Override
    public List<Order> getOrderList(long userID, int days) {
        return ((HibernateTemplate) entityManager).find("from Order where userID = ? and timestampdiff(DAY, 'SYSDATE()', orderTime) <= ?",
                new Object[]{
                        userID,
                        days
                });
    }

    @SuppressWarnings("unchecked")
	@Override
    public List<Order> getAllUnPayedOrderList(long userID) {
    	
    	String sql = "select o from " + Order.class.getName() + " o where o.userID = :userID and o.isPayed = false";
    	Query query = entityManager.createQuery(sql, Order.class);
    	query.setParameter("userID", userID);
    	
    	
        return  query.getResultList();
    }

    @Override
    public void payOrder(long userID) {
    	String sql = "select o from " + Order.class.getName() + " o where o.userID = :userID and o.isPayed = false";
    	Query query = entityManager.createQuery(sql, Order.class);
    	query.setParameter("userID", userID);
    	List<Order> orderList = query.getResultList();
    	
    	for(int i = 0; i < orderList.size(); i++){
    		Order order = orderList.get(i);
    		order.setPayed(true);
    		entityManager.merge(order);
    	}
    }
}
