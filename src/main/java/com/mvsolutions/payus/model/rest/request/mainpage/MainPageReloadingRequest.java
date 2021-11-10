package com.mvsolutions.payus.model.rest.request.mainpage;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class MainPageReloadingRequest {
    private String address;
    private int class_first;
    private int last_index;
}
