package com.project.royalscouts.exceptions;

public class BadRequestException extends RuntimeException {

  public BadRequestException() {
    super("Bad Request");
  }

}