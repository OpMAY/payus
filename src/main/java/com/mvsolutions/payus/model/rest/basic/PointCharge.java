package com.mvsolutions.payus.model.rest.basic;

import lombok.Data;

@Data
public class PointCharge {
    private int charge_no;
    private int vendor_no;
    private int point;
    private int status;
    private String reg_date;
    private boolean read_check;
}
