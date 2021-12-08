package com.mvsolutions.payus.util;

import java.text.NumberFormat;

public class NumberUtil {
    /**
     * @Return cutSize 자리에서 반올림한 값 String
     * @Param int cutSize, double value
     * value 값을 cutSize 자리 수 만큼 반올림 하여 String 을 반환하는 함수
     * **/
    public static String cutDecimal(int cutSize, double value){
        NumberFormat nf = NumberFormat.getNumberInstance();
        nf.setMaximumFractionDigits(cutSize);
        nf.setGroupingUsed(false);
        return nf.format(value);
    }

    /**
     * @Return cutSize 자리에서 반올림한 값 double
     * @Param int cutSize, double value
     * value 값을 cutSize 자리 수 만큼 반올림 하여 double 을 반환하는 함수
     * **/
    public static double roundDouble(int cutSize, double value){
        int k = 1;
        for(int i = 0; i < cutSize; i++){
            k = k * 10;
        }
        return (double)Math.round(value * k) / k;
    }

    public static String PriceFormat(int price) {
        String amount = Integer.toString(price);
        return amount.replaceAll("\\B(?=(\\d{3})+(?!\\d))", ",");
    }
}
