// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.usyd.group7.web.admin;

import com.usyd.group7.domain.Food;
import com.usyd.group7.service.FoodCommentService;
import com.usyd.group7.service.FoodService;
import com.usyd.group7.web.admin.FoodAdminController;
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

privileged aspect FoodAdminController_Roo_Controller {
    
    @Autowired
    FoodService FoodAdminController.foodService;
    
    @Autowired
    FoodCommentService FoodAdminController.foodCommentService;
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String FoodAdminController.create(@Valid Food food, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, food);
            return "admin/foods/create";
        }
        uiModel.asMap().clear();
        foodService.saveFood(food);
        return "redirect:/admin/foods/" + encodeUrlPathSegment(food.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String FoodAdminController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Food());
        return "admin/foods/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String FoodAdminController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("food", foodService.findFood(id));
        uiModel.addAttribute("itemId", id);
        return "admin/foods/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String FoodAdminController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("foods", Food.findFoodEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) foodService.countAllFoods() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("foods", Food.findAllFoods(sortFieldName, sortOrder));
        }
        return "admin/foods/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String FoodAdminController.update(@Valid Food food, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, food);
            return "admin/foods/update";
        }
        uiModel.asMap().clear();
        foodService.updateFood(food);
        return "redirect:/admin/foods/" + encodeUrlPathSegment(food.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String FoodAdminController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, foodService.findFood(id));
        return "admin/foods/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String FoodAdminController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Food food = foodService.findFood(id);
        foodService.deleteFood(food);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/admin/foods";
    }
    
    void FoodAdminController.populateEditForm(Model uiModel, Food food) {
        uiModel.addAttribute("food", food);
        uiModel.addAttribute("foodcomments", foodCommentService.findAllFoodComments());
    }
    
    String FoodAdminController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
