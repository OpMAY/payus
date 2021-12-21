package com.mvsolutions.payus.model.web.vendor.response.point;

import lombok.Data;

import java.util.List;

@Data
public class VendorStoreManagementPointChargePagingResponse {
    private int charge_num;
    private List<VendorAdminPointChargeList> chargeList;
}
