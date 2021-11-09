package com.mvsolutions.payus.model.rest.basic;

import lombok.Data;

import java.util.List;

@Data
public class StoreLodgement {
    private int lodgement_no;
    private int store_no;
    private String service_list;
    private String information;
    private String room_options;
}
