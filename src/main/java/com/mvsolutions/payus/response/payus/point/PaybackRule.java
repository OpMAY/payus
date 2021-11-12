package com.mvsolutions.payus.response.payus.point;

public class PaybackRule {
    public static final int LIMIT_PRICE = 10000000;
    public static final int LIMIT_PAYBACK_RATE = 70;
    public static final double LIMIT_PAYBACK_POINT = (double) LIMIT_PRICE * LIMIT_PAYBACK_RATE / 100;
    public static final int USER_CODE_CALCULATION_AMOUNT = 10000000;

    public static boolean CalculatePoint(int price, int payback_rate, int point) {
        return price == payback_rate / 100 * point;
    }

    public static int UserCodeCalculation(int value, boolean returnCode) {
        // result_type == true -> 유저 코드 반환, value = user_no
        // result_type == false -> user_no 반환, value = 유저 코드
        if(returnCode)
            return value + USER_CODE_CALCULATION_AMOUNT;
        return value - USER_CODE_CALCULATION_AMOUNT;
    }
}
