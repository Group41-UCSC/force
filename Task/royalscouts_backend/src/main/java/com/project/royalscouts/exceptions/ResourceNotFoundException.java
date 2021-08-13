package com.project.royalscouts.exceptions;

public class ResourceNotFoundException extends RuntimeException {

  public ResourceNotFoundException() {
    super("Resource not found");
  }

}