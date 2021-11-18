package com.mvsolutions.payus.model.rest.response.storedetailpage;

import lombok.Data;

@Data
public class UserAccumulateCheckResponse {
    private int user_no;
    private String store_name;
    private String reg_date;
    private int point;
}
