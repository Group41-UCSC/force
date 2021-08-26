package com.project.royalscouts.controllers;

import java.util.List;

import com.project.royalscouts.dtos.StatusRequest;
import com.project.royalscouts.dtos.TaskRequest;
import com.project.royalscouts.models.Task;
import com.project.royalscouts.services.TaskService;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/v1/tasks")
@CrossOrigin("*")
public class TaskController {
  @Autowired
  TaskService taskService;

  @GetMapping
  public ResponseEntity<List<Task>> getAllTasks() {
    return new ResponseEntity<>(taskService.getTasks(), HttpStatus.OK);
  }

  @GetMapping("{taskId}")
  public ResponseEntity<Task> getTask(@PathVariable Long taskId) {
    return new ResponseEntity<>(taskService.getTaskById(taskId), HttpStatus.OK);
  }

  @PostMapping
  public ResponseEntity<Task> saveTask(@RequestBody TaskRequest task) {
    return new ResponseEntity<>(taskService.addTask(task), HttpStatus.CREATED);
  }

  @PutMapping("{taskId}")
  public ResponseEntity<Task> updateTask(@PathVariable("taskId") Long taskId, @RequestBody TaskRequest task) {
    taskService.updateTask(taskId, task);
    return new ResponseEntity<>(taskService.getTaskById(taskId), HttpStatus.OK);
  }

  @PutMapping("{taskId}/status")
  public ResponseEntity<Task> updateTaskStatus(@PathVariable("taskId") Long taskId, @RequestBody StatusRequest statusRequest) {
    taskService.updateTaskStatus(taskId, statusRequest);
    return new ResponseEntity<>(taskService.getTaskById(taskId), HttpStatus.OK);
  }

  @DeleteMapping("{taskId}")
  public ResponseEntity<Task> deleteTask(@PathVariable("taskId") Long taskId) {
    taskService.deleteTask(taskId);
    return new ResponseEntity<>(HttpStatus.NO_CONTENT);
  }

}
