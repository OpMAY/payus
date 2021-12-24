package com.mvsolutions.payus.model.web.vendor.response.cs;

import lombok.Data;

import java.util.List;

@Data
public class VendorStoreManagementFAQPagingResponse {
    private int faq_num;
    private List<VendorAdminFAQList> faqList;
}
