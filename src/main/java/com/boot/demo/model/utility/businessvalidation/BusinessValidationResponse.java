package com.boot.demo.model.utility.businessvalidation;

import lombok.Data;

@Data
public class BusinessValidationResponse {
    private String status_code;
    private int request_cnt;
    private int valid_cnt;
    private BusinessValidationResponseData data;
}
