package com.mvsolutions.payus.model.rest.response.usermypage;

import lombok.Data;

@Data
public class UserPointAccumulateListResponse {
    private int accumulate_no;
    private int store_no;
    private String store_name;
    private String reg_date;
    private int point;
    private int status;
    private boolean review_status;
    private boolean user_read_check;
}
