package com.mvsolutions.payus.util;

import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.utils.URIBuilder;
import org.apache.http.impl.client.HttpClientBuilder;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URI;
import java.net.URLEncoder;

public class JusoApi {
    private final String REST_API_KEY = "U01TX0FVVEgyMDIxMTEwOTE2NTcwOTExMTg2MTc=";

    private HttpGet initJuso(String keyword) throws UnsupportedEncodingException {
        String url = getUrl(keyword);
        HttpGet get = new HttpGet(url);
        get.setHeader("Accept", "application/json");
        get.setHeader("Content-Type", "application/json");
        get.setHeader("Accept-Charset", "utf-8");
        return get;
    }

    public HttpResponse getJusoSearch(String keyword) throws IOException {
        HttpClient client = HttpClientBuilder.create().build();
        HttpGet get = initJuso(keyword);
        return client.execute(get);
    }

    private String getUrl(String keyword) throws UnsupportedEncodingException {
        return "https://www.juso.go.kr/addrlink/addrLinkApi.do?currentPage="+1+"&countPerPage="+10+"&keyword="+ URLEncoder.encode(keyword,"UTF-8")+"&confmKey="+REST_API_KEY+"&resultType=json";
    }
}
