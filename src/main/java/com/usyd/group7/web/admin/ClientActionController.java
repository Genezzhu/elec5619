package com.usyd.group7.web.admin;
import com.usyd.group7.domain.ClientAction;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/admin/clientactions")
@Controller
@RooWebScaffold(path = "admin/clientactions", formBackingObject = ClientAction.class)
public class ClientActionController {
}
