package com.mvsolutions.payus.model.web.vendor.request.point;

import lombok.Data;

@Data
public class VendorPointChargeRejectModalRequest {
    private int vendor_no;
    private int charge_no;
}
