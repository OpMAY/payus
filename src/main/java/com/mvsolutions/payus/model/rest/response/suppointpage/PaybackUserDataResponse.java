package com.mvsolutions.payus.model.rest.response.suppointpage;

import lombok.Data;

@Data
public class PaybackUserDataResponse {
    private int user_no;
    private String name;
    private boolean user_penalty;
}
