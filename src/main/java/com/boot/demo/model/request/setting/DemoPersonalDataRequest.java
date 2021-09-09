package com.boot.demo.model.request.setting;

import lombok.Data;

@Data
public class DemoPersonalDataRequest {
    private PersonalDataComponents personal;

    @Data
    public static class PersonalDataComponents{
        private int user_no;
        private int vendor_no;
        private String phone;
    }

}

