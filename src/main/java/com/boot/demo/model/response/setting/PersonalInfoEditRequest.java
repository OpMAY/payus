package com.boot.demo.model.response.setting;

import lombok.Data;

@Data
public class PersonalInfoEditRequest {
    private PersonalInfoComponents personal;
    @Data
    public static class PersonalInfoComponents{
        private int user_no;
        private int vendor_no;
        private String phone;
    }
}
