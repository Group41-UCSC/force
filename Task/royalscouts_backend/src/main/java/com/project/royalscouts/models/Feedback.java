package com.project.royalscouts.models;

import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonIgnore;

import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

@Entity
@Table(name = "feedbacks")
public class Feedback extends AuditModel {

  @Column(name = "content")
  private String content;

  @Column(name = "rating")
  private double rating;

  @Column(name = "created_by")
  private String createdBy;

  @Column(name = "is_checked")
  private boolean isChecked;

  @ManyToOne(fetch = FetchType.LAZY, optional = false)
  @JoinColumn(name = "task_id", nullable = false)
  @OnDelete(action = OnDeleteAction.CASCADE)
  @JsonIgnore
  private Task task;

  public Feedback() {
  }

  public String getContent() {
    return content;
  }

  public void setContent(String content) {
    this.content = content;
  }

  public double getRating() {
    return rating;
  }

  public void setRating(double rating) {
    this.rating = rating;
  }

  public Task getTask() {
    return task;
  }

  public void setTask(Task task) {
    this.task = task;
  }

  public String getCreatedBy() {
    return createdBy;
  }

  public void setCreatedBy(String createdBy) {
    this.createdBy = createdBy;
  }

  public boolean isChecked() {
    return isChecked;
  }

  public void setChecked(boolean isChecked) {
    this.isChecked = isChecked;
  }

}
