package com.mvsolutions.payus.model.rest.basic;

import lombok.Data;

@Data
public class PointAccumulateCancel {
    private int cancel_no;
    private int accumulate_no;
    private String reason;
    private String reg_date;
    private boolean cancel_status;
    private String cancel_date;
}
