package com.mvsolutions.payus.model.rest.response.suppointpage;

import lombok.Data;

@Data
public class VendorPointAccumulateListResponse {
    private int accumulate_no;
    private int user_no;
    private String user_name;
    private int point;
    private int status;
    private String reg_date;
    private boolean read_check;
    private String reject_reason;
}
