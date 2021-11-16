package com.mvsolutions.payus.model.rest.response.usercustomcenterpage;

import lombok.Data;

@Data
public class FAQResponse {
    private int faq_no;
    private String question;
    private String answer;
    private String img;
    private int type;
    private String reg_date;
}
