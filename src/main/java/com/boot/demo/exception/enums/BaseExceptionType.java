package com.boot.demo.exception.enums;

public interface BaseExceptionType {
    int getErrorCode();

    int getHttpStatus();

    String getErrorMessage();
}