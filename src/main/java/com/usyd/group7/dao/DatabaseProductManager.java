package com.usyd.group7.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.usyd.group7.domain.Products;

@Service("productManager")
@Transactional
public class DatabaseProductManager implements ProductManager {

	@PersistenceContext
	EntityManager entityManager;
	

	@Override
	public void increasePrice(int percentage) {
		Session currentSession = ((SessionFactory) entityManager).getCurrentSession();
		List<Products> products = currentSession.createQuery("FROM Product").list();
		
		if (products != null) {
			for (Products product : products) {
				double newPrice = product.getPrice();
				product.setPrice(newPrice);
				currentSession.save(product);
			}
		}
		
	}

	@Override
	public List<Products> getProducts() {
		String sql = "select p from " + Products.class.getName() + " p";
		Query query = entityManager.createQuery(sql, Products.class);
		return query.getResultList();
	}

	public void addProduct(Products product) {
		entityManager.persist(product);
		
	}

	public Products getProductById(String id) {
		String sql = "select p from " + Products.class.getName() + " p where p.productID = :productID";
		Query query = entityManager.createQuery(sql, Products.class);
		query.setParameter("productID", id);
		List<Products> productList = query.getResultList();
		if(productList == null || productList.isEmpty()){
			throw new RuntimeException("No Result Found");
		}else{
			return productList.get(0);
		}
	}

    @Override
    public List<Products> getProductList(Set<String> productIDSet) {
    	List<String> productIDList = new ArrayList<String>(); 
    	productIDList.addAll(productIDSet);
    	String sql = "select p from " + Products.class.getName() + " p where p.productID in (:productIDList) order by p.productID";
		Query query = entityManager.createQuery(sql, Products.class);
        query.setParameter("productIDList", productIDList);

        List<Products> productList = query.getResultList();
        
        if(productList == null || productList.isEmpty()){
        	return null;
        }else{
        	return productList;
        } 
    }

    public void updateProduct(Products product) {
		entityManager.merge(product);
		
	}

	public void deleteProduct(String id) {
		String sql = "select p from " + Products.class.getName() + " p where p.productID = :productID";
		Query query = entityManager.createQuery(sql, Products.class);
		query.setParameter("productID", id);
		Products product = (Products)query.getSingleResult();
		entityManager.remove(product);
	}

}
