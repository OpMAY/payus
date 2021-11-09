package com.mvsolutions.payus.model.rest.basic;

import lombok.Data;

@Data
public class PointAccumulateReject {
    private int reject_no;
    private int accumulate_no;
    private String reason;
    private String reg_date;
}
