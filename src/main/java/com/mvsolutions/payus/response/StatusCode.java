package com.mvsolutions.payus.response;

public class StatusCode {
    public static final int SUCCESS = 200;
    public static final int UPDATING = 999;
    public static final String MORE_INFORMATION = "L426";
    public static final String LOGIN_FAILED = "L401";
    public static final String RELOAD_FAILED = "R400";
    public static final String DELETED_CONTENT = "D404";
    public static final String DENIED_CONTENT = "D501";
    public static final int BAD_REQUEST = 400;
    public static final String COORDINATE_ERROR = "M400";
    public static final String REGISTER_REQUIRED = "L404";
    public static final int INTERNAL_SERVER_ERROR = 500;
    public static final String ALREADY_ANSWERED = "A400";
    public static final String TIME_EXPIRED = "T401";
    public static final String CAN_NOT_CANCEL_POINT = "P401";
    public static final String NO_USER_DETECTED = "U404";
    public static final String PENALTY_USER = "U501";
}