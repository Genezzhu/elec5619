// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.usyd.group7.domain;

import com.usyd.group7.domain.ExerciseDataOnDemand;
import com.usyd.group7.domain.ExerciseIntegrationTest;
import com.usyd.group7.service.ExerciseService;
import java.util.Iterator;
import java.util.List;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ExerciseIntegrationTest_Roo_IntegrationTest {
    
    declare @type: ExerciseIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: ExerciseIntegrationTest: @ContextConfiguration(locations = "classpath*:/META-INF/spring/applicationContext*.xml");
    
    declare @type: ExerciseIntegrationTest: @Transactional;
    
    @Autowired
    ExerciseDataOnDemand ExerciseIntegrationTest.dod;
    
    @Autowired
    ExerciseService ExerciseIntegrationTest.exerciseService;
    
    @Test
    public void ExerciseIntegrationTest.testCountAllExercises() {
        Assert.assertNotNull("Data on demand for 'Exercise' failed to initialize correctly", dod.getRandomExercise());
        long count = exerciseService.countAllExercises();
        Assert.assertTrue("Counter for 'Exercise' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void ExerciseIntegrationTest.testFindExercise() {
        Exercise obj = dod.getRandomExercise();
        Assert.assertNotNull("Data on demand for 'Exercise' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Exercise' failed to provide an identifier", id);
        obj = exerciseService.findExercise(id);
        Assert.assertNotNull("Find method for 'Exercise' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'Exercise' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void ExerciseIntegrationTest.testFindAllExercises() {
        Assert.assertNotNull("Data on demand for 'Exercise' failed to initialize correctly", dod.getRandomExercise());
        long count = exerciseService.countAllExercises();
        Assert.assertTrue("Too expensive to perform a find all test for 'Exercise', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<Exercise> result = exerciseService.findAllExercises();
        Assert.assertNotNull("Find all method for 'Exercise' illegally returned null", result);
        Assert.assertTrue("Find all method for 'Exercise' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void ExerciseIntegrationTest.testFindExerciseEntries() {
        Assert.assertNotNull("Data on demand for 'Exercise' failed to initialize correctly", dod.getRandomExercise());
        long count = exerciseService.countAllExercises();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<Exercise> result = exerciseService.findExerciseEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'Exercise' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'Exercise' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void ExerciseIntegrationTest.testFlush() {
        Exercise obj = dod.getRandomExercise();
        Assert.assertNotNull("Data on demand for 'Exercise' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Exercise' failed to provide an identifier", id);
        obj = exerciseService.findExercise(id);
        Assert.assertNotNull("Find method for 'Exercise' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyExercise(obj);
        Integer currentVersion = obj.getVersion();
        obj.flush();
        Assert.assertTrue("Version for 'Exercise' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void ExerciseIntegrationTest.testUpdateExerciseUpdate() {
        Exercise obj = dod.getRandomExercise();
        Assert.assertNotNull("Data on demand for 'Exercise' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Exercise' failed to provide an identifier", id);
        obj = exerciseService.findExercise(id);
        boolean modified =  dod.modifyExercise(obj);
        Integer currentVersion = obj.getVersion();
        Exercise merged = exerciseService.updateExercise(obj);
        obj.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'Exercise' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void ExerciseIntegrationTest.testSaveExercise() {
        Assert.assertNotNull("Data on demand for 'Exercise' failed to initialize correctly", dod.getRandomExercise());
        Exercise obj = dod.getNewTransientExercise(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'Exercise' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'Exercise' identifier to be null", obj.getId());
        try {
            exerciseService.saveExercise(obj);
        } catch (final ConstraintViolationException e) {
            final StringBuilder msg = new StringBuilder();
            for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                final ConstraintViolation<?> cv = iter.next();
                msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
            }
            throw new IllegalStateException(msg.toString(), e);
        }
        obj.flush();
        Assert.assertNotNull("Expected 'Exercise' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void ExerciseIntegrationTest.testDeleteExercise() {
        Exercise obj = dod.getRandomExercise();
        Assert.assertNotNull("Data on demand for 'Exercise' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Exercise' failed to provide an identifier", id);
        obj = exerciseService.findExercise(id);
        exerciseService.deleteExercise(obj);
        obj.flush();
        Assert.assertNull("Failed to remove 'Exercise' with identifier '" + id + "'", exerciseService.findExercise(id));
    }
    
}
