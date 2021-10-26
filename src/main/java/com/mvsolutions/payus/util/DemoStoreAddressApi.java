package com.mvsolutions.payus.util;

import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.HttpClientBuilder;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

public class DemoStoreAddressApi {


    public String urlBuild(int page) throws UnsupportedEncodingException {
        return "http://apis.data.go.kr/B553077/api/open/sdsc2/storeListInUpjong" + "?" + URLEncoder.encode("ServiceKey", "UTF-8") + "=navZSiGlAISRynqdYKsv5Nq%2BnXtZ4RV0pv%2FxFXbyTfgJce5UroOiCsafnkxfTYe1YXuTAB1qHNHUgkFLgNw7MQ%3D%3D" + /*Service Key*/
                "&" + URLEncoder.encode("ServiceKey", "UTF-8") + "=" + URLEncoder.encode("-", "UTF-8") + /*공공데이터포털에서 받은 인증키*/
                "&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode(String.valueOf(page), "UTF-8") + /* 현재 요청 페이지번호*/
                "&" + URLEncoder.encode("numOfRows", "UTF-8") + "=" + URLEncoder.encode("1000", "UTF-8") + /* 최대 1000*/
                "&" + URLEncoder.encode("divId", "UTF-8") + "=" + URLEncoder.encode("indsLclsCd", "UTF-8") + /* 대분류는 indsLclsCd, 중분류는 indsMclsCd, 소분류는 indsSclsCd를 사용*/
                "&" + URLEncoder.encode("key", "UTF-8") + "=" + URLEncoder.encode("O", "UTF-8") + /* 대분류는 대분류코드값, 중분류는 중분류코드값, 소분류는 소분류코드값을 사용*/
                "&" + URLEncoder.encode("type", "UTF-8") + "=" + URLEncoder.encode("json", "UTF-8");
    }

    private HttpGet getGet(String url) {
        HttpGet get = new HttpGet(url);
        get.setHeader("Accept", "application/json");
        get.setHeader("Content-Type", "application/json");
        get.setHeader("Accept-Charset", "utf-8");
        return get;
    }

    public HttpResponse goRequest(String url) throws Exception {
        HttpClient client = HttpClientBuilder.create().build();
        HttpGet get = getGet(url);
        return client.execute(get);
    }
}
