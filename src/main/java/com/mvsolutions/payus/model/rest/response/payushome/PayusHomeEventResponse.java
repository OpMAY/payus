package com.mvsolutions.payus.model.rest.response.payushome;

import lombok.Data;

@Data
public class PayusHomeEventResponse {
    private int store_no;
    private String name;
    private String address_short;
    private float star_rate;
    private int review_num;
    private int advertise_payback;
    private String thumbnail;
}
