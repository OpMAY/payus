package com.mvsolutions.payus.model.utility.demoaddress;

import lombok.Data;
import java.util.List;

@Data
public class Header {
    private String description;
    private List<String> columns;
    private String stdrYm;
    private String resultCode;
    private String resultMsg;
}
