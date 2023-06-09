package com.mvsolutions.payus.util;

import lombok.extern.log4j.Log4j2;
import org.apache.commons.io.IOUtils;
import org.apache.http.HttpResponse;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.net.URISyntaxException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

@Log4j2
@Service
public class KakaoLocationService {
    /**
     * 주석 생성 날짜 - 2021-09-14, 화, 11:20
     * 코드 설명 : 상세 주소를 받아와 해당 주소의 좌표를 받아오는 Kakao API
     * 특이 사항 : 반드시 상세 주소를 입력해야 정확한 좌표를 얻을 수 있음
     **/
    public String getLocationCoordinates(String location) throws IOException, URISyntaxException {
        log.info("location : " + location);
        KakaoLocationApi api = new KakaoLocationApi();
        HttpResponse response = api.getLocationCoordinates(location);
        return IOUtils.toString(response.getEntity().getContent(), StandardCharsets.UTF_8);
    }


    /**
        주석 생성 날짜 - 2021-11-9, 화, 12:59
        코드 설명 : 좌표를 던져 해당 좌표의 주소를 받아오는 Kakao API
    **/
    public String getCoordinateToAddress(String x, String y) throws IOException, URISyntaxException {
        KakaoLocationApi api = new KakaoLocationApi();
        HttpResponse response = api.getCoordinateToAddress(x, y);
        return IOUtils.toString(response.getEntity().getContent(), StandardCharsets.UTF_8);
    }

    /**
        주석 생성 날짜 - 2021-11-9, 화, 16:34
        코드 설명 : 키워드로 관련 주소를 검색하는 Kakao API
    **/
    public String getKeywordAddressSearch(String keyword) throws IOException, URISyntaxException {
        KakaoLocationApi api = new KakaoLocationApi();
        HttpResponse response = api.getKeywordAddressSearch(keyword);
        return IOUtils.toString(response.getEntity().getContent(), StandardCharsets.UTF_8);
    }
}
