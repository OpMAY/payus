package com.mvsolutions.payus.exception.enums;

public enum BusinessExceptionType implements BaseExceptionType {
    GRANT_EXCEPTION(1001, 200, "1001, You do not have permission."),
    AUTHORIZATION_TOKEN_EXCEPTION(1002,200,"1002, You do not have permission."),
    NOT_ALLOWED_STORE(1003, 200, "1003, Not Allowed Store Type."),
    NOTIFICATION_TYPE_ERROR(1004, 200, "1004, Notification Type Is Not Qualified"),
    VENDOR_LOGIN_INFO_EXPIRED_OR_NULL(1005, 401, "1005, Vendor Login Session is expired or null"),
    NOT_QUALIFIED_ACCESS(1006, 400, "1006, This Request is not qualified for vendor");
    private int errorCode;
    private int httpStatus;
    private String errorMessage;

    BusinessExceptionType(int errorCode, int httpStatus, String errorMessage) {
        this.errorCode = errorCode;
        this.httpStatus = httpStatus;
        this.errorMessage = errorMessage;
    }

    @Override
    public int getErrorCode() {
        return errorCode;
    }

    @Override
    public int getHttpStatus() {
        return httpStatus;
    }

    @Override
    public String getErrorMessage() {
        return errorMessage;
    }
}
