package com.mvsolutions.payus.model.web.vendor.request.point;

import lombok.Data;

@Data
public class VendorPointAccumulateCancelRequest {
    private int accumulate_no;
    private String reason;
    private String reg_date;
}
