package com.project.royalscouts.services;

import java.util.List;

import com.project.royalscouts.dtos.StatusRequest;
import com.project.royalscouts.dtos.TaskRequest;
import com.project.royalscouts.models.Task;

public interface TaskService {
  List<Task> getTasks();

  Task getTaskById(Long taskId);

  Task addTask(TaskRequest taskRequest);

  void updateTask(Long taskId, TaskRequest taskRequest);
  
  void updateTaskStatus(Long taskId, StatusRequest statusRequest);

  void deleteTask(Long taskId);

}
