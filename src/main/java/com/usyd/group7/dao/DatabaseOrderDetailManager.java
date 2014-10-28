package com.usyd.group7.dao;

import com.usyd.group7.domain.OrderDetail;
import com.usyd.group7.domain.Products;

import org.hibernate.Session;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 * Created by Zhengan Zhu.
 */
@Repository(value = "orderDetailManger")
@Transactional
public class DatabaseOrderDetailManager implements OrderDetailManager{
	@PersistenceContext
	EntityManager entityManager;

	 @Override
	    public boolean addOrderDetail(OrderDetail detail) {
	        return ((Session) entityManager).save(detail) != null;
	    }

	    @Override
	    public void batchAddOrderDetail(List<OrderDetail> detailList) {
	    	System.out.println("I am in DAO add bath order detail!!!");
	    	System.out.println(detailList.size());
	        for(int i = 0; i < detailList.size(); i++){
	        	OrderDetail orderDetail = new OrderDetail();
	        	orderDetail = detailList.get(i);
	        	entityManager.persist(orderDetail);
	        	entityManager.flush();
	        }
	    	
	    }

	    @Override
	    public List<OrderDetail> getOrderDetailList(List<Long> orderIDList) {
	        
	        Query query = entityManager.createQuery("from OrderDetail o where o.orderID in (:orderIDList) order by o.orderID");
	        query.setParameter("orderIDList", orderIDList);

	        return query.getResultList();
	    }

	    @Override
	    public void deleteOrderDetail(List<Long> orderIDList) {
	        
	        Query query = entityManager.createQuery("delete from OrderDetail where orderID in (:orderIDList)");
	        query.setParameter("orderIDList", orderIDList);
	        query.executeUpdate();
	    }

	    @Override
	    public Map<Long, Double> getOrderTotalPrice(List<Long> orderIDList){
	        HashMap<Long, Double> total = new HashMap<Long, Double>();
	        List<Map> list = null;

	        if(orderIDList != null && !orderIDList.isEmpty()){
	          
	            Query query = entityManager.createQuery(" select new map(o.orderID, sum(p.price * o.productQuan)) from "+ OrderDetail.class.getName() +" o, " + Products.class.getName() + " p " +
	                    " where o.orderID in (:orderIDList) and o.productID = p.productID " +
	                    " group by o.orderID order by o.orderID");
	            query.setParameter("orderIDList", orderIDList);

	            list = query.getResultList();
	        }


	        if(list != null){
	            for(Map row : list){
	                total.put(Long.valueOf(row.get("0").toString()), Double.valueOf(row.get("1").toString()));
	            }
	        }

	        return total;
	    }
}
