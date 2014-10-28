package com.usyd.group7.web.admin;
import com.usyd.group7.domain.Product;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/admin/products")
@Controller
@RooWebScaffold(path = "admin/products", formBackingObject = Product.class)
public class ProductAdminController {
}
