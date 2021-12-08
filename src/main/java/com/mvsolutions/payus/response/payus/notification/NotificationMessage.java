package com.mvsolutions.payus.response.payus.notification;

import com.mvsolutions.payus.util.NumberUtil;

public class NotificationMessage {
    public static String ReviewWarning(String userName, String content) {
        if (content.length() > 4) {
            content = content.substring(0, 4) + "...";
        }
        return userName + "님이 작성하신 리뷰 \"" + content + "\"에서 다수의 신고가 확인되었습니다.\n확인 부탁드립니다.";
    }

    public static String PointPayback(String userName, String storeName, int point, boolean user) {
        if (user)
            return userName + "님의 " + NumberUtil.PriceFormat(point) + "포인트 페이백이 확인되었습니다.\n\"" + storeName + "\"에 대한 리뷰가 필요합니다!\n리뷰를 작성해주시면 큰 힘이 됩니다.";
        else
            return userName + "님에게" + NumberUtil.PriceFormat(point) + "포인트가 페이백 되었습니다.";
    }



}
