package com.usyd.group7.web.admin;
import com.usyd.group7.domain.BlogType;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/admin/blogtypes")
@Controller
@RooWebScaffold(path = "admin/blogtypes", formBackingObject = BlogType.class)
public class BlogTypeController {
}
