package com.mvsolutions.payus.model.web.vendor.response.cs;

import lombok.Data;

import java.util.List;

@Data
public class VendorStoreManagementNoticePagingResponse {
    private int notice_num;
    private List<VendorAdminNoticeList> noticeList;
}
