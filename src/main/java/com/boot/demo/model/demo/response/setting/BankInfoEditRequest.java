package com.boot.demo.model.demo.response.setting;

import lombok.Data;

@Data
public class BankInfoEditRequest {
    private BankInfoEditComponents bank;

    @Data
    public static class BankInfoEditComponents{
        private int user_no;
        private int vendor_no;
        private String bank_name;
        private String bank_owner;
        private String bank_account;
    }
}
