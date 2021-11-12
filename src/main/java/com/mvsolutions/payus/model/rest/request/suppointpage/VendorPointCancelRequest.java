package com.mvsolutions.payus.model.rest.request.suppointpage;

import lombok.Data;

@Data
public class VendorPointCancelRequest {
    private int accumulate_no;
    private String reason;
    private String reg_date;
}
