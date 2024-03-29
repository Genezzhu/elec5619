// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.usyd.group7.web.admin;

import com.usyd.group7.domain.ActionHistory;
import com.usyd.group7.domain.Client;
import com.usyd.group7.domain.ClientLevel;
import com.usyd.group7.service.BlogService;
import com.usyd.group7.service.ClientService;
import com.usyd.group7.service.ExerciseService;
import com.usyd.group7.service.OrderService;
import com.usyd.group7.web.admin.ClientController;
import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect ClientController_Roo_Controller {
    
    @Autowired
    ClientService ClientController.clientService;
    
    @Autowired
    BlogService ClientController.blogService;
    
    @Autowired
    ExerciseService ClientController.exerciseService;
    
    @Autowired
    OrderService ClientController.orderService;
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String ClientController.create(@Valid Client client, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, client);
            return "admin/clients/create";
        }
        uiModel.asMap().clear();
        clientService.saveClient(client);
        return "redirect:/admin/clients/" + encodeUrlPathSegment(client.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String ClientController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Client());
        return "admin/clients/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String ClientController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("client", clientService.findClient(id));
        uiModel.addAttribute("itemId", id);
        return "admin/clients/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String ClientController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("clients", Client.findClientEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) clientService.countAllClients() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("clients", Client.findAllClients(sortFieldName, sortOrder));
        }
        return "admin/clients/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String ClientController.update(@Valid Client client, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, client);
            return "admin/clients/update";
        }
        uiModel.asMap().clear();
        clientService.updateClient(client);
        return "redirect:/admin/clients/" + encodeUrlPathSegment(client.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String ClientController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, clientService.findClient(id));
        return "admin/clients/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String ClientController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Client client = clientService.findClient(id);
        clientService.deleteClient(client);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/admin/clients";
    }
    
    void ClientController.populateEditForm(Model uiModel, Client client) {
        uiModel.addAttribute("client", client);
        uiModel.addAttribute("actionhistorys", ActionHistory.findAllActionHistorys());
        uiModel.addAttribute("blogs", blogService.findAllBlogs());
        uiModel.addAttribute("clientlevels", ClientLevel.findAllClientLevels());
        uiModel.addAttribute("exercises", exerciseService.findAllExercises());
        uiModel.addAttribute("productorders", orderService.findAllProductOrders());
    }
    
    String ClientController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
