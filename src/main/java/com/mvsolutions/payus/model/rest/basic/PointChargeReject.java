package com.mvsolutions.payus.model.rest.basic;

import lombok.Data;

@Data
public class PointChargeReject {
    private int reject_no;
    private int charge_no;
    private String reason;
    private String reg_date;
}
