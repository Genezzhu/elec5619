package com.usyd.group7.web.admin;
import com.usyd.group7.domain.ProductOrderItem;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/admin/productOrderItems")
@Controller
@RooWebScaffold(path = "admin/productOrderItems", formBackingObject = ProductOrderItem.class)
public class ProductOrderItemAdminController {
}
