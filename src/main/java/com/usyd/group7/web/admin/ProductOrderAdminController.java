package com.usyd.group7.web.admin;
import com.usyd.group7.domain.ProductOrder;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/admin/productOrders")
@Controller
@RooWebScaffold(path = "admin/productOrders", formBackingObject = ProductOrder.class)
public class ProductOrderAdminController {
}
