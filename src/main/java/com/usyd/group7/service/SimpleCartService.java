package com.usyd.group7.service;

import com.usyd.group7.base.ResultInfo;
import com.usyd.group7.dao.ProductManager;
import com.usyd.group7.domain.Products;
import com.usyd.group7.util.SessionUtil;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;

import java.util.List;
import java.util.Set;

/**
 * Created by Zhengan Zhu
 */
@Component
public class SimpleCartService {
    @Autowired
    private ProductManager productManager;

    private static final Logger LOGGER = LoggerFactory.getLogger(SimpleUserService.class);

    public ResultInfo addToCart(List<String> productList, HttpServletRequest request){
        ResultInfo resultInfo = new ResultInfo();

        try {
            SessionUtil.addToCart(request, productList);
            resultInfo.markSuccess();
        }catch (RuntimeException e){
            LOGGER.error("Add To Cart Error", e);
            resultInfo.setErrorMessage(e);
        }

        return resultInfo;
    }

    public ResultInfo getCart(HttpServletRequest request){
        ResultInfo resultInfo = new ResultInfo();

        try {
            Set<String> productIDList = SessionUtil.getCart(request);
            List<Products> productList = productManager.getProductList(productIDList);

            resultInfo.addData("productList", productList);
            resultInfo.markSuccess();
        }catch (RuntimeException e){
            LOGGER.error("Add To Cart Error", e);
            resultInfo.setErrorMessage(e);
        }

        return resultInfo;
    }
}
