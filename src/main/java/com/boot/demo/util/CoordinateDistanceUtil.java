package com.boot.demo.util;

import com.boot.demo.model.utility.kakaolocation.LocationCoordinate;

/**
    주석 생성 날짜 - 2021-09-14, 화, 11:23
    코드 설명 : 두 좌표를 받아 두 좌표 사이의 거리를 구하는 Util
    특이 사항 : SQL 의 거리 비교 계산 방식과 달라 우선 PayUs 에서는 사용 X
**/
public class CoordinateDistanceUtil {
    public double distance(LocationCoordinate start, LocationCoordinate end) {
        double theta = start.getLon() - end.getLon();
        double dist = Math.sin(deg2Rad(start.getLat())) * Math.sin(deg2Rad(end.getLat())) + Math.cos(deg2Rad(start.getLat())) * Math.cos(deg2Rad(end.getLat())) * Math.cos(deg2Rad(theta));

        dist = Math.acos(dist);
        dist = rad2Deg(dist);
        dist = dist * 60 * 1.1515;
        //to meter
        dist = dist * 1609.344;

        return dist;
    }

    // 각도를 라디안으로 변환하는 함수
    private double deg2Rad(double deg) {
        return (deg * Math.PI / 180.0);
    }

    // 라디안을 각도로 변환하는 함수
    private double rad2Deg(double rad) {
        return (rad * 180 / Math.PI);
    }
}
