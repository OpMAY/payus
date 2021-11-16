package com.mvsolutions.payus.model.rest.response.usermypage;

import lombok.Data;

@Data
public class UserMyPagePersonalDataResponse {
    private int user_no;
    private int sns;
    private String nickname;
    private String phone;
    private String bank_name;
    private String bank_account;
    private String bank_owner;
    private boolean event_push;
    private boolean review_push;
    private boolean point_push;
    private boolean report_push;
    private boolean marketing_agree;
}
