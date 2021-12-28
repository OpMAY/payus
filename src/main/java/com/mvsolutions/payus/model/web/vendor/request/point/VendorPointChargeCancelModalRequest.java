package com.mvsolutions.payus.model.web.vendor.request.point;

import lombok.Data;

@Data
public class VendorPointChargeCancelModalRequest {
    private int charge_no;
    private boolean for_charge;
}
