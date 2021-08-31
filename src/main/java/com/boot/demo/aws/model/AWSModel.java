package com.boot.demo.aws.model;

import com.boot.demo.aws.model.smodel.Download;
import com.boot.demo.aws.model.smodel.Upload;
import lombok.Data;
import lombok.extern.log4j.Log4j;

@Log4j
@Data
public class AWSModel {
    private Upload upload;
    private Download download;
    private String accessKey;
    private String secretKey;
    private String bucketName;
}
