package com.mvsolutions.payus.model.web.vendor.response.storemanagement;

import lombok.Data;

import java.util.List;

@Data
public class VendorStoreManagementReviewPagingResponse {
    private int review_num;
    private List<VendorStoreManagementReviewInfo> reviewList;
}
