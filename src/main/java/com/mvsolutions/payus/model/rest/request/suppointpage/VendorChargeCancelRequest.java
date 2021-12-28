package com.mvsolutions.payus.model.rest.request.suppointpage;

import lombok.Data;

@Data
public class VendorChargeCancelRequest {
    private int charge_no;
    private String reason;
    private String reg_date;
}
