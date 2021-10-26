package com.mvsolutions.payus.model.demo.request.detail;

import lombok.Data;

@Data
public class StoreLikeRequest {
    private StoreLikeComponents store_like;

    @Data
    public static class StoreLikeComponents{
        private int user_no;
        private int vendor_no;
        private int store_no;
    }
}
