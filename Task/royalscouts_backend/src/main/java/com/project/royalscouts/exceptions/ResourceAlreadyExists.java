package com.project.royalscouts.exceptions;

public class ResourceAlreadyExists extends RuntimeException {

  public ResourceAlreadyExists() {
    super("Resource already exists");
  }
}