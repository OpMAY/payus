package com.mvsolutions.payus.model.web.vendor.response.point;

import lombok.Data;

@Data
public class VendorStoreManagementPointAccumulateCancelRejectInfo {
    private int point;
    private String request_date;
    private String cancel_reason;
    private String reject_reason;
}
