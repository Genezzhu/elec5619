// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.usyd.group7.service;

import com.usyd.group7.domain.ExerciseType;
import com.usyd.group7.service.ExerciseTypeService;
import java.util.List;

privileged aspect ExerciseTypeService_Roo_Service {
    
    public abstract long ExerciseTypeService.countAllExerciseTypes();    
    public abstract void ExerciseTypeService.deleteExerciseType(ExerciseType exerciseType);    
    public abstract ExerciseType ExerciseTypeService.findExerciseType(Long id);    
    public abstract List<ExerciseType> ExerciseTypeService.findAllExerciseTypes();    
    public abstract List<ExerciseType> ExerciseTypeService.findExerciseTypeEntries(int firstResult, int maxResults);    
    public abstract void ExerciseTypeService.saveExerciseType(ExerciseType exerciseType);    
    public abstract ExerciseType ExerciseTypeService.updateExerciseType(ExerciseType exerciseType);    
}
