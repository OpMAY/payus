package com.mvsolutions.payus.model.utility.demoaddress;

import lombok.Data;

import java.util.List;

@Data
public class Body {
    private List<Item> items;
    private int numOfRows;
    private int pageNo;
    private int totalCount;
}
