package com.project.royalscouts.models;

import javax.persistence.*;

@Entity
@Table(name = "tasks")
public class Task extends AuditModel {

  @Column(name = "title")
  private String title;

  @Column(name = "status")
  private String status;

  @Column(name = "origin")
  private String origin;

  @Column(name = "opc")
  private String opc;

  @Column(name = "npc")
  private String npc;

  @Column(name = "description")
  private String description;

  @Column(name = "programmeType")
  private String programmeType;

  @Column(name = "spice")
  private String spice;

  @Column(name = "durationDays")
  private int durationDays;

  @Column(name = "durationHours")
  private int durationHours;

  @Column(name = "durationMins")
  private int durationMins;

  @Column(name = "participation")
  private String participation;

  @Column(name = "location")
  private String location;

  @Column(name = "bonus")
  private int bonus;

  @Column(name = "score")
  private int score;

  @Column(name = "supervision")
  private String supervision;

  @Column(name = "difficulty")
  private String difficulty;

  @Column(name = "approved_by")
  private String approvedBy;

  @Column(name = "created_by")
  private String createdBy;

  @Column(name = "things_needed")
  private String thingsNeeded;

  public Task() {
  }

  public String getTitle() {
    return title;
  }

  public void setTitle(String title) {
    this.title = title;
  }

  public String getStatus() {
    return status;
  }

  public void setStatus(String status) {
    this.status = status;
  }

  public String getOrigin() {
    return origin;
  }

  public void setOrigin(String origin) {
    this.origin = origin;
  }

  public String getOpc() {
    return opc;
  }

  public void setOpc(String opc) {
    this.opc = opc;
  }

  public String getNpc() {
    return npc;
  }

  public void setNpc(String npc) {
    this.npc = npc;
  }

  public String getDescription() {
    return description;
  }

  public void setDescription(String description) {
    this.description = description;
  }

  public String getProgrammeType() {
    return programmeType;
  }

  public void setProgrammeType(String programmeType) {
    this.programmeType = programmeType;
  }

  public String getSpice() {
    return spice;
  }

  public void setSpice(String spice) {
    this.spice = spice;
  }

  public int getDurationDays() {
    return durationDays;
  }

  public void setDurationDays(int durationDays) {
    this.durationDays = durationDays;
  }

  public int getDurationHours() {
    return durationHours;
  }

  public void setDurationHours(int durationHours) {
    this.durationHours = durationHours;
  }

  public int getDurationMins() {
    return durationMins;
  }

  public void setDurationMins(int durationMins) {
    this.durationMins = durationMins;
  }

  public String getParticipation() {
    return participation;
  }

  public void setParticipation(String participation) {
    this.participation = participation;
  }

  public String getLocation() {
    return location;
  }

  public void setLocation(String location) {
    this.location = location;
  }

  public int getBonus() {
    return bonus;
  }

  public void setBonus(int bonus) {
    this.bonus = bonus;
  }

  public int getScore() {
    return score;
  }

  public void setScore(int score) {
    this.score = score;
  }

  public String getSupervision() {
    return supervision;
  }

  public void setSupervision(String supervision) {
    this.supervision = supervision;
  }

  public String getDifficulty() {
    return difficulty;
  }

  public void setDifficulty(String difficulty) {
    this.difficulty = difficulty;
  }

  public String getApprovedBy() {
    return approvedBy;
  }

  public void setApprovedBy(String approvedBy) {
    this.approvedBy = approvedBy;
  }

  public String getCreatedBy() {
    return createdBy;
  }

  public void setCreatedBy(String createdBy) {
    this.createdBy = createdBy;
  }

  public String getThingsNeeded() {
    return thingsNeeded;
  }

  public void setThingsNeeded(String thingsNeeded) {
    this.thingsNeeded = thingsNeeded;
  }

  
}
