package com.mvsolutions.payus.model.rest.basic;

import lombok.Data;

@Data
public class AdvertisementBanner {
    private int advertisement_no;
    private String banner_sm_img;
    private String banner_lg_img;
    private int status;
    private String reg_date;
    private String revise_date;
}
