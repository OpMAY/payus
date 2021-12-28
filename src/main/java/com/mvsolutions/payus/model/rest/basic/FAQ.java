package com.mvsolutions.payus.model.rest.basic;

import lombok.Data;

@Data
public class FAQ {
    private int faq_no;
    private String question;
    private String answer;
    private String img;
    private int type;
    private String reg_date;
}
