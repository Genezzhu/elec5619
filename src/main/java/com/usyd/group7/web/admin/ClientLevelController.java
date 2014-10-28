package com.usyd.group7.web.admin;
import com.usyd.group7.domain.ClientLevel;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/admin/clientlevels")
@Controller
@RooWebScaffold(path = "admin/clientlevels", formBackingObject = ClientLevel.class)
public class ClientLevelController {
}
