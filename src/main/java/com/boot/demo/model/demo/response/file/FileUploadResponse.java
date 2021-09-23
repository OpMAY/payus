package com.boot.demo.model.demo.response.file;

import lombok.Data;

import java.util.List;

@Data
public class FileUploadResponse {
    private String title;
    private String content;
    private List<FileComponents> file_list;
    @Data
    public static class FileComponents{
        private String file_name;
        private String file_type;
        private long file_size;
        private String file_uri;
    }
}
