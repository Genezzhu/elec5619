package com.usyd.group7.service;

import com.usyd.group7.domain.Integral;

public interface IntegralService {
	public boolean updateIntegral(long userID, long delta);
    public Integral getIntegral(long userID);
}
