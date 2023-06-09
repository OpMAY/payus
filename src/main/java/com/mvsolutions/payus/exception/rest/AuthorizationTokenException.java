package com.mvsolutions.payus.exception.rest;

import com.mvsolutions.payus.exception.enums.BaseExceptionType;
import lombok.Getter;
import lombok.extern.log4j.Log4j2;

@Log4j2
public class AuthorizationTokenException extends RuntimeException {
    @Getter
    private BaseExceptionType exceptionType;

    public AuthorizationTokenException(BaseExceptionType exceptionType) {
        super(exceptionType.getErrorMessage());
        this.exceptionType = exceptionType;
    }
}
