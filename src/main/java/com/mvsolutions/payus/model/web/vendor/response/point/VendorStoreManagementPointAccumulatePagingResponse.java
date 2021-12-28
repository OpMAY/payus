package com.mvsolutions.payus.model.web.vendor.response.point;

import lombok.Data;

import java.util.List;

@Data
public class VendorStoreManagementPointAccumulatePagingResponse {
    private int accumulate_num;
    private List<VendorAdminPointAccumulateList> accumulateList;
}
