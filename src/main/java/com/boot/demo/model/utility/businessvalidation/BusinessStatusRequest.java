package com.boot.demo.model.utility.businessvalidation;

import lombok.Data;
import lombok.NonNull;

import java.util.ArrayList;

@Data
public class BusinessStatusRequest {
    @NonNull
    private ArrayList<String> b_no;
}
