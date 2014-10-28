package com.usyd.group7.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.usyd.group7.dao.IntegralManager;
import com.usyd.group7.domain.Integral;

@Component
public class IntegralServiceImpl implements IntegralService{
	
	@Autowired
    private IntegralManager integralManager;

	@Override
	public boolean updateIntegral(long userID, long delta) {
		System.out.println("I am In Integral Service Update!");
		boolean a = integralManager.updateIntegral(userID, delta);
		return a;
	}

	@Override
	public Integral getIntegral(long userID) {
		Integral integralList = integralManager.getIntegral(userID);
		return integralList;
	}

}
