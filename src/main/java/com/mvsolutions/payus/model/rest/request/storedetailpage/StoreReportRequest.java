package com.mvsolutions.payus.model.rest.request.storedetailpage;

import lombok.Data;

@Data
public class StoreReportRequest {
    private int user_no;
    private int store_no;
    private String title;
    private String content;
    private String img_list;
    private String reg_date;
}
