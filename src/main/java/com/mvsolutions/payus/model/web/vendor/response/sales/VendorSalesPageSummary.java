package com.mvsolutions.payus.model.web.vendor.response.sales;

import lombok.Data;

@Data
public class VendorSalesPageSummary {
    private int total_price;
    private int total_point;
    private int this_month_price;
    private int this_month_point;
}
