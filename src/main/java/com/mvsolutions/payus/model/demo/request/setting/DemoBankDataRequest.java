package com.mvsolutions.payus.model.demo.request.setting;

import lombok.Data;

@Data
public class DemoBankDataRequest {
    private BankDataComponents bank;

    @Data
    public static class BankDataComponents{
        private int user_no;
        private int vendor_no;
        private String bank_name;
        private String bank_owner;
        private String bank_account;
    }
}

