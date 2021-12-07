package com.mvsolutions.payus.model.web.vendor.response.point;

import lombok.Data;

@Data
public class VendorAdminPointChargeList {
    private int charge_no;
    private int point;
    private String reg_date;
    private String revise_date;
    private int status;
}
