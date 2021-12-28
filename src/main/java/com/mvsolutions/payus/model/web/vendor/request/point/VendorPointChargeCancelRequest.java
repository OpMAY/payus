package com.mvsolutions.payus.model.web.vendor.request.point;

import lombok.Data;

@Data
public class VendorPointChargeCancelRequest {
    private int charge_no;
    private String reason;
    private String reg_date;
}
