package com.mvsolutions.payus.model.rest.response.loginpage.vendor;

import lombok.Data;

@Data
public class VendorPenaltyResponse {
    private int vendor_no;
    private String name;
    private String reason;
    private String start_date;
    private String end_date;
}
