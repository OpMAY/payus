package com.mvsolutions.payus.util;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * Time에 관련된 Class
 */
public class Time {

    /**
     * @return 현재 시간 FORM에 맞춰 리턴
     * "yyyy-MM-dd HH:mm:ss"
     * "yyyy년 MM월dd일 HH시mm분ss초"
     * "yyyy_MM_dd_HH_mm_ss"
     */
    public static String TimeFormatHMS() {
        Date now = new Date();
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
        return dateFormat.format(now);
    }

    public static String TimeForFile() {
        Date now = new Date();
        DateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
        return dateFormat.format(now);
    }

    public static String TimeFormatNoSpecialCharacter() {
        Date now = new Date();
        DateFormat dateFormat = new SimpleDateFormat("yyyyMMdd-HHmmss");
        return dateFormat.format(now);
    }

    public static String TimeFormatter(Date date) {
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return dateFormat.format(date);
    }

    public static String TimeFormatterHMS(Date date) {
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
        return dateFormat.format(date);
    }

    public static String TimeFormatterDay(Date date) {
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        return dateFormat.format(date);
    }

    public static String TimeFormatDay() {
        Date now = new Date();
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        return dateFormat.format(now);
    }

    /**
     * @return 밀리초 시간 String을 받아 초 단위까지 표시
     * "yyyy-MM-dd HH:mm:ss.SSS" -> "yyyy-MM-dd HH:mm:ss"
     */
    public static String MsToSecond(String date) {
        if (date.lastIndexOf(".") < 0)
            return date;
        else
            return date.substring(0, date.lastIndexOf("."));
    }

    /**
     * @return Date 포맷 형태, String이 Date가 아니면 null 반환
     * "2021-08-25" -> "yyyy-MM-dd"
     * "2021-08-25 12:33:24" -> "yyyy-MM-dd HH:mm:ss"
     * "2021-08-25 12:33:24.555" -> "yyyy-MM-dd HH:mm:ss.SSS"
     * "한지우" -> null
     */
    public static String checkDateFormat(String date) {
        SimpleDateFormat dateFormatDay = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat dateFormatHMS = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        SimpleDateFormat dateFormatMS = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
        dateFormatDay.setLenient(false);
        dateFormatHMS.setLenient(false);
        dateFormatMS.setLenient(false);
        String format = null;
        try {
            Date date1 = dateFormatDay.parse(date.trim());
            String result = dateFormatDay.format(date1);
            if (result.equals(date)) {
                format = "yyyy-MM-dd";
            } else {
                throw new Exception();
            }
        } catch (Exception e) {
            try {
                Date date1 = dateFormatHMS.parse(date.trim());
                String result = dateFormatHMS.format(date1);
                if (result.equals(date)) {
                    format = "yyyy-MM-dd HH:mm:ss";
                } else {
                    throw new Exception();
                }
            } catch (Exception e1) {
                try {
                    Date date1 = dateFormatMS.parse(date.trim());
                    String result = dateFormatMS.format(date1);
                    if (result.equals(date)) {
                        format = "yyyy-MM-dd HH:mm:ss.SSS";
                    } else {
                        throw new Exception();
                    }
                } catch (Exception e2) {
                }
            }
        }
        return format;
    }

    public static Date StringToHMSFormat(String dateString) throws ParseException {
        SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
        return transFormat.parse(dateString);
    }

    public static Date StringToDateTimeFormat(String dateString) throws ParseException {
        SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return transFormat.parse(dateString);
    }

    public static Date StringToDateFormat(String dateString) throws ParseException {
        SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
        return transFormat.parse(dateString);
    }

    public static int DateCompare(String dateString1, String dateString2) throws ParseException {
        Date date1 = StringToHMSFormat(dateString1);
        Date date2 = StringToHMSFormat(dateString2);
        if (date1.before(date2)) {
            return 0;
        } else if (date1.after(date2)) {
            return 1;
        } else {
            return 2;
        }
    }

    public static String DatePlusDays(String dateString, int days) throws ParseException {
        Date date = StringToDateFormat(dateString);

        Calendar c = Calendar.getInstance();
        c.setTime(date);
        // manipulate date
        c.add(Calendar.YEAR, 0);
        c.add(Calendar.MONTH, 0);
        c.add(Calendar.DATE, days); //same with c.add(Calendar.DAY_OF_MONTH, 1);
        c.add(Calendar.HOUR, 0);
        c.add(Calendar.MINUTE, 0);
        c.add(Calendar.SECOND, 0);
        // convert calendar to date
        Date currentDatePlusOne = c.getTime();
        return TimeFormatterHMS(currentDatePlusOne);
    }

    public static String DatePlusOneDay(String dateString) throws ParseException {
        Date date = StringToDateFormat(dateString);

        Calendar c = Calendar.getInstance();
        c.setTime(date);
        // manipulate date
        c.add(Calendar.YEAR, 0);
        c.add(Calendar.MONTH, 0);
        c.add(Calendar.DATE, 1); //same with c.add(Calendar.DAY_OF_MONTH, 1);
        c.add(Calendar.HOUR, 0);
        c.add(Calendar.MINUTE, 0);
        c.add(Calendar.SECOND, 0);
        // convert calendar to date
        Date currentDatePlusOne = c.getTime();
        return TimeFormatterDay(currentDatePlusOne);
    }

    public static String DateMinusOneDay(String dateString) throws ParseException {
        Date date = StringToDateFormat(dateString);

        Calendar c = Calendar.getInstance();
        c.setTime(date);
        // manipulate date
        c.add(Calendar.YEAR, 0);
        c.add(Calendar.MONTH, 0);
        c.add(Calendar.DATE, -1); //same with c.add(Calendar.DAY_OF_MONTH, 1);
        c.add(Calendar.HOUR, 0);
        c.add(Calendar.MINUTE, 0);
        c.add(Calendar.SECOND, 0);
        // convert calendar to date
        Date currentDatePlusOne = c.getTime();
        return TimeFormatterDay(currentDatePlusOne);
    }

    /**
     * @return 현재 시간 + 1day를 늘려서 Stamp로 리턴
     * 현재 Stamp에서 하루를 늘린 Stamp
     */
    public static Date LongTimeStamp() {
        Date currentDate = new Date();
        System.out.println(currentDate);
        // convert date to calendar
        Calendar c = Calendar.getInstance();
        c.setTime(currentDate);
        // manipulate date
        c.add(Calendar.YEAR, 0);
        c.add(Calendar.MONTH, 0);
        c.add(Calendar.DATE, 1); //same with c.add(Calendar.DAY_OF_MONTH, 1);
        c.add(Calendar.HOUR, 0);
        c.add(Calendar.MINUTE, 0);
        c.add(Calendar.SECOND, 0);
        // convert calendar to date
        Date currentDatePlusOne = c.getTime();
        return currentDatePlusOne;
    }

    public static Date LongTimeStampCurrent() {
        Date currentDate = new Date();
        System.out.println(currentDate);
        // convert date to calendar
        Calendar c = Calendar.getInstance();
        c.setTime(currentDate);
        // manipulate date
        c.add(Calendar.YEAR, 0);
        c.add(Calendar.MONTH, 0);
        c.add(Calendar.DATE, 0); //same with c.add(Calendar.DAY_OF_MONTH, 1);
        c.add(Calendar.HOUR, 0);
        c.add(Calendar.MINUTE, 0);
        c.add(Calendar.SECOND, 0);
        // convert calendar to date
        Date currentDatePlusOne = c.getTime();
        return currentDatePlusOne;
    }
}
