package com.mvsolutions.payus.model.rest.basic;

import lombok.Data;

@Data
public class AdvertisementStore {
    private int advertisement_no;
    private int store_no;
    private boolean status;
    private String reg_date;
    private String revise_date;
    private String apply_date;
    private String end_date;
    private int advertise_days;
    private int advertise_payback;
}
