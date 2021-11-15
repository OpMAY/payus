package com.mvsolutions.payus.model.rest.request.usermypage;

import lombok.Data;

@Data
public class ReviewUploadRequest {
    // Application Send
    private int user_no;
    private int accumulate_no;
    private int rate;
    private String content;

    // Server Set
    private String reg_date;
    private String image_list;
}
