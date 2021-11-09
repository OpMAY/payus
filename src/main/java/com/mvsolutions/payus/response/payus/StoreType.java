package com.mvsolutions.payus.response.payus;

/**
    주석 생성 날짜 - 2021-11-4, 목, 11:56
    코드 설명 : 가게 유형 지정
        1. 숙박
        2. 식당
        3. 병원
        4. 쇼핑
        5. 식료품
    특이 사항 : 확장성을 염두, DB 내에서 FK로 연결하기 힘든 요소를 위해 StoreType 을 명시
**/
public class StoreType {
    public static final int LODGEMENT = 1;
    public static final int RESTAURANT = 2;
    public static final int HOSPITAL = 3;
    public static final int SHOPPING = 4;
    public static final int GROCERY = 5;
}
