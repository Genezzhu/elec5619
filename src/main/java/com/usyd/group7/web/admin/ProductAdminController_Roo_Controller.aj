// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.usyd.group7.web.admin;

import com.usyd.group7.domain.Product;
import com.usyd.group7.web.admin.ProductAdminController;
import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect ProductAdminController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String ProductAdminController.create(@Valid Product product, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, product);
            return "admin/products/create";
        }
        uiModel.asMap().clear();
        product.persist();
        return "redirect:/admin/products/" + encodeUrlPathSegment(product.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String ProductAdminController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Product());
        return "admin/products/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String ProductAdminController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("product", Product.findProduct(id));
        uiModel.addAttribute("itemId", id);
        return "admin/products/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String ProductAdminController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("products", Product.findProductEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) Product.countProducts() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("products", Product.findAllProducts(sortFieldName, sortOrder));
        }
        return "admin/products/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String ProductAdminController.update(@Valid Product product, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, product);
            return "admin/products/update";
        }
        uiModel.asMap().clear();
        product.merge();
        return "redirect:/admin/products/" + encodeUrlPathSegment(product.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String ProductAdminController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, Product.findProduct(id));
        return "admin/products/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String ProductAdminController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Product product = Product.findProduct(id);
        product.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/admin/products";
    }
    
    void ProductAdminController.populateEditForm(Model uiModel, Product product) {
        uiModel.addAttribute("product", product);
    }
    
    String ProductAdminController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
