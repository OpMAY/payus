package com.mvsolutions.payus.model.rest.request.storedetailpage;

import lombok.Data;

@Data
public class UserInsertStoreFavoriteRequest {
    private int user_no;
    private int store_no;
    private String reg_date;
}
