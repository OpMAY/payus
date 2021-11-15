package com.mvsolutions.payus.model.file;

import lombok.AllArgsConstructor;
import lombok.Data;

@AllArgsConstructor
@Data
public class MFile {
    private String file_name;
    private String file_url;
    private String file_type;
    private long file_size;
    private byte[] file_bytes;
}
