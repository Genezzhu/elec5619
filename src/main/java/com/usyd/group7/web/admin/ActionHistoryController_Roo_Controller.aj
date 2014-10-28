// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.usyd.group7.web.admin;

import com.usyd.group7.domain.ActionHistory;
import com.usyd.group7.domain.ClientAction;
import com.usyd.group7.service.ClientService;
import com.usyd.group7.web.admin.ActionHistoryController;
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

privileged aspect ActionHistoryController_Roo_Controller {
    
    @Autowired
    ClientService ActionHistoryController.clientService;
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String ActionHistoryController.create(@Valid ActionHistory actionHistory, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, actionHistory);
            return "admin/actionhistorys/create";
        }
        uiModel.asMap().clear();
        actionHistory.persist();
        return "redirect:/admin/actionhistorys/" + encodeUrlPathSegment(actionHistory.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String ActionHistoryController.createForm(Model uiModel) {
        populateEditForm(uiModel, new ActionHistory());
        return "admin/actionhistorys/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String ActionHistoryController.show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("actionhistory", ActionHistory.findActionHistory(id));
        uiModel.addAttribute("itemId", id);
        return "admin/actionhistorys/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String ActionHistoryController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("actionhistorys", ActionHistory.findActionHistoryEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) ActionHistory.countActionHistorys() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("actionhistorys", ActionHistory.findAllActionHistorys(sortFieldName, sortOrder));
        }
        addDateTimeFormatPatterns(uiModel);
        return "admin/actionhistorys/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String ActionHistoryController.update(@Valid ActionHistory actionHistory, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, actionHistory);
            return "admin/actionhistorys/update";
        }
        uiModel.asMap().clear();
        actionHistory.merge();
        return "redirect:/admin/actionhistorys/" + encodeUrlPathSegment(actionHistory.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String ActionHistoryController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, ActionHistory.findActionHistory(id));
        return "admin/actionhistorys/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String ActionHistoryController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        ActionHistory actionHistory = ActionHistory.findActionHistory(id);
        actionHistory.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/admin/actionhistorys";
    }
    
    void ActionHistoryController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("actionHistory_created_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
    }
    
    void ActionHistoryController.populateEditForm(Model uiModel, ActionHistory actionHistory) {
        uiModel.addAttribute("actionHistory", actionHistory);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("clients", clientService.findAllClients());
        uiModel.addAttribute("clientactions", ClientAction.findAllClientActions());
    }
    
    String ActionHistoryController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
