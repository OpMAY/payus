package com.mvsolutions.payus.aws.model;

import com.mvsolutions.payus.aws.model.smodel.Download;
import com.mvsolutions.payus.aws.model.smodel.Upload;
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
