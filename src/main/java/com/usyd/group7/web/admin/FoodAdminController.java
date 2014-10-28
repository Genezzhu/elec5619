package com.usyd.group7.web.admin;
import com.usyd.group7.domain.Food;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/admin/foods")
@Controller
@RooWebScaffold(path = "admin/foods", formBackingObject = Food.class)
public class FoodAdminController {
}
