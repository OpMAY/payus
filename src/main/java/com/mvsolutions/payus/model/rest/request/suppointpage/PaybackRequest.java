package com.mvsolutions.payus.model.rest.request.suppointpage;

import lombok.Data;

@Data
public class PaybackRequest {
    private int accumulate_no;
    private int vendor_no;
    private int user_code;
    private int user_no;
    private int price;
    private int payback_rate;
    private int point;
    private String reg_date;
}
