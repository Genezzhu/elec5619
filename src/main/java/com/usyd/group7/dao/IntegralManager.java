package com.usyd.group7.dao;

import com.usyd.group7.domain.Integral;

/**
 * Created by Zhengan Zhu
 */
public interface IntegralManager {
    public boolean updateIntegral(long userID, long delta);
    public Integral getIntegral(long userID);
}
