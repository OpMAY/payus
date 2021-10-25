package com.mvsolutions.payus.model.utility.businessvalidation;

import lombok.Data;

@Data
public class BusinessValidationResponseData {
    private String b_no;
    private String valid;
    private String valid_msg;
    private BusinessValidation request_param;
    private BusinessStatus status;
}
