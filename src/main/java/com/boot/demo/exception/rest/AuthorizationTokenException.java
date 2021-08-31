package com.boot.demo.exception.rest;

import lombok.Getter;
import lombok.extern.log4j.Log4j;
import com.boot.demo.exception.enums.BaseExceptionType;

@Log4j
public class AuthorizationTokenException extends RuntimeException {
    @Getter
    private BaseExceptionType exceptionType;

    public AuthorizationTokenException(BaseExceptionType exceptionType) {
        super(exceptionType.getErrorMessage());
        this.exceptionType = exceptionType;
    }
}
