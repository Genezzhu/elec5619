package com.usyd.group7.web.admin;
import com.usyd.group7.domain.Exercise;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/admin/exercises")
@Controller
@RooWebScaffold(path = "admin/exercises", formBackingObject = Exercise.class)
public class ExerciseController {
}
