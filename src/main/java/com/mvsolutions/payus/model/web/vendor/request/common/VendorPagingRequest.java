package com.mvsolutions.payus.model.web.vendor.request.common;

import lombok.Data;

@Data
public class VendorPagingRequest {
    private int vendor_no;
    private int data_type;
    private boolean select_change;
    private int page;
    private int start_index;
    private int answer_type;
    private String search_keyword;
    private boolean sTitle;
    private boolean sContent;
}
