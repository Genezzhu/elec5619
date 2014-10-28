package com.usyd.group7.web.admin;
import com.usyd.group7.domain.ExerciseType;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/admin/exercisetypes")
@Controller
@RooWebScaffold(path = "admin/exercisetypes", formBackingObject = ExerciseType.class)
public class ExerciseTypeController {
}
