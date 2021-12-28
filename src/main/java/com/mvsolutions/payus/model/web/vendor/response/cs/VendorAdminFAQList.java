package com.mvsolutions.payus.model.web.vendor.response.cs;

import lombok.Data;

@Data
public class VendorAdminFAQList {
    private int faq_no;
    private String question;
    private String answer;
    private int type;
    private String reg_date;
    private int view_num;
}
