package com.mvsolutions.payus.model.web.vendor.response.sales;

import lombok.Data;

import java.util.List;

@Data
public class VendorStoreManagementSalesPagingResponse {
    private int sales_num;
    private List<VendorAdminSalesList> salesList;
    private VendorSalesPageSummary summary;
}
