package com.mvsolutions.payus.model.utility.businessvalidation;

import lombok.Data;

@Data
public class BusinessStatusResponseData {
    private String b_no;
    private String b_stt;
    private String b_stt_cd;
    private String tax_type;
    private String tax_type_cd;
    private String end_dt;
    private String utcc_yn;
    private String tax_type_change_dt;
    private String invoice_apply_dt;
}
