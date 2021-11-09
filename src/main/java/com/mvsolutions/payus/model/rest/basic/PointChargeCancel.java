package com.mvsolutions.payus.model.rest.basic;

import lombok.Data;

@Data
public class PointChargeCancel {
    private int cancel_no;
    private int charge_no;
    private String reason;
    private String reg_date;
    private boolean cancel_status;
    private String cancel_date;
}
