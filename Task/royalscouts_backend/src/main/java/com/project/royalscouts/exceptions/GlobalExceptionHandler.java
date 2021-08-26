package com.project.royalscouts.exceptions;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import java.time.LocalDateTime;

@ControllerAdvice
public class GlobalExceptionHandler {

  @ExceptionHandler(ResourceNotFoundException.class)
  public ResponseEntity<ExceptionResponse> resourceNotFound(ResourceNotFoundException ex) {
    ExceptionResponse response = new ExceptionResponse();
    response.setErrorCode(404);
    response.setErrorMessage(ex.getMessage());
    response.setTimestamp(LocalDateTime.now());

    return new ResponseEntity<>(response, HttpStatus.NOT_FOUND);
  }

  @ExceptionHandler(ResourceAlreadyExists.class)
  public ResponseEntity<ExceptionResponse> resourceAlreadyExists(ResourceAlreadyExists ex) {
    ExceptionResponse response = new ExceptionResponse();
    response.setErrorCode(409);
    response.setErrorMessage(ex.getMessage());
    response.setTimestamp(LocalDateTime.now());

    return new ResponseEntity<>(response, HttpStatus.CONFLICT);
  }

  @ExceptionHandler(BadRequestException.class)
  public ResponseEntity<ExceptionResponse> badRequestException(BadRequestException ex) {
    ExceptionResponse response = new ExceptionResponse();
    response.setErrorCode(400);
    response.setErrorMessage(ex.getMessage());
    response.setTimestamp(LocalDateTime.now());

    return new ResponseEntity<>(response, HttpStatus.BAD_REQUEST);
  }

  @ExceptionHandler(UnauthorizedException.class)
  public ResponseEntity<ExceptionResponse> unauthorizedException(UnauthorizedException ex) {
    ExceptionResponse response = new ExceptionResponse();
    response.setErrorCode(403);
    response.setErrorMessage(ex.getMessage());
    response.setTimestamp(LocalDateTime.now());

    return new ResponseEntity<>(response, HttpStatus.UNAUTHORIZED);
  }

  @ExceptionHandler(ConflictException.class)
  public ResponseEntity<ExceptionResponse> conflictException(ConflictException ex) {
    ExceptionResponse response = new ExceptionResponse();
    response.setErrorCode(409);
    response.setErrorMessage(ex.getMessage());
    response.setTimestamp(LocalDateTime.now());

    return new ResponseEntity<>(response, HttpStatus.CONFLICT);
  }

}