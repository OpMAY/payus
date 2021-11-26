package com.mvsolutions.payus.model.utility.businessvalidation;

import lombok.Data;

import java.util.List;

@Data
public class BusinessStatusResponse {
    private String status_code;
    private int request_cnt;
    private int valid_cnt;
    private List<BusinessStatusResponseData> data;
}
