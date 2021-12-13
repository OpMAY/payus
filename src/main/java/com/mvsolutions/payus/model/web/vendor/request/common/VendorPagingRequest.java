package com.mvsolutions.payus.model.web.vendor.request.common;

import lombok.Data;

@Data
public class VendorPagingRequest {
    private int vendor_no;
    private int page;
    private int start_index;
    private int end_index;
}
