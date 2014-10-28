// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.usyd.group7.service;

import com.usyd.group7.domain.Exercise;
import com.usyd.group7.service.ExerciseService;
import java.util.List;

privileged aspect ExerciseService_Roo_Service {
    
    public abstract long ExerciseService.countAllExercises();    
    public abstract void ExerciseService.deleteExercise(Exercise exercise);    
    public abstract Exercise ExerciseService.findExercise(Long id);    
    public abstract List<Exercise> ExerciseService.findAllExercises();    
    public abstract List<Exercise> ExerciseService.findExerciseEntries(int firstResult, int maxResults);    
    public abstract void ExerciseService.saveExercise(Exercise exercise);    
    public abstract Exercise ExerciseService.updateExercise(Exercise exercise);    
}
