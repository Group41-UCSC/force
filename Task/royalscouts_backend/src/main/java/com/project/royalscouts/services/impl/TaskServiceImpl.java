package com.project.royalscouts.services.impl;

import java.util.Collections;
import java.util.List;
import java.util.Optional;

import com.project.royalscouts.dtos.StatusRequest;
import com.project.royalscouts.dtos.TaskRequest;
import com.project.royalscouts.exceptions.ResourceNotFoundException;
import com.project.royalscouts.models.Task;
import com.project.royalscouts.repositories.TaskRepository;
import com.project.royalscouts.services.InstructionService;
import com.project.royalscouts.services.TaskService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TaskServiceImpl implements TaskService {

  @Autowired
  TaskRepository taskRepository;

  @Autowired
  InstructionService instructionService;

  @Override
  public List<Task> getTasks() {
    List<Task> tasks = taskRepository.findAll();
    Collections.reverse(tasks);
    return tasks;
  }

  @Override
  public Task getTaskById(Long taskId) {
    return taskRepository.findById(taskId).orElseThrow(() -> new ResourceNotFoundException());
  }

  @Override
  public Task addTask(TaskRequest taskRequest) {
    Task newTask = new Task();
    newTask.setTitle(taskRequest.getTitle());
    newTask.setStatus(taskRequest.getStatus());
    newTask.setOrigin(taskRequest.getOrigin());
    newTask.setOpc(taskRequest.getOpc());
    newTask.setNpc(taskRequest.getNpc());
    newTask.setDescription(taskRequest.getDescription());
    newTask.setProgrammeType(taskRequest.getProgrammeType());
    newTask.setSpice(taskRequest.getSpice());
    newTask.setDurationDays(taskRequest.getDurationDays());
    newTask.setDurationHours(taskRequest.getDurationHours());
    newTask.setDurationMins(taskRequest.getDurationMins());
    newTask.setParticipation(taskRequest.getParticipation());
    newTask.setLocation(taskRequest.getLocation());
    newTask.setBonus(taskRequest.getBonus());
    newTask.setScore(taskRequest.getScore());
    newTask.setSupervision(taskRequest.getSupervision());
    newTask.setDifficulty(taskRequest.getDifficulty());
    newTask.setCreatedBy(taskRequest.getCreatedBy());
    newTask.setThingsNeeded(taskRequest.getThingsNeeded());

    Task addedTask = taskRepository.save(newTask);
    instructionService.addInstructions(addedTask, taskRequest.getInstructions());
    return addedTask;
  }

  @Override
  public void updateTask(Long taskId, TaskRequest taskRequest) {

    Optional<Task> taskFromDb = taskRepository.findById(taskId);
    if (taskFromDb.isPresent()) {
      Task updatedTask = taskFromDb.get();
      updatedTask.setTitle(taskRequest.getTitle());
      updatedTask.setStatus(taskRequest.getStatus());
      updatedTask.setOrigin(taskRequest.getOrigin());
      updatedTask.setOpc(taskRequest.getOpc());
      updatedTask.setNpc(taskRequest.getNpc());
      updatedTask.setDescription(taskRequest.getDescription());
      updatedTask.setProgrammeType(taskRequest.getProgrammeType());
      updatedTask.setSpice(taskRequest.getSpice());
      updatedTask.setDurationDays(taskRequest.getDurationDays());
      updatedTask.setDurationHours(taskRequest.getDurationHours());
      updatedTask.setDurationMins(taskRequest.getDurationMins());
      updatedTask.setParticipation(taskRequest.getParticipation());
      updatedTask.setLocation(taskRequest.getLocation());
      updatedTask.setBonus(taskRequest.getBonus());
      updatedTask.setScore(taskRequest.getScore());
      updatedTask.setSupervision(taskRequest.getSupervision());
      updatedTask.setDifficulty(taskRequest.getDifficulty());
      updatedTask.setCreatedBy(taskRequest.getCreatedBy());
      updatedTask.setThingsNeeded(taskRequest.getThingsNeeded());

      Task updatedTaskFromDb = taskRepository.save(updatedTask);
      instructionService.updateInstructions(updatedTaskFromDb, taskRequest.getInstructions());

    } else {
      throw new ResourceNotFoundException();
    }
  }

  @Override
  public void deleteTask(Long taskId) {
    Optional<Task> taskFromDb = taskRepository.findById(taskId);
    if (taskFromDb.isPresent()) {
      taskRepository.delete(taskFromDb.get());
    } else {
      throw new ResourceNotFoundException();
    }
  }

  @Override
  public void updateTaskStatus(Long taskId, StatusRequest statusRequest) {
    Optional<Task> taskFromDb = taskRepository.findById(taskId);
    if (taskFromDb.isPresent()) {
      taskFromDb.get().setStatus(statusRequest.getStatus());
      taskFromDb.get().setApprovedBy(statusRequest.getApprovedBy());
      taskRepository.save(taskFromDb.get());
    } else {
      throw new ResourceNotFoundException();
    }
  }
}
