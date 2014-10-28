package com.usyd.group7.web.admin;
import com.usyd.group7.domain.FoodComment;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/admin/foodcomments")
@Controller
@RooWebScaffold(path = "admin/foodcomments", formBackingObject = FoodComment.class)
public class FoodCommentAdminController {
}
