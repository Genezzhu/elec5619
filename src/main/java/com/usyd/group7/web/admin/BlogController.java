package com.usyd.group7.web.admin;
import com.usyd.group7.domain.Blog;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/admin/blogs")
@Controller
@RooWebScaffold(path = "admin/blogs", formBackingObject = Blog.class)
public class BlogController {
}
