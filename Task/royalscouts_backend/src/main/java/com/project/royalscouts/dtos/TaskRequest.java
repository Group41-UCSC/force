package com.project.royalscouts.dtos;

import java.util.List;

public class TaskRequest {

  private String title;

  private String status;

  private String origin;

  private String opc;

  private String npc;

  private String description;

  private String programmeType;

  private String spice;

  private int durationDays;

  private int durationHours;

  private int durationMins;

  private String participation;

  private String location;

  private int bonus;

  private int score;

  private String supervision;

  private String difficulty;

  private List<String> instructions;

  private String createdBy;

  private String thingsNeeded;

  public TaskRequest() {
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

  public List<String> getInstructions() {
    return instructions;
  }

  public void setInstructions(List<String> instructions) {
    this.instructions = instructions;
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
