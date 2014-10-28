package com.usyd.group7.web;

import com.usyd.group7.base.ResultInfo;

import com.usyd.group7.service.IntegralService;
import com.usyd.group7.service.OrderServices;
import com.usyd.group7.util.SessionUtil;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
// * Created by Zhengan Zhu
 */
@Controller
@RequestMapping(value = "/pay/")
public class PayController {
	@Autowired
    private IntegralService integralService;
	@Autowired
    private OrderServices orderServices;

    private static final Logger LOGGER = LoggerFactory.getLogger(PayController.class);

    @Transactional
    @RequestMapping(value = "payUsingIntegral", method = RequestMethod.POST)
    @ResponseBody
    public ResultInfo payUsingIntegral(long integralToUse, HttpServletRequest request) {
    	System.out.println(integralToUse);
        ResultInfo resultInfo = new ResultInfo();
        long userID = SessionUtil.getUser(request).getUserID();
        System.out.println("User ID: "+userID);

        try{
        	integralService.updateIntegral(userID, integralToUse);
        	System.out.println("Executed in Pay Controller!");
        	orderServices.payOrder(userID);
        	System.out.println("Executed in payOrder Service in pay Controller!");
            resultInfo.markSuccess();
        }catch (RuntimeException e){
            LOGGER.error(e.getCause().getMessage());
            resultInfo.setErrorMessage(e);
        }

        return resultInfo;
    }
}
