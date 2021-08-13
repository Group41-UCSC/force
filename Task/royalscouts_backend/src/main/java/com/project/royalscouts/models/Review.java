package com.project.royalscouts.models;

import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonIgnore;

import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

@Entity
@Table(name = "reviews")
public class Review  extends AuditModel {

  @Column(name = "reviewed_by")
  private String reviewedBy;

  @Column(name = "comments")
  private String comments;

  @Column(name = "permission_action")
  private String permissionAction;

  @Column(name = "frequency")
  private String frequency;

  @ManyToOne(fetch = FetchType.LAZY, optional = false)
  @JoinColumn(name = "task_id", nullable = false)
  @OnDelete(action = OnDeleteAction.CASCADE)
  @JsonIgnore
  private Task task;

  public Review() {
  }

  public String getReviewedBy() {
    return reviewedBy;
  }

  public void setReviewedBy(String reviewedBy) {
    this.reviewedBy = reviewedBy;
  }

  public String getComments() {
    return comments;
  }

  public void setComments(String comments) {
    this.comments = comments;
  }

  public String getPermissionAction() {
    return permissionAction;
  }

  public void setPermissionAction(String permissionAction) {
    this.permissionAction = permissionAction;
  }

  public String getFrequency() {
    return frequency;
  }

  public void setFrequency(String frequency) {
    this.frequency = frequency;
  }

  public Task getTask() {
    return task;
  }

  public void setTask(Task task) {
    this.task = task;
  }

  

}
