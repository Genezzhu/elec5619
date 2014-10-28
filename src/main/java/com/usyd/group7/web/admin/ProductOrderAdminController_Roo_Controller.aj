// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.usyd.group7.web.admin;

import com.usyd.group7.domain.ProductOrder;
import com.usyd.group7.domain.ProductOrderItem;
import com.usyd.group7.service.ClientService;
import com.usyd.group7.service.OrderService;
import com.usyd.group7.web.admin.ProductOrderAdminController;
import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.joda.time.format.DateTimeFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect ProductOrderAdminController_Roo_Controller {
    
    @Autowired
    OrderService ProductOrderAdminController.orderService;
    
    @Autowired
    ClientService ProductOrderAdminController.clientService;
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String ProductOrderAdminController.create(@Valid ProductOrder productOrder, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, productOrder);
            return "admin/productOrders/create";
        }
        uiModel.asMap().clear();
        orderService.saveProductOrder(productOrder);
        return "redirect:/admin/productOrders/" + encodeUrlPathSegment(productOrder.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String ProductOrderAdminController.createForm(Model uiModel) {
        populateEditForm(uiModel, new ProductOrder());
        return "admin/productOrders/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String ProductOrderAdminController.show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("productorder", orderService.findProductOrder(id));
        uiModel.addAttribute("itemId", id);
        return "admin/productOrders/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String ProductOrderAdminController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("productorders", ProductOrder.findProductOrderEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) orderService.countAllProductOrders() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("productorders", ProductOrder.findAllProductOrders(sortFieldName, sortOrder));
        }
        addDateTimeFormatPatterns(uiModel);
        return "admin/productOrders/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String ProductOrderAdminController.update(@Valid ProductOrder productOrder, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, productOrder);
            return "admin/productOrders/update";
        }
        uiModel.asMap().clear();
        orderService.updateProductOrder(productOrder);
        return "redirect:/admin/productOrders/" + encodeUrlPathSegment(productOrder.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String ProductOrderAdminController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, orderService.findProductOrder(id));
        return "admin/productOrders/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String ProductOrderAdminController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        ProductOrder productOrder = orderService.findProductOrder(id);
        orderService.deleteProductOrder(productOrder);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/admin/productOrders";
    }
    
    void ProductOrderAdminController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("productOrder_created_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
    }
    
    void ProductOrderAdminController.populateEditForm(Model uiModel, ProductOrder productOrder) {
        uiModel.addAttribute("productOrder", productOrder);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("clients", clientService.findAllClients());
        uiModel.addAttribute("productorderitems", ProductOrderItem.findAllProductOrderItems());
    }
    
    String ProductOrderAdminController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
