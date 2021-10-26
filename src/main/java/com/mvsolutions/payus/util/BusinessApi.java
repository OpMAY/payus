package com.mvsolutions.payus.util;

import com.mvsolutions.payus.model.utility.businessvalidation.BusinessStatusRequest;
import com.mvsolutions.payus.model.utility.businessvalidation.BusinessValidationRequest;
import com.google.gson.Gson;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.HttpClientBuilder;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

public class BusinessApi {
    private String bv_access_key = "navZSiGlAISRynqdYKsv5Nq+nXtZ4RV0pv/xFXbyTfgJce5UroOiCsafnkxfTYe1YXuTAB1qHNHUgkFLgNw7MQ==";

    private final String BASE_URL = "http://api.odcloud.kr/api/nts-businessman/v1";
    private final String VALIDATE_URL = BASE_URL + "/validate?serviceKey=" + URLEncoder.encode(bv_access_key, "UTF-8") + "&returnType=JSON";
    private final String STATUS_URL = BASE_URL + "/status?serviceKey=" + URLEncoder.encode(bv_access_key, "UTF-8") + "&returnType=JSON";

    public BusinessApi() throws UnsupportedEncodingException {
    }

    private HttpPost getPost(String url, StringEntity entity) {
        HttpPost post = new HttpPost(url);
        post.setHeader("Accept", "application/json");
        post.setHeader("Content-Type", "application/json");
        post.setHeader("Accept-Charset", "utf-8");
        post.setEntity(entity);
        return post;
    }

    public HttpResponse getBusinessStatus(BusinessStatusRequest request) throws IOException {
        HttpClient client = HttpClientBuilder.create().build();
        HttpPost post = getPost(STATUS_URL, new StringEntity(new Gson().toJson(request), "UTF-8"));
        return client.execute(post);
    }

    public HttpResponse getBusinessValidation(BusinessValidationRequest request) throws Exception {
        HttpClient client = HttpClientBuilder.create().build();
        HttpPost post = getPost(VALIDATE_URL, new StringEntity(new Gson().toJson(request), "UTF-8"));
        return client.execute(post);
    }
}
