package com.mvsolutions.payus.util;

import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.utils.URIBuilder;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.HttpClientBuilder;

import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;

/**
 * KAKAO DEVELOPERS API 주소 검색
 * 기본 URL = https://dapi.kakao.com/v2/local/search/adress.{format}
 *
 * format의 형태
 * 1. JSON
 * 2. xml
 *
 * Parameters
 * 1. analyze_type : 검사 결과 제공 방식 (필수 X)
 * - similar : 입력한 건물명과 일부만 매칭될 경우에도 확장된 검색 결과 제공
 * - exact : 주소의 정확한 건물명이 입력된 경우의 정확히 일치하는 데이터 제공
 *
 * 2. query : 검색을 원하는 질의어/주소 (필수 O)
 * 3. page : 결과 페이지 번호. 1~45 사이, 기본 값 1 (필수 X)
 * 4. size : 한 페이지에 보여질 문서의 갯수, 1~30 사이, 기본 값 10 (필수 X)
 * **/

public class KakaoLocationApi {
    private final String REST_API_KEY = "b59ff3937ee712fcc589f4f1adeeaa21";
    private final String ADDRESS_SEARCH_URL = "https://dapi.kakao.com/v2/local/search/address.";
    private final String COORDINATE_TO_ADDRESS_URL = "https://dapi.kakao.com/v2/local/geo/coord2address.";
    private final String KEYWORD_ADDRESS_SEARCH_URL = "https://dapi.kakao.com/v2/local/search/keyword.";

    //REQUIRED PARAMETERS
    private final String FORMAT_JSON = "json";
    private final String FORMAT_XML = "xml";

    //UN-REQUIRED PARAMETERS
    private final String ANALYZE_TYPE_SIMILAR = "similar";
    private final String ANALYZE_TYPE_EXACT = "exact";
    private final int PAGES = 1;
    private final int SIZE = 10;

    private HttpPost getPost(String url, StringEntity entity) {
        HttpPost post = new HttpPost(url);
        post.setHeader("Accept", "application/json");
        post.setHeader("Content-Type", "application/json");
        post.setHeader("Accept-Charset", "utf-8");
        post.setHeader("Authorization", REST_API_KEY);
        post.setEntity(entity);
        return post;
    }

    private HttpGet initKeywordAddressSearch(String url, String keyword) throws URISyntaxException {
        HttpGet get = new HttpGet(url);
        get.setHeader("Accept", "application/json");
        get.setHeader("Content-Type", "application/json");
        get.setHeader("Accept-Charset", "utf-8");
        get.setHeader("Authorization", "KakaoAK " + REST_API_KEY);
        URI uri = new URIBuilder(get.getURI()).addParameter("query", keyword).build();
        get.setURI(uri);
        return get;
    }

    private HttpGet initCoordinateToAddress(String url, String x, String y) throws URISyntaxException {
        HttpGet get = new HttpGet(url);
        get.setHeader("Accept", "application/json");
        get.setHeader("Content-Type", "application/json");
        get.setHeader("Accept-Charset", "utf-8");
        get.setHeader("Authorization", "KakaoAK " + REST_API_KEY);
        URI uri = new URIBuilder(get.getURI()).addParameter("x", x).addParameter("y", y).build();
        get.setURI(uri);
        return get;
    }

    private HttpGet initLocationCoordinates(String url, String location) throws URISyntaxException {
        HttpGet get = new HttpGet(url);
        get.setHeader("Accept", "application/json");
        get.setHeader("Content-Type", "application/json");
        get.setHeader("Accept-Charset", "utf-8");
        get.setHeader("Authorization", "KakaoAK " + REST_API_KEY);
        URI uri = new URIBuilder(get.getURI()).addParameter("query", location).build();
        get.setURI(uri);
        return get;
    }

    public HttpResponse getLocationCoordinates(String location) throws IOException, URISyntaxException {
        HttpClient client = HttpClientBuilder.create().build();
        HttpGet get = initLocationCoordinates(ADDRESS_SEARCH_URL + FORMAT_JSON, location);
        return client.execute(get);
    }

    public HttpResponse getCoordinateToAddress(String x, String y) throws URISyntaxException, IOException {
        HttpClient client = HttpClientBuilder.create().build();
        HttpGet get = initCoordinateToAddress(COORDINATE_TO_ADDRESS_URL + FORMAT_JSON, x, y);
        return client.execute(get);
    }

    public HttpResponse getKeywordAddressSearch(String keyword) throws URISyntaxException, IOException {
        HttpClient client = HttpClientBuilder.create().build();
        HttpGet get = initKeywordAddressSearch(KEYWORD_ADDRESS_SEARCH_URL + FORMAT_JSON, keyword);
        return client.execute(get);
    }

}
