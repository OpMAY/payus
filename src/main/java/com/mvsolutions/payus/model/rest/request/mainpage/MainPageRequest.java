package com.mvsolutions.payus.model.rest.request.mainpage;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class MainPageRequest {
    private int user_no;
    private String address;
}
