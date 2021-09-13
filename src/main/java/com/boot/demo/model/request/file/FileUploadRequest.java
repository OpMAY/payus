package com.boot.demo.model.request.file;

import lombok.Data;

@Data
public class FileUploadRequest {
    private int user_no;
    private int vendor_no;
    private String title;
    private String content;
    private String file;
}
