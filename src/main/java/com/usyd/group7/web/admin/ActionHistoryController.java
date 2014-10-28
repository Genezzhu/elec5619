package com.usyd.group7.web.admin;
import com.usyd.group7.domain.ActionHistory;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/admin/actionhistorys")
@Controller
@RooWebScaffold(path = "admin/actionhistorys", formBackingObject = ActionHistory.class)
public class ActionHistoryController {
}
