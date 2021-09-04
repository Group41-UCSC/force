package com.project.royalscouts.exceptions;

public class UnauthorizedException extends RuntimeException {

  public UnauthorizedException() {
    super("You are unauthorized");
  }

}