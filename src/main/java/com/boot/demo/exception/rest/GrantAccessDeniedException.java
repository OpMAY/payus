package com.boot.demo.exception.rest;

import com.boot.demo.exception.enums.BaseExceptionType;
import lombok.Getter;
import lombok.extern.log4j.Log4j;

@Log4j
public class GrantAccessDeniedException extends RuntimeException {
    @Getter
    private BaseExceptionType exceptionType;

    public GrantAccessDeniedException(BaseExceptionType exceptionType) {
        super(exceptionType.getErrorMessage());
        this.exceptionType = exceptionType;
    }
}
