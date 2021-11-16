package com.mvsolutions.payus.model.rest.request.usermypage;

import lombok.Data;

@Data
public class UserPersonalDataEditRequest {
    private int user_no;
    private int type;
    private String data;
}
