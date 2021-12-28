package com.mvsolutions.payus.model.web.vendor.request.mypage;

import lombok.Data;

@Data
public class VendorAdminEditBankDataRequest {
    private int vendor_no;
    private String bankName;
    private String bankAccount;
    private String bankOwner;
}
