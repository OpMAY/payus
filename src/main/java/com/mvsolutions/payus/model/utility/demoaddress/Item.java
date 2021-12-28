package com.mvsolutions.payus.model.utility.demoaddress;

import lombok.Data;

@Data
public class Item {
    private String bizesId;
    private String bizesNm; // 상호명
    private String brchNm; // 지점명
    private String indsLclsCd;
    private String indsLclsNm;
    private String indsMclsCd;
    private String indsMclsNm; // 숙박 종류
    private String indsSclsCd;
    private String indsSclsNm; // 숙박 종류
    private String ksicCd;
    private String ksicNm; // 여관업
    private String ctprvnCd;
    private String ctprvnNm; // 시도
    private String signguCd;
    private String signguNm; // 시군구
    private String adongCd;
    private String adongNm; // 행정동
    private String ldongCd;
    private String ldongNm; // 법정동
    private String lnoCd;
    private String plotSctCd;
    private String plotSctNm;
    private int lnoMnno; // 본번지
    private Object lnoSlno; // 주번지
    private String lnoAdr; // 전체 주소
    private String rdnmCd;
    private String rdnm; // 도로명 주소 번지 X
    private int bldMnno; // 도로명 주소의 번지만
    private Object bldSlno;
    private String bldMngNo;
    private String bldNm; // 건물 이름
    private String rdnmAdr; // 도로명 주소 총 이름
    private String oldZipcd; // 개편 전 우편번호
    private String newZipcd; // 개편 후 우편번호
    private String dongNo;
    private String flrNo;
    private String hoNo;
    private double lon; // 경도
    private double lat; // 위도
}
