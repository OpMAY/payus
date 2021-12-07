package com.mvsolutions.payus.exception.web;

import com.mvsolutions.payus.exception.enums.BaseExceptionType;
import lombok.Getter;
import lombok.extern.log4j.Log4j;

@Log4j
public class VendorAdminLoginException extends RuntimeException {
    @Getter
    private BaseExceptionType exceptionType;

    public VendorAdminLoginException(BaseExceptionType exceptionType) {
        super(exceptionType.getErrorMessage());
        this.exceptionType = exceptionType;
    }
}
