package com.boot.demo.util;

import lombok.extern.log4j.Log4j;
import org.apache.commons.io.IOUtils;
import org.apache.http.HttpResponse;
import org.springframework.stereotype.Service;

import java.nio.charset.StandardCharsets;

@Log4j
@Service
public class KakaoLocationService {
    /**
        주석 생성 날짜 - 2021-09-14, 화, 11:20
        코드 설명 : 상세 주소를 받아와 해당 주소의 좌표를 받아오는 Kakao API
        특이 사항 : 반드시 상세 주소를 입력해야 정확한 좌표를 얻을 수 있음
    **/
    public String getLocationCoordinates(String location) throws Exception {
        log.info("location : " + location);
        KakaoLocationApi api = new KakaoLocationApi();
        HttpResponse response =  api.getLocationCoordinates(location);
        return IOUtils.toString(response.getEntity().getContent(), StandardCharsets.UTF_8);
    }
}
