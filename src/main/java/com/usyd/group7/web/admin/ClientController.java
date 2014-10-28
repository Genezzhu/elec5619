package com.usyd.group7.web.admin;
import com.usyd.group7.domain.Client;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/admin/clients")
@Controller
@RooWebScaffold(path = "admin/clients", formBackingObject = Client.class)
public class ClientController {
}
