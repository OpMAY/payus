package com.mvsolutions.payus.model.web.vendor.response.point;

import lombok.Data;

@Data
public class VendorStoreManagementPointChargeRejectInfo {
    private int point;
    private String request_date;
    private String reject_reason;
}
