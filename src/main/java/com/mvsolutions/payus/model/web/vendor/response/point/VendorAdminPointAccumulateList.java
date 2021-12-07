package com.mvsolutions.payus.model.web.vendor.response.point;

import lombok.Data;

@Data
public class VendorAdminPointAccumulateList {
    private int accumulate_no;
    private String user_name;
    private int price;
    private int payback_rate;
    private int point;
    private String reg_date;
    private int status;
    private int review_status;
}
