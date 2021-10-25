package com.mvsolutions.payus.model.utility.businessvalidation;

import lombok.Data;

import java.util.ArrayList;

@Data
public class BusinessValidationRequest {
    private ArrayList<BusinessValidation> businesses;
}
