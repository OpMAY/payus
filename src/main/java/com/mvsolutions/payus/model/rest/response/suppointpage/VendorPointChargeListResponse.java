package com.mvsolutions.payus.model.rest.response.suppointpage;

import lombok.Data;

@Data
public class VendorPointChargeListResponse {
    private int charge_no;
    private int point;
    private int status;
    private String reg_date;
    private boolean read_check;
}
