package com.mvsolutions.payus.response;

public class StatusCode {
    // Integer Status Code
    public static final int SUCCESS = 200;
    public static final int UPDATING = 999;
    public static final int BAD_REQUEST = 400;
    public static final int INTERNAL_SERVER_ERROR = 500;

    // String Custom Status Code

    /** User / Vendor Acess **/
    public static final String LOGIN_FAILED = "L401";
    public static final String NICKNAME_EXISTS = "U402";
    public static final String REGISTER_REQUIRED = "L404";
    public static final String USER_EDIT_TYPE_ERROR = "U400";
    public static final String NO_USER_DETECTED = "U404";
    public static final String PENALTY_USER = "U501";
    public static final String PENALTY_VENDOR = "V501";

    /** Content Loading / Reloading **/
    public static final String RELOAD_FAILED = "R400";
    public static final String DELETED_CONTENT = "D404";
    public static final String DENIED_CONTENT = "D501";
    public static final String NO_STORE_FOUND = "S404";

    /** Point **/
    public static final String CAN_NOT_CANCEL_POINT = "P401";
    public static final String PAYBACK_RATE_DIFFERENT = "P402";
    public static final String NOT_ENOUGH_POINT = "P403";
    public static final String PRICE_EXCEEDED = "P404";
    public static final String POINT_RESULT_ERROR = "P405";
    public static final String POINT_STATUS_ERROR = "P406";
    public static final String POINT_NOT_MATCH = "P407";
    public static final String LOWER_THAN_1000 = "P408";

    /** Request Data Error **/
    // 지도 좌표 관련 에러 - 해당 좌표에 관한 주소가 없을 때
    public static final String COORDINATE_ERROR = "M400";
    // 취소, 리뷰 작성 등의 시간 제한을 지닌 컨텐츠 접근에 시간이 만료되었을 때
    public static final String TIME_EXPIRED = "T401";
    // 답변을 작성할 수 있는 컨텐츠 중 이미 답변이 존재하는 컨텐츠에 답변을 작성하려고 할 때
    public static final String ALREADY_ANSWERED = "A400";
    // 리뷰를 이미 작성한 경우 or 작성했다가 삭제한 경우
    public static final String ALREADY_REVIEWED = "R401";
    // 좌표 기준 10KM 내의 상점이 없는 경우
    public static final String NO_STORE_FOUND_ON_MAP = "M404";
}