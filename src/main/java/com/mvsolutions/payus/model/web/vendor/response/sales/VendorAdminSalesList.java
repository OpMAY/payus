package com.mvsolutions.payus.model.web.vendor.response.sales;

import lombok.Data;

@Data
public class VendorAdminSalesList {
    private int accumulate_no;
    private String user_name;
    private int price;
    private int payback_rate;
    private int point;
    private String reg_date;
    private boolean status;
}
